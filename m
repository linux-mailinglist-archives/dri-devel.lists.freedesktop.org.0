Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489663425EA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 20:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C79A6EA96;
	Fri, 19 Mar 2021 19:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBA76EA96
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 19:13:09 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lNKYV-0006D0-Md; Fri, 19 Mar 2021 20:13:07 +0100
Message-ID: <693cbfa87ac025d84e1cd8d95c5bd68ec68a943b.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/etnaviv: Use FOLL_FORCE for userptr
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Fri, 19 Mar 2021 20:13:06 +0100
In-Reply-To: <YFT3B9fRldXI470m@phenom.ffwll.local>
References: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
 <YFT3B9fRldXI470m@phenom.ffwll.local>
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
Cc: John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 etnaviv@lists.freedesktop.org, stable@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgZGVtIDE5LjAzLjIwMjEgdW0gMjA6MDkgKzAxMDAgc2NocmllYiBEYW5pZWwg
VmV0dGVyOgo+IE9uIE1vbiwgTWFyIDAxLCAyMDIxIGF0IDEwOjUyOjUzQU0gKzAxMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBOb3RoaW5nIGNoZWNrcyB1c2VycHRyLnJvIGV4Y2VwdCB0aGlz
IGNhbGwgdG8gcHVwX2Zhc3QsIHdoaWNoIG1lYW5zCj4gPiB0aGVyZSdzIG5vdGhpbmcgYWN0dWFs
bHkgcHJldmVudGluZyB1c2Vyc3BhY2UgZnJvbSB3cml0aW5nIHRvIHRoaXMuCj4gPiBXaGljaCBt
ZWFucyB5b3UgY2FuIGp1c3QgcmVhZC1vbmx5IG1tYXAgYW55IGZpbGUgeW91IHdhbnQsIHVzZXJw
dHIgaXQKPiA+IGFuZCB0aGVuIHdyaXRlIHRvIGl0IHdpdGggdGhlIGdwdS4gTm90IGdvb2QuCj4g
PiAKPiA+IFRoZSByaWdodCB3YXkgdG8gaGFuZGxlIHRoaXMgaXMgRk9MTF9XUklURSB8IEZPTExf
Rk9SQ0UsIHdoaWNoIHdpbGwKPiA+IGJyZWFrIGFueSBDT1cgbWFwcGluZ3MgYW5kIHVwZGF0ZSB0
cmFja2luZyBmb3IgTUFZX1dSSVRFIG1hcHBpbmdzIHNvCj4gPiB0aGVyZSdzIG5vIGV4cGxvaXQg
YW5kIHRoZSB2bSBpc24ndCBjb25mdXNlZCBhYm91dCB3aGF0J3MgZ29pbmcgb24uCj4gPiBGb3Ig
YW55IGxlZ2l0IHVzZSBjYXNlIHRoZXJlJ3Mgbm8gZGlmZmVyZW5jZSBmcm9tIHdoYXQgdXNlcnNw
YWNlIGNhbgo+ID4gb2JzZXJ2ZSBhbmQgZG8uCj4gPiAKPiA+IENjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnCj4gPiBDYzogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+ID4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiBD
YzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+Cj4gPiBDYzogUnVzc2VsbCBL
aW5nIDxsaW51eCtldG5hdml2QGFybWxpbnV4Lm9yZy51az4KPiA+IENjOiBDaHJpc3RpYW4gR21l
aW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgo+ID4gQ2M6IGV0bmF2aXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gCj4gQ2FuIEkgcGxlYXNlIGhhdmUgYW4gYWNrIG9uIHRoaXMgc28g
SSBjYW4gYXBwbHkgaXQ/IEl0J3Mgc3R1Y2suCgpSZXZpZXdlZC1ieTogTHVjYXMgU3RhY2ggPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+Cgo+IFRoYW5rcywgRGFuaWVsCj4gCj4gPiAtLS0KPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYyB8IDIgKy0KPiA+IMKgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYwo+ID4gaW5kZXggNmQzOGM1YzE3ZjIzLi5hOWU2OTZk
MDViMzMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dl
bS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jCj4gPiBA
QCAtNjg5LDcgKzY4OSw3IEBAIHN0YXRpYyBpbnQgZXRuYXZpdl9nZW1fdXNlcnB0cl9nZXRfcGFn
ZXMoc3RydWN0IGV0bmF2aXZfZ2VtX29iamVjdCAqZXRuYXZpdl9vYmopCj4gPiDCoAkJc3RydWN0
IHBhZ2UgKipwYWdlcyA9IHB2ZWMgKyBwaW5uZWQ7Cj4gPiDCoAo+ID4gCj4gPiAKPiA+IAo+ID4g
wqAJCXJldCA9IHBpbl91c2VyX3BhZ2VzX2Zhc3QocHRyLCBudW1fcGFnZXMsCj4gPiAtCQkJCQkg
ICF1c2VycHRyLT5ybyA/IEZPTExfV1JJVEUgOiAwLCBwYWdlcyk7Cj4gPiArCQkJCQkgIEZPTExf
V1JJVEUgfCBGT0xMX0ZPUkNFLCBwYWdlcyk7Cj4gPiDCoAkJaWYgKHJldCA8IDApIHsKPiA+IMKg
CQkJdW5waW5fdXNlcl9wYWdlcyhwdmVjLCBwaW5uZWQpOwo+ID4gwqAJCQlrdmZyZWUocHZlYyk7
Cj4gPiAtLSAKPiA+IDIuMzAuMAo+ID4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
