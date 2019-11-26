Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C163C10974E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 01:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648BE6E0BA;
	Tue, 26 Nov 2019 00:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676F56E0BA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 00:35:28 +0000 (UTC)
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:40516)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iZOp3-0002Ur-F6; Tue, 26 Nov 2019 00:35:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iZOoz-00078a-7T; Tue, 26 Nov 2019 00:35:13 +0000
Date: Tue, 26 Nov 2019 00:35:13 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 05/15] drm/armada: Delete dma_buf->k(un)map implemenation
Message-ID: <20191126003513.GX25745@shell.armlinux.org.uk>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-6-daniel.vetter@ffwll.ch>
 <20191125214443.GN29965@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125214443.GN29965@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h1g2Je1xHGqLp+iNWkAJqkKZ9aUyAlrruEIraCgNb2c=; b=bOjN/3Xuh5ZSziYOIFF8eAEdD
 2rBAAk/sZxI5YF4Uyph4DQjlSB3TyU0ODPaqTolhep9SDno3/TAhMR2oIzd9QK+OSv1a4OZ4tiHhB
 g8cDeLlezAx2KutJlUyXBrrsSQ3uxZJcDfwbWg+i3XdykG+Tkak/1TaXYrIEEgurV75WdscNE8Uxm
 jWaV9CAhQ06nSuXUldy0frFZwnR196mYUjtO4q4Pj4+nHnNqkVphpxKxm0r1fFgRCf4gVKPdQ8CZf
 xOCGDfMlAJcwi4/+A4UHWfoYet2eiX1Ms6wMjd2g2t4X9uPkjT/Wjc772+sHyGBuLNw1Dwl4lxCNa
 cePxAMu6Q==;
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMTA6NDQ6NDNQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIE5vdiAxOCwgMjAxOSBhdCAxMTozNToyNkFNICswMTAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gSXQncyBhIGR1bW15IGFueXdheS4KPiA+IAo+ID4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiBDYzogUnVz
c2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4gCj4gSSBtZXJnZWQgdGhlIGVudGly
ZSBzZXJpZXMgZXhjZXB0IHRoaXMgb25lIGFuZCB0aGUgZmluYWwgcGF0Y2gsIHNpbGwKPiB3YWl0
aW5nIGEgYml0IG1vcmUgZm9yIGFuIGFjayBvbiB0aGlzIHBlcmhhcHMuCgpBY2tlZC1ieTogUnVz
c2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KCkkgdGhvdWdodCBkcm0gdHJl
ZXMgY2xvc2VkIGFyb3VuZCAtcmM2PwoKPiAtRGFuaWVsCj4gCj4gPiAtLS0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vYXJtYWRhL2FybWFkYV9nZW0uYyB8IDEyIC0tLS0tLS0tLS0tLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcm1hZGEvYXJtYWRhX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1h
ZGFfZ2VtLmMKPiA+IGluZGV4IDkzY2Y4YjhiZmNmZi4uOTc2Njg1ZjI5MzllIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZ2VtLmMKPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2dlbS5jCj4gPiBAQCAtNDYxLDE2ICs0NjEsNiBAQCBz
dGF0aWMgdm9pZCBhcm1hZGFfZ2VtX3ByaW1lX3VubWFwX2RtYV9idWYoc3RydWN0IGRtYV9idWZf
YXR0YWNobWVudCAqYXR0YWNoLAo+ID4gIAlrZnJlZShzZ3QpOwo+ID4gIH0KPiA+ICAKPiA+IC1z
dGF0aWMgdm9pZCAqYXJtYWRhX2dlbV9kbWFidWZfbm9fa21hcChzdHJ1Y3QgZG1hX2J1ZiAqYnVm
LCB1bnNpZ25lZCBsb25nIG4pCj4gPiAtewo+ID4gLQlyZXR1cm4gTlVMTDsKPiA+IC19Cj4gPiAt
Cj4gPiAtc3RhdGljIHZvaWQKPiA+IC1hcm1hZGFfZ2VtX2RtYWJ1Zl9ub19rdW5tYXAoc3RydWN0
IGRtYV9idWYgKmJ1ZiwgdW5zaWduZWQgbG9uZyBuLCB2b2lkICphZGRyKQo+ID4gLXsKPiA+IC19
Cj4gPiAtCj4gPiAgc3RhdGljIGludAo+ID4gIGFybWFkYV9nZW1fZG1hYnVmX21tYXAoc3RydWN0
IGRtYV9idWYgKmJ1Ziwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCj4gPiAgewo+ID4gQEAg
LTQ4MSw4ICs0NzEsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRtYV9idWZfb3BzIGFybWFkYV9n
ZW1fcHJpbWVfZG1hYnVmX29wcyA9IHsKPiA+ICAJLm1hcF9kbWFfYnVmCT0gYXJtYWRhX2dlbV9w
cmltZV9tYXBfZG1hX2J1ZiwKPiA+ICAJLnVubWFwX2RtYV9idWYJPSBhcm1hZGFfZ2VtX3ByaW1l
X3VubWFwX2RtYV9idWYsCj4gPiAgCS5yZWxlYXNlCT0gZHJtX2dlbV9kbWFidWZfcmVsZWFzZSwK
PiA+IC0JLm1hcAkJPSBhcm1hZGFfZ2VtX2RtYWJ1Zl9ub19rbWFwLAo+ID4gLQkudW5tYXAJCT0g
YXJtYWRhX2dlbV9kbWFidWZfbm9fa3VubWFwLAo+ID4gIAkubW1hcAkJPSBhcm1hZGFfZ2VtX2Rt
YWJ1Zl9tbWFwLAo+ID4gIH07Cj4gPiAgCj4gPiAtLSAKPiA+IDIuMjQuMAo+ID4gCj4gCj4gLS0g
Cj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+
IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCj4gCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczov
L3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVEMgYnJvYWRiYW5kIGZv
ciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIuMU1icHMgZG93biA2MjJrYnBz
IHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJwcyBkb3duIDUwMGticHMgdXAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
