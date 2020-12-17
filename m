Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD642DD448
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 16:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA2A893B8;
	Thu, 17 Dec 2020 15:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E38E893B8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 15:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABeJWwvc2TJXXQKv162qUEbnFBTkK/ihRekxhlKJnEwjR0yo0lNVxpRBlxBEUdbQL3fSm1iGhDse3besgOQlxxmugbdtFxUsSLXY5RHG+YxpvURjbgqoyb2jJFQTWR8e5lCbpw4ls7y+04fGl7CevGEeCMY50JgCOTpaC6QE8e5oIgxkMk882Q4g4l3o494hJgRqcxKFiDLIf95Xq+MN9MO29iCGNHwkqXR5g6xJlS0sRrMbyrm1mpqkA0968mnnDm7MAidDCaV4tZcIMsDOtLCO174347GaTHHCaYpMK3GZXj9x2xtaE89dhDyfpQMynn1aeWlNO2yUIIwSB8Khlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uIZqSQrwaLc4jMqb1m/wBrwvTpOdO7Lqse2+0rtcNw=;
 b=gCZPmtLxsGhi1jyJVYiCa3OTtk6wXL0LNFAoR8hD59Go89nWJwlX0xCMz1z03imNUsJD5pEL5B7cyYubhd2o8O1gXXpUndJwrD6swloD0DOGESPl6ulplEZjWFoP6gYkMlBjcoTmOhTp86Th8CyK+b9+sNly4hg1Kh3+5nQFdoiaSMIpeniv6t+h53hs4i5p7D4PdSR4gHz9jqNbbewn6AqOEcqLthqULxJAt59YSBRWZjNF11/6kQEweBEM+UNTXYNeWKO1o6rPuk5MdNEgohd0x4GH6+gAfUxGEeaDw7MlzBJyTQrWC+g9KJSSA0rag/H8+cr/A67DgflLuz/0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uIZqSQrwaLc4jMqb1m/wBrwvTpOdO7Lqse2+0rtcNw=;
 b=CIKhDGvfqQOr4wQMew/vJy1VYBJq9Y3JI/2elkvjzNDOF74D0jrEMpl7r8tmpe/qzGFGT7szOclDEL5k80X/FZO4iDDRLzL1od9O8v1H1Gx8J6sj3T1R18Dj/4vYE+nkUjtzrIAjfo9TPtbVLF2RZ3ezeHx+kDmxHzQASvGw7Sk=
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4706.namprd12.prod.outlook.com (2603:10b6:208:82::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 17 Dec
 2020 15:36:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 15:36:00 +0000
Subject: Re: [PATCH 1/2] drm/ttm: rework ttm_tt page limit v2
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201216140427.1253-1-christian.koenig@amd.com>
 <X9ojPDJv1ybEJT0k@phenom.ffwll.local>
 <2d702307-052c-f59d-a385-f373d1eae823@gmail.com>
 <CAKMK7uFsNY+yj1C_q+=-_0F6Mud-9_YjPTq6wDEBBZ+oeraQaw@mail.gmail.com>
 <de05379f-87d7-e0f0-d661-b331ee03cea6@amd.com>
 <CAKMK7uEqUOBgdd+2Lcw8KEGVYz9MCfE67bEp-NsfMuzmWu0_4A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0e50223b-d851-fdaa-d25e-5402d14444af@amd.com>
Date: Thu, 17 Dec 2020 16:35:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uEqUOBgdd+2Lcw8KEGVYz9MCfE67bEp-NsfMuzmWu0_4A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0302CA0016.eurprd03.prod.outlook.com
 (2603:10a6:205:2::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0302CA0016.eurprd03.prod.outlook.com (2603:10a6:205:2::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 17 Dec 2020 15:35:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cf9ee1b0-0fbd-4988-c1d3-08d8a2a17495
X-MS-TrafficTypeDiagnostic: BL0PR12MB4706:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB47067D3C13E8706391CA075083C40@BL0PR12MB4706.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0nq+LpSpI6PqPBcdaBB/2yn4BMfCCsk8pSJxmI7KlIukrqpAbvz9EFZHAp91XMzzbayXcxB4VdcDlxB3UCno2IhCLmPiE11sIYSHXF5MYB0yFCQKf0QWTVM5lj/Y2Z7Ru0JB8YiTGfpN6JzxVymfalYsiM/gmYmiImyiHnuqT2a4ivS+mr2t63mqk1DzSiT1Ft2FAjjzVfiAQaxUNXbVMYp2ZyAK2zK4cBmeqI0qLNmBVuaiNIDOOxspcn0rcM4wlnj+DltwB/QM4IACGN5t0AMtTe0vztpnz984Ei+PPSVo85EIIbtNy3abwGDE5izAIUVBanYRVPPVZZozrVCfnDEQ4+z+aNCchHdmkGwUY6yrN205GNiugHuaN96lrMD4Z43PmYC3px5Cd0Ii7nx8JbVKCDv3buV0ppVjgPQD4/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(4326008)(52116002)(66556008)(31696002)(186003)(2616005)(478600001)(53546011)(54906003)(6486002)(6666004)(16526019)(66946007)(5660300002)(83380400001)(36756003)(66574015)(6916009)(8676002)(86362001)(316002)(2906002)(8936002)(31686004)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c1BMS0twN3pOSTd4Z0prOUJRTVZmTlRXRUYydGpNMmlQdEJwc0F3bHlQcXd6?=
 =?utf-8?B?cG8wZlhIdGpnYkVGbW9WZFlmeU1McDBnOXRhakk4T2h4U0UwSkVNMDBqKzVV?=
 =?utf-8?B?ZDgvTEpSVVFlSmlaWWdoSURseUU5YjQ1dm9zMWdFa1Bwc1R2dUtZbEV2dGNI?=
 =?utf-8?B?MXpkWmt3V0dDdkE5SnpzRWt2cHBlOGFMbWN5dXZmdlc2cGpBcVJNUzhRMmxS?=
 =?utf-8?B?VkR0OEVvMXJ0Q2UvYStrUjZRUFRZU1Q0bnQ5NWZUWmRGVjljMjZBNmNaMFNM?=
 =?utf-8?B?VGJBL1lvTEJTYlhMamR0VU9RSU5oV2tMbjZYNHNWOFM3R3BEeDByTlJHSFd4?=
 =?utf-8?B?Tnhrd0llNmtQTjlqdk55M2RqS1dYVnZoRy9ER1FzMkxHaEsxLzRvS2QwWkdM?=
 =?utf-8?B?RGdTY3dKQ2tiZEFJa1hSVUhkc3FURkhUK1V5bHJXUnBOaElLUVRFZysrdUQx?=
 =?utf-8?B?dExjeHVRdUZSZVdCNkdIUVNsUFk5UG9NRjY3eHlna2NZTnF4dEE5UTlSRVpr?=
 =?utf-8?B?Sm5IdDNDTmFEZUFUZ2VYcjJzdFZtVmFqb0I3WkpRUXNTTURZeHAvMW9VRWdx?=
 =?utf-8?B?WmJyTldyUmdpeWM5N01Zb1A4aklRVkwvZDFvaXdlWnRTZlRsUVFIdTlXQUN2?=
 =?utf-8?B?OVRNcWU5eXgyd3FNamlPVWxJd0xndzhPLzlVSHkyaWJDT21GL09tWGZ2bUpk?=
 =?utf-8?B?TGZJd2Y4bExOT1Vsd0lDUW91OEhBd2pGdHR3Y3NvSk5zTlFRNHJIOTlvcVVa?=
 =?utf-8?B?cjhuR1RkSGY1VlJoMXc0TTQ4M2ZtWXpubDNCVDZGYlIwTDk0YldJRkRMSG9X?=
 =?utf-8?B?a3Jyc1lGcVR0bVh0TXFGUEY2TjVWVzgrVlJwamFsWjhqMjJFRnU5b3ZuT2hx?=
 =?utf-8?B?OHpPbEkvTlh3N1MzWlNoYTlKNzUvemsza1MwWTZWblhuMDhEV2p5SDJxcnIz?=
 =?utf-8?B?NzcwbHRQOE1uVjNJTk9MeVUrYXhYNjZma1VWOXp5MU1PUk5KT3dZU3RzZ1d3?=
 =?utf-8?B?NjN2S2Q2QkN4eHNZalB2Tk13Z0N4ckpoZnpqdVhUYjhWUkJPNHZCQ2ZrZ1pG?=
 =?utf-8?B?ZnhjZktydEpxczBRVW1WaTRJMTlYVHJNYmw4WWJhd3BUbUh1RGhFV0pGaXln?=
 =?utf-8?B?T1d0TERjSDZjdlNHK1VuTFN3cGFsN2drWFBYaUNHTkRPUmptRzMrZ2ZpT2xx?=
 =?utf-8?B?dEsycVhMM0FQV2ZhWEhUVXFJTUhnaWdTTy94SlQ4aWxXa01jYXdrK1duVDZV?=
 =?utf-8?B?V0thbFVmdCtTdTViZDcwaUxKalBrblptZlVuKzRxeXh5VHRuelNZZDYzSWJK?=
 =?utf-8?B?dUpuam9XOExrRG5ybWdyckQ0V3VGQStPY2RlbUpWa0NMNk1KZkdab0YvWXVs?=
 =?utf-8?B?bEpSZXZIUmQwZVpFQldONFJLMGNEbVVVRVdJOFA3b3VSZ3pIMmFpdXNSY3la?=
 =?utf-8?Q?IgYzfOT4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 15:36:00.1621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9ee1b0-0fbd-4988-c1d3-08d8a2a17495
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEyMQybxjyb8AkMcjAkit4lhO/lw9YAARhcpqG7pV7pqm4xplp2H0iUOvxMBGr0M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4706
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
Cc: Dave Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMTIuMjAgdW0gMTY6MjYgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgRGVj
IDE3LCAyMDIwIGF0IDQ6MTAgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+PiBBbSAxNy4xMi4yMCB1bSAxNTozNiBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4+PiBPbiBUaHUsIERlYyAxNywgMjAyMCBhdCAyOjQ2IFBNIENocmlzdGlhbiBLw7Zu
aWcKPj4+IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4gQW0g
MTYuMTIuMjAgdW0gMTY6MDkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4+PiBPbiBXZWQsIERl
YyAxNiwgMjAyMCBhdCAwMzowNDoyNlBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
Pj4+PiBbU05JUF0KPj4+Pj4+ICsKPj4+Pj4+ICsvKiBBcyBsb25nIGFzIHBhZ2VzIGFyZSBhdmFp
bGFibGUgbWFrZSBzdXJlIHRvIHJlbGVhc2UgYXQgbGVhc3Qgb25lICovCj4+Pj4+PiArc3RhdGlj
IHVuc2lnbmVkIGxvbmcgdHRtX3R0X3Nocmlua2VyX3NjYW4oc3RydWN0IHNocmlua2VyICpzaHJp
bmssCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
c2hyaW5rX2NvbnRyb2wgKnNjKQo+Pj4+Pj4gK3sKPj4+Pj4+ICsgICAgc3RydWN0IHR0bV9vcGVy
YXRpb25fY3R4IGN0eCA9IHsKPj4+Pj4+ICsgICAgICAgICAgICAubm9fd2FpdF9ncHUgPSB0cnVl
Cj4+Pj4+IElpcmMgdGhlcmUncyBhbiBldmVudHVhbCBzaHJpbmtlciBsaW1pdCB3aGVyZSBpdCBn
ZXRzIGRlc3BlcmF0ZS4gSSB0aGluawo+Pj4+PiBvbmNlIHdlIGhpdCB0aGF0LCB3ZSBzaG91bGQg
YWxsb3cgZ3B1IHdhaXRzLiBCdXQgaXQncyBub3QgcGFzc2VkIHRvCj4+Pj4+IHNocmlua2VycyBm
b3IgcmVhc29ucywgc28gbWF5YmUgd2Ugc2hvdWxkIGhhdmUgYSBzZWNvbmQgcm91bmQgdGhhdCB0
cmllcwo+Pj4+PiB0byBtb3JlIGFjdGl2ZWx5IHNocmluayBvYmplY3RzIGlmIHdlIGZlbGwgc3Vi
c3RhbnRpYWxseSBzaG9ydCBvZiB3aGF0Cj4+Pj4+IHJlY2xhaW0gZXhwZWN0ZWQgdXMgdG8gZG8/
Cj4+Pj4gSSB0aGluayB3ZSBzaG91bGQgdHJ5IHRvIGF2b2lkIHdhaXRpbmcgZm9yIHRoZSBHUFUg
aW4gdGhlIHNocmlua2VyIGNhbGxiYWNrLgo+Pj4+Cj4+Pj4gV2hlbiB3ZSBnZXQgSE1NIHdlIHdp
bGwgaGF2ZSBjYXNlcyB3aGVyZSB0aGUgc2hyaW5rZXIgaXMgY2FsbGVkIGZyb20KPj4+PiB0aGVy
ZSBhbmQgd2UgY2FuJ3Qgd2FpdCBmb3IgdGhlIEdQVSB0aGVuIHdpdGhvdXQgY2F1c2luZyBkZWFk
bG9ja3MuCj4+PiBVaCB0aGF0IGRvZXNuJ3Qgd29yay4gQWxzbywgdGhlIGN1cnJlbnQgcnVsZXMg
YXJlIHRoYXQgeW91IGFyZSBhbGxvd2VkCj4+PiB0byBjYWxsIGRtYV9mZW5jZV93YWl0IGZyb20g
c2hyaW5rZXIgY2FsbGJhY2tzLCBzbyB0aGF0IHNoaXBwZWQgc2FpbGVkCj4+PiBhbHJlYWR5LiBU
aGlzIGlzIGJlY2F1c2Ugc2hyaW5rZXJzIGFyZSBhIGxlc3MgcmVzdHJpY3RpdmUgY29udGV4dCB0
aGFuCj4+PiBtbXUgbm90aWZpZXIgaW52YWxpZGF0aW9uLCBhbmQgd2Ugd2FpdCBpbiB0aGVyZSB0
b28uCj4+Pgo+Pj4gU28gaWYgeW91IGNhbid0IHdhaXQgaW4gc2hyaW5rZXJzLCB5b3UgYWxzbyBj
YW4ndCB3YWl0IGluIG1tdQo+Pj4gbm90aWZpZXJzIChhbmQgYWxzbyBub3QgaW4gSE1NLCB3xKVp
Y2ggaXMgdGhlIHNhbWUgdGhpbmcpLiBXaHkgZG8geW91Cj4+PiBuZWVkIHRoaXM/Cj4+IFRoZSBj
b3JlIGNvbmNlcHQgb2YgSE1NIGlzIHRoYXQgcGFnZXMgYXJlIGZhdWx0ZWQgaW4gb24gZGVtYW5k
IGFuZCBpdCBpcwo+PiBwZXJmZWN0bHkgdmFsaWQgZm9yIG9uZSBvZiB0aG9zZSBwYWdlcyB0byBi
ZSBvbiBkaXNrLgo+Pgo+PiBTbyB3aGVuIGEgcGFnZSBmYXVsdCBoYXBwZW5zIHdlIG1pZ2h0IG5l
ZWQgdG8gYmUgYWJsZSB0byBhbGxvY2F0ZSBtZW1vcnkKPj4gYW5kIGZldGNoIHNvbWV0aGluZyBm
cm9tIGRpc2sgdG8gaGFuZGxlIHRoYXQuCj4+Cj4+IFdoZW4gdGhpcyBtZW1vcnkgYWxsb2NhdGlv
biB0aGVuIGluIHR1cm4gd2FpdHMgZm9yIHRoZSBHUFUgd2hpY2ggaXMKPj4gcnVubmluZyB0aGUg
SE1NIHByb2Nlc3Mgd2UgYXJlIHByZXR0eSBtdWNoIGJ1c3RlZC4KPiBZZWFoIHlvdSBjYW4ndCBk
byB0aGF0LiBUaGF0J3MgdGhlIGVudGlyZSBpbmZpbml0ZSBmZW5jZXMgZGlzY3Vzc2lvbnMuCgpZ
ZXMsIGV4YWN0bHkuCgo+IEZvciBITU0gdG8gd29yaywgd2UgbmVlZCB0byBzdG9wIHVzaW5nIGRt
YV9mZW5jZSBmb3IgdXNlcnNwYWNlIHN5bmMsCgpJIHdhcyBjb25zaWRlcmluZyBvZiBzZXBhcmF0
aW5nIHRoYXQgaW50byBhIGRtYV9mZW5jZSBhbmQgYSBobW1fZmVuY2UuIApPciBzb21ldGhpbmcg
bGlrZSB0aGlzLgoKPiBhbmQgeW91IGNhbiBvbmx5IHVzZSB0aGUgYW1ka2ZkIHN0eWxlIHByZWVt
cHQgZmVuY2VzLiBBbmQgcHJlZW1wdGluZwo+IHdoaWxlIHRoZSBwYWdlZmF1bHQgaXMgcGVuZGlu
ZyBpcyBJIHRob3VnaHQgc29tZXRoaW5nIHdlIHJlcXVpcmUuCgpZZWFoLCBwcm9ibGVtIGlzIHRo
YXQgbW9zdCBoYXJkd2FyZSBjYW4ndCBkbyB0aGF0IDopCgpHZXR0aW5nIHBhZ2UgZmF1bHRzIHRv
IHdvcmsgaXMgaGFyZCBlbm91Z2gsIHByZWVtcHRpbmcgd2hpbGUgd2FpdGluZyBmb3IgCmEgZmF1
bHQgdG8gcmV0dXJuIGlzIG5vdCBzb21ldGhpbmcgd2hpY2ggd2FzIGFudGljaXBhdGVkIDopCgo+
IElvdywgdGhlIEhNTSBwYWdlIGZhdWx0IGhhbmRsZXIgbXVzdCBub3QgYmUgYSBkbWEtZmVuY2Ug
Y3JpdGljYWwKPiBzZWN0aW9uLCBpLmUuIGl0J3Mgbm90IGFsbG93ZWQgdG8gaG9sZCB1cCBhbnkg
ZG1hX2ZlbmNlLCBldmVyLgoKV2hhdCBkbyB5b3UgbWVhbiB3aXRoIHRoYXQ/Cgo+IE9uZSBjb25z
ZXF1ZW5jZSBvZiB0aGlzIGlzIHRoYXQgeW91IGNhbiB1c2UgSE1NIGZvciBjb21wdXRlLCBidXQg
dW50aWwKPiB3ZSd2ZSByZXZhbXBlZCBhbGwgdGhlIGxpbnV4IHdpbnN5cyBsYXllcnMsIG5vdCBm
b3IgZ2wvdmsuIE9yIGF0IGxlYXN0Cj4gSSdtIG5vdCBzZWVpbmcgaG93Lgo+Cj4gQWxzbyBsaWtl
IEkgc2FpZCwgZG1hX2ZlbmNlX3dhaXQgaXMgYWxyZWFkeSBhbGxvd2VkIGluIG1tdSBub3RpZmll
cnMsCj4gc28gd2UndmUgYWxyZWFkeSBsb2NrZWQgZG93biB0aGVzZSBzZW1hbnRpY3MgZXZlbiBt
b3JlLiBEdWUgdG8gdGhlCj4gbmVzdGluZyBvZiBnZnAgYWxsb2NhdGlvbiBjb250ZXh0cyBhbGxv
d2luZyBkbWFfZmVuY2Vfd2FpdCBpbiBtbXUKPiBub3RpZmllcnMgKGkuZS4gX19HRlBfQUxMT1df
UkVDTEFJTSBvciB3aGF0ZXZlciB0aGUgZmxhZyBpcyBleGFjdGx5KQo+IGltcGxpZXMgaXQncyBh
bGxvd2VkIGluIHNocmlua2Vycy4gQW5kIG9ubHkgaWYgeW91IGZvcmJpZCBpdCBmcm9tIGZyb20K
PiBhbGwgYWxsb2NhdGlvbnMgY29udGV4dHMgKHdoaWNoIG1ha2VzIGFsbCBidWZmZXIgb2JqZWN0
IG1hbmFnZWQgZ3B1Cj4gbWVtb3J5IGVzc2VudGlhbGx5IHBpbm5lZCwgZXhhY3RseSB3aGF0IHlv
dSdyZSB0cnlpbmcgdG8gbGlmdCBoZXJlKSBkbwo+IHlvdSBnZXQgd2hhdCB5b3Ugd2FudC4KPgo+
IFRoZSBvdGhlciBvcHRpb24gaXMgdG8gbWFrZSBITU0gYW5kIGRtYS1idWYgY29tcGxldGVseSBk
aXNqb2ludCB3b3JsZHMKPiB3aXRoIG5vIG92ZXJsYXAsIGFuZCBnYW5nIHNjaGVkdWxpbmcgb24g
dGhlIGdwdSAodG8gZ3VhcmFudGVlIHRoYXQKPiB0aGVyZSdzIG5ldmVyIGFueSBkbWFfZmVuY2Ug
aW4gcGVuZGluZyBzdGF0ZSB3aGlsZSBhbiBITU0gdGFzayBtaWdodAo+IGNhdXNlIGEgZmF1bHQp
Lgo+Cj4+IFtTTklQXQo+Pj4gU28gd2hlcmUgZG8geW91IHdhbnQgdG8gcmVjdXJzZSBoZXJlPwo+
PiBJIHdhc24ndCBhd2FyZSB0aGF0IHdpdGhvdXQgX19HRlBfRlMgc2hyaW5rZXJzIGFyZSBub3Qg
Y2FsbGVkLgo+IE1heWJlIGRvdWJsZSBjaGVjaywgYnV0IHRoYXQncyBhdCBsZWFzdCBteSB1bmRl
cnN0YW5kaW5nLiBHRlAgZmxhZ3MKPiBhcmUgZmxhZ3MsIGJ1dCBpbiByZWFsaXR5IGl0J3MgYSBz
dHJpY3RseSBuZXN0aW5nIGhpZXJhcmNoeToKPiBHRlBfS0VSTkVMID4gR0ZQX05PRlMgPiBHRlBf
Tk9JTyA+IEdGUF9SRUxDQUlNID4gR0ZQX0FUT01JQyAob2sgYXRvbWljCj4gaXMgc3BlY2lhbCwg
c2luY2UgaXQncyBhbGxvd2VkIHRvIGRpcCBpbnRvIGVtZXJnZW5jeSByZXNlcnZlKS4KCkdvaW5n
IHRvIHJlYWQgbXlzZWxmIGludG8gdGhhdCBvdmVyIHRoZSBob2xpZGF5cy4KCkNocmlzdGlhbi4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
