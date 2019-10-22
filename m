Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 896CDE0077
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 11:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955146E4AA;
	Tue, 22 Oct 2019 09:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4A16E4A7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 09:14:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EF1A828D194;
 Tue, 22 Oct 2019 10:14:36 +0100 (BST)
Date: Tue, 22 Oct 2019 11:14:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 04/21] drm/exynos: Fix potential unbalanced calls to
 pm_runtime_put
Message-ID: <20191022111433.4b408cf0@collabora.com>
In-Reply-To: <20191012071526.GA19311@ravnborg.org>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <CGME20190826152700epcas1p34f6efa9f4c77885901f4cb9181bcaffe@epcas1p3.samsung.com>
 <20190826152649.13820-5-boris.brezillon@collabora.com>
 <19d2998a-1b54-f5c2-1c9c-3eeced8b6f6d@samsung.com>
 <20191011162041.24953d44@dhcp-172-31-174-146.wireless.concordia.ca>
 <20191012071526.GA19311@ravnborg.org>
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
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Chris Healy <Chris.Healy@zii.aero>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAxMiBPY3QgMjAxOSAwOToxNToyNiArMDIwMApTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+IHdyb3RlOgoKPiBIaSBCb3Jpcy9BbmRyemVqLgo+IAo+ID4gICAKPiA+ID4gCj4g
PiA+ICAgCj4gPiA+ID4gTm90ZSB0aGF0IC1FTk9TWVMgaXMgYWN0dWFsbHkgYSB2YWxpZCBjYXNl
LCBpdCBqdXN0Cj4gPiA+ID4gbWVhbnMgdGhlIHBhbmVsIGRyaXZlciBkb2VzIG5vdCBpbXBsZW1l
bnQgdGhlIGhvb2suICAgIAo+ID4gPiAKPiA+ID4gCj4gPiA+IEl0IHdvdWxkIGJlIGdvb2QgdGhl
biB0byBmaXggaXQgaW4gcGFuZWwgZnJhbWV3b3JrLCBpZSB3aXRob3V0IGhvb2sKPiA+ID4gZHJt
X3BhbmVsXyogZnVuY3Rpb24gc2hvdWxkIHJldHVybiAwLCBFTk9TWVMgbWFrZXMgbm8gc2Vuc2Ug
aGVyZS4gIAo+ID4gCj4gPiBJJ20gZmluZSB3aXRoIHRoYXQuIFRoaWVycnksIFNhbSwgYW55IG9w
aW5pb24/ICAKPiAKPiBBZ3JlZWQsIEkgaGF2ZSBmb2xsb3dpbmcgcGF0Y2ggaW4gbXkgcGFuZWwg
cGF0Y2ggcXVldWU6Cj4gCj4gZHJtL2RybV9wYW5lbDogbm8gZXJyb3Igd2hlbiBubyBjYWxsYmFj
awo+IAo+ICAgICBUaGUgY2FsbGJhY2tzIGluIGRybV9wYW5lbF9mdW5jcyBhcmUgb3B0aW9uYWws
IHNvIGRvIG5vdAo+ICAgICByZXR1cm4gYW4gZXJyb3IganVzdCBiZWNhdXNlIG5vIGNhbGxiYWNr
IGlzIGFzc2lnbmVkLgo+IAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cj4gCj4gSWYgSSBnZXQgdGltZSB0aGlzIHdlZWtlbmQgSSB3aWxsIHJlYmFz
ZS90ZXN0IGFuZCBzZW5kIHRoZQo+IHNldCBvZiBwYXRjaGVzIG91dC4KCkFueSBwcm9ncmVzcyBv
biB0aGF0PyBDYW4gSSByZWJhc2Uvc2VuZCBpdCBmb3IgeW91IGlmIHlvdSBkb24ndCBoYXZlCnRp
bWU/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
