Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F19D006
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 15:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7582489D42;
	Mon, 26 Aug 2019 13:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426C989D42
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 13:06:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FD249A4;
 Mon, 26 Aug 2019 15:06:08 +0200 (CEST)
Date: Mon, 26 Aug 2019 16:06:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 25/50] drm/omap: hdmi4: Rework EDID read to isolate
 data read
Message-ID: <20190826130602.GE5031@pendragon.ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-26-laurent.pinchart@ideasonboard.com>
 <708f7343-43de-d097-de34-530ae3ad8c5b@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <708f7343-43de-d097-de34-530ae3ad8c5b@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566824768;
 bh=ezNMFCKJTf2bV72lo+LxzqN06OgcAuKxO5gT5RS8GLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YJ2f0CiKGtQF5LIuZ/KamuzqZihLV1ZmihmJ2cSkGOzsjHTZ/o6b+thugisEPuG22
 rc3+l8XjLavH+ktIRwWrE48Kla+a+bT13CXI648bW97fAKYpCPJAGFUHTW+y/NHh9/
 Twc8boL7PtdabXqS1d5Ia+mTFCHYQv1s3V3DPmzs=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIE1vbiwgQXVnIDI2LCAyMDE5IGF0IDAyOjM5OjI1UE0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDIwLzA4LzIwMTkgMDQ6MTYsIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBJbiBwcmVwYXJhdGlvbiBvZiBhZGRpbmcgRFJNIGJyaWRnZSBzdXBwb3J0IHRv
IHRoZSBoZG1pNCBlbmNvZGVyIGNvZGUsCj4gPiByZXdvcmsgdGhlIEVESUQgcmVhZCB0byBpc29s
YXRlIGRhdGEgcmVhZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNC5jICAgICAgfCA5NCArKysrKysrKysrKysrKystLS0t
LS0tLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUuYyB8IDU5
ICsrKy0tLS0tLS0tLS0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRf
Y29yZS5oIHwgIDQgKy0KPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCA4
NCBkZWxldGlvbnMoLSkKPiAKPiBJIGZpbmQgdGhpcyAoYW5kIHRoZSBuZXh0KSBwYXRjaCBhIGJp
dCBkaWZmaWN1bHQgdG8gcmV2aWV3LiBDYW4geW91IAo+IGV4cGxhaW4gYSBiaXQgbW9yZSB3aGF0
IHRoZSBwdXJwb3NlIGFuZCB0aGUgY2hhbmdlIGlzPwoKVGhlIGNvbW1pdCBtZXNzYWdlIGluIHYz
IHdpbGwgcmVhZAoKZHJtL29tYXA6IGhkbWk1OiBSZXdvcmsgRURJRCByZWFkIHRvIGlzb2xhdGUg
ZGF0YSByZWFkCgpJbiBwcmVwYXJhdGlvbiBvZiBhZGRpbmcgRFJNIGJyaWRnZSBzdXBwb3J0IHRv
IHRoZSBoZG1pNSBlbmNvZGVyIGNvZGUsCnJld29yayB0aGUgRURJRCByZWFkIHRvIGlzb2xhdGUg
ZGF0YSByZWFkLgoKVGhlIGhkbWlfcmVhZF9lZGlkKCkgZnVuY3Rpb24gaXMgdGhlIG1haW4gZW50
cnkgcG9pbnQuIEl0IHBlcmZvcm1zIGFsbAppbml0aWFsaXNhdGlvbiBzdGVwcyByZXF1aXJlZCBw
cmlvciB0byByZWFkaW5nIHRoZSBFRElEIChzdWNoIGFzCmVuc3VyaW5nIHRoZSBkZXZpY2UgaXMg
cG93ZXJlZCBvbiksIGFzIHdlbGwgYXMgY29ycmVzcG9uZGluZyBjbGVhbnVwCnN0ZXBzIGFmdGVy
d2FyZHMuIEVESUQgcmVhZCBpdHNlbGYgaXMgaGFuZGxlZCBieSBoZG1pX3JlYWRfZWRpZF9kYXRh
KCkKdGhhdCBjYWxscyB0aGUgaGRtaTVfY29yZV9kZGNfcmVhZCgpIGZ1bmN0aW9uIHRvIHJlYWQg
aW5kaXZpZHVhbCBibG9ja3MuCgpUaGlzIG5ldyBjb2RlIGFyY2hpdGVjdHVyZSB3aWxsIGFsbG93
IHJldXNpbmcgaGRtaV9yZWFkX2VkaWQoKSBhbmQKaGRtaTVfY29yZV9kZGNfcmVhZCgpIGZvciB0
aGUgZHJtX2JyaWRnZSBFRElEIHJlYWQgaW1wbGVtZW50YXRpb24sIHdoaWxlCnN3YXBwaW5nIG91
dCBoZG1pX3JlYWRfZWRpZF9kYXRhKCkgZm9yIHRoZSBEUk0gZHJtX2RvX2dldF9lZGlkKCkKZnVu
Y3Rpb24uCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
