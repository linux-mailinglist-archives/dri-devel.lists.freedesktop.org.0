Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193FB36DB00
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835246EB7E;
	Wed, 28 Apr 2021 15:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6F36EB68;
 Wed, 28 Apr 2021 15:13:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlUabXx78O+VdqPt94BtQGyyT9HYPpo0/aDZgJr6/x2io51Lj9EkLQDPplWpfJuEzGHJ0G/U4vS+QBy0NW47f78DggqhwXrfOf614x8pktp+MVWHS7t8cj5Dt1Mo5a7IiyPo+GI3BjCksNwkA0lX2PwT5PIu7WWv1nGBsp/mF3GTQIqI/PQ+3l0So/s+dYL4Zta3p1tr8dOnEAlWZy2WHjtVYMBXCPEIYm/3boDP3shdIMHLfN69oI0PQR7CnwClCWOYxb6n3jg8qgMwpEcrfLM3ZSMWpIuFUDh8H4pG+1I9pmcUMc9bINPXlaEbtIiaIZYpAWa9gZo7Z++4KgVbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl/O/shlSz/P5DjdJh1C7b4UObg5BRm5//EqkEZWN84=;
 b=mm2To12TQrYrtHDTzQMgQIJ4asJvvjqFBkbyFYNQR8c7ST68MA6wd7eyvTjcxq73gHdVX/ovgSo3ha1165KPJw8osGFbdA4KHPQJPMe/0R+u1xlD9n0Z/DxPiDawFCJsChHJ1nZYIaPwAXMUDztDGS26QC1hZjx7D8nzX0ky1GawA279NlAKLvb6IQw4lcdFWkzGb3537vIecHWB8K5qHSyKKKlx6Di/ey4Rh8duKZ/7Gw8pzU+42rnsPD6PB4YDcUwScm5EwZR4HYnWy7AZdtIPZvesgRCXrh4g79fCa+U1Ayo9A1EoWcustF9M39/rv1Z84IpURkIhTAY4Sr+A9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl/O/shlSz/P5DjdJh1C7b4UObg5BRm5//EqkEZWN84=;
 b=PfHgEYUHdlvBy6D0pqOhh5WDv2yEwM32zAQ3AcUMq/mTx7bSV+wdGfRq7c1mOjYZ6XX/lDrwAeMoihbNkkhkC5hxLD5Pe67lVyg1e+8scWb4CYYZRwi/Ai+HTRHFlqUlTbC0ILN6gijhzw637uFvmIaNjbWVY14leIR17h5cwV0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:00 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:59 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 15/27] drm/scheduler: Fix hang when sched_entity released
