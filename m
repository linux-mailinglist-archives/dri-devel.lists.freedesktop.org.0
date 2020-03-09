Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0DF17F1A0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64BA6E804;
	Tue, 10 Mar 2020 08:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B0588940F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 08:41:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BEA11FB;
 Mon,  9 Mar 2020 01:41:05 -0700 (PDT)
Received: from [10.37.12.74] (unknown [10.37.12.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 454DD3F6CF;
 Mon,  9 Mar 2020 01:41:02 -0700 (PDT)
Subject: Re: [PATCH] drm/exynos: Fix memory leak and release IOMMU mapping
 structures
To: Inki Dae <inki.dae@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <CGME20200304220104epcas1p2d65f8ab31df6aa5373787b695b14f8ff@epcas1p2.samsung.com>
 <20200304220022.8003-1-lukasz.luba@arm.com>
 <c69c1163-a75b-6667-1979-f3aa356dc0b4@samsung.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <7962c9f2-e85d-9f9b-f442-c4a5b387ca44@arm.com>
Date: Mon, 9 Mar 2020 08:41:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c69c1163-a75b-6667-1979-f3aa356dc0b4@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
Cc: jy0922.shim@samsung.com, b.zolnierkie@samsung.com, airlied@linux.ie,
 sw0312.kim@samsung.com, krzk@kernel.org, a.hajda@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, Dietmar.Eggemann@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSW5raSwKCk9uIDMvOS8yMCAxMjo0NSBBTSwgSW5raSBEYWUgd3JvdGU6Cj4gSGkgTHVrYXN6
LAo+IAo+IDIwLiAzLiA1LiDsmKTsoIQgNzowMOyXkCBMdWthc3ogTHViYSDsnbQo6rCAKSDsk7Qg
6riAOgo+PiBUaGVyZSBpcyBhIG1lbW9yeSBsZWFrIHdoaWNoIGxlZnQgc29tZSBvYmplY3RzIG5v
dCBmcmVlZC4gVGhlIHJlZmVyZW5jZQo+PiBjb3VudGVyIG9mIG1hcHBpbmc6ICdtYXBwaW5nLT5r
cmVmJyB3YXMgMiB3aGVuIGNhbGxpbmcKPj4gYXJtX2lvbW11X2RldGFjaF9kZXZpY2UoKSwgc28g
dGhlIHJlbGVhc2VfaW9tbXVfbWFwcGluZygpIHdvbid0IGJlIGNhbGxlZC4KPj4gU2luY2UgdGhl
IG9sZCBtYXBwaW5nIHN0cnVjdHVyZSBpcyBub3QgZ29pbmcgdG8gYmUgdXNlZCBhbnkgbW9yZSAo
YmVjYXVzZQo+PiBpdCBpcyBkZXRhY2hlZCBhbmQgbmV3IG9uZSBhdHRhY2hlZCksIGNhbGwgYXJt
X2lvbW11X3JlbGVhc2VfbWFwcGluZygpCj4+IHRvIHRyaWdnZXIgY2xlYW51cC4KPj4KPj4gRm91
bmQgdXNpbmcga21lbWxlYWsgZGV0ZWN0b3IsIHRoZSBvdXRwdXQ6Cj4+Cgpbc25pcF0KCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBMdWJhIDxsdWthc3oubHViYUBhcm0uY29tPgo+PiAtLS0K
Pj4KPj4gSGkgYWxsLAo+Pgo+PiBJIGhhdmUgZGlzY292ZXJlZCB0aGlzIGlzc3VlIG9uIE9kcm9p
ZFhVNCB3aGlsZSBydW5uaW5nIHNvbWUgc3RyZXNzIHRlc3RzCj4+IGZvciB1cGNvbWluZyBFbmVy
Z3kgTW9kZWwuIFRvIHJlcHJvZHVjZSBpdCwga2VybmVsIG11c3QgYmUgY29tcGlsZWQgd2l0aAo+
PiBERUJVR19LTUVNTEVBSy4gV2hlbiB0aGUgYm9vdCBoYXMgZmluaXNoZWQsIHR5cGU6Cj4+ICMg
ZWNobyBzY2FuID4gL3N5cy9rZXJuZWwvZGVidWcva21lbWxlYWsKPj4gIyBjYXQgL3N5cy9rZXJu
ZWwvZGVidWcva21lbWxlYWsKPj4gWW91IHNob3VsZCBleHBlY3Qgc2ltaWxhciBvdXRwdXQgdG8g
dGhlIG9uZSBmcm9tIHRoZSBjb21taXQgbWVzc2FnZS4KPj4KPj4gSSBkb24ndCBrbm93IGlmIGl0
IHNob3VsZCBnbyB2aWEgc3RhYmxlIHRyZWUgYXMgd2VsbC4gSSBjYW4gcmVzZW5kIHdpdGggQ0MK
Pj4gc3RhYmxlLCBpZiB0aGVyZSBpcyBhIG5lZWQuCj4gCj4gVGhhbmtzIGZvciBmaXh1cC4gQlRX
LCBhcyB5b3UgY29tbWVudGVkIG9uIE1hcmVrJ3MgcGF0Y2ggdGhyZWFkLCB3aXRoIE1hcmVrJ3Mg
cGF0Y2ggdGhlIG1lbW9yeSBsZWFrIHdpbGwgYmUgc29sdmVkLgo+IERvIHlvdSB3YW50IE1hcmVr
IHRvIHJld29yayBoaXMgcGF0Y2ggb24gdG9wIG9mIHlvdXIgcGF0Y2ggb3IgYXJlIHlvdSBvayBt
ZSB0byBwaWNrIHVwIG9ubHkgTWFyZWsncyBvbmU/CgpQbGVhc2UgZHJvcCB0aGlzIG9uZSBhbmQg
YXBwbHkgb25seSBNYXJlaydzIHBhdGNoLCBpdCBmaXhlcyB0aGUgaXNzdWUuCkkgZGlkbid0IGtu
b3cgdGhhdCBoZSB3YXMgd29ya2luZyBvbiBzaW1pbGFyIHN0dWZmLgoKPiAKPiBNYXJlaydzIHBh
dGNoIGlzIGNvbmZsaWN0ZWQgd2l0aCB5b3VyIG9uZS4KPiAKPiBUaGFua3MsCj4gSW5raSBEYWUK
ClJlZ2FyZHMsCkx1a2FzegpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
