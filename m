Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE46A6F4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 13:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AADA6E111;
	Tue, 16 Jul 2019 11:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B886E0D2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 11:08:32 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 37D6920029;
 Tue, 16 Jul 2019 13:08:28 +0200 (CEST)
Date: Tue, 16 Jul 2019 13:08:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: drm_panel_get_modes() should take the connector as an argument [Was:
 drm/bridge: panel: Implement bridge ...]
Message-ID: <20190716110827.GA27797@ravnborg.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-9-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190707181937.6250-9-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=1JrXyOvD6FtXSA7bpbkA:9 a=CjuIK1q_8ugA:10
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCBldCBhbGwuCgo+ICtzdGF0aWMgaW50IHBhbmVsX2JyaWRnZV9nZXRfbW9kZXMo
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiArCQkJCSAgc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvcikKPiArewo+ICsJc3RydWN0IHBhbmVsX2JyaWRnZSAqcGFuZWxfYnJpZGdlID0g
ZHJtX2JyaWRnZV90b19wYW5lbF9icmlkZ2UoYnJpZGdlKTsKPiArCj4gKwkvKgo+ICsJICogRklY
TUU6IGRybV9wYW5lbF9nZXRfbW9kZXMoKSBzaG91bGQgdGFrZSB0aGUgY29ubmVjdG9yIGFzIGFu
Cj4gKwkgKiBhcmd1bWVudC4KPiArCSAqLwo+ICsJcmV0dXJuIGRybV9wYW5lbF9nZXRfbW9kZXMo
cGFuZWxfYnJpZGdlLT5wYW5lbCk7Cj4gK30KCkkgdG9vayBhIGxvb2sgYXQgdGhpcyAtIGl0IHNl
ZW1zIHNpbXBsZToKLSBVcGRhdGUgZHJtX3BhbmVsLmdldF9tb2RlcygpIHRvIHRha2UgY29udHJv
bGxlciBhcyBhcmd1bWVudCwgYW5kIGZpeAogIGFsbCBjYWxsZXJzLiBBbGwgY2FsbGVycyBhbHJl
YWR5IGhhdmUgY29ubmVjdG9yIGF2YWlsYWJsZS4KLSBEcm9wIGRybV9wYW5lbF9hdHRhY2goKSwg
ZHJtX3BhbmVsX2RldGFjaCgpIGFuZCB1cGRhdGUgYWxsIGNhbGxlcnMuCiAgSW4gcmVhbGl0eSBq
dXN0IGRyb3AgYWxsIGNvZGUgYXJvdW5kIGF0dGFjaCgpLCBkZXRhY2goKS4KICBkcm1fcGFuZWxf
YXR0YWNoKCksIGRybV9wYW5lbF9kZXRhY2goKSB3aWxsIGJlIG5vb3BzIHdoZW4gdGhlCiAgY29u
bmVjdG9yIHN0b3JlZCBpbiBkcm1fcGFuZWwgaXMgbm8gbG9uZ2VyIHVzZWQuCgpUaGUgc2VtYW50
aWMgZGlmZmVyZW5jZSBpcyB0aGF0IHdlIHN1cHBseSB0aGUgY29ubmVjdG9yIHdoZW4gd2UgY2Fs
bApkcm1fcGFuZWxfZ2V0X21vZGVzKCkgYW5kIG5vdCBhdCBwYW5lbCBjcmVhdGlvbiB0aW1lIHdp
dGggYW4gZHJtX3BhbmVsX2F0dGFjaCgpLgoKU28gaXQgc2hvdWxkIGJlIGRvYWJsZSB3aXRob3V0
IGFueSBtaWdyYXRpb24gZnJvbSBvbmUgd29ybGQgdG8gdGhlIG90aGVyLgoKSWYgc29tZW9uZSBj
YW4gc2F5ICJ5ZXMgaXQgc2hvdWxkIGJlIHRoYXQgc2ltcGxlIiwgdGhlbiBJIHdpbGwKZ2l2ZSBp
dCBhIHNwaW4uCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
