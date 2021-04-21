Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48883665EB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 09:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7F96E95A;
	Wed, 21 Apr 2021 07:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8032C6E958;
 Wed, 21 Apr 2021 07:01:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OD/I3S4wZIgKilZ9rdRT2AN3SWLdCHeVS+xjdwVufQL/YU/uWw3UpDDECUDwWS1qxlc4uEuSbK/e/P3VrTUojq87RJxsbGTEYuEWKWaR5nFDsjX2he7df7Hfj392NBx9JyG3RxXrtImPjkjMUx41kHEYiDQCKSIjkyzGRtKIpP7LVH/rX81tNF/CrTJwv64oTKhzPi5B2rUX7E3MVBvl2TdQD3qqmTnGAO+LqrKZ7gC59tQyD7bp0G7HmcCGBzDMA4g+vUrDq0fuuBRhfBY89/ucnWmOQmop3XAVAT0twi17JRNQ3C5zDsbbjAc6UF8ztnRanjNoMz4aRRGrFEyyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu8koUthkB/9rvC1OGQ4hxu/Ro5+CT63mWRdI8JIMvg=;
 b=H69JnZes14LHdwJJVSxWCKhSKj2jY0yqNLjGpxVZXPT/sKyOoVrhHLsYIRqw9MKGxxs6h9AYhqOiWUNV7cK7N7urXada8quRw9WSbYfKs3FO96W9B46Nj/Fky/ixs1mBeZiqDOMBNh7OiJy5MjN/OBf8J0SoZn38ELpbYn214utn8xKFaYBZzlIrq10IyjrOhO7B88VeJqLzeQNAe41jSmWwmU/UyHGdbLcDqm3lE1g1XAxdbxl8lMLk5XmXgpmKZ4uMZkKxDXQg2OG13p8k2e7yXD8GH+Zk5BrJ+yFqicFx0R6QKqpM/LM2F+mf48Cu78jEZcjM/jz6xTPE/6jhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu8koUthkB/9rvC1OGQ4hxu/Ro5+CT63mWRdI8JIMvg=;
 b=n/7gnPTyrY6tLLwiHfNEeyiIXpAoihnhsnNkysVBjWubQ1SKPv3KOp15EBWccv3bkjBBNbCnqHnh99Homhq0bTQ62zeh2aWu4XsoWWeUTp2Otd4WAhBhxnZ1OJih4rXtWxk3qWQxgv9GQvOWKLe1xNr0+ijiiNQeGrZK9x4qsaw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3951.namprd12.prod.outlook.com (2603:10b6:208:16b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 07:01:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 07:01:09 +0000
Subject: Re: [PATCH v3 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
To: Daniel Vetter <daniel@ffwll.ch>, Felix Kuehling <felix.kuehling@amd.com>
References: <20210416133146.24825-1-tzimmermann@suse.de>
 <20210416133146.24825-6-tzimmermann@suse.de>
 <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
 <80012c09-6975-f694-420f-72b2236dcf4e@amd.com>
 <52403618-62f5-2085-c245-e1e98762cccb@suse.de>
 <YH6WJ0p2jGd3Q5Xw@phenom.ffwll.local>
 <a76b44d2-d894-ab4e-ef37-f0feb4326297@amd.com>
 <CAKMK7uGmR_US-fy1GTWF4jCnCiRofyDrrJP1qFrE2CKLWbTXBA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a60d976a-8b1e-b0bb-07ba-f5801242b86c@amd.com>
Date: Wed, 21 Apr 2021 09:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAKMK7uGmR_US-fy1GTWF4jCnCiRofyDrrJP1qFrE2CKLWbTXBA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:30c1:a1b7:433d:2c5d]
X-ClientProxiedBy: PR0P264CA0093.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:30c1:a1b7:433d:2c5d]
 (2a02:908:1252:fb60:30c1:a1b7:433d:2c5d) by
 PR0P264CA0093.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 21 Apr 2021 07:01:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 377060e8-9bf5-4527-06c7-08d904933d7f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB395174817E90E36F19DD72E083479@MN2PR12MB3951.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQ5bFhtb+yOCE5DCzNMtlFOLa0AuO1AUGJLEqPrHc5KU4t0mhD0DuIin3WU/HgZ3woVslCP2l87yLd1rNNBN02ErRHK5eHSxOQ+IqNpHsfDIdl3Uag3RlVzZklrWVxFiDMZfSxFu3d38ug5smAdtaGqMvOrHMmENHuAKAXHEMUTatUp4Fi9yiSxwpUbty2CjX/rjWZtqmsNTMoUVk114ddqXHfhu26NZ3eCK1FB+BMeajRe3zwUxLHmT5QwEfhTrKb9AN0URlLna4uOS2ExLOpvvRxft2jYxbJvxBCewGyI5I2sqWtWTN6M11wPAPcB08N84FKKf9Mln0iKRucQSIAUQUXF5VlyMFWEPHiEm6taz+0sqmU9u9XdwkwIaHjls1YTc11Ho+bKyXXO1nXWrayDg68YWpTZeg15BDS//6c9qFk31A1DiQ/Hk65zL4GDisE1Kuhh8z8lD8J3ZtsyldY2QOKMVP3PbsYW2oidyUBef2BOOdESr4LZejehU7yQG92p1Gwzou7hGilh2bQ18Q9TwAklm0h/xbbvf2DPHcvcT7mKcu91O/UKk3+kkDAfTx6xa2sq99E53BcDX6aMaRewrgzXtv1xiiGVfiJOErUtmGz8ZSMm4rPBeONvsOyOQYxy0N5ErsqEyaRGcvMfdaNs5OLCsM5kIxHXLIJdeXPIledn1LuZkH+MynaGdDHaHx+MsdwJ1js0gFInzxXp39Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(6636002)(86362001)(38100700002)(31696002)(6486002)(7416002)(8676002)(31686004)(2906002)(4326008)(66574015)(6666004)(478600001)(83380400001)(110136005)(54906003)(66946007)(66476007)(53546011)(5660300002)(52116002)(8936002)(16526019)(186003)(2616005)(66556008)(36756003)(316002)(40753002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NisvREluWEd1VVpOMHVJL1pBb2tPYXRwRXZ3V0VmdEZmaStiTmRTTmhiU2J4?=
 =?utf-8?B?MDNHMktoT3NhUlB2Z1hBYWkvUjJUNmNHR2hFcnNnU29IZTdabEUyTW1vTEtz?=
 =?utf-8?B?a2VNZjQwZ28vTnB1V0RtK1Q5cHdVN3EyZ05tdGtTUEdHbEVZZ3RxdjFBUThT?=
 =?utf-8?B?Ym5rY2NINkM0ZXhMS296Mi9nMHlOYW10aGFZVmwxL2wwOEpON3hyUzc5UXgw?=
 =?utf-8?B?eFpKVXpGUTM2M2d1eWpUM0tqWURNcThEakEwYnBZbFZTWm8vNVl5c0luVVE0?=
 =?utf-8?B?RmI2c2N2aTg1UXAya2F0bDFjd1RBRjcwcEVMY0VvVSs1eWNpcDNFbUpNRzhw?=
 =?utf-8?B?bE9uMDNKVE00ZnZ1cExtOVU4ZnNUYUp1dTRwc25Gb2RyaDFvZkU0V3luTWRl?=
 =?utf-8?B?Um8rRnc4akNORDF0UEtjQW1ZRy9PVnFjdFAwd2ZCRVdqMElRTU9HYlBrK1F1?=
 =?utf-8?B?Qmw3MUJzYnJrYXVhZTVNSGhOTitpVFBmSjd6eU96UmlYWllVY09uclc1REcx?=
 =?utf-8?B?cjJsWnBsOW1BengxZU9sZDRLaFg1TTVrU3djK3M1WTRwSHN3aU1pKzFQZ251?=
 =?utf-8?B?UXFyZUdzUEFQYVBJM1RSaW16S25na2FEV1pJdXlTUk84RGRHZjdGbWYySmg2?=
 =?utf-8?B?S2RMUElRQ1JFaUVYTWV5VlovYlBEY0o1TFZJcTFkamtidlBvb24vMU81SDBQ?=
 =?utf-8?B?eXNZbUlCTWV1RldaUGZTMVBZdEtXWlJndEVKQk1oRHd1aytSS1NqYVdjNXFt?=
 =?utf-8?B?UGJDTU5TT1RiVHF2ektlU1VFbmM2czgvdzVJMnQzMEM0S2RZWldoU3AyUUZG?=
 =?utf-8?B?Q01kRXlCclRESTlPZzdxWVlNSDZpYXdCd3pOd2YrUWVISHVHSnIwMTNaM05t?=
 =?utf-8?B?b0VLd2w1Z0xOMXR1R3cwYVdmSjgwc05teG9NTkRadm43eTVIc3lTWHdNckFB?=
 =?utf-8?B?S1dneWNTcHhjR09MMmxORUFIZGRicmpHTm1Ga2x0UVpUeTVPMHhQVmJVLzBt?=
 =?utf-8?B?K0tXSU8rcnVROFFZMFVpZHJsdy9QaUNUUThYVi85WkovN0ZmY0thWEcrck5V?=
 =?utf-8?B?VFNsMDZnLzZUcXpVQVFMQnlXY25LQUFDWlQwN3ZIcVllMG5QNEh5a005NGNt?=
 =?utf-8?B?cUtwNXlUNXdiT3Z5RnFKQ1E3NGh2bEE4bHdxcGJITnZWYXNHZ1I1WW9Ocnp2?=
 =?utf-8?B?YWE3L25OZFNqRG42QVYxdmhieUZNdzdiNkNGRjI2eTJHZDVBL3VvT05Bb0JD?=
 =?utf-8?B?Q3dubmpBYWtKQ1crL21rNlk1eEVTRlE1SUMzSEpyZUk5bFYrNmo4SUFWQ3ZS?=
 =?utf-8?B?TEVhMkJuSGduV29JQ0JYdTg4Q09aeTlTVUwwZnNGYmNkVGMvK0Y3TmR3ekxH?=
 =?utf-8?B?MzVHOEczdnd6VW1Zb01pSDZBWDliMHYvajduT255L3JTVVB5TzhwWGVpZmhR?=
 =?utf-8?B?QXhGUmNEcXQ2QUdIZENCNkwxcThVUU5WbnkrRVk3UG0vKzQxK3hjMWpLQ3B0?=
 =?utf-8?B?SVhEMXdWeSs3NTA0QUhaZ3VodTNWaGF6eGVCMUQ2Ukg0Q2xoNG5KOE52NVRi?=
 =?utf-8?B?K0svNS95empqRjNQT2s2Wmpad2dUS1F0NlEvNEJ3dmgrcjRvdmp3dUdQdk9G?=
 =?utf-8?B?NDdZd3hMQUZvR1pMRk54Tit3YlBWZkdGMitkdzFoYVdxTmJ6aTVTaG1WN1c5?=
 =?utf-8?B?V1hpamZoaHEydC9oS3FUZG1PRUFsZ1loQXQrS09ZZnlpOHkzYlVzUmpIRE1I?=
 =?utf-8?B?eTdObFkzR2ZESTE3UzhWSlhGalY3Y0V0K3pTaEZLNjFzNklDdnMxaFAyeklS?=
 =?utf-8?B?NDV0cmtva3JZK29mbkV3VjlGOWtsY25YUEtzT1o3citKV2NseEZ2bW0yRWFC?=
 =?utf-8?Q?8arYmF24zSN21?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377060e8-9bf5-4527-06c7-08d904933d7f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 07:01:09.2741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVef1UBXCJ642Rga0FpQ1pfB1ADkGK1ZTZ2Q3bvsqL2Qae8V6VjEq2yzFeHXG4H7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3951
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>, Dave Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Roland Scheidegger <sroland@vmware.com>, Nirmoy Das <nirmoy.das@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDQuMjEgdW0gMjI6NTMgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgQXBy
IDIwLCAyMDIxIGF0IDEwOjIzIFBNIEZlbGl4IEt1ZWhsaW5nIDxmZWxpeC5rdWVobGluZ0BhbWQu
Y29tPiB3cm90ZToKPj4KPj4gQW0gMjAyMS0wNC0yMCB1bSA0OjUxIGEubS4gc2NocmllYiBEYW5p
ZWwgVmV0dGVyOgo+Pj4+PiBXaG9sZSBzZXJpZXMgaXMgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+PiBUaGFua3MgYSBsb3QuIElmIEkn
bSBub3QgbWlzdGFrZW4sIHRoZSBwYXRjaGVzIGF0IFsxXSBuZWVkIHRvIGdvIGluIGZpcnN0Lgo+
Pj4+IFNvIGl0IGNvdWxkIHRha2UgYSBhIGJpdCB1bnRpbCB0aGlzIGxhbmRzLgo+Pj4+Cj4+Pj4g
T3RoZXJ3aXNlLCB0aGlzIHNlcmllcyBjb3VsZCBnbyB0aHJvdWdoIHRoZSBzYW1lIHRyZWUgYXMg
WzFdIGlmIG5vdXZlYXUgYW5kCj4+Pj4gdm13Z2Z4IGRldnMgZG9uJ3QgbWluZC4KPj4+IEkgd291
bGQgbGFuZCBpdCBhbGwgdGhyb3VnaCBkcm0tbWlzYy1uZXh0LiBNYXliZSBjaGVjayB3aXRoIEFs
ZXggb24gaXJjCj4+PiBmb3IgYW4gYWNrIGZvciBtZXJnaW5nIHRoYXQgd2F5LCBidXQgSSBkb24n
dCB0aGluayB0aGlzIHdpbGwgY2F1c2UgaXNzdWVzCj4+PiBhZ2FpbnN0IHRoZSBhbWRncHUgdHJl
ZS4gTG90cyBvZiB0dG0gY2xlYW51cCBoYXMgbGFuZGVkIHRoaXMgd2F5IGFscmVhZHkKPj4+IHBh
c3QgZmV3IG1vbnRocy4gT3RoZXJ3aXNlIHlvdSBjb3VsZCBjcmVhdGUgYSBzbWFsbCB0b3BpYyBi
cmFuY2ggd2l0aAo+Pj4gdGhlc2UgcGF0Y2hlcyBoZXJlIGFuZCBzZW5kIHRoYXQgdG8gQWxleCwg
YW5kIGhlIGNhbiBzb3J0IG91dCB0aGUKPj4+IGludGVyYWN0aW9uIHdpdGggRmVsaXgnIHNlcmll
cy4KPj4+IC1EYW5pZWwKPj4gTXkgcGF0Y2ggc2VyaWVzIGludm9sdmVkIHNvbWUgcHJldHR5IGZh
ci1yZWFjaGluZyBjaGFuZ2VzIGluIEtGRAo+PiAocmVuYW1pbmcgc29tZSB2YXJpYWJsZXMgaW4g
S0ZEIGFuZCBhbWRncHUsIGNoYW5naW5nIHRoZSBLRkQtPmFtZGdwdQo+PiBpbnRlcmZhY2UpLiBX
ZSBhbHJlYWR5IHN1Ym1pdHRlZCBvdGhlciBwYXRjaGVzIG9uIHRvcCBvZiBpdCB0aGF0IGhhdmUK
Pj4gZGVwZW5kZW5jaWVzIG9uIGl0LiBJZiB3ZSBkZWNpZGUgdG8gZGVsaXZlciB0aGlzIHRocm91
Z2ggYSBkaWZmZXJlbnQKPj4gdHJlZSBhbmQgcmVtb3ZlIGl0IGZyb20gYW1kLXN0YWdpbmctZHJt
LW5leHQsIHRoZXJlIHdpbGwgYmUgY29uZmxpY3RzIHRvCj4+IHJlc29sdmUgd2hlbiByZW1vdmlu
ZyBpdCBmcm9tIGFtZC1zdGFnaW5nLWRybS1uZXh0LCBhbmQgYWdhaW4gdGhlIG5leHQKPj4gdGlt
ZSB5b3UgbWVyZ2Ugd2l0aCBhbWQtc3RhZ2luZy1kcm0tbmV4dC4KPiBBaCB0aGVuIHRoZSB1c3Vh
bCB3YXkgaXMgZm9yIEFsZXggdG8gYXNzZW1ibGUgYSB0b3BpYyBwdWxsIHJlcXVlc3QKPiAoc3Rh
YmxlLCBub24tcmViYXNpbmcpIHdpdGggdGhvc2Ugc2VsZWN0IHBhdGNoZXMsIHdoaWNoIHRoZW4g
Z2V0cwo+IG1lcmdlZCBpbnRvIGRybS1taXNjLW5leHQuIE9yIHdlIHNtYXNoIGl0IGFsbCBpbnRv
IGFtZGdwdS1uZXh0LiBPciB3ZQo+IGp1c3Qgd2FpdCB1bnRpbCAtcmMyIHdoZW4gZHJtLW5leHQg
aXMgYmFjayBvcGVuIGZvciBidXNpbmVzcy4KCkkgbmVlZCB0byBkb3VibGUgY2hlY2ssIGJ1dCBp
ZiBJJ20gbm90IHRvdGFsbHkgbWlzdGFrZW4gdGhlIGNoYW5nZXMgaW4gCnF1ZXN0aW9uIHNob3Vs
ZCBhbHJlYWR5IGJlIGluIGRybS1uZXh0LgoKQnV0IGV4YWN0bHkgdGhhdCB3YXMgdGhlIHJlYXNv
biB3aHkgSSBhc2tlZCB3aGVuIHRoZSBuZXh0IGJhY2ttZXJnZSBmcm9tIApkcm0tbmV4dCBpbnRv
IGRybS1taXNjLW5leHQgaXMgcGxhbm5lZCA6KQoKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
