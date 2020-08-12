Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D972426E6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 10:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3A76E07D;
	Wed, 12 Aug 2020 08:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DC16E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ix/Eva+6dHMm0yjmXI0yqKTgXGRms4Vdnzr1kv7RaJ7UlODAYZTOdToNxcoZLtaFg9vJiaE2YdKW3VhNMFywGAfhJJ/TBRnh8mIZ+0FaWdDG6vzMcZOTxkax18x3kYtMpCg96TthTyvjxFZszKG5ZmSsKwj6YWw/UBwDL64Eb5eiqOMCuTUhPPVlChxikSf1Hx0Bsfbo6jhISpZUeZhA2AJqHdMKJArj8pYySfCOjeVvwMyE1hGFv9AJ/tbESVeNd7AHTrs4wOgiIm7l2cPDYV7D1x7cL9Sm/8CW2DxBqJlZUBovqmuJSM8uQmN2dPCHCOiOTpc9W72GANMgArOUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLCX4zw8C4fCbLucIqikSq+3V6isk11vzDVHPtrnHCU=;
 b=TO/3wMgT6Fg2E2bWnqNBItfqVnRiRk09u6CCzmdD5tSBMTlyd1DLbDGZKzbkF8ieMTD4meTchsYrQKFSaYV/Nc+YzVMZYAnIaFQFe583cBb2cat8CsCIabURX03HLHJKNnSWS5MKWrFf8iJFaNdvaorboL1rJnXXRfMQ2YQ9sVIwc42lt53HDD7NFi9vWiF9ewNJfkJGywd97eDF79304Keb65FvguCy7HVB24ylDV0X5HraAliru7BHgKL49gKS+fg2qTMl9d88XyDm7NWTz6znZikDTgyNZmfe0G6yl9+25kT6v7t8sRjAHRaUNd0DrOgMEw0P28719xdDOtB6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLCX4zw8C4fCbLucIqikSq+3V6isk11vzDVHPtrnHCU=;
 b=GozyMDHgp9wYun2i8WfsNyLCoCZVPbuODCy//lL3N+pIZrQOS2prfF3MDM5u04PpUP7mgP6LMrKvV4G0IGBJ63Hxh2IZaV9eVD0VmXY9HeijfqX6BzmXkv1hn04I02+LUFq+phj/D1Fpk4cUwfAxqVyA0/GVvNpXwGaOw+xoG3Q=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2452.namprd12.prod.outlook.com (2603:10b6:207:3f::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Wed, 12 Aug
 2020 08:44:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.015; Wed, 12 Aug 2020
 08:44:21 +0000
Subject: Re: [PATCH] drm/ttm: revert "make TT creation purely optional v3"
To: Dave Airlie <airlied@gmail.com>
References: <20200811092400.188124-1-christian.koenig@amd.com>
 <bbeaca4b-189d-c4dd-6d3a-e1489d6b0e4f@gmail.com>
 <052cbf93-00d1-6913-a278-eb3dafa86281@gmail.com>
 <12304df3-e891-9e8e-8a51-8be3c2bddc61@daenzer.net>
 <e42482e1-6dc0-d4c5-4fd0-c6b15737e67c@gmail.com>
 <CAPM=9tyUBMXMWbPbXLsNV7j10svYWRHnsYrNOeksQm_EPp-0VA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <af875ff5-eb21-c7d2-23f8-50be3975ba7d@amd.com>
