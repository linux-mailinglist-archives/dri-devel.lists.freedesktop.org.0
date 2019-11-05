Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3572F0655
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874AF6E82E;
	Tue,  5 Nov 2019 19:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848506E82E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 19:53:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E3F9559;
 Tue,  5 Nov 2019 20:53:33 +0100 (CET)
Date: Tue, 5 Nov 2019 21:53:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
Message-ID: <20191105195323.GC4869@pendragon.ideasonboard.com>
References: <20191014184320.GA161094@dtor-ws> <20191105004050.GU57214@dtor-ws>
 <CACRpkdak-gW9+OV-SZQVNNi5BuyNzkjkKvHmYp2+eYq4vu2nyg@mail.gmail.com>
 <CAKMK7uG7FQ3bDWsTxq0n8Osh7jjws5ia3PFJXvDdo=nxKu7+Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG7FQ3bDWsTxq0n8Osh7jjws5ia3PFJXvDdo=nxKu7+Ng@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1572983614;
 bh=fcuygVB2SplZS3Dkx3i6Moc1rRXaeuVQvASKaqu5weI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CSiClPhOy6tIRIGYDNTwVfLRgW7hCJ0UlYOb3cMGsCef0GXSd+CDkKf32Ia/rS9t0
 dahaFXWD+U+haYq/otzMkkenbLXXcnTkp2CCICtnxKPuu7dq3prkt0krg6hPaBWAwr
 /pFGt+CwP2k98+RuJZ7vLm3QfEoJTrBrmhlaTMfI=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDQ6NDE6NDFQTSArMDEwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBUdWUsIE5vdiA1LCAyMDE5IGF0IDQ6MjkgUE0gTGludXMg
V2FsbGVpaiB3cm90ZToKPiA+IE9uIFR1ZSwgTm92IDUsIDIwMTkgYXQgMTo0MCBBTSBEbWl0cnkg
VG9yb2tob3Ygd3JvdGU6Cj4gPiA+IE9uIE1vbiwgT2N0IDE0LCAyMDE5IGF0IDExOjQzOjIwQU0g
LTA3MDAsIERtaXRyeSBUb3Jva2hvdiB3cm90ZToKPiA+Cj4gPiA+ID4gSW5zdGVhZCBvZiBmd25v
ZGVfZ2V0X25hbWVkX2dwaW9kKCkgdGhhdCBJIHBsYW4gdG8gaGlkZSBhd2F5LCBsZXQncyB1c2UK
PiA+ID4gPiB0aGUgbmV3IGZ3bm9kZV9ncGlvZF9nZXRfaW5kZXgoKSB0aGF0IG1pbWljcyBncGlv
ZF9nZXRfaW5kZXgoKSwgYnV0Cj4gPiA+ID4gd29ya3Mgd2l0aCBhcmJpdHJhcnkgZmlybXdhcmUg
bm9kZS4KPiA+ID4gPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRG1p
dHJ5IFRvcm9raG92IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPgo+ID4gPiA+IC0tLQo+ID4g
PiA+Cj4gPiA+ID4gQW5kcnplaiwgTmVpbCwKPiA+ID4gPgo+ID4gPiA+IFRoaXMgZGVwZW5kcyBv
biB0aGUgbmV3IGNvZGUgdGhhdCBjYW4gYmUgYm91bmQgaW4KPiA+ID4gPiBpYi1md25vZGUtZ3Bp
b2QtZ2V0LWluZGV4IGltbXV0YWJsZSBicmFuY2ggb2YgTGludXMnIFdhbGxlaWogdHJlZToKPiA+
ID4gPgo+ID4gPiA+ICAgICAgICAgZ2l0IHB1bGwgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2xpbnVzdy9saW51eC1ncGlvLmdpdCBpYi1md25vZGUtZ3Bpb2Qt
Z2V0LWluZGV4Cj4gPiA+ID4KPiA+ID4gPiBJIGhvcGUgdGhhdCBpdCB3b3VsZCBiZSBwb3NzaWJs
ZSB0byBwdWxsIGluIHRoaXMgaW1tdXRhYmxlIGJyYW5jaCBhbmQKPiA+ID4gPiBub3Qgd2FpdCB1
bnRpbCBhZnRlciA1LjUgbWVyZ2Ugd2luZG93LCBvciwgYWx0ZXJuYXRpdmVseSwgbWVyZ2UgdGhy
b3VnaAo+ID4gPiA+IExpbnVzIFdhbGxlaWoncyB0cmVlLgo+ID4gPgo+ID4gPiBBbnkgY2hhbmNl
IHRoaXMgY291bGQgYmUgbWVyZ2VkLCBwbGVhc2U/Cj4gPgo+ID4gSSdtIGhhcHB5IHRvIG1lcmdl
IGl0IGludG8gdGhlIEdQSU8gdHJlZSBpZiBzb21lIERSTSBtYWludGFpbmVyIGNhbgo+ID4gcHJv
dmlkZSBhbiBBQ0suCj4gCj4gQWNrLgo+IAo+ID4gR2V0dGluZyBBQ0sgZnJvbSBEUk0gcGVvcGxl
IGlzIHByb2JsZW1hdGljIGFuZCBhIGJpdCBvZiBmcmljdGlvbiBpbiB0aGUKPiA+IGNvbW11bml0
eSwgRFZldHRlciB1c3VhbGx5IGFkdmljZSB0byBzZWVrIG11dHVhbCByZXZpZXdzIGV0YywgYnV0
IElNTwo+ID4gaXQgd291bGQgYmUgYmV0dGVyIGlmIHNvbWUgcGVvcGxlIGZlbHQgbW9yZSBjb21w
ZWxsZWQgdG8gcmV2aWV3IHN0dWZmCj4gPiBldmVudHVhbGx5LiAoQW5kIHRoYXQgaGFzIHRoZSBw
cm9ibGVtIHRoYXQgaXQgZG9lc24ndCBzY2FsZS4pCj4gCj4gVGhpcyBoYXMgYSByZXZpZXcgYWxy
ZWFkeSBwbHVzIGlmIHlvdSBtZXJnZSB5b3VyIGltcGxpZWQgcmV2aWV3Lgo+IFRoYXQncyBtb3Jl
IHRoYW4gZ29vZCBlbm91Z2ggaW1vLCBzbyBub3Qgc2VlaW5nIHRoZSBpc3N1ZSBoZXJlPwoKSXNu
J3QgdGhlIGlzc3VlIHRoYXQgdGhlIHBhdGNoIHNob3VsZCBoYXZlIGJlZW4gcGlja2VkIGJ5IHNv
bWVvbmUgZm9yCmRybS1taXNjID8KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
