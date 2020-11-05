Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D09B2A7E90
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BA86ED18;
	Thu,  5 Nov 2020 12:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680085.outbound.protection.outlook.com [40.107.68.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7118A6ED18
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ax6Ck8qr+8e7rZdebVK1nJjewod2s1E3OzrXrs6/tWUo2KyPzFik7GTV40d33eZv+W0BhWe+FJMhhugMhtOwY+nOw/Bu0khFtoZQ6SNgMlziX7HFZDJPXMXX4uEzyrfutcaZuyJg/WratOhYKRZBVQemVVIu1aa7ZJdj2gLCDzWCWXH3TvbjqE6ha+1rqcTQMqGkQtGr31ObPehWnA3ObKJktEnpshOk6Gy2ShdqPPmD3pU6aG4SP1l7fOGjXskYlrIlW2NA9wH8uTpHhDplP3B8rEVeZzGKnaGxX4QaH+lYGvfBmnjGjNAfM0P9VgwnVG3MilcFWNya9D/hjLozng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r62w6I44zRrHBHz/2vwU/imvryxir76tJKtMdsBT9Eo=;
 b=PbD5lz5+OzNrCrO8yn56+D3FOM4D5qOqLO5c1o5rbexTd+7DfMtZGFoVdovZXd0pfrRkJnb8Tz/ADrYZR6SaLd+kuO0d92WHz3HKE6ZqAOaUduhSz1xB5yZXlKjzZW6xeLAj0WbX+y/zqh5r5QB21dBhzELlRahd+lb1n7yTjjbq51O2f2LysZUV9uqEcxIUMb2lWfUltc8s2g3OktZP7xxUHoD1UXSkadGfo3xUMhg9Mb8+9AgIBsfxtDPQ+lpUWjwDuo4+THyy0PULf0DeIggOGxzEmkjhhvln3IWgv9WLtIJsSBktqO0lvdzOn/8pE0NYYjLHPvDOTXMR6aFdqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r62w6I44zRrHBHz/2vwU/imvryxir76tJKtMdsBT9Eo=;
 b=lyUvoiV7qTAjKtaAogyd8XJPeD++FpmqQlFaQ8FJazrKtiGnh7Hlim+I2tv0OF2B345Y/OSCR6mJPn06LkeHsgcS8dr+3VXIhKNiA6FAKmMbsSo0AFVPEpk6DxdxcRvG9eQG/UcmIzeAgH4Nb8Ukk+LHvVSkQtXWD6YB/tWuF3M=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 5 Nov
 2020 12:29:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 12:29:55 +0000
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20201104165030.2005167-1-daniel.vetter@ffwll.ch>
 <859e2b9c-c202-25c6-b52f-9841fe32b082@amd.com>
 <CAKMK7uGA3URvu3BUzs617sGS_TchHDhpzzgsMGrVVJtwBpD+Vw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d6cdc22d-9cb2-7985-fdc3-ad3548899f02@amd.com>
Date: Thu, 5 Nov 2020 13:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uGA3URvu3BUzs617sGS_TchHDhpzzgsMGrVVJtwBpD+Vw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P189CA0002.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P189CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Thu, 5 Nov 2020 12:29:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 414a1f88-034b-4d0e-ab16-08d881868058
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142485CE83DBE7E0B75177C83EE0@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rw/G5STb26b8BXr6GWwFEjMNyF7e/1xKoqLuHsoDKoICWfjvxjbNVVy2gfWb/jRnSu3ty5EIdiugGV611ZseAWyf1c8h6lzkAkFzR7TLbMU8/hzu7a6aTNSSGFLdFwFhclZcjoOlESxbiJg4df1NyoUlvrdjOJpQwKtrqwec/5d1PXPQGgBQfTtHiW9836delJJqfu25BI9ScCQ0veRcUnXlrRpBhHTUBRDL88QO9l4FUvAcQLFU8q90aJJdhtUiwFTI8PgEpw6w7wRgXqoEeoCIncWfERiznWcnQpXxgldi9pgPEyzdSIjamftEUK/M9/DuA8U5fUpYDw62/VD6I3WB/bwbNBvY9HpablSVfZrTouYbriB3VIZaHPZHMmn1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(4326008)(6666004)(66556008)(66946007)(6916009)(2616005)(66476007)(316002)(83380400001)(478600001)(6486002)(31696002)(8936002)(2906002)(31686004)(86362001)(16526019)(186003)(52116002)(5660300002)(54906003)(36756003)(8676002)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /Wujjn6lkAEztKfygM5kLS0DLw6vL/TiAiWWS9nZgkmwyfxhIcvd36pcffd9E1AKCLrZKqTS4fDbE/G1NmPbZFVAtwyxEeduY6OHyUVuptfoAgKW7jSEq3UPyi6ezP0HfVRW++7VMWbl4ievIbcCziySUbQi+hbxMipj0Rd3045stgokoVagYZC2gC/5dcqnrqDUcviT6/bGdGVDS/ZnGs6pHFp0cVOdi1WdkiE0b6Qb5VrDghhKWeGA8KR17+sAGdpyFV1ShcDBmgvwiOp1ViYQOVbblZ1WR5azki388UOJyeepMQq0ORpI8qXhSaoLCx/pZAlTDVtGGR/sSLEW5HbXGvaYIGXwvWtegpmczo87N/B4FzVspZP6kfRitsPQdVHQsGezBlDVt20apwWJuhQpFKIuzo+nnoZ6TeAGuX8eMxqe0bivezBFA7UxdrsMFMh7IBA4l+obMd9CGFQD/exFEX4xNJpyREHVpKoYkb7AdWTEy3OVKm8OSp1/1i0R/rpzFwrmPmvCn3ILnVwMNHgwfpsekbHnkpkjSmXyb/OT9YaL8CK3xGaieokp0RIxg0TeqfggF0YXwD/BI4D2OlDweUfxdh58kdowxhLt6qVGaero8qa+fpyNHOZa3SnkYkHiPLmpvVAod57XgN0LFZvYeviWamJq5NBtZWRGYbwnGFR6x3o5sBOTxajP+W/IL9gChS3hQq36VDki7IL2YQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414a1f88-034b-4d0e-ab16-08d881868058
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 12:29:55.4109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PhwgvLxLkAtD8qL+ggJHNwRso1uPr+jEh8it/CLWpxmpZrC11izzcJNEe6QCC+n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Huang Rui <ray.huang@amd.com>,
 Brian Paul <brianp@vmware.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMTEuMjAgdW0gMTA6MTEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgTm92
IDUsIDIwMjAgYXQgOTowMCBBTSBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+IHdyb3RlOgo+PiBBbSAwNC4xMS4yMCB1bSAxNzo1MCBzY2hyaWViIERhbmllbCBWZXR0
ZXI6Cj4+PiBSYW5kb20gb2JzZXJ2YXRpb24gd2hpbGUgdHJ5aW5nIHRvIHJldmlldyBDaHJpc3Rp
YW4ncyBwYXRjaCBzZXJpZXMgdG8KPj4+IHN0b3AgbG9va2luZyBhdCBzdHJ1Y3QgcGFnZSBmb3Ig
ZG1hLWJ1ZiBpbXBvcnRzLgo+Pj4KPj4+IFRoaXMgd2FzIG9yaWdpbmFsbHkgYWRkZWQgaW4KPj4+
Cj4+PiBjb21taXQgNThhYTY2MjJkMzJhZjdkMmMwOGQ0NTA4NWY0NGM1NDU1NGExNmVkNwo+Pj4g
QXV0aG9yOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4+PiBEYXRl
OiAgIEZyaSBKYW4gMyAxMTo0NzoyMyAyMDE0ICswMTAwCj4+Pgo+Pj4gICAgICAgZHJtL3R0bTog
Q29ycmVjdGx5IHNldCBwYWdlIG1hcHBpbmcgYW5kIC1pbmRleCBtZW1iZXJzCj4+Pgo+Pj4gICAg
ICAgTmVlZGVkIGZvciBzb21lIHZtIG9wZXJhdGlvbnM7IG1vc3Qgbm90YWJseSB1bm1hcF9tYXBw
aW5nX3JhbmdlKCkgd2l0aAo+Pj4gICAgICAgZXZlbl9jb3dzID0gMC4KPj4+Cj4+PiAgICAgICBT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4+
PiAgICAgICBSZXZpZXdlZC1ieTogQnJpYW4gUGF1bCA8YnJpYW5wQHZtd2FyZS5jb20+Cj4+Pgo+
Pj4gYnV0IHdlIGRvIG5vdCBoYXZlIGEgc2luZ2xlIGNhbGxlciBvZiB1bm1hcF9tYXBwaW5nX3Jh
bmdlIHdpdGgKPj4+IGV2ZW5fY293cyA9PSAwLiBBbmQgYWxsIHRoZSBnZW0gZHJpdmVycyBkb24n
dCBkbyB0aGlzLCBzbyBhbm90aGVyCj4+PiBzbWFsbCB0aGluZyB3ZSBjb3VsZCBzdGFuZGFyZGl6
ZSBiZXR3ZWVuIGRybSBhbmQgdHRtIGRyaXZlcnMuCj4+Pgo+Pj4gUGx1cyBJIGRvbid0IHJlYWxs
eSBzZWUgYSBuZWVkIGZvciB1bmFtcF9tYXBwaW5nX3JhbmdlIHdoZXJlIHdlIGRvbid0Cj4+PiB3
YW50IHRvIGluZGlzY3JpbWluYXRlbHkgc2hvb3QgZG93biBhbGwgcHRlcy4KPj4gTkFLLCB3ZSB1
c2UgdGhpcyB0byBkZXRlcm1pbmUgaWYgYSBwYWdlcyBiZWxvbmdzIHRvIHRoZSBkcml2ZXIgb3Ig
bm90IGluCj4+IGFtZGdwdSBmb3IgZXhhbXBsZS4KPj4KPj4gTW9zdGx5IHVzZWQgZm9yIGRlYnVn
Z2luZywgYnV0IEkgd291bGQgcmVhbGx5IGxpa2UgdG8ga2VlcCB0aGF0Lgo+IENhbiB5b3UgcGxz
IHBvaW50IG1lIGF0IHRoYXQgY29kZT8gQSBxdWljayBncmVwIGhhc24ndCByZWFsbHkgZm91bmQg
bXVjaCBhdCBhbGwuCgpTZWUgYW1kZ3B1X2lvbWVtX3JlYWQoKSBmb3IgYW4gZXhhbXBsZToKCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChwLT5tYXBwaW5nICE9IGFkZXYtPm1t
YW4uYmRldi5kZXZfbWFwcGluZykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiAtRVBFUk07CgpDaHJpc3RpYW4uCgo+IC1EYW5pZWwKPgo+PiBD
aHJpc3RpYW4uCj4+Cj4+PiBDYzogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUu
Y29tPgo+Pj4gQ2M6IEJyaWFuIFBhdWwgPGJyaWFucEB2bXdhcmUuY29tPgo+Pj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4+PiBDYzogQ2hy
aXN0aWFuIEtvZW5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4gQ2M6IEh1YW5nIFJ1
aSA8cmF5Lmh1YW5nQGFtZC5jb20+Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3R0LmMgfCAxMiAtLS0tLS0tLS0tLS0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBkZWxl
dGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQu
YyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4+IGluZGV4IDg4NjFhNzRhYzMzNS4u
NDM4ZWE0M2ZkOGMxIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQu
Ywo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4gQEAgLTI5MSwxNyAr
MjkxLDYgQEAgaW50IHR0bV90dF9zd2Fwb3V0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBz
dHJ1Y3QgdHRtX3R0ICp0dG0pCj4+PiAgICAgICAgcmV0dXJuIHJldDsKPj4+ICAgIH0KPj4+Cj4+
PiAtc3RhdGljIHZvaWQgdHRtX3R0X2FkZF9tYXBwaW5nKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LCBzdHJ1Y3QgdHRtX3R0ICp0dG0pCj4+PiAtewo+Pj4gLSAgICAgcGdvZmZfdCBpOwo+Pj4g
LQo+Pj4gLSAgICAgaWYgKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpCj4+PiAt
ICAgICAgICAgICAgIHJldHVybjsKPj4+IC0KPj4+IC0gICAgIGZvciAoaSA9IDA7IGkgPCB0dG0t
Pm51bV9wYWdlczsgKytpKQo+Pj4gLSAgICAgICAgICAgICB0dG0tPnBhZ2VzW2ldLT5tYXBwaW5n
ID0gYmRldi0+ZGV2X21hcHBpbmc7Cj4+PiAtfQo+Pj4gLQo+Pj4gICAgaW50IHR0bV90dF9wb3B1
bGF0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPj4+ICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4KQo+Pj4gICAg
ewo+Pj4gQEAgLTMyMCw3ICszMDksNiBAQCBpbnQgdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2LAo+Pj4gICAgICAgIGlmIChyZXQpCj4+PiAgICAgICAgICAgICAgICBy
ZXR1cm4gcmV0Owo+Pj4KPj4+IC0gICAgIHR0bV90dF9hZGRfbWFwcGluZyhiZGV2LCB0dG0pOwo+
Pj4gICAgICAgIHR0bS0+cGFnZV9mbGFncyB8PSBUVE1fUEFHRV9GTEFHX1BSSVZfUE9QVUxBVEVE
Owo+Pj4gICAgICAgIGlmICh1bmxpa2VseSh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFH
X1NXQVBQRUQpKSB7Cj4+PiAgICAgICAgICAgICAgICByZXQgPSB0dG1fdHRfc3dhcGluKHR0bSk7
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