Date: Wed, 12 Aug 2020 10:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tyUBMXMWbPbXLsNV7j10svYWRHnsYrNOeksQm_EPp-0VA@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:208:122::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0014.eurprd04.prod.outlook.com (2603:10a6:208:122::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Wed, 12 Aug 2020 08:44:19 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ba1db9fd-9890-4ae3-5426-08d83e9be84a
X-MS-TrafficTypeDiagnostic: BL0PR12MB2452:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24522B14FE2BFCA7750C889983420@BL0PR12MB2452.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wt+jZILT5BVRsgXOKOQsvjtm+VjxMsALKWRrPI5qW+M3VeKlkyqFL80uqVXtQT5wtM9i4f4NtdhJDlzWZfSWorfzCVYDUVBdyeEX2VyMk83CP7bkQMFjMwbqt6TkscOMow8jt3fxeVxLaYCsScjCDdDGOUxi8+NHY7ctfTrr9WP/7vdrQO4mkAilb885EHdEjgq7xmqHdu8cHKnyNpkjwT7Zfjx+Fr1FehV+yMKcjZemq83bn4DeD8ElSJECm0Iiv6LfysGghoBQ8Vf8bUnRC9oKeEsKB8lmkZifqAAEMRibDqsw0CKl2RT0lPiePbWo76ML2K1xz+exKt23y4NJgIUOlFShDtvrIDjE44vj36P4Z2OSrXLdM8R+Rl4ny1SW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(2616005)(31696002)(66946007)(31686004)(53546011)(16526019)(66556008)(4326008)(52116002)(66476007)(186003)(8676002)(6486002)(8936002)(6916009)(6666004)(86362001)(478600001)(36756003)(2906002)(54906003)(316002)(5660300002)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PW2cxEE1ilkOs471XZ06jestV50cHFXemj3FGHr0w/96TnnfduiFZAIpWMmuTUyZJ2e35Wc6K4P/nFlVXH1UoKoySfqIYtupKxbfhRl/LeU8U+n5cNC+7GS3b7Ka3OfCN8g3hAhY2K0SacwuZQ0PesPUrRlPLLALSQiJy1yL5QHQwlwGi3cvqPtg6JUwyfKPmBBgJ/PirpcctnYDx9/8BSh9HoO0yBxZ6C+PjBt+JuLM+sp4E8NF5W3O1j/Ima9qlzSQ+RqQmCnjdBg8Dy+GpQHWwBf1BaiUz7hLJoitJjg9Hk0ZojtlLFgi2u1wL9OX89SB36WkNh/7gHEpubmIzBn9lGdke+wFmZztXoXEe3LuwCBWXjhrD7hkfxYMHmitUOAL5ttXpITXCtvW//ma/ax3yOmY77v7oNtw4u/frNAY1vlA5AJRtdxuDyCAScZ0UuajLyN5pv+d2twc84Yolyxamjm3zPjYT0nWSPLjkonAYoTf69WLNR4ofBBOrJsgUwo78ohb8FGXOMhdTujByElo+aN3Q1xYSxVt9f+HAY0hHiDKi/e7MDtdO8K3q+sLiQ2aPqo3L02SM74/ZJAoD7mxUOL/NaHbyJvjae07ktrFVKqab7gK9SgCCorDtXJJq9J6ZxtLCQbu7RbaOziYXHhZ3PoN8VAAj/jpOd2SdV3BQrir8tJpTy5EQ9qVnhaatVmrgsPfv4M6q0uMxZyKbg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1db9fd-9890-4ae3-5426-08d83e9be84a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2020 08:44:21.3132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBjKPFSoigIuKnA8JWcsNKdJ7UFrRH/uj2NQBuyqH65WK5fNbm1JBAgJ05ZyVfCs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2452
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDguMjAgdW0gMjE6MzQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBXZWQsIDEyIEF1
ZyAyMDIwIGF0IDAzOjExLCBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVtZXJr
ZW5AZ21haWwuY29tPiB3cm90ZToKPj4gQW0gMTEuMDguMjAgdW0gMTg6NDIgc2NocmllYiBNaWNo
ZWwgRMOkbnplcjoKPj4+IE9uIDIwMjAtMDgtMTEgMjo1MyBwLm0uLCBDaHJpc3RpYW4gS8O2bmln
IHdyb3RlOgo+Pj4+IEFtIDExLjA4LjIwIHVtIDE0OjUyIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5p
ZzoKPj4+Pj4gQW0gMTEuMDguMjAgdW0gMTE6MjQgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+
Pj4+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCAyZGRlZjE3Njc4YmMyZWExZDIwNTE3ZGQyYjRlZDRh
YTk2N2ZmYThiLgo+Pj4+Pj4KPj4+Pj4+IEFzIGl0IHR1cm5lZCBvdXQgVk1XR0ZYIG5lZWRzIGEg
bXVjaCB3aWRlciBhdWRpdCB0byBmaXggdGhpcy4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Pj4+IERhcmUg
dG8gZ2l2ZSBtZSBhbiByYiBmb3IgdGhpcz8gSSBhbHJlYWR5IHRlc3RlZCBvbiBhbWRncHUgYW5k
IGl0Cj4+Pj4+IHNob3VsZCBiZSBmaXhpbmcgdGhlIFZNV0dGWCBwcm9ibGVtcyB3ZSBjdXJyZW50
bHkgaGF2ZS4KPj4+PiBVcHMsIHRoYXQgd2FzIHlvdXIgb2xkIEFNRCBhZGRyZXNzIDopCj4+Pj4K
Pj4+PiBTbyBvbmNlIG1vcmUgd2l0aCBmZWVsaW5nLAo+Pj4gOikKPj4+Cj4+PiBIb3dldmVyLCBJ
J20gYWZyYWlkIEknbSBub3QgZGVlcCBlbm91Z2ggaW50byBUVE0gY29kZSBhbnltb3JlIHRvIGdp
dmUKPj4+IHlvdSBhbiBSLWIsIGdpdmVuIGl0J3Mgbm90IGEgc3RyYWlnaHQgcmV2ZXJ0IChwcmVz
dW1hYmx5IGR1ZSB0byBvdGhlcgo+Pj4gY2hhbmdlcyBpbiB0aGUgbWVhbnRpbWUpLgo+PiBZZWFo
LCBpbmRlZWQgaGFkIHRvIGtlZXAgRGF2ZXMgY2hhbmdlcyBpbnRhY3QuCj4+Cj4+IERhdmUgY2Fu
IHlvdSB0YWtlIGEgbG9vayB0aGVuPwo+IFl1cCBqdXN0IGNhbWUgaW4gYWZ0ZXIgbXkgInN0b3Ag
d29ya2luZyBEYXZlIiB0aW1lLgo+Cj4gRGlkIHlvdSBoYXZlIGFuIGFtZGdwdSBwYXRjaCB0aGF0
IHdvcmtlZCBvbiB0b3Agb2YgdGhpcz8gZG9lcyB0aGF0Cj4gbmVlZCByZXZlcnRpbmcgb3IgZGlk
IGl0IG5vdCBsYW5kIHlldD8KClRoZSBhbWRncHUgcGF0Y2ggd2hpY2ggSSBhbHJlYWR5IHB1c2hl
ZCB3b3JrcyB3aXRoIG9yIHdpdGhvdXQgdGhpcy4gU28gCm5vIGNoYW5nZSBuZWVkZWQgaGVyZS4K
Cj4KPiBPdGhlcndpc2UsCj4KPiBSZXZpZXdlZC1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVk
aGF0LmNvbT4KClRoYW5rcywKQ2hyaXN0aWFuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
