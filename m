Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABA1D42A3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 16:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA90E6E0BC;
	Fri, 11 Oct 2019 14:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA306E0BC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 14:20:46 +0000 (UTC)
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2F35829106A;
 Fri, 11 Oct 2019 15:20:44 +0100 (BST)
Date: Fri, 11 Oct 2019 16:20:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 04/21] drm/exynos: Fix potential unbalanced calls to
 pm_runtime_put
Message-ID: <20191011162041.24953d44@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <19d2998a-1b54-f5c2-1c9c-3eeced8b6f6d@samsung.com>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <CGME20190826152700epcas1p34f6efa9f4c77885901f4cb9181bcaffe@epcas1p3.samsung.com>
 <20190826152649.13820-5-boris.brezillon@collabora.com>
 <19d2998a-1b54-f5c2-1c9c-3eeced8b6f6d@samsung.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMSBPY3QgMjAxOSAxNTo1NDo1MyArMDIwMApBbmRyemVqIEhhamRhIDxhLmhhamRh
QHNhbXN1bmcuY29tPiB3cm90ZToKCj4gT24gMjYuMDguMjAxOSAxNzoyNiwgQm9yaXMgQnJlemls
bG9uIHdyb3RlOgo+ID4gVGhlIGVuY29kZXItPmVuYWJsZSgpIGNhbid0IHJlcG9ydCBlcnJvcnMg
YW5kIGlzIGV4cGVjdGVkIHRvIGFsd2F5cwo+ID4gc3VjY2VlZC4gSWYgd2UgY2FsbCBwbV9ydW50
aW1lX3B1dCgpIGluIHRoZSBleHlub3NfZHNpX2VuYWJsZSgpIGVycm9yCj4gPiBwYXRoIChhcyBj
dXJyZW50bHkgZG9uZSkgd2UnbGwgaGF2ZSB1bmJhbGFuY2VkIGdldC9wdXQgY2FsbHMgd2hlbgo+
ID4gZW5jb2Rlci0+ZGlzYWJsZSgpIGlzIGNhbGxlZC4gIAo+IAo+IAo+IFRydWUKPiAKPiAKPiA+
Cj4gPiBUaGUgc2l0dWF0aW9uIGlzIG5vdCBpZGVhbCBzaW5jZSBkcm1fcGFuZWxfe3ByZXBhcmUs
ZW5hYmxlfSgpIGNhbgo+ID4gdGhlb3JldGljYWxseSByZXR1cm4gYW4gZXJyb3IgKGV2ZW4gaWYg
aW4gcHJhY3RpY2UgSSBkb24ndCB0aGluayBhbnkKPiA+IHBhbmVsIGRyaXZlciBkb2VzIHRoYXQp
LiAgCj4gCj4gCj4gU28gd2h5IGRvIHlvdSB3YW50IHRvIGZpeCBpdCBhdCBhbGwsIGlmIHlvdSB0
aGluayByZXR1cm4gdmFsdWUgaXMgYWx3YXlzCj4gMCA6KSA/Cj4gCj4gCj4gZ2l0IGdyZXAgLXAg
LUEzMCAnX3ByZXBhcmUnIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC8gc2hvd3MgdGhhdCBtYW55IG9m
Cj4gdGhlbSBjYW4gcmV0dXJuIGVycm9ycy4KClRoZW4gSSB3YXMgd3JvbmcgOi0pLgoKPiAKPiAK
PiA+ICBQdXR0aW5nIGEgV0FSTl9PTigpIGlzIHRoZSBiZXN0IHdlIGNhbiBkbywKPiA+IHVuZm9y
dHVuYXRlbHkuICAKPiAKPiAKPiBJIGd1ZXNzIG9wdGltYWxseSB3ZSBzaG91bGQgdXNlIERSTV9N
T0RFX0xJTktfU1RBVFVTX0JBRCwgYnV0IEkgYW0gbm90Cj4gc3VyZSBob3cgZXhhY3RseSBpdCBz
aG91bGQgYmUgaGFuZGxlZC4KCllvdSBtZWFuIGNhbGwKZHJtX2Nvbm5lY3Rvcl9zZXRfbGlua19z
dGF0dXNfcHJvcGVydHkoRFJNX01PREVfTElOS19TVEFUVVNfQkFEKSA/Cgo+IAo+IAo+ID4gTm90
ZSB0aGF0IC1FTk9TWVMgaXMgYWN0dWFsbHkgYSB2YWxpZCBjYXNlLCBpdCBqdXN0Cj4gPiBtZWFu
cyB0aGUgcGFuZWwgZHJpdmVyIGRvZXMgbm90IGltcGxlbWVudCB0aGUgaG9vay4gIAo+IAo+IAo+
IEl0IHdvdWxkIGJlIGdvb2QgdGhlbiB0byBmaXggaXQgaW4gcGFuZWwgZnJhbWV3b3JrLCBpZSB3
aXRob3V0IGhvb2sKPiBkcm1fcGFuZWxfKiBmdW5jdGlvbiBzaG91bGQgcmV0dXJuIDAsIEVOT1NZ
UyBtYWtlcyBubyBzZW5zZSBoZXJlLgoKSSdtIGZpbmUgd2l0aCB0aGF0LiBUaGllcnJ5LCBTYW0s
IGFueSBvcGluaW9uPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
