Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC57535F0A9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 11:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065A76E904;
	Wed, 14 Apr 2021 09:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8CC6E8FF;
 Wed, 14 Apr 2021 09:19:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMLdppc8H5IxId3cZxqoRtLH3IneM+eSjcXcYxMHBajgsquDdbAiCQ/JtJXZU+k1Ru5ghHg0lUU7zPp8msjhF2mDq6NQ+7WVwqke6KKYxglRauQba66nXSPrYVb8sLQ6Sj0d/HN5nNjwTm8hW3WcuH+cmcIT16PCupZHFU4u6wTl8pKaVRom85qHS/FFSWoxDwXlMa99y6lB4JIREOQIGW4gdJ3hXiie3ZB/6esBbqAGaE3vey4ub1hVowJ7nDIcNBepWV+YuA/4cBA/ucaKT2rwiFGhNwaTrBBXa/pWbxH88QdLw2FbznHX1xpBg33cTTh5v4hZ63aWiCgRauqvFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzQxA1MWhkqNFvktzYikOood8cvIEL4QIEugfL3YgTI=;
 b=L+jnE1k9t0rMlj5+b6A19vLcFDh0KZ3P3QETRnOt5HWpBEQyhckaG7FHcwGdBf06lekyqUc0mYaqq+eZwW65FzRGWY+9uC/f5lcVo/u0oKCMDLaezCIh4nrVqidYQVhQ+tl3LS+eivJ938baRWyaVrPpsMU/CDS9vT52q5S98i4EfrHsw0N33ztyWQJKAXedoO2gSGRSWEbQ7HkdTJxZGgwTFYQcthINJoiTmSyI7VAH1E7z8iF8yBu1KRjRjLi1T1apxDCTQ+yxCX6V7YIJBdr/55zGh4//JWcZ1DkCLcAlb2mNMmXvWoy9sB1VmbQGVN1CIaJopASL0CoQV2mH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzQxA1MWhkqNFvktzYikOood8cvIEL4QIEugfL3YgTI=;
 b=AFs4lIVQzlqJ04h79puW+N4st9pZvo00kmDfDR03eVMkeAQ8D851QXwzw6uyCVcYV9yk5Of8HYCMaDtWjl5cJlCFOJYhvm6eV0gw5YNKdgGaCGy+CiWGkgzsumY8iLlkocgvSc8UHPAe+fiEX5WSIxv3wjKf8dSTBnl/pwrsEl4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 09:19:48 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 09:19:48 +0000
Subject: Re: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against
 pages_limit
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
 <20210414064804.29356-9-Felix.Kuehling@amd.com>
 <60d08770-e4f5-4e8f-0a93-2270ae02aa26@gmail.com>
 <YHayqD3IbupkY7b+@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <18a18e85-7b0d-649f-64a3-028376d8de15@amd.com>