Date: Wed, 28 Apr 2021 11:11:55 -0400
Message-Id: <20210428151207.1212258-16-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce484d86-8da4-4163-f65e-08d90a581c30
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB274954E60AD29DD29BD9F6F4EA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lulc5oekbOtXj1MaqcGN1BTIc6Cp4R8OS7NZVrhvetkmTF2eGi3vjmJg68sjSit8fOIH3NvALxllkZNEjI2sLLwiqlNoGLfGpzKweMHlFQp5JTVn6udkfb2YkSejPNbl3KQnTMKOgHf1MSJdXLncV+lke3L9o4g7ATTmg7b5RsLU92e5uzTi6Qu41qWWF8Q1/t12+OMeySx8+gCKFK+prSnSeE82w643Dt74J8m73mTt7AD+bFntua6xXB1ljDTR0SytT07eLBzOJ5dhg39K7dKRLOG983KMX5E0iqcbfxzDxY7QqIQK/mlO3lBAvWNHTAldG7FxyOK6KbF4DgTrWKqS/MmoSyY8knNnujNPzdQ8bRfo/8mMAB1XvZqi+tUzuvqXxJglKqQv207MrzcDhxazB32AbJZnhAiPJz1YnOF0DpCX9GVFREjkiW1Nc1lbMh4IUa39NOyxeqk+Qz+LclHDn6SRFwow4PQ93Bcg8bYN35FOoxH6Minb/hi5RYMCbFIPSzBSo76ib+Wh/jrGwXotA7BeVoEn99jNB5MsiJ+Ft5/ijvJJTZoYnic2MpOPVyCz5QydCbjYsCAql4LHWy8F+No8z2buxd4W6k46sA8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(6666004)(66574015)(6512007)(2616005)(1076003)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(54906003)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEhYUUFaTnFuZ3pYTzAyK2xoU0JkZU1mR01DM2N0Vks3eS9yVnh3b2dpOFB2?=
 =?utf-8?B?cUNpOHBGYmZWY2ZrVWRhaUdabHZaMnVZeXF2aXlodE9EY3F0U2M1QXlFcEE0?=
 =?utf-8?B?RzNjTWtMUXVQc2l4a3Z2U0FRY2thNVBqcDhhWExDdnZ5aEhTTWs2R2hKWTJF?=
 =?utf-8?B?YWVNS1N6YW9PNWNaU01jNTBFVEhYeFhaVmd4bzN5RTJoMmpUWno1Z0xwSndY?=
 =?utf-8?B?eVpIQ0hRY3pIMjQvYW1ZUmNCekJ5YzZhY2pIcC9mMjNFeWRXSUxzanFPL1lx?=
 =?utf-8?B?TjBRbmNKc2htTngrdzkwbENDMVMzWmFycTJ5UEFuQmRISEsrYjNPTzhlejFv?=
 =?utf-8?B?d0xDMUMvNjhqQ1VaeERuUmxhb1VLTXptZTB5bXhlbzZxNTZGZ2JhNUNVbmhP?=
 =?utf-8?B?MnZEL0NoaHo4UzFyWGlYNEQ5SDRpUkhDVU5HTllzWkRJcE12VjY0Tlp2VWVZ?=
 =?utf-8?B?VmRtVEdJVnB4Qk9HTHhsMDIwSzJyQzVkeTYxSVo1L1dTRC9yTHpUNXJ2U21G?=
 =?utf-8?B?R2dxSjlwRlU5UnZmKzFnNDQ5MUllRE9xN0lmdXg0S2MvdDRGWEUvWWxZSC9J?=
 =?utf-8?B?VmpEK3E4QVp5RHN3N3ZWQklLRGJpMmE4SlNBVDZXaXhiRVhzcXhIS0Q0UnJB?=
 =?utf-8?B?QmFCaUNvbTJ2N0krMGptejJBRnE5Q2UwanZ1K3NNU1BEVldWaEFpajIwcVRZ?=
 =?utf-8?B?dDk0UDAvNHpBZmNtZVB3ME04Z3g2NWszS05tYmJHbmJNRUI5Q3QrVmZhV0o1?=
 =?utf-8?B?K1VkdTBSZzRoNGFvOVptUUNDTnFaWEJPbUhaMXlHQVQ0aVY4S0NzeGpiY0tk?=
 =?utf-8?B?SVpZL3VkZkdaODFKU25xRS9BNDl5WUc2YUJseWttQkQ0REhQdHpTSUZKWFJq?=
 =?utf-8?B?SnoxakE4d2RWK3k2eU93REpBMDFuNU1ZZFc3U0d1YUNLRVJNTDcxN3VPZ1RU?=
 =?utf-8?B?V2tXZzNDd3B0c0oxNVVUS3BjY0NmVGJxT1Zkb1BEMmluRUc4WlRuVVloUXdS?=
 =?utf-8?B?MEpPV2RVM05XczI1S0ZmaU95RzdZQVRyTkRBQVVxV1lGM3BEZE1VY2tvUTVt?=
 =?utf-8?B?N0R4YzhOeUUrbXI1NVNmL1Z5c0JUT0JFOXZrY1dnNTd6bmNudVNYaDFDeE9w?=
 =?utf-8?B?enNqWVBCOGNBRCtUU050TDREV0dzeVA3YWhXc0VsWkJZQXdRd2oza3Buci85?=
 =?utf-8?B?R2g1U0Z6czlLM0dUNUtIZWsycVNoSTROc0lYaUZXTUVNQnh0WE1qY2pSWmh5?=
 =?utf-8?B?d2w3aUVScEJ6LzBYZ1VkZGEvOVVGaVFmRExpcFRFazVzVkNmbDl0MmV2UU9v?=
 =?utf-8?B?dXF4N3Y3YmFDNnRkQlZsLy9veXlKZFBBdG5yS3AyaDZLM3ZocUFURXhkWTBm?=
 =?utf-8?B?a3dBb2VRTWlPQmFMdTBZck0xbWpwR2JEeVpPSnhSWFlwSGZSVjNpY3N0a3c5?=
 =?utf-8?B?cUxRRGFXaU54ZE1qNmFlMENVNE1yMFovQVMxdXBhZjBpcHZPZlpNcG9MUUVQ?=
 =?utf-8?B?Sk1HbmYxK3JqTDFxZ3VnZU1qRmlOaEhRc2FsSzlkeFpOeHk4RGEvR3JuckZ4?=
 =?utf-8?B?a3VqWGY0RjZQb0RYQUdnVGpVdEpuZkpFVTFoV0ZMdjNSZzB1UDZIWCtXV0pk?=
 =?utf-8?B?T0V0ZUdxd3RGL0g3bTUyRW9jdmh1MzBqS01ZSFZ1K010VXphVmxSMlp2ZmJn?=
 =?utf-8?B?VklldDZqTzJ0NTNISXhjc1VhbTJOdzdyK2ZsZ3hGZlhUaEhVWlp6N0xHUE9F?=
 =?utf-8?B?UUd5L0RXdTBpU0o1R2h3TGxzdkNKa2lSaFowWVArQWU1LzhoOGF1cG9SVEtP?=
 =?utf-8?B?bFVIbnVMK3FrWGtreG5waWlqaWFtNUk2WkZ1bW5wcFhtU2V5MVdhRWpEWnI0?=
 =?utf-8?Q?gUg4MOFWqRYRr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce484d86-8da4-4163-f65e-08d90a581c30
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:59.7125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tidZahAWe63VbKeEMpdBSQLgXVe1Gr1otsTGygf0HvRQLXgyrWPJ2pI+vIhfyuA3b+uMlbuqO7bunDgzpq3QKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvYmxlbTogSWYgc2NoZWR1bGVyIGlzIGFscmVhZHkgc3RvcHBlZCBieSB0aGUgdGltZSBzY2hl
ZF9lbnRpdHkKaXMgcmVsZWFzZWQgYW5kIGVudGl0eSdzIGpvYl9xdWV1ZSBub3QgZW1wdHkgSSBl
bmNvdW50cmVkCmEgaGFuZyBpbiBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoLiBUaGlzIGlzIGJlY2F1
c2UgZHJtX3NjaGVkX2VudGl0eV9pc19pZGxlCm5ldmVyIGJlY29tZXMgZmFsc2UuCgpGaXg6IElu
IGRybV9zY2hlZF9maW5pIGRldGFjaCBhbGwgc2NoZWRfZW50aXRpZXMgZnJvbSB0aGUKc2NoZWR1
bGVyJ3MgcnVuIHF1ZXVlcy4gVGhpcyB3aWxsIHNhdGlzZnkgZHJtX3NjaGVkX2VudGl0eV9pc19p
ZGxlLgpBbHNvIHdha2V1cCBhbGwgdGhvc2UgcHJvY2Vzc2VzIHN0dWNrIGluIHNjaGVkX2VudGl0
eSBmbHVzaGluZwphcyB0aGUgc2NoZWR1bGVyIG1haW4gdGhyZWFkIHdoaWNoIHdha2VzIHRoZW0g
dXAgaXMgc3RvcHBlZCBieSBub3cuCgp2MjoKUmV2ZXJzZSBvcmRlciBvZiBkcm1fc2NoZWRfcnFf
cmVtb3ZlX2VudGl0eSBhbmQgbWFya2luZwpzX2VudGl0eSBhcyBzdG9wcGVkIHRvIHByZXZlbnQg
cmVpbnNlcmlvbiBiYWNrIHRvIHJxIGR1ZQp0byByYWNlLgoKdjM6CkRyb3AgZHJtX3NjaGVkX3Jx
X3JlbW92ZV9lbnRpdHksIG9ubHkgbW9kaWZ5IGVudGl0eS0+c3RvcHBlZAphbmQgY2hlY2sgZm9y
IGl0IGluIGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZQoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdy
b2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9tYWluLmMgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKaW5kZXggZjA3OTBlOTQ3MWQxLi5jYjU4ZjY5MmRh
ZDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwpAQCAtMTE2LDcg
KzExNiw4IEBAIHN0YXRpYyBib29sIGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZShzdHJ1Y3QgZHJt
X3NjaGVkX2VudGl0eSAqZW50aXR5KQogCXJtYigpOyAvKiBmb3IgbGlzdF9lbXB0eSB0byB3b3Jr
IHdpdGhvdXQgbG9jayAqLwogCiAJaWYgKGxpc3RfZW1wdHkoJmVudGl0eS0+bGlzdCkgfHwKLQkg
ICAgc3BzY19xdWV1ZV9jb3VudCgmZW50aXR5LT5qb2JfcXVldWUpID09IDApCisJICAgIHNwc2Nf
cXVldWVfY291bnQoJmVudGl0eS0+am9iX3F1ZXVlKSA9PSAwIHx8CisJICAgIGVudGl0eS0+c3Rv
cHBlZCkKIAkJcmV0dXJuIHRydWU7CiAKIAlyZXR1cm4gZmFsc2U7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfbWFpbi5jCmluZGV4IDkwOGIwYjU2MDMyZC4uYmEwODczNTRkMGE4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwpAQCAtODk3LDkgKzg5NywzMyBAQCBF
WFBPUlRfU1lNQk9MKGRybV9zY2hlZF9pbml0KTsKICAqLwogdm9pZCBkcm1fc2NoZWRfZmluaShz
dHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQogeworCXN0cnVjdCBkcm1fc2NoZWRfZW50
aXR5ICpzX2VudGl0eTsKKwlpbnQgaTsKKwogCWlmIChzY2hlZC0+dGhyZWFkKQogCQlrdGhyZWFk
X3N0b3Aoc2NoZWQtPnRocmVhZCk7CiAKKwlmb3IgKGkgPSBEUk1fU0NIRURfUFJJT1JJVFlfQ09V
TlQgLSAxOyBpID49IERSTV9TQ0hFRF9QUklPUklUWV9NSU47IGktLSkgeworCQlzdHJ1Y3QgZHJt
X3NjaGVkX3JxICpycSA9ICZzY2hlZC0+c2NoZWRfcnFbaV07CisKKwkJaWYgKCFycSkKKwkJCWNv
bnRpbnVlOworCisJCXNwaW5fbG9jaygmcnEtPmxvY2spOworCQlsaXN0X2Zvcl9lYWNoX2VudHJ5
KHNfZW50aXR5LCAmcnEtPmVudGl0aWVzLCBsaXN0KQorCQkJLyoKKwkJCSAqIFByZXZlbnRzIHJl
aW5zZXJ0aW9uIGFuZCBtYXJrcyBqb2JfcXVldWUgYXMgaWRsZSwKKwkJCSAqIGl0IHdpbGwgcmVt
b3ZlZCBmcm9tIHJxIGluIGRybV9zY2hlZF9lbnRpdHlfZmluaQorCQkJICogZXZlbnR1YWxseQor
CQkJICovCisJCQlzX2VudGl0eS0+c3RvcHBlZCA9IHRydWU7CisJCXNwaW5fdW5sb2NrKCZycS0+
bG9jayk7CisKKwl9CisKKwkvKiBXYWtldXAgZXZlcnlvbmUgc3R1Y2sgaW4gZHJtX3NjaGVkX2Vu
dGl0eV9mbHVzaCBmb3IgdGhpcyBzY2hlZHVsZXIgKi8KKwl3YWtlX3VwX2FsbCgmc2NoZWQtPmpv
Yl9zY2hlZHVsZWQpOworCiAJLyogQ29uZmlybSBubyB3b3JrIGxlZnQgYmVoaW5kIGFjY2Vzc2lu
ZyBkZXZpY2Ugc3RydWN0dXJlcyAqLwogCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmc2NoZWQt
PndvcmtfdGRyKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
