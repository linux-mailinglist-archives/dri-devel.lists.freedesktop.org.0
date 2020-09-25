Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6522781CA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:39:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642936EC42;
	Fri, 25 Sep 2020 07:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7A86EC42
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 07:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POZ5Wf1XsHcaK4p+aN1ds8TzSrAJYCF+56wTldtXr30tj46j7YK2NQMQe/XI8xU1oe3hCyQRknVT7nmfOBmjSVF2qlWMrVMeFfxjgdkgFFYJ66132iX/PkVWTTlMLWnOSc8jTM+DJjrxwsDsqH6y8zUiWgPgIAvwGSS0B2PIhh3zXURebiCAxvSWxjPJYpS++5wfePYF/S/g1hNDslcY91v7HEW3eFSbz2mzqSc4PT4a8xTziEd9UzC1vmHp7YgxrC9Zhnp1bpY18LtA26AOIPILUFXqKsSa9olkN4amUXUwUnCNilUnbVL6E1sHRq8LcimYcGXndrU7h3a74t5Vqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPs1XAbyWWockLB8M/GIPNh5E6MBb1ZepZQy/wPJaT4=;
 b=ChMM4WH6Nv1KOdNfYbOTnpocq0qsdpE2c/NhbhNDby/jzqvxa86oDZB1e4Ax18Ty7XFv+KoYfLANXWsVf6OTafUtChhWkwU32dYMFSilHrLPDQUHu0F3TPY1lxISfwyCIqGjh0RgbZWa5ICk/LtuFovf6FJTba3hVDMz+xutrI3kLsYhz2Mgpzu4csrEAtbmO2MuKd5JeY4Eqa5k3uQu/6+PbMvLifSIh27QtyNC9xM9kpUfByuneOGEhuB4GsfoYLLOalXdGYv9pgL9NUG4vW7do5hIVgtXh9itL+nM/HnthuYzvUsQltP0sHWQ5ZmbWt7qqpwTWtMnBbwsn6n60Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPs1XAbyWWockLB8M/GIPNh5E6MBb1ZepZQy/wPJaT4=;
 b=kXZaXqUiZGzs09AFQj3Lh5Vzclg65ZEZGdr647ec1kp907zzLgwnKk22ryjNFDyrj1AWk5vEKsszx7d2yMs5E8jzV6QLZNEY1Uv9fUoCDusiwP29WWjGrUZw3iQBM2A2HM28zcUxV4Lvo5L+WHW20Dqcfse4cXFEWMxw/1TTRQc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2452.namprd12.prod.outlook.com (2603:10b6:207:3f::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Fri, 25 Sep
 2020 07:39:35 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Fri, 25 Sep 2020
 07:39:34 +0000
Subject: Re: [PATCH 37/45] drm/ttm: add a helper to allocate a temp tt for
 copies.
To: Dave Airlie <airlied@gmail.com>
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-38-airlied@gmail.com>
 <39ca897a-e7f2-93c8-e844-449ccbfe6041@amd.com>
 <CAPM=9tw6a6E+KZV7LceHUj=SHFaTe9M+KjjYgouhdX0gkDsuzw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4b16b60d-228d-164d-396f-f8344fd67674@amd.com>
Date: Fri, 25 Sep 2020 09:39:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tw6a6E+KZV7LceHUj=SHFaTe9M+KjjYgouhdX0gkDsuzw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.18 via Frontend Transport; Fri, 25 Sep 2020 07:39:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c752020-2be0-49c8-e05f-08d8612625df
X-MS-TrafficTypeDiagnostic: BL0PR12MB2452:
X-Microsoft-Antispam-PRVS: <BL0PR12MB24523B1AFA01E191B3FB89D683360@BL0PR12MB2452.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O1apEEH7zvEfaezDYExY+y9GHKzUGjPxnudOMLRRBpbejc1wdqROjLNtDypHw8xgXGC3Lo+WkALTrXQ9dgkM5aN4vSIdGK8jJ9+XdO7m8RBsyEvF6Nu/5rVa8FMNWPlBAElMuilFKxbQKa9wSm42NCqovD2w0eiIVCceikH0GOISh3jPvR/KYW8hSgpHtiU75mixR+hl8YmkJED0p8nGTVBo5LlWBMVJQ63gf6J0TFMWtY9gUz8yIibHRqMdXbqpFepFGdZsur2w+lO+tKrRhAPVVzfKJNIpglaTP0l+CcMiEdyhuDBje8kDvI7lh/z/8jJS1n414ACo84KqsxzA0/WREgx+dPIGBYSAKe8xss3uAQ7PHKKtzdwj+XEqxrMdTtnUQtLrEpW+6M+4h47XUQNR0BnGMVYKs1l+dloF8+11kjBKSLDRgu03W4XvoGZc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(6916009)(186003)(52116002)(316002)(31696002)(54906003)(83380400001)(66574015)(2616005)(6486002)(478600001)(4326008)(16526019)(31686004)(86362001)(5660300002)(2906002)(66476007)(66556008)(36756003)(8936002)(8676002)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PysSSlIAZH4qwVXm2/rPvfUxUfXGCOoWQawDp8QSeBVxk++WbAbsHu4W8IGhVo5qTkr2AYXihpFkJ0+GlGtzzzXoNaYFy7IbIo1xRpgMLElPQ8dSMrkitu03jqwq6o0O4XZ8AlFtZKr5hG2SThEfmpoDp8KuspBB+nGAy2NB7V4dKOopnsTK3koOFSbDt9RG7WogGg5xC14fGQwk0NIokVPZj0rQWNFrTvVlytkZeiIZNenJuwVr5odgcfmNuuvhnN3vFRj391v32kPS6HrRxYNvWykOlqiyo06P2Oq5HyY16QniROUIIWj7y8TQRYcO98ihRkFds9Q26RNs34Cd6h1dqo7xBbwBHdeOXaZY8mDhv2OfB2jVTeuH08ojja7HkfRjgzKyvW2nBFLZatRHJ3WngFFSfebDHfAc9a59W9VYJ6qWf9BSjS3PJQVz0j9Qee4w5HUQbTd1i1HPvgxhJXBlLb6NB+o9KADmZ4JeHnemEVi64//q4U+oVRPIyIv5//AikDQhA3ynwIrrRIRCONWpplVW8Jl+bG/R0FQHiH4mRpF1sqjklDyX5m0K9/D2Y0ct3Bj/688rzlMhlL+bdNVdo+tc+7JRvK6VsgXJ5b7y0uuKFSA9n6ebFAZeTCC7y3EqfBWAenjxfA9z97is0qjTnecZISoHLnTZ/1Npq8qHFfHJBXjLJ/OtaaTP+wA9wlqtLtQTNdPxOb80Hua9jg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c752020-2be0-49c8-e05f-08d8612625df
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 07:39:34.6974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fuv+ATJAwhTVJuKOl/5l5rbnpbYzODXTl7HfMgZHGlQFtLSvRvDARtShbenjNr43
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
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDkuMjAgdW0gMDE6MTQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBPbiBUaHUsIDI0IFNl
cCAyMDIwIGF0IDIyOjQyLCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+IHdyb3RlOgo+PiBBbSAyNC4wOS4yMCB1bSAwNzoxOCBzY2hyaWViIERhdmUgQWlybGllOgo+
Pj4gRnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPj4+Cj4+PiBBbGwgdGhl
IGFjY2VsIG1vdmVzIGRvIHRoZSBzYW1lIHBhdHRlcm4gaGVyZSwgcHJvdmlkZSBhIGhlbHBlcgo+
PiBBbmQgZXhhY3RseSB0aGF0IHBhdHRlcm4gSSB3YW50IHRvIGdldCBhd2F5IGZyb20uCj4gQ3Vy
cmVudGx5IHRoaXMgaXMganVzdCByZWZhY3RvcmluZyBvdXQgdGhlIGhlbHBlciBjb2RlIGluIGVh
Y2ggZHJpdmVyLCBidXQgSSBzZWUKPiBzaW5jZSBpdCBjYWxscyBib19tZW1fc3BhY2Ugd2UgYXJl
IHByb2JhYmx5IG1vdmluZyBhIGJpdCBpbiB0aGUgd3JvbmcgZGlyZWN0aW9uLgoKRXhhY3RseSB0
aGF0J3Mgd2h5IEknbSBub3RpbmcgdGhpcy4KCj4KPj4gU2VlIHdoYXQgaGFwcGVucyBpZiB3ZSAo
Zm9yIGV4YW1wbGUpIGhhdmUgYSBWUkFNIC0+IFNZU1RFTSBtb3ZlIGlzIHRoZQo+PiBmb2xsb3dp
bmc6Cj4+Cj4+IDEuIFRUTSBhbGxvY2F0ZXMgYSBuZXcgdHRtX3Jlc291cmNlIG9iamVjdCBpbiB0
aGUgU1lTVEVNIGRvbWFpbi4KPj4gMi4gV2UgY2FsbCB0aGUgZHJpdmVyIHRvIG1vdmUgZnJvbSBW
UkFNIHRvIFNZU1RFTS4KPj4gMy4gRHJpdmVyIGZpbmRzIHRoYXQgaXQgY2FuJ3QgZG8gdGhpcyBh
bmQgY2FsbHMgVFRNICB0byBhbGxvY2F0ZSBHVFQuCj4+IDQuIFNpbmNlIHdlIGFyZSBtYXliZSBv
dXQgb2YgR1RUIFRUTSBldmljdHMgYSBkaWZmZXJlbnQgQk8gZnJvbSBHVFQgdG8KPj4gU1lTVEVN
IGFuZCBjYWxsIGRyaXZlciBhZ2Fpbi4KPj4KPj4gVGhpcyBpcyBhIGhvcnJpYmxlIHBpbmcvcG9u
ZyBiZXR3ZWVuIGRyaXZlci9UVE0vZHJpdmVyL1RUTS9kcml2ZXIgYW5kIHdlCj4+IHNob3VsZCBz
dG9wIHRoYXQgaW1tZWRpYXRlbHkuCj4+Cj4+IE15IHN1Z2dlc3Rpb24gaXMgdGhhdCB3ZSByZXdy
aXRlIGhvdyBkcml2ZXJzIGNhbGwgdGhlIHR0bV9ib192YWxpZGF0ZSgpCj4+IGZ1bmN0aW9uIHNv
IHRoYXQgd2UgY2FuIGd1YXJhbnRlZSB0aGF0IHRoaXMgbmV2ZXIgaGFwcGVucy4KPj4KPj4gV2hh
dCBkbyB5b3UgdGhpbms/Cj4gSSB0aGluayB0aGF0IGlzIGxpa2VseSB0aGUgbmV4dCBzdGVwIEkn
ZCBsaWtlIHRvIHRha2UgYWZ0ZXIgdGhpcwo+IHJlZmFjdG9yLCBpdCdzIGEgbG90IGJpZ2dlciwg
YW5kIEknbSBub3Qgc3VyZSBob3cgaXQgd2lsbCBsb29rIHlldC4KCkFncmVlLCB5ZXMuIEkgaGF2
ZSBzb21lIGlkZWFzIGluIG1pbmQgZm9yIHRoYXQsIGJ1dCBub3QgZnVsbHkgYmFrZWQgZWl0aGVy
LgoKPiBEbyB3ZSBlbnZpc2lvbiB0aGUgZHJpdmVyIGNhbGxpbmcgdmFsaWRhdGUgaW4gYSBsb29w
IGJ1dCB3aGVuIGl0IGNhbid0Cj4gZmluZCBzcGFjZSBpdCB0ZWxscyB0aGUgZHJpdmVyIGFuZCB0
aGUgZHJpdmVyIGRvZXMgZXZpY3Rpb24gYW5kCj4gcmVjYWxscyB2YWxpZGF0ZT8KCk5vdCBpbiBh
IGxvb3AsIGJ1dCBtb3JlIGxpa2UgaW4gYSBjaGFpbi4KCk15IHBsYW4gaXMgc29tZXRoaW5nIGxp
a2UgdGhpczoKSW5zdGVhZCBvZiBoYXZpbmcgIm5vcm1hbCIgYW5kICJidXN5IiBwbGFjZW1lbnQg
d2UgaGF2ZSBhIGZsYWcgaW4gdGhlIApjb250ZXh0IGlmIGV2aWN0aW9ucyBhcmUgYWxsb3dlZCBv
ciBub3QuClRoZSBjYWxsIHRvIHR0bV9ib192YWxpZGF0ZSBhcmUgdGhlbiByZXBsYWNlZCB3aXRo
IHR3byBjYWxscywgZmlyc3QgCndpdGhvdXQgZXZpY3Rpb25zIGFuZCBpZiB0aGF0IGRpZG4ndCB3
b3JrZWQgb25lIHdpdGggZXZpY3Rpb25zLgoKVGhlbiB0aGUgbm9ybWFsIHZhbGlkYXRlIHNlcXVl
bmNlIHNob3VsZCBsb29rIGxpa2UgdGhpczoKMS4gSWYgYSBCTyBpcyBpbiB0aGUgU1lTVEVNIChv
ciBTV0FQIGRvbWFpbikgd2UgdmFsaWRhdGUgaXQgdG8gR1RUIGZpcnN0IAp3aXRoIGV2aWN0aW9u
cz10cnVlLgoyLiBJZiBhIEJPIHNob3VsZCBiZSBpbiBWUkFNIHdlIHRoZW4gdmFsaWRhdGUgaXQg
dG8gVlJBTS4gSWYgZXZpY3Rpb25zIAphcmUgb25seSBhbGxvd2VkIGlmIHRoZSBHRU0gZmxhZ3Mg
c2F5IHRoYXQgR1RUIGlzIG5vdCBkZXNpcmVkLgoKRm9yIHNwZWNpYWwgQk9zLCBsaWtlIGFtZGdw
dXMgR0RTLCBHV1MgYW5kIE9BIGRvbWFpbiBvciBWTVdHRlggc3BlY2lhbCAKZG9tYWlucyB0aGF0
IHdpbGwgb2J2aW91c2x5IGxvb2sgYSBiaXQgZGlmZmVyZW50LgoKQ2hyaXN0aWFuLgoKPgo+IERh
dmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