Date: Wed, 14 Apr 2021 11:19:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YHayqD3IbupkY7b+@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:eb49:bad8:5b80:ea48]
X-ClientProxiedBy: PR0P264CA0155.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:eb49:bad8:5b80:ea48]
 (2a02:908:1252:fb60:eb49:bad8:5b80:ea48) by
 PR0P264CA0155.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 14 Apr 2021 09:19:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b637139-2f21-4806-6896-08d8ff2672b2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40941DFC7177615C56C7B9F4834E9@MN2PR12MB4094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cN9t81Wa2E3UE+y3JagF5aVR63cDjqHxNqNzNfTsDW++OhlgdOunIbWpr1lVPFufj7OYYTZsiekAn9UpKFoSfrXgdCZeVdGqbTAs2P59+WitrK/klKaL8NAWJFAQkZwN3xCZuqivGZdAWKHkeav5cDOxQyePdUzqu6iDQfQHDpxX3kzeeAW1vEJ5xo4NtApRwupz5Ai3lOSdYnQ9PjtKot+dgKM+yzNkxvLcEO1/0Yv9/z/WpDGqU9py9py2HryS0WAhOXlR3m4NQX8DhZDjC7y3Qugqsw+QM899dpeH8TMuuTcN+7ibQxOiJtCzbaACN33IhTbgVTm/Hifj8ZB4t9sffjMmjxKerIES8sx0Ub2pW3dgrXT47LgpxhNc1BeLDNM81chhto1emdV4hsweEynHz+VIloGIw4blxMmJEtv9xs1aTZ84FT+qB7yTH9OvIelmOx6npJWdmPukKcpmbTvrTyC5Lyb1UB4Bcj8J8Jhq6WzwyC+1yKeaYgsDcQs1BhrkFxHzzsem3fN98ELUL0dc0Ub9HXGTut5fnsLnk8vPUecWd8sSBplbsBRrKMCID5dBhRdNlDMjZKr1Zt61IiZ9mjHCWNC0LOiWpmZkrpnv5RE7AfBuDGqqPASMCnVz8uXbQGODLOg/cDgmqMs1j/zSmtGffjYsR7slNZ8VGOeQTKRowiDhmXtA/S3+TNaSIUrAqtMUMPr8Rpppl8Z8b+seFXsTuuLTa04cHl+buI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39850400004)(366004)(136003)(8676002)(31686004)(186003)(8936002)(83380400001)(86362001)(66574015)(4326008)(36756003)(2906002)(66946007)(66556008)(316002)(6666004)(2616005)(110136005)(38100700002)(52116002)(6486002)(31696002)(66476007)(478600001)(966005)(5660300002)(45080400002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TS9KL2ZvZUYwV3V3dDNXS09XV2F3QjE5S3d6K3NkekNOK2czaGRIMnRBZ21B?=
 =?utf-8?B?Znozc3E2dHViMkQxaThqTU82VE5idmJZK2dnUVgzcW1PZHNzTUI4NlE1MXhK?=
 =?utf-8?B?dGErdHVRelU0c0xjOTRJOTczSVlicHk5dE9OSXU1RDBqbGxtOWNxOTF3VEpr?=
 =?utf-8?B?WGJQL1ZsZ2NkNy9vaWV1VTA1b1BWKy9XSEhjNDc3K21RZllFYW1XOCtaT2lr?=
 =?utf-8?B?NnZlV0JPRDdGUVNFdzU1ZmhwWk5TNEQxZm14a3lYQkdpRTNqbjRuelEwUlNz?=
 =?utf-8?B?by9ZeVpNNW9IblI0T3hUTXdHRUVyaXpmUEQ3Mll2NFp5UWkrK0UwU2NzRldV?=
 =?utf-8?B?VkRhdkErNlZZd0F2Z09GWUkyNXhIZkpxc2lQWUhYN0sxMGIrZ1VIaEppbDM2?=
 =?utf-8?B?SktsWFRxUlJIWTZxbGVSeGtaMC9qVG5rejFPWm5TVmFrUUNsazk1blN3SzJj?=
 =?utf-8?B?MjIvTWV6RkVkM2lFSGhvZUcwSk82Y09JM3MvMi9LaHBHWnJGZHJHWTRCaWI1?=
 =?utf-8?B?TERhSzFCazI2dXB3Y2dTUUkxbUZocEJYcWNOeHZxdkkxeFdUd0FKWXlZb283?=
 =?utf-8?B?MCtTQnhlZ2NTMk9UUkpWekZuVVpBdHhES3NUeTM1RmtnREpJV3VpVlk5bWVy?=
 =?utf-8?B?U3FCKzdHRTZ6VGpNZFRnRjlVRzV3MEVkbGZVTGc2dWs3ZHd0MGdRUDYrQkJK?=
 =?utf-8?B?WlVjRFIwVEUrbHAyaUJvdEhmaTE3ZWJScGkxSXRESFd6YlVmK1lkSXhLQ1Zk?=
 =?utf-8?B?VVZRYXdRWjI2S2dud2loYUFVcE51bnNnVEVWSnJVZWVCTllNbGNpZDBsU2Ry?=
 =?utf-8?B?NVNzMFRtc29zVzFleEMzVENsb2s1NmJMRWNEalFkMVh0UVlHNHY1S2lhQW85?=
 =?utf-8?B?alF0czh4bklvaU5GSktzbWJ4cVBsVmkyd1VwN3BJdVBrRlY2WGhLWTVqQ28z?=
 =?utf-8?B?RmRqbnl1eEo3YWhmZ1VLUDJJbHR3dE5FTFVaMmZnbWg0ZFp6L3U4eE5kOWpY?=
 =?utf-8?B?TjdIR1ZsakNTalRWcWNUSS9jUGdRbHlWSnRJS3JGam5qbWpIRGRCbS92T2Q3?=
 =?utf-8?B?dXFmVzk0QVcycjR2U1FnYXN0U01kOHhhMllBTXFyMm9yM0JENlV5b0FrSkRG?=
 =?utf-8?B?bmhYdFZMekpzNWRNOUxxeTY5bzFITFJLcVJnTWkxalh5enhobzM0aXo4UGU0?=
 =?utf-8?B?WHpNbkVpTTNqZmJXNkRIOGlPekJTaWdrNG5HVnJicWxaQ2Z5R1JiWEhnQ1NF?=
 =?utf-8?B?TFFISU9hRGhWaG91aUJvU3dYc1dBc2t4K1g4TW16QU9VbFczTVY3Q0x0ZlhL?=
 =?utf-8?B?RVVtb1NYaGh2eDJCVFVhMjZyRDBIdVBtcU1zQlRMRE9wRjl2Mm9QMmdsamhj?=
 =?utf-8?B?OXNoekVpUzNLdURYVDFZc1RuU3d2bkxyRExSN2dDaGZkZEJ0YmttbnVEYmF1?=
 =?utf-8?B?SUt5QnIrNUFtWHlQNHhSV3k3L2x1NTBzdmlVRFRnc3IwZ3M2TjdIRS9ubnZz?=
 =?utf-8?B?N2NoOUZsTFVOTHp2WGVRaXE0bkl1UEFlSkllRjRwMlB0OEwrNnlMZG5sd1pj?=
 =?utf-8?B?L3kvZjhsUXg3VU9pWXJtRWI5c0dBd2I0dFlyNFJFWjJKY0FQQnpRVGZjTjJq?=
 =?utf-8?B?VmFHYkpxS1FZMzNqT1dRUlYvc1E5TEQrWXlma1NXeEU4Rnd1WlIzZGQrMlUr?=
 =?utf-8?B?NXV1TnQ2dVYvRHNycnpZd29sYW8yYXEwaDNFTmVPSWFzVmRMNlB4bHE3Yytt?=
 =?utf-8?B?b3AwTDVUTmFtWjM3YmtudG1FOUZaRGlKNzAwSHlncjdhYWRjTHIydlVzNUkw?=
 =?utf-8?B?RHpsbkFHVjczU0g5L1RiQUJVaHowOGsvQnpES2FBRUUxZlE4MUVRNFNtbnFP?=
 =?utf-8?Q?6cJ8zbkmn9xs0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b637139-2f21-4806-6896-08d8ff2672b2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 09:19:47.8515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cds8vaiS2DRoyRP1iyEvFXHmRFx5yL0arwdK5VzXIpjO1uRpQ57HNL1/Cpz+mvUj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDQuMjEgdW0gMTE6MTUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgQXBy
IDE0LCAyMDIxIGF0IDA4OjUxOjUxQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDE0LjA0LjIxIHVtIDA4OjQ4IHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6Cj4+PiBQYWdlcyBp
biBTRyBCT3Mgd2VyZSBub3QgYWxsb2NhdGVkIGJ5IFRUTS4gU28gZG9uJ3QgY291bnQgdGhlbSBh
Z2FpbnN0Cj4+PiBUVE0ncyBwYWdlcyBsaW1pdC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZWxp
eCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4KPj4gR29pbmcgdG8gcGlj
ayB0aGF0IG9uZSB1cCBmb3IgaW5jbHVzaW9uIGluIGRybS1taXNjLW5leHQuCj4gU2VlIG15IG90
aGVyIGVtYWlsLCBidXQgd2h5IGRvIHdlIG5lZWQgdGhpcz8gQSBiaXQgbW9yZSBleHBsYW5hdGlv
biBpcyBpbW8KPiBuZWVkZWQgaGVyZSBhdCBsZWFzdCwgc2luY2Ugd2Ugc3RpbGwgbmVlZCB0byBn
dWFyYW50ZWUgdGhhdCBhbGxvY2F0aW9ucwo+IGRvbid0IG92ZXIgdGhlIGxpbWl0IGluIHRvdGFs
IGZvciBhbGwgZ3B1IGJ1ZmZlcnMgdG9nZXRoZXIuIEF0IGxlYXN0IHVudGlsCj4gdGhlIHNocmlu
a2VyIGhhcyBsYW5kZWQuCj4KPiBBbmQgdGhpcyBoZXJlIGp1c3Qgb3BlbnMgdXAgdGhlIGJhcm4g
ZG9vciB3aXRob3V0IGFueSBleHBsYW5hdGlvbiB3aHkgaXQncwo+IG9rLgoKVGhlIFNHIGJhc2Vk
IEJPcyBtaWdodCBub3QgZXZlbiBiZSBiYWNrZWQgYnkgcGFnZXMuIEUuZy4gZXhwb3J0ZWQgVlJB
TS4KClNvIGVpdGhlciB0aGV5IGFyZSBleHBvcnRlZCBieSBhIGRyaXZlciB3aGljaCBzaG91bGQg
aGF2ZSBhY2NvdW50ZWQgZm9yIAp0aGUgYWxsb2NhdGlvbiwgZXhwb3J0ZWQgYnkgVFRNIHdoaWNo
IGFscmVhZHkgZGlkIHRoZSBhY2NvdW50aW5nIG9yIApkb2Vzbid0IGV2ZW4gcG9pbnQgdG8gcGFn
ZXMgYXQgYWxsLgoKVGhpcyBpcyByZWFsbHkgYSBidWcgZml4IHRvIHJlY3JlYXRlIHRoZSBiZWhh
dmlvciB3ZSBoYWQgYmVmb3JlIG1vdmluZyAKdGhlIGFjY291bnRpbmcgdG8gdGhpcyBwbGFjZS4K
CkNocmlzdGlhbi4KCj4gLURhbmllbAo+Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4KPj4KPj4+
IC0tLQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyB8IDI3ICsrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4+PiBpbmRleCA1ZDg4MjA3
MjViNzUuLmU4YjhjMzI1NzM5MiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3R0LmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4+IEBAIC0z
MTcsOSArMzE3LDEyIEBAIGludCB0dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9kZXZpY2UgKmJk
ZXYsCj4+PiAgICAJaWYgKHR0bV90dF9pc19wb3B1bGF0ZWQodHRtKSkKPj4+ICAgIAkJcmV0dXJu
IDA7Cj4+PiAtCWF0b21pY19sb25nX2FkZCh0dG0tPm51bV9wYWdlcywgJnR0bV9wYWdlc19hbGxv
Y2F0ZWQpOwo+Pj4gLQlpZiAoYmRldi0+cG9vbC51c2VfZG1hMzIpCj4+PiAtCQlhdG9taWNfbG9u
Z19hZGQodHRtLT5udW1fcGFnZXMsICZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKTsKPj4+ICsJ
aWYgKCEodHRtLT5wYWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxBR19TRykpIHsKPj4+ICsJCWF0b21p
Y19sb25nX2FkZCh0dG0tPm51bV9wYWdlcywgJnR0bV9wYWdlc19hbGxvY2F0ZWQpOwo+Pj4gKwkJ
aWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+Pj4gKwkJCWF0b21pY19sb25nX2FkZCh0dG0tPm51
bV9wYWdlcywKPj4+ICsJCQkJCSZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKTsKPj4+ICsJfQo+
Pj4gICAgCXdoaWxlIChhdG9taWNfbG9uZ19yZWFkKCZ0dG1fcGFnZXNfYWxsb2NhdGVkKSA+IHR0
bV9wYWdlc19saW1pdCB8fAo+Pj4gICAgCSAgICAgICBhdG9taWNfbG9uZ19yZWFkKCZ0dG1fZG1h
MzJfcGFnZXNfYWxsb2NhdGVkKSA+Cj4+PiBAQCAtMzUwLDkgKzM1MywxMiBAQCBpbnQgdHRtX3R0
X3BvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LAo+Pj4gICAgCXJldHVybiAwOwo+Pj4g
ICAgZXJyb3I6Cj4+PiAtCWF0b21pY19sb25nX3N1Yih0dG0tPm51bV9wYWdlcywgJnR0bV9wYWdl
c19hbGxvY2F0ZWQpOwo+Pj4gLQlpZiAoYmRldi0+cG9vbC51c2VfZG1hMzIpCj4+PiAtCQlhdG9t
aWNfbG9uZ19zdWIodHRtLT5udW1fcGFnZXMsICZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKTsK
Pj4+ICsJaWYgKCEodHRtLT5wYWdlX2ZsYWdzICYgVFRNX1BBR0VfRkxBR19TRykpIHsKPj4+ICsJ
CWF0b21pY19sb25nX3N1Yih0dG0tPm51bV9wYWdlcywgJnR0bV9wYWdlc19hbGxvY2F0ZWQpOwo+
Pj4gKwkJaWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+Pj4gKwkJCWF0b21pY19sb25nX3N1Yih0
dG0tPm51bV9wYWdlcywKPj4+ICsJCQkJCSZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKTsKPj4+
ICsJfQo+Pj4gICAgCXJldHVybiByZXQ7Cj4+PiAgICB9Cj4+PiAgICBFWFBPUlRfU1lNQk9MKHR0
bV90dF9wb3B1bGF0ZSk7Cj4+PiBAQCAtMzgyLDkgKzM4OCwxMiBAQCB2b2lkIHR0bV90dF91bnBv
cHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0ICp0dG0pCj4+PiAg
ICAJZWxzZQo+Pj4gICAgCQl0dG1fcG9vbF9mcmVlKCZiZGV2LT5wb29sLCB0dG0pOwo+Pj4gLQlh
dG9taWNfbG9uZ19zdWIodHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNfYWxsb2NhdGVkKTsKPj4+
IC0JaWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+Pj4gLQkJYXRvbWljX2xvbmdfc3ViKHR0bS0+
bnVtX3BhZ2VzLCAmdHRtX2RtYTMyX3BhZ2VzX2FsbG9jYXRlZCk7Cj4+PiArCWlmICghKHR0bS0+
cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpKSB7Cj4+PiArCQlhdG9taWNfbG9uZ19zdWIo
dHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNfYWxsb2NhdGVkKTsKPj4+ICsJCWlmIChiZGV2LT5w
b29sLnVzZV9kbWEzMikKPj4+ICsJCQlhdG9taWNfbG9uZ19zdWIodHRtLT5udW1fcGFnZXMsCj4+
PiArCQkJCQkmdHRtX2RtYTMyX3BhZ2VzX2FsbG9jYXRlZCk7Cj4+PiArCX0KPj4+ICAgIAl0dG0t
PnBhZ2VfZmxhZ3MgJj0gflRUTV9QQUdFX0ZMQUdfUFJJVl9QT1BVTEFURUQ7Cj4+PiAgICB9Cj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBo
dHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZkcmkt
ZGV2ZWwmYW1wO2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMzA3
NWQ3ZmQxNjY0NDMyMmExMzYwOGQ4ZmYyNWQ1OWIlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5
OTRlMTgzZCU3QzAlN0MwJTdDNjM3NTM5ODg1MjU1Nzk1MTg3JTdDVW5rbm93biU3Q1RXRnBiR1pz
YjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lM
Q0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPUtPbkhBMUNiTkZqak1aUjJyZ0htR2tIJTJC
N0M4NFlDdEE2dTlWMXdCQWF5NCUzRCZhbXA7cmVzZXJ2ZWQ9MAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
