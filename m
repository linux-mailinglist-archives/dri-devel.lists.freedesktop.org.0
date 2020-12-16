Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E23512DC203
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:19:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FA96E1B6;
	Wed, 16 Dec 2020 14:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750082.outbound.protection.outlook.com [40.107.75.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7B76E1B6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5utzGNzUp0nsg6x+cq0RLr0+ddIN6vVbfuIt8ewkbwvczhH78qJ8dG/YbNX7q3ChibuwpVXMMNQGPRqabGKK3yvMtAYpMq4eZ1hH+tCetKZPlZ6wgeyLqwI+W0jqp9vjug2RNKdG+TFY75zO3shDhkZeEicz6/68GoWyhFQFbLq7HyABrNBypOnI18s0Ji4tYLYcPl3bR8ewMRuAuCZeJ0QKOA7GOiVp1z7xmg9boLa3xwCvoXCWbVzWTztEdEMKq2pPtivU5DUgehEV40GHuPmsIQdRBuhcMnEo+qb4w1fHUPNre2xBj13ecJA3Y7pw2caP0vZQ/RXp2M1qXG9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFmTJ7A9A1BTin5g3cXBVgdQFGn7AV/9aytqob2LhlU=;
 b=Acb7Tjm8D+AZO5yJKOYXnywVhDRMgpl0R5QXnHDzqSYokrSDy1CK9JU8P+8hX1Fln+fDVm8UympdvVX7/N2BQB3yAI/XFiZI+zvQCH36u0EDNlVs6zBuPw7jLftSW2rauHj2R2iAhlFoGpmlOlkuHhPXMvFJI0zY7fsBy7FzHjBcpPFKfcRAdwmBD1q+hOBpz23gj0qQv+v1VR9A4SIb//OYshB9D3uyattbnvx8seDzNDORmbLa1k/Bh5/d63SMXxEsyynHJqJEqgEXAIJdtSfriu3SIsPZUIxFKlW2QIFv05YM+PcbmOkaIiQ8gcrwxDVfbKMCx/EuMEIdVJSlUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFmTJ7A9A1BTin5g3cXBVgdQFGn7AV/9aytqob2LhlU=;
 b=jJLlgfZ6luxXRbY0tEVC6viJTkYsKIPZ1E8JptYKZjI6XkjV12113ZdLQi1+Eqz+yftkOL7948dyOTnVyBQxSk5WbswwpL+EJRRbq7soUrMcCzHO1cS2rN4ICt8N9euqad6mQmrqXvBaOZ6IaSXsy/or4lrYeV635j/Bk8wXyf0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Wed, 16 Dec
 2020 14:19:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 14:19:17 +0000
Subject: Re: [PATCH] drm/[amdgpu|radeon]: fix memset on io mem
To: Chen Li <chenli@uniontech.com>
References: <877dpiz4sf.wl-chenli@uniontech.com>
 <4277816d-db00-7e81-a2fb-069aeee18e8b@amd.com>
 <875z51zwsq.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <90b625e2-2409-d13b-2456-483ad4eef18f@amd.com>
Date: Wed, 16 Dec 2020 15:19:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <875z51zwsq.wl-chenli@uniontech.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR08CA0015.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR08CA0015.eurprd08.prod.outlook.com (2603:10a6:208:d2::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 14:19:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cff7d383-aa8f-4a45-00f8-08d8a1cd92b7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4239CBBBEEBE74EDEAAAA5BD83C50@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vGq6ZadFk2WP+pt40ZDaWrrKhNKRfkFa8tmfnZ4WL3umTP6tx6ywfi2X2COcg6fDMipFxKmFkzs5dNcmNZ1e0ETAzapnfMHMi87JUa9ReT3AG/HCjf+CZceXhqKU7f6RB83F5x/6HLvj1EJ2OLVEA25qLFlYB+C/2IdDAbjEQJ/ngp/D9Ya1HB6Q0vbdRDs8JjQ4/QHEd2bjkB/kOmQKFNI4kAa/DtoGf0WZ5isEWlxVYJwOL3emjcMThFMky9Wv4h2ZhkhYNpbeMsSugmKiXPfdzlwjeJOk0vMOBVMMZpcYOs5i5182uUSx0ySsgpxXvkS4FQheRekm3rAnt7O8a8xuIpt8EMiE6Blzl73y1/gFPLDLoNnQlznRijMewvTq8tFfBKB+DIoHFmWALeCQCHqczSSOMNf9kz0UIYd0ch8AFVv8favtLF0NRqDVJ2NHvbo4koGze4E3jasgehRBAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(45080400002)(8936002)(66574015)(6486002)(66946007)(966005)(6916009)(2616005)(36756003)(31686004)(8676002)(4326008)(52116002)(498600001)(83380400001)(186003)(6666004)(5660300002)(86362001)(31696002)(16526019)(2906002)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WG1sUUNRNVJRRXFobGR3b1lwNnBhRmh0R1RDWVkzRGUrenJjTmQwZHlVQ3k2?=
 =?utf-8?B?dHZZM0RiZUoySmNsdW1yQ3AweXYybTlZb0hsRUZaZEZGZE1CYkYwSUdvaWk0?=
 =?utf-8?B?STBWTnMvbXBDS0crTmRGemo3cHpGR1IzeFFxNlRrOENnR2grUEdhM0V6MUIx?=
 =?utf-8?B?bGF1TzhmT3ZBR1NzUWsvazljeXhRL2RVUktVOVRMbTZCdWR2UWpaWmMxZVor?=
 =?utf-8?B?ZzBjaTBXMlNpTTA1ZGJuekE2emdLRDRVT0xvbmV0aVRLc3oyb0RLQmMwQWIw?=
 =?utf-8?B?b0o4L0pQdGhFVnVydCsrbkJvSDZKeVdxNHV2Tk5laElJSk5TN3RsaUVqWjF3?=
 =?utf-8?B?d2pTYkIwNFdGUG4wazlBT015cS94bTg4bDkzZmlIYWJ6ZVBDVE9QdGt3ZlN4?=
 =?utf-8?B?Mld2TFFBWTg4RFF0eU9SNkk2YzNSc3o0RWhEbG5JT01TQ2ZoVjBZZTlJNDJK?=
 =?utf-8?B?U3IzeWlrSitJVHY0ZXE1S3NQT3FYcHkvS01YaVFSNUxzVllaZGZ3RzZkRlRX?=
 =?utf-8?B?R2pDYk1OZUlWai9jSm1xcDdQdVRxL0s1eGdxejh6TzQ1azhtejdQa3lvTDBs?=
 =?utf-8?B?UHAzYjY2b29yalFIbkZtdXcvbXVPR0ZJUDdkQXBwNk9XM3l5OUs4Um10WHc2?=
 =?utf-8?B?d2QyWnVZWldGOTh1NFpKVzhxWEN0Zm4vZWttcUk0SWZzQlF1RVg4TTlKVXFC?=
 =?utf-8?B?UmV3NVpLNHBGWmk3ZkRqRVNMM0dNR2xNNHozTis4RzdLOExVTWoyR3plRnlD?=
 =?utf-8?B?bnU2NXdXRUJLOEtPOWtJZnNwS1gvZ2U0d0s0aXNEQ2gyMjFVRjFpUGNEa0xk?=
 =?utf-8?B?N1huZmY0bUE0NzBEeEdsdFdJZHpOMFN4YTBBVTBVRk1BdHFDeUl2M05nVDlF?=
 =?utf-8?B?UXBxT09PZlFUZGpPMGRtanVMeHBGMHZ2eG1Pd0tZeHpWUXBJTWZpYUJZT1FF?=
 =?utf-8?B?WEVhR25FTzdnbUhFOGRuaXUvYTNoa0pKTE5FTjI0TmRIU3A3eWJncE5LOVcv?=
 =?utf-8?B?elVXZ3lRUDhLQmg0VVVjUVhMMXBxd2N0aWZjOGYyejNpNXh5TkRMODRULzFK?=
 =?utf-8?B?Vkt6cFkvSWI0T1F2c2c3WGYrNEl0VDk4ckNQamZQWVVqM0tZUXRoYmdrUEh1?=
 =?utf-8?B?MG9OZDdFSm9wWWoyUnhaTFQyb2hzODNMV0lUNnVsdUl6NVBMUExWMzhJUjE3?=
 =?utf-8?B?TitUNVMvSC92aktIbGRyRSszWXpvWEoyOHpkWnNUMGVFT29wNHVyUWVtMWVU?=
 =?utf-8?B?a3hkcVc1K0dDOEFON2h2WlN3V2d4NXM2Rk1acG5WWFFsQjVsRHBMZVNmRytn?=
 =?utf-8?B?eEQ5NzRGYXNXdjR6bnVDMjVMR1p3c0FOOU0rNnpzL0RyTDNmc0pTTlM1bjMx?=
 =?utf-8?B?WXNqKzJ4MUhvdnFjeU1VbzBicUpKMmwyRUJoSlh6Z3I1UnNqWFBid3dYTTdt?=
 =?utf-8?Q?Fq8IF6oY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 14:19:17.4140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: cff7d383-aa8f-4a45-00f8-08d8a1cd92b7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RMYE18BeUslgHWsTHRQZYT03iKQXpNPmik++S3ifHyDget9YQAapMB0KyGBemW7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMTIuMjAgdW0gMTQ6NDggc2NocmllYiBDaGVuIExpOgo+IE9uIFdlZCwgMTYgRGVjIDIw
MjAgMTU6NTk6MzcgKzA4MDAsCj4gQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTYuMTIu
MjAgdW0gMDY6NDEgc2NocmllYiBDaGVuIExpOgo+Pj4gV2hlbiB1c2luZyBlODg2MChnY24xKSBv
biBhcm02NCwgdGhlIGtlcm5lbCBjcmFzaGVkIG9uIGRybS9yYWRlb246Cj4+PiBbU05JUF0KPj4+
IE9idmlvdXNseSwgdGhlIF9fbWVtc2V0IGNhbGwgaXMgZ2VuZXJhdGVkIGJ5IGdjYyg4LjMuMSku
IEl0IG9wdGltaXplcwo+Pj4gdGhpcyBmb3IgbG9vcCBpbnRvIG1lbXNldC4gQnV0IHRoaXMgbWF5
IGJyZWFrLCBiZWNhdXNlIGRlc3QgaGVyZSBpcwo+Pj4gY3B1X2FkZHIgbWFwcGVkIHRvIGlvIG1l
bS4gU28sIGp1c3QgaW52b2tlIGBtZW1zZXRfaW9gIGRpcmVjdGx5LCB3aGljaAo+Pj4gZG8gc29s
dmUgdGhlIHByb2JsZW0gaGVyZS4KPj4gV2VsbCBpbnRlcmVzdGluZyBwcm9ibGVtIHlvdSBzdHVt
YmxlZCBvdmVyIGhlcmUsIGJ1dCB0aGUgc29sdXRpb24gaXMgcXVpdGUgYQo+PiBoYWNrLgo+IEhp
LCBDaHJpc3RpYW4uIEknbSBub3Qgc3VyZSB3aHkgdGhpcyBjaGFuZ2UgaXMgYSBoYWNrIGhlcmUu
IEkgY2Fubm90IHNlZSB0aGUgcHJvYmxlbSBhbmQgd2xsIGJlIGdyYXRlZnVsIGlmIHlvdSBnaXZl
IG1vcmUgZXhwbGFpbmF0aW9ucy4KCl9fbWVtc2V0IGlzIHN1cHBvc2VkIHRvIHdvcmsgb24gdGhv
c2UgYWRkcmVzc2VzLCBvdGhlcndpc2UgeW91IGNhbid0IHVzZSAKdGhlIGU4ODYwIG9uIHlvdXIg
YXJtNjQgc3lzdGVtLgoKUmVwbGFjaW5nIHRoZSB0aGUgZGlyZWN0IHdyaXRlIGluIHRoZSBrZXJu
ZWwgd2l0aCBjYWxscyB0byB3cml0ZWwoKSBvciAKbWVtc2V0X2lvKCkgd2lsbCBmaXggdGhhdCB0
ZW1wb3JhcnksIGJ1dCB5b3UgaGF2ZSBhIG1vcmUgZ2VuZXJhbCBwcm9ibGVtIApoZXJlLgoKPj4g
Rm9yIGFtZGdwdSBJIHN1Z2dlc3QgdGhhdCB3ZSBhbGxvY2F0ZSB0aGUgVVZEIG1lc3NhZ2UgaW4g
R1RUIGluc3RlYWQgb2YgVlJBTQo+PiBzaW5jZSB3ZSBkb24ndCBoYXZlIHRoZSBoYXJkd2FyZSBy
ZXN0cmljdGlvbiBmb3IgdGhhdCBvbiB0aGUgbmV3IGdlbmVyYXRpb25zLgo+Pgo+IFRoYW5rcywg
SSB3aWxsIHRyeSB0byBkaWcgaW50byBkZWVwZXIuIEJ1dCB3aGF0J3MgdGhlICJoYXJkd2FyZSBy
ZXN0cmljdGlvbiIgbWVhbmluZyBoZXJlPyBJJ20gbm90IGZhbWlsaWFyIHdpdGggdmlkZW8gZHJp
dmVyIHN0YWNrIGFuZCBhbWQgZ3B1LCBzb3JyeS4KCk9uIG9sZGVyIGhhcmR3YXJlIChBR1AgZGF5
cykgdGhlIGJ1ZmZlciBoYWQgdG8gYmUgaW4gVlJBTSAoTU1JTykgbWVtb3J5LCAKYnV0IG9uIG1v
ZGVybiBzeXN0ZW0gR1RUIChzeXN0ZW0gbWVtb3J5KSB3b3JrcyBhcyB3ZWxsLgoKPj4gRm9yIHJh
ZGVvbiBJIHRoaW5rIHRoZSBiZXR0ZXIgYXBwcm9hY2ggd291bGQgYmUgdG8gY29udmVydCB0aGUg
ZGlyZWN0IG1lbW9yeQo+PiB3cml0ZXMgaW50byBjYWxscyB0byB3cml0ZWwoKS4KPiBPaywgc28g
eW91IG1lYW4gdGhlIG1vcmUgcHJvcGVyIHdheSBpcyB0byB1c2Ugd3JpdGVsIGluc3RlYWQgb2Yg
bWVtc2V0X2lvPwoKV2VsbCwgaXQgaXMgYSBzdGFydC4gQnV0IEknbSBub3Qgc3VyZSBpZiB5b3Ug
d2lsbCBldmVyIGdldCB0aGF0IGhhcmR3YXJlIAp3b3JraW5nIHdpdGggdGhpcyBDUFUuCgo+PiBC
VFc6IEhvdyBkb2VzIHVzZXJzcGFjZSB3b3JrIG9uIGFybTY0IHRoZW4/IFRoZSBkcml2ZXIgc3Rh
Y2sgdXN1YWxseSBvbmx5IHdvcmtzCj4+IGlmIG1taW8gY2FuIGJlIG1hcHBlZCBkaXJlY3RseS4K
PiBJIGFsc28gcG9zdCB0d28gdXNlc3BhY2UgaXNzdWUgb24gbWVzYSwgYW5kIHlvdSBtYXkgYmUg
aW50ZXJlc3RlZCB3aXRoIHRoZW06Cj4gICBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRsYWIuZnJlZWRlc2t0b3Aub3Jn
JTJGbWVzYSUyRm1lc2ElMkYtJTJGaXNzdWVzJTJGMzk1NCZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hy
aXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0NkNmZmNTIzODNhNDU0YTZkYzAzMTA4ZDhhMWM5NGRj
MSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MzcyMzMy
Njg1ODg3NDclN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pR
SWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2Rh
dGE9UkRFU3l6WUJCM3FsMkdnQmlnc1lmJTJGeDJnNnp3Q3ElMkZ5OEhRMEFBTXRYOTAlM0QmYW1w
O3Jlc2VydmVkPTAKPiAgIGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGxhYi5mcmVlZGVza3RvcC5vcmclMkZtZXNhJTJG
bWVzYSUyRi0lMkZpc3N1ZXMlMkYzOTUxJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29l
bmlnJTQwYW1kLmNvbSU3Q2Q2ZmY1MjM4M2E0NTRhNmRjMDMxMDhkOGExYzk0ZGMxJTdDM2RkODk2
MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQzNzIzMzI2ODU4ODc0NyU3
Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16
SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1ZNWY5S2kl
MkZROEc0em4zTWpMVkc3eWlMTEN4YmhUeU5lbFpqMzZoQXVYUVklM0QmYW1wO3Jlc2VydmVkPTAK
PiBJIHBhc3RlIHNvbWUgdmlydHVhbCBtZW1vcnkgbWFwIGluIHVzZXJzcGFjZSB0aGVyZS4gKGFu
ZCB0aGUgdHdvIHByb2JsZW1zIGRvIGJvdGhlciBtZSBxdWl0ZSBhIGxvbmcgdGltZS4pCgpJIGRv
bid0IHJlYWxseSBzZWUgYSBzb2x1dGlvbiBmb3IgdGhvc2UgcHJvYmxlbXMuCgpTZWUgaXQgaXMg
cGVyZmVjdGx5IHZhbGlkIGZvciBhbiBhcHBsaWNhdGlvbiB0byBtZW1zZXQvbWVtY3B5IG9uIG1t
YXBlZCAKTU1JTyBzcGFjZSB3aGljaCBjb21lcyBmcm9tIE9wZW5HTCBvciBWdWxrYW4uCgpTbyB5
b3VyIENQVSBzaW1wbHkgd29uJ3Qgd29yayB3aXRoIHRoZSBoYXJkd2FyZS4gV2UgY291bGQgd29y
ayBhcm91bmQgCnRoYXQgd2l0aCBhIGNvdXBsZSBvZiBoYWNrcywgYnV0IHRoaXMgaXMgYSBwcmV0
dHkgbXVjaCBnZW5lcmFsIHByb2JsZW0uCgpSZWdhcmRzLApDaHJpc3RpYW4uCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
