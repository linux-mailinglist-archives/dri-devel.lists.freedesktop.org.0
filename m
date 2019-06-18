Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729649A8B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535FB6E105;
	Tue, 18 Jun 2019 07:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F6E6E103;
 Tue, 18 Jun 2019 07:27:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5EEED5;
 Tue, 18 Jun 2019 09:27:09 +0200 (CEST)
Date: Tue, 18 Jun 2019 10:26:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/rcar-du: Fix error check when retrieving crtc state
Message-ID: <20190618072652.GC4800@pendragon.ideasonboard.com>
References: <20190617181548.124134-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617181548.124134-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560842829;
 bh=aSUwOkHaJ8zFU/e9BXcyehPVPIcptxKEFlC1H40lBK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JkBMxTSBHHD6MGgFwY1CW5s7wioMLTed8kw2A7iZzclu7BeGnSgAuhqvfytoYWxX+
 ILMSt5BHHPTKqrIIrfQrMM5YLUbI2LsfUr6IjPQ99h5vr81aw9VFRdL8D5y3csNJgx
 9ACu1YqEb6S8/W/DQTgDSVC3SbWweLcZslKQztB8=
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kbuild test robot <lkp@intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Karol Herbst <karolherbst@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2VhbiwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBKdW4gMTcsIDIwMTkg
YXQgMDI6MTU6NDJQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3RlOgo+IEZyb206IFNlYW4gUGF1bCA8
c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IGRybV9hdG9taWNfZ2V0X2NydGNfc3RhdGUoKSBy
ZXR1cm5zIGFuIGVycm9yIHBvaW50ZXIgd2hlbiBpdCBmYWlscywgc28KPiB0aGUgbnVsbCBjaGVj
ayBpcyBkb2luZyBub3RoaW5nIGhlcmUuCj4gCj4gQ3JlZGl0IHRvIDAtZGF5L0RhbiBDYXJwZW50
ZXIgZm9yIHJlcG9ydGluZyB0aGlzLgo+IAo+IEZpeGVzOiA2ZjNiNjI3ODFiYmQgKCJkcm06IENv
bnZlcnQgY29ubmVjdG9yX2hlbHBlcl9mdW5jcy0+YXRvbWljX2NoZWNrIHRvIGFjY2VwdCBkcm1f
YXRvbWljX3N0YXRlIikKPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENj
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IENjOiBK
YW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgo+IENjOiBKb29uYXMgTGFo
dGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFJvZHJpZ28gVml2
aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRo
YXQuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+Cj4gQ2M6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlk
ZWFzb25ib2FyZC5jb20+Cj4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4gQ2M6
IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gW2Zv
ciByY2FyIGx2ZHNdCj4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IENj
OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+
IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IENjOiBTZWFu
IFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPgo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+IENjOiBLYXJvbCBIZXJi
c3QgPGthcm9saGVyYnN0QGdtYWlsLmNvbT4KPiBDYzogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1
bS5taXQuZWR1Pgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtcmVuZXNhcy1zb2NAdmdl
ci5rZXJuZWwub3JnCj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwu
Y29tPgo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpS
ZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgoKSSBoYXZlIG5vIHBlbmRpbmcgY29uZmxpY3RpbmcgY2hhbmdlcyBmb3IgcmNhcl9s
dmRzLmMuIERvIHlvdSBwbGFuIHRvCm1lcmdlIHRoaXMgdGhyb3VnaCBkcm0tbWlzYyA/Cgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyB8IDQgKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yY2FyLWR1L3JjYXJfbHZkcy5jCj4gaW5kZXggZjJhNWQ0ZDk5NzA3My4uMWM2MjU3ODU5MGY0
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCj4gQEAgLTExNSw4ICsxMTUs
OCBAQCBzdGF0aWMgaW50IHJjYXJfbHZkc19jb25uZWN0b3JfYXRvbWljX2NoZWNrKHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gIAo+ICAJLyogV2UncmUgbm90IGFsbG93ZWQgdG8g
bW9kaWZ5IHRoZSByZXNvbHV0aW9uLiAqLwo+ICAJY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0
X2NydGNfc3RhdGUoc3RhdGUsIGNvbm5fc3RhdGUtPmNydGMpOwo+IC0JaWYgKCFjcnRjX3N0YXRl
KQo+IC0JCXJldHVybiAtRUlOVkFMOwo+ICsJaWYgKElTX0VSUihjcnRjX3N0YXRlKSkKPiArCQly
ZXR1cm4gUFRSX0VSUihjcnRjX3N0YXRlKTsKPiAgCj4gIAlpZiAoY3J0Y19zdGF0ZS0+bW9kZS5o
ZGlzcGxheSAhPSBwYW5lbF9tb2RlLT5oZGlzcGxheSB8fAo+ICAJICAgIGNydGNfc3RhdGUtPm1v
ZGUudmRpc3BsYXkgIT0gcGFuZWxfbW9kZS0+dmRpc3BsYXkpCgotLSAKUmVnYXJkcywKCkxhdXJl
bnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
