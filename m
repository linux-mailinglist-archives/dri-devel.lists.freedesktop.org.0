Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1E9D59E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B632F6E291;
	Mon, 26 Aug 2019 18:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960C76E291
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 18:17:45 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 852E027C1C9;
 Mon, 26 Aug 2019 19:17:43 +0100 (BST)
Date: Mon, 26 Aug 2019 20:17:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH v2 18/21] drm/bridge: lvds-encoder: Implement basic bus
 format negotiation
Message-ID: <20190826201740.28d93350@collabora.com>
In-Reply-To: <2507680.nRZY6kW3Wv@jernej-laptop>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
 <20190826152649.13820-19-boris.brezillon@collabora.com>
 <2507680.nRZY6kW3Wv@jernej-laptop>
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

T24gTW9uLCAyNiBBdWcgMjAxOSAxODoxNTo0MSArMDIwMApKZXJuZWogxaBrcmFiZWMgPGplcm5l
ai5za3JhYmVjQHNpb2wubmV0PiB3cm90ZToKCj4gSGkgQm9yaXMhCj4gCj4gRG5lIHBvbmVkZWxq
ZWssIDI2LiBhdmd1c3QgMjAxOSBvYiAxNzoyNjo0NiBDRVNUIGplIEJvcmlzIEJyZXppbGxvbiAK
PiBuYXBpc2FsKGEpOgo+ID4gU29tZSBMVkRTIGVuY29kZXIgbWlnaHQgc3VwcG9ydCBzZXZlcmFs
IGlucHV0L291dHB1dCBidXMgZm9ybWF0cy4gQWRkCj4gPiBhIHdheSB0byBkZXNjcmliZSB0aGUg
b25lIHVzZWQgb24gYSBzcGVjaWZpYyBkZXNpZ24gYnkgYWRkaW5nIG9wdGlvbmFsCj4gPiAnZGF0
YS1tYXBwaW5nJyBwcm9wZXJ0aWVzIHRvIHRoZSBpbnB1dC9vdXRwdXQgcG9ydHMuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9y
YS5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAqIE1ha2UgdGhlIGJ1cy1mb3Jt
YXQgbmVnb3RpYXRpb24gbG9naWMgbW9yZSBnZW5lcmljCj4gPiAtLS0KPiA+ICAuLi4vZGlzcGxh
eS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQgICAgICAgfCAgMTIgKysKPiA+ICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5jb2Rlci5jICAgICAgICAgfCAxMDUgKysrKysrKysrKysr
KysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0Cj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9sdmRzLXRyYW5zbWl0dGVyLnR4dAo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci50eHQKPiA+IGluZGV4
IDYwMDkxZGI1ZGZhNS4uZGI1MWVhYjIxNmY3IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvbHZkcy10cmFuc21pdHRlci50eHQKPiA+IEBAIC0zNiw2ICszNiwxOCBAQCBncmFwaCBiaW5k
aW5ncyBzcGVjaWZpZWQgaW4KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9n
cmFwaC50eHQuIC0gVmlkZW8gcG9ydCAwIGZvciBwYXJhbGxlbAo+ID4gaW5wdXQKPiA+ICAtIFZp
ZGVvIHBvcnQgMSBmb3IgTFZEUyBvdXRwdXQKPiA+IAo+ID4gK09wdGlvbmFsIHBvcnQgMCBub2Rl
IHByb3BlcnRpZXM6Cj4gPiArCj4gPiArLSBkYXRhLW1hcHBpbmc6IGNhbiBiZSBvbmUgb2YgdGhl
IGZvbGxvd2luZyB2YWx1ZXMKPiA+ICsJInJnYi0yNCIKPiA+ICsJInJnYi0xOCIKPiA+ICsKPiA+
ICtPcHRpb25hbCBwb3J0IDAgbm9kZSBwcm9wZXJ0aWVzOiAgCj4gCj4gWW91IHByb2JhYmx5IG1l
YW4gcG9ydCAxIF5eXiA/CgpZZXMuCgo+IAo+IEFueXdheSwgZGV2aWNldHJlZSBkb2MgY2hhbmdl
cyBzaG91bGQgYmUgc2VwYXJhdGUgcGF0Y2ggYW5kIGJlIHNlbmQgdG8gRFQgTUwgCj4gKEkgY2Fu
J3Qgc2VlIGl0IGluIENDKS4KCkknbGwgZml4IHRoYXQgaW4gdjMuIEluIHRoZSBtZWFudGltZSwg
SSdkIHJlYWxseSBsaWtlIHRvIGhhdmUgZmVlZGJhY2sKb24gcGF0Y2hlcyAxIHRvIDE2IGFzIHRo
aXMgaXMgd2hlcmUgY29yZSBjaGFuZ2VzIGFyZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
