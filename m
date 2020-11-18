Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE3F2B7847
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D036E434;
	Wed, 18 Nov 2020 08:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08F06E428;
 Wed, 18 Nov 2020 08:17:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jruGW4QX2HECQfM2Qt7G8w9aQpsOBO/ezfVE8ChUIym2yAkc4OnSbl5M25JNurCvU5vG2AlxyeyTkDwMlZ+AVfKJ4QaXZc+j4daezxYWxK0OzZcLLkLWzTmAZyaYZm7Apfre3pG8EvOY+Mdis3V/7RBvHReQyKi5/9sCmtNmFrfy+mC4th5J33L2Lyw6qOHrdq571p1wwLxQJIFkzR5FI3pvzRLKgr1cKD32gon+dQmWl2EcU0Un1Z4Y+6YFEO8RFlBPAJAQmb8xXtzw3/QNsfoESQgo4ye2rf6JKhdnaS9hMC0X71q6IL9nHUzL2tiTF2gKGQpkiTtOxMzG4ymSGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSs1trCyG5UT4I/jRddZiO1HMVAIVB1h7VRmK6KCJH4=;
 b=UErASAf8kxy+/4ooK+4hxSUK9WE8dU+06IgRwDKZ3qMZdyoYB4gY55gJlIeX4P3c5bQJHqt9tMoEDWwMapJimM1f74xp6Y7RZi0gzZq4KWDgK6jQYJvqghieSw7UD0Ra1SQ/jEBKqK0KS7qK5Divk/m1En6jhkOVyB3dBOI6w19BSENaGvGWt7mTIdesjwTNNZdIf5fX+Np9rWTB1e26nFApHuitKS9WCqx7EXba1HKKNdTkLht6ES9p9AwpFl09Rt34UAbGNqlWB206H3nUbk2Ljw5c7M9a9g062PuL4gDgaN9ZuBBiNVe6YwSRH32Kfg1QuKap6OzFYUU19y9vKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSs1trCyG5UT4I/jRddZiO1HMVAIVB1h7VRmK6KCJH4=;
 b=VYjYuALAp7mQ/txJsTak7vsQeMR93UNxfjA4Wil2U8wlWrj/g52fNsUc7wrRKcgLWgir4ZKoKXcflWvY5tZUkAcCqzBuqvKXETgTnVo/RMey3qKGupQaakU6BzEDSgZqQSBo2MrVrQMYrVcAj6VuNVSyOZDkqA9ibmtPoff8vCE=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3966.namprd12.prod.outlook.com (2603:10b6:208:165::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 08:17:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 08:17:56 +0000
Subject: Re: [PATCH] amd/amdgpu: use kmalloc_array to replace kmalloc with
 multiply
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Monk Liu <Monk.Liu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Yintian Tao <yttao@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Wenhui Sheng <Wenhui.Sheng@amd.com>,
 chen gong <curry.gong@amd.com>, Bokun Zhang <Bokun.Zhang@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201118025503.102699-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f55ec782-9eff-c30b-2a0e-01a9898c9387@amd.com>
Date: Wed, 18 Nov 2020 09:17:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201118025503.102699-1-bernard@vivo.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0125.eurprd07.prod.outlook.com
 (2603:10a6:207:8::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0125.eurprd07.prod.outlook.com (2603:10a6:207:8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.15 via Frontend Transport; Wed, 18 Nov 2020 08:17:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b70033bf-cadd-41b2-3dd6-08d88b9a740f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3966B469DD43F46E87E5E26683E10@MN2PR12MB3966.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z8Omptn27fYckps9sXsR4NS8byNpiysTRlKhahDHmqaEKX6ISltzrCeMFH7Sfo7UA05N+zgYxBYoUtlctvHACjzwgkWTc/NftRgX6CcamF3HaIwIda4IniXg3nTcAnNMj2yQCA9FC7PAeUzjnkjRVVmiv2v8mfwpZLB1szgs9EeRJEF/dA5+hRWagHterCQ8JQw2USReNR4UoA4QbICdmIQeah6gLZO5dz4dpVCjjSIQwp5lOSQjq61lBqamfI8EcN73wZlvnRpWmWgSVa1uAj5jIW3DV9PvEguRyGeW/+p5VRQ0pg8R7+lJLqBzXHN6051Q2k7uvWfKuElixx1ktisTDIga7xgHZEsPF3BbWH/M58P2APAUMQ2aNfSieVUHkTfB5ai1KQ8ib8+rkiaj4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(66556008)(66476007)(6666004)(16526019)(86362001)(36756003)(6486002)(31686004)(2906002)(5660300002)(66946007)(4326008)(31696002)(8676002)(316002)(2616005)(186003)(478600001)(110136005)(8936002)(83380400001)(52116002)(921005)(66574015)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFlGTTZqNml4OThHOVZLQkc4VllXNFZiU0RFTURLZnROcXFuYUtZd1cvUGpz?=
 =?utf-8?B?VjAyOW5EQkthbFB5RWtHQmFLeVVWVmFzM2RDZGZTY1IyRUZNWUU3YmlpQSs2?=
 =?utf-8?B?UVlDNTFlMGdCb1BCMnBRcWZZS2JTUmJqMXFoL2ErUEVDR3ZhTnpYYm5kV2NT?=
 =?utf-8?B?a0hpWlUwOEJlb3IrakNnaGZnaDB5WDUraVd1b2ltMlFlMS85VmUzZTFZcEcx?=
 =?utf-8?B?MHhHRVJDd2FjWDJsWXY0TjNQN1plZFV0OTZTeVBBS3piZ3F6NjVsQVhpRVRU?=
 =?utf-8?B?SUlDcTNxM2ZTUGJtOG5QTmY1czZBWVU1S0xtakJQelN1RFJINVR5L3lhM1Vv?=
 =?utf-8?B?TFBVTHdkVXFWcmxTTGliVHI2VVFiK3MycU9raFByaGUyZkMxeC9WV0dGWGxU?=
 =?utf-8?B?cWo1Smg0K25lenozcU9pRmpucVRSV2pQcXBSYi81L0ZlaXpqL3Z0WVFYem94?=
 =?utf-8?B?R21jR3d0dFFkb1kzU01tZUdZbURoVW9OemNBNHRSU1lZbUxVd3gvc2VNVVNx?=
 =?utf-8?B?T0VWTWVBU3QrY29peHBzay9ZQk5pTlFLM2VxNmxwd2xVNi9sRTBtSG1XTTFQ?=
 =?utf-8?B?RFpqbXdOYWphcU0rbkltTndISzdkb1lvMWNxNGl0a1pDOW1IanBjeXI2dTRC?=
 =?utf-8?B?RkY5SzNiWGpodStaQms1RWdtRWdsdm5OaWhFclljaVBBcnB5SVpSbWVGOVNv?=
 =?utf-8?B?c2paVXRkaFJxTDF0UFdYY3ZVZ1o4V29zZzFGMXlZZ3ZuZzlZTkxoRW00bFhm?=
 =?utf-8?B?RmVhVXZLdk44WWxOOTFPYTJiNU9LbE1ERlh5Ry9UQlhZZTAwZktsMzVPbElz?=
 =?utf-8?B?WkdUaWRuYmljdlVCUlFEUE5TVWJZS2lQT0lJcy9XQzRYYzBGOGJFWC9GNGtG?=
 =?utf-8?B?d0VYUGJrNXpraXpIU1VIbGRpQXRINVA0NUdKWndOaDdWUWYyL2lQM1UzNHRr?=
 =?utf-8?B?WnZVTnlOdmtNMStpSVFDUy8rTnBDbnA1REM5YnJsOXlNaUlhS2ttZHRycEhQ?=
 =?utf-8?B?OFNTWmZOZ2VxVGdaMnprVWcyYnBsd3ZlR0lJcnhMVjFRRENPczltdVlLeENY?=
 =?utf-8?B?T1MwWERpZVRLSG9kcDhnNHArT2N1Q3BEQTZIYTVXOXA1elJCS2hTcDJpcjdy?=
 =?utf-8?B?bmVGVTJHWVNMY0lwMjRScGRibURGWFVrY2hEQ0I4RWNsSDFzWHRLK2hTcXo2?=
 =?utf-8?B?U2NUQmVKS0ZFZlBjQnFmRlR3aEw1UXZrc2NUSVYvRzVWcC9PMjZWRkNXVjB3?=
 =?utf-8?B?ZVpIQ0YwR1BON0tEMGViODJ1bEpsRkMvWnFFL1k4aW90MVptUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70033bf-cadd-41b2-3dd6-08d88b9a740f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:17:56.4323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJ2Qw9L69cTpTUEBZyuLUhNtCtl4mcNJIYa2PoG7NM49UgUzPjuUvVXYkwm3LFXj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3966
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
Cc: opensource.kernel@vivo.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMTEuMjAgdW0gMDM6NTUgc2NocmllYiBCZXJuYXJkIFpoYW86Cj4gRml4IGNoZWNrX3Bh
dGNoLnBsIHdhcm5pbmc6Cj4gV0FSTklORzogUHJlZmVyIGttYWxsb2NfYXJyYXkgb3ZlciBrbWFs
bG9jIHdpdGggbXVsdGlwbHkKPiArYnBzID0ga21hbGxvYyhhbGlnbl9zcGFjZSAqIHNpemVvZigo
KmRhdGEpLT5icHMpLCBHRlBfS0VSTkVMKTsKPiBXQVJOSU5HOiBQcmVmZXIga21hbGxvY19hcnJh
eSBvdmVyIGttYWxsb2Mgd2l0aCBtdWx0aXBseQo+ICticHNfYm8gPSBrbWFsbG9jKGFsaWduX3Nw
YWNlICogc2l6ZW9mKCgqZGF0YSktPmJwc19ibyksCj4gR0ZQX0tFUk5FTCk7Cj4ga21hbGxvY19h
cnJheSBoYXMgbXVsdGlwbHkgb3ZlcmZsb3cgY2hlY2ssIHdoaWNoIHdpbGwgYmUgc2FmZXIuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+CgpOb3QgdXNl
cnNwYWNlIGNvbnRyb2xsYWJsZSB2YWx1ZXMsIGJ1dCBsb29rcyBjbGVhbmVyIGFueXdheS4KClJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYyB8IDQgKyst
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmlydC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZpcnQuYwo+IGluZGV4IGQwYWVhNWUz
OTUzMS4uZjJhMDg1MWM4MDRmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV92aXJ0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdmlydC5jCj4gQEAgLTI4MCw4ICsyODAsOCBAQCBzdGF0aWMgaW50IGFtZGdwdV92aXJ0X2lu
aXRfcmFzX2Vycl9oYW5kbGVyX2RhdGEoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJ
aWYgKCEqZGF0YSkKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gICAKPiAtCWJwcyA9IGttYWxsb2Mo
YWxpZ25fc3BhY2UgKiBzaXplb2YoKCpkYXRhKS0+YnBzKSwgR0ZQX0tFUk5FTCk7Cj4gLQlicHNf
Ym8gPSBrbWFsbG9jKGFsaWduX3NwYWNlICogc2l6ZW9mKCgqZGF0YSktPmJwc19ibyksIEdGUF9L
RVJORUwpOwo+ICsJYnBzID0ga21hbGxvY19hcnJheShhbGlnbl9zcGFjZSwgc2l6ZW9mKCgqZGF0
YSktPmJwcyksIEdGUF9LRVJORUwpOwo+ICsJYnBzX2JvID0ga21hbGxvY19hcnJheShhbGlnbl9z
cGFjZSwgc2l6ZW9mKCgqZGF0YSktPmJwc19ibyksIEdGUF9LRVJORUwpOwo+ICAgCj4gICAJaWYg
KCFicHMgfHwgIWJwc19ibykgewo+ICAgCQlrZnJlZShicHMpOwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
