Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C0327C12
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 11:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7816E584;
	Mon,  1 Mar 2021 10:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9AE6E584
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 10:28:32 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lGfmw-00045g-S2; Mon, 01 Mar 2021 11:28:30 +0100
Message-ID: <f0e85747e101a9078f1e1d158f1eea29a9f31684.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/etnaviv: Use FOLL_FORCE for userptr
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Mon, 01 Mar 2021 11:28:30 +0100
In-Reply-To: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
References: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: John Hubbard <jhubbard@nvidia.com>, etnaviv@lists.freedesktop.org,
 stable@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTW9udGFnLCBkZW0gMDEuMDMuMjAyMSB1bSAxMDo1MiArMDEwMCBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4gTm90aGluZyBjaGVja3MgdXNlcnB0ci5ybyBleGNlcHQgdGhpcyBjYWxsIHRvIHB1
cF9mYXN0LCB3aGljaCBtZWFucwo+IHRoZXJlJ3Mgbm90aGluZyBhY3R1YWxseSBwcmV2ZW50aW5n
IHVzZXJzcGFjZSBmcm9tIHdyaXRpbmcgdG8gdGhpcy4KPiBXaGljaCBtZWFucyB5b3UgY2FuIGp1
c3QgcmVhZC1vbmx5IG1tYXAgYW55IGZpbGUgeW91IHdhbnQsIHVzZXJwdHIgaXQKPiBhbmQgdGhl
biB3cml0ZSB0byBpdCB3aXRoIHRoZSBncHUuIE5vdCBnb29kLgoKSSBhZ3JlZSBhYm91dCB0aGUg
Im5vdCBnb29kIiBwYXJ0LgoKPiBUaGUgcmlnaHQgd2F5IHRvIGhhbmRsZSB0aGlzIGlzIEZPTExf
V1JJVEUgfCBGT0xMX0ZPUkNFLCB3aGljaCB3aWxsCj4gYnJlYWsgYW55IENPVyBtYXBwaW5ncyBh
bmQgdXBkYXRlIHRyYWNraW5nIGZvciBNQVlfV1JJVEUgbWFwcGluZ3Mgc28KPiB0aGVyZSdzIG5v
IGV4cGxvaXQgYW5kIHRoZSB2bSBpc24ndCBjb25mdXNlZCBhYm91dCB3aGF0J3MgZ29pbmcgb24u
Cj4gRm9yIGFueSBsZWdpdCB1c2UgY2FzZSB0aGVyZSdzIG5vIGRpZmZlcmVuY2UgZnJvbSB3aGF0
IHVzZXJzcGFjZSBjYW4KPiBvYnNlcnZlIGFuZCBkby4KClRoaXMgaG93ZXZlciBzZWVtcyBwcmV0
dHkgaGVhdnkgaGFuZGVkLiBEb2VzIHRoaXMgbWVhbiB3ZSBkbyBhIGZ1bGwgQ09XCmN5Y2xlIG9m
IHRoZSB1c2VycGFnZXMgb24gQk8gY3JlYXRpb24/IFRoaXMgbW9zdCBsaWtlbHkga2lsbHMgYSBs
b3Qgb2YKdGhlIHBlcmZvcm1hbmNlIGJlbmVmaXRzIHRoYXQgb25lIG1pZ2h0IHNlZWsgYnkgdXNp
bmcgdXNlcnB0ci4gSWYKdGhhdCdzIHRoZSBjYXNlIEkgbWlnaHQgc3RpbGwgdGFrZSB0aGlzIHBh
dGNoIGZvciBzdGFibGUsIGJ1dCB0aGVuIHdlCnNob3VsZCByYXRoZXIganVzdCBkaXNhbGxvdyB3
cml0YWJsZSBHUFUgbWFwcGluZ3MgdG8gdGhpcyBCTy4KClJlZ2FyZHMsCkx1Y2FzCgo+IAo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZp
ZGlhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGlu
dGVsLmNvbT4KPiBDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6
IFJ1c3NlbGwgS2luZyA8bGludXgrZXRuYXZpdkBhcm1saW51eC5vcmcudWs+Cj4gQ2M6IENocmlz
dGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+Cj4gQ2M6IGV0bmF2aXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X2dlbS5jIHwgMiArLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0
bmF2aXZfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jCj4gaW5k
ZXggNmQzOGM1YzE3ZjIzLi5hOWU2OTZkMDViMzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2
L2V0bmF2aXZfZ2VtLmMKPiBAQCAtNjg5LDcgKzY4OSw3IEBAIHN0YXRpYyBpbnQgZXRuYXZpdl9n
ZW1fdXNlcnB0cl9nZXRfcGFnZXMoc3RydWN0IGV0bmF2aXZfZ2VtX29iamVjdCAqZXRuYXZpdl9v
YmopCj4gwqAJCXN0cnVjdCBwYWdlICoqcGFnZXMgPSBwdmVjICsgcGlubmVkOwo+IMKgCj4gCj4g
Cj4gCj4gCj4gCj4gCj4gCj4gwqAJCXJldCA9IHBpbl91c2VyX3BhZ2VzX2Zhc3QocHRyLCBudW1f
cGFnZXMsCj4gLQkJCQkJICAhdXNlcnB0ci0+cm8gPyBGT0xMX1dSSVRFIDogMCwgcGFnZXMpOwo+
ICsJCQkJCSAgRk9MTF9XUklURSB8IEZPTExfRk9SQ0UsIHBhZ2VzKTsKPiDCoAkJaWYgKHJldCA8
IDApIHsKPiDCoAkJCXVucGluX3VzZXJfcGFnZXMocHZlYywgcGlubmVkKTsKPiDCoAkJCWt2ZnJl
ZShwdmVjKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
