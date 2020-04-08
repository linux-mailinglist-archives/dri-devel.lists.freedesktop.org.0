Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7612A1A23BD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 16:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C266E11A;
	Wed,  8 Apr 2020 14:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680073.outbound.protection.outlook.com [40.107.68.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4066E11A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 14:05:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Emu/5mpvsaaTFeKUuslnIHexEj7bJqdDTcVvuGyYKdfQ6i08SA8n/8JZZXkCNjHfVvcAVfaHhXILyXj8huTnV3KA5QORGaef8K5MUYDwfEKPfMIdSTi4eqJ7xFdGRQOsA9Doe+YZUn502PnnRd+aZe/KCZQBaFyVi46VbnngDppmsjjo8aHC9ISSh3AKl7uGGQipzy2aJU9/RgsRwM+rIng2UWVNtQkaHcFr+/9Kr5MnM/JHEWlNlw6nktN2aNEUx41YI4yPQaOo2Vr70uOZs6Rcer54f2nozmxKqn1/Id1F31lWxxIHo8u73W9smbh1sINk4PlFvHslJNTg0i/TJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyGAO5lej1ilBI/SS5mBWxKpC3+Je6dOXFyu68KZXU0=;
 b=H8HrTH6kOFb74xqVsiyfITJkD4jHJCZiqICImrsSReecggWS89eSh8E+5nCgAwgDcT1+NgW4mjME8PzVutgJmQCrp0w84oPNW23PlM7XIp2br/R7nEcWyzqCecvr9P6q4zyPc9x64/SazB4rpYKu/TETh0D/B8UCq//mmtDz5nGTBc4DWYA5cU14IhxuxEI0QSOwpvpUTHs2wMluZKCKzeIYCxt00SwZVL1gzkLru0myLdiURLiMRKAwiIGE+nRzhbamKsQi97RSzc2n/7GZHku97h6l4r3qn3VjEUWz4hN3bYtegK5gC/Exriz7WOkJHDQ6DhGeURnZA4SOTRnBZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyGAO5lej1ilBI/SS5mBWxKpC3+Je6dOXFyu68KZXU0=;
 b=Cs7OFgYvJxPhPMuZvG5Na5Cq6br2YM28vHb5Ewp4OPaD86QUVncvuZi5qLrX5Mkqe/v9CUXnu8hFI9gvQ4+wciybU4dCLtBB32eruFCox41BPz8ZuWMuyrwGYrxZuxVtriLSvqOqYO1B+1jMcIbMyWrJ4EoQTvb2GigvT91t3qQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB3850.namprd12.prod.outlook.com (2603:10b6:5:1c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 14:04:58 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 14:04:58 +0000
Subject: Re: [PATCH] drm/ttm: Temporarily disable the huge_fault() callback
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
References: <20200408115331.5529-1-thomas_os@shipmail.org>
 <f7408653-39a1-e234-c45d-7a786e043b8f@shipmail.org>
 <67f24846-0063-d435-1423-3cab8744854d@amd.com>
 <9832f388-2227-8eb6-5a31-5cf38012eeff@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6ecaf529-5609-aba9-3883-424c3d55dde9@amd.com>
Date: Wed, 8 Apr 2020 16:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <9832f388-2227-8eb6-5a31-5cf38012eeff@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: ZRAP278CA0001.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::11) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 ZRAP278CA0001.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Wed, 8 Apr 2020 14:04:57 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bf3494ac-196c-426e-e1d9-08d7dbc5d283
X-MS-TrafficTypeDiagnostic: DM6PR12MB3850:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3850522EC9A06076FFA2DD0C83C00@DM6PR12MB3850.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(36756003)(5660300002)(2906002)(8936002)(31696002)(186003)(81166007)(86362001)(6486002)(53546011)(16526019)(66476007)(66946007)(478600001)(81156014)(52116002)(31686004)(66574012)(8676002)(2616005)(66556008)(316002)(6666004)(14583001);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rl2+Y+2SGQm9X7ZNFo1+VUVnRvF6Um78Rhl7bTlpELw/K41amMB+k1bonXvpQ4A4U6f1Pcj9fPU/+zKkbEXr28ye95p7MfEBw9Lhzf0+yICSm/1rACUbOl7RDwXQW4BCtQqJgYVZbPWhcnP2E3tGbcb2pA/kp/Ieftl/InErQYQnlP1pXDNm4zAqJJOagS8WorpVBhG4HqJjorP+glWm8RmCBsJvBzlPU0KEmCtvZFymhQtcsmz4oig5Mo0TuHt+7ZBCPeQKedvjGHP8I+V+Hqtya4LDRmvC7XjbcJwc7W6y7ZOzll5i748eTNd2Jl9JW6CiZ/2FgWrtPQF2wPWYMccbIG/CyGyKjDTs5Sp+spk+biH0G5JW/A4Ws3IEbqgRHs282HYamRkqV0UO8YFzb/p9Taj8wjOm7HW5FKJUg/1Kl6EGiATv++Vh1Q993UQ1JTDuojlM/ARhtzmCRBzJMO5z/g2E56yg/W+2lT0tXRFJamBsYjjaM8eZveAlV3PT
X-MS-Exchange-AntiSpam-MessageData: 9t2Bj0QWCbiYfnqekGwbWhW/H/IjUWL9RHAEGo7Oy57NJIK5Dz34cxGjeT91Vktwno46cIDo7lVn6r0FUEvrQC7sqSLJpw4fwb4nP5jIq3shPCoc6GpZ2XrhXlgoLQZXyfH18gcW3Pq4r1IjtJEwBGM8rbKyGNy3D6Ld8Ngxhp5gbtBngbgTiiqx/Gc59rVgYWMn8t/7PuBfg7JAACMAFg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3494ac-196c-426e-e1d9-08d7dbc5d283
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 14:04:58.5512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xge2gOPF9MDcOE8NJnQwz2d1HQyqO2vqbFGf0DIuSprkCoUgMe3SQldk69jy1YOy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3850
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDQuMjAgdW0gMTU6NDkgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToK
PiBPbiA0LzgvMjAgMjoxOSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMDguMDQu
MjAgdW0gMTQ6MDEgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToKPj4+IEhpLCBD
aHJpc3RpYW4sCj4+Pgo+Pj4gT24gNC84LzIwIDE6NTMgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChW
TXdhcmUpIHdyb3RlOgo+Pj4+IEZyb206ICJUaG9tYXMgSGVsbHN0cm9tIChWTXdhcmUpIiA8dGhv
bWFzX29zQHNoaXBtYWlsLm9yZz4KPj4+Pgo+Pj4+IFdpdGggYW1kZ3B1IGFuZCBDT05GSUdfVFJB
TlNQQVJFTlRfSFVHRVBBR0VfQUxXQVlTPXksIHRoZXJlIGFyZQo+Pj4+IGVycm9ycyBsaWtlOgo+
Pj4+IEJVRzogbm9uLXplcm8gcGd0YWJsZXNfYnl0ZXMgb24gZnJlZWluZyBtbQo+Pj4+IGFuZDoK
Pj4+PiBCVUc6IEJhZCByc3MtY291bnRlciBzdGF0ZQo+Pj4+IHdpdGggVFRNIHRyYW5zcGFyZW50
IGh1Z2UtcGFnZXMuCj4+Pj4gVW50aWwgd2UndmUgZmlndXJlZCBvdXQgd2hhdCBvdGhlciBUVE0g
ZHJpdmVycyBkbyBkaWZmZXJlbnRseSAKPj4+PiBjb21wYXJlZCB0bwo+Pj4+IHZtd2dmeCwgZGlz
YWJsZSB0aGUgaHVnZV9mYXVsdCgpIGNhbGxiYWNrLCBlbGltaW5hdGluZyB0cmFuc2h1Z2UKPj4+
PiBwYWdlLXRhYmxlIGVudHJpZXMuCj4+Pj4KPj4+PiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ry
b20gKFZNd2FyZSkgPHRob21hc19vc0BzaGlwbWFpbC5vcmc+Cj4+Pj4gUmVwb3J0ZWQtYnk6IEFs
ZXggWHUgKEhlbGxvNzEpIDxhbGV4X3lfeHVAeWFob28uY2E+Cj4+Pj4gVGVzdGVkLWJ5OiBBbGV4
IFh1IChIZWxsbzcxKSA8YWxleF95X3h1QHlhaG9vLmNhPgo+Pgo+PiBBY2tlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pgo+Pj4+IC0tLQo+Pj4KPj4+
IFdpdGhvdXQgYmVpbmcgYWJsZSB0byB0ZXN0IGFuZCB0cmFjayB0aGlzIGRvd24gb24gYW1kZ3B1
IHRoZXJlJ3MgCj4+PiBsaXR0bGUgbW9yZSB0aGFuIHRoaXMgSSBjYW4gZG8gYXQgdGhlIG1vbWVu
dC4gSG9wZWZ1bGx5IEknbGwgYmUgYWJsZSAKPj4+IHRvIHRlc3Qgb24gbm91dmVhdS90dG0gYWZ0
ZXIgZ2V0dGluZyBiYWNrIGZyb20gdmFjYXRpb24gdG8gc2VlIGlmIEkgCj4+PiBjYW4gcmVwcm9k
dWNlLgo+Pj4KPj4+IEl0IGxvb2tzIGxpa2Ugc29tZSBwYXJ0IG9mIHRoZSBrZXJuZWwgbWlzdGFr
ZXMgYSBodWdlIHBhZ2UtdGFibGUgCj4+PiBlbnRyeSBmb3IgYSBwYWdlIGRpcmVjdG9yeSwgYW5k
IHRoYXQgd291bGQgYmUgYSBwYXRoIHRoYXQgaXMgbm90IGhpdCAKPj4+IHdpdGggdm13Z2Z4Lgo+
Pgo+PiBXZWxsIHRoYXQgbG9va3MgbGlrZSBhbiB1Z2x5IG9uZSBhbmQgSSBkb24ndCBrbm93IGVu
b3VnaCBhYm91dCB0aGUgCj4+IHBhZ2UgdGFibGUgaGFuZGxpbmcgdG8gaHVudCB0aGlzIGRvd24g
ZWl0aGVyLgo+Pgo+PiBCVFc6IEhhdmUgeW91IHNlZW4gdGhlIGNvdmVyaXR5IHdhcm5pbmcgYWJv
dXTCoCAiV0FSTl9PTl9PTkNFKHJldCA9IAo+PiBWTV9GQVVMVF9GQUxMQkFDSyk7Ij8KPgo+IFll
cywgdGhhdCdzIGEgZmFsc2Ugd2FybmluZyBidXQgaXQgbWlnaHQgYmUgdGhhdCBpdCBzaG91bGQg
YmUgCj4gcmV3cml0dGVuIGZvciBjbGFyaXR5IGxpa2Ugc286Cj4KPiByZXQgPSBWTV9GQVVMVF9G
QUxMQkFDSzsKPiBXQVJOX09OX09OQ0UodHJ1ZSk7CgpVc2luZyBhbiBhZGRpdGlvbmFsICgpIGFs
c28gdXN1YWxseSB3b3JrcywgYnV0IEknbSBub3QgZXZlbiBzdXJlIGlmIApXQVJOX09OX09OQ0Uo
KSBpc24ndCBjb21waWxlZCB0byBhIG5vLW9wIHVuZGVyIHNvbWUgY2lyY3Vtc3RhbmNlcy4KClNv
IGJldHRlciBzYXZlIHRoYW4gc29ycnksCkNocmlzdGlhbi4KCj4KPiAvVGhvbWFzCj4KPgo+Cj4+
Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4KPj4KPj4+Cj4+PiAvVGhvbWFzCj4+Pgo+Pj4KPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
