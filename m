Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11366C4836
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C646E8B5;
	Wed,  2 Oct 2019 07:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from balrog.mythic-beasts.com (balrog.mythic-beasts.com
 [IPv6:2a00:1098:0:82:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D175C6E544
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 08:04:13 +0000 (UTC)
Received: from [199.195.250.187] (port=41686 helo=hermes.aosc.io)
 by balrog.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1iFD8k-0004bN-51; Tue, 01 Oct 2019 09:04:10 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 7F4E782AFC;
 Tue,  1 Oct 2019 08:03:58 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/3] drm/sun4i: dsi: fix DRQ calculation
Date: Tue,  1 Oct 2019 16:02:52 +0800
Message-Id: <20191001080253.6135-3-icenowy@aosc.io>
In-Reply-To: <20191001080253.6135-1-icenowy@aosc.io>
References: <20191001080253.6135-1-icenowy@aosc.io>
MIME-Version: 1.0
X-BlackCat-Spam-Score: 50
X-Spam-Status: No, score=5.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
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
Cc: linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIHRoZSBCU1Agc291cmNlIGNvZGUsIHdoZW4gY2FsY3VsYXRpbmcgdGhlIG1h
Z2ljIERSUSB2YWx1ZQpvdXRzaWRlIGJ1cnN0IG1vZGUsIGEgZm9ybXVsYSBvZiAibGNkX2h0IC0g
bGNkX3ggLSBsY2RfaGJwIiwgd2hpY2ggaXMKaW50ZXJwcmV0ZWQgYXMgcmlnaHQgbWFyZ2luIChI
RlAgdmFsdWUpLiBIb3dldmVyLCBjdXJyZW50bHkgdGhlCnN1bjZpX21pcGlfZHNpIGRyaXZlciBj
b2RlIGNhbGN1bGF0ZXMgaXQgd3JvbmdseSBhcyBIRlAgKyBzeW5jIGxlbmd0aCwKd2hpY2ggbGVh
ZCB0byB0aW1pbmcgZXJyb3IuCgpGaXggdGhlIERSUSBjYWxjdWxhdGlvbiBieSBjaGFuZ2UgaXQg
dG8gdXNlIEhGUC4KClNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5p
bz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyBiL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCmluZGV4IGM4NmUxMTYzMWViYy4uMmQzZTgyMmE3
NzM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYwpAQCAtNDM2LDkgKzQz
Niw5IEBAIHN0YXRpYyB2b2lkIHN1bjZpX2RzaV9zZXR1cF9idXJzdChzdHJ1Y3Qgc3VuNmlfZHNp
ICpkc2ksCiAJCQkgICAgIFNVTjZJX0RTSV9CVVJTVF9MSU5FX1NZTkNfUE9JTlQoU1VONklfRFNJ
X1NZTkNfUE9JTlQpKTsKIAogCQl2YWwgPSBTVU42SV9EU0lfVENPTl9EUlFfRU5BQkxFX01PREU7
Ci0JfSBlbHNlIGlmICgobW9kZS0+aHN5bmNfZW5kIC0gbW9kZS0+aGRpc3BsYXkpID4gMjApIHsK
Kwl9IGVsc2UgaWYgKChtb2RlLT5oc3luY19zdGFydCAtIG1vZGUtPmhkaXNwbGF5KSA+IDIwKSB7
CiAJCS8qIE1hYWFhYWFnaWMgKi8KLQkJdTE2IGRycSA9IChtb2RlLT5oc3luY19lbmQgLSBtb2Rl
LT5oZGlzcGxheSkgLSAyMDsKKwkJdTE2IGRycSA9IChtb2RlLT5oc3luY19zdGFydCAtIG1vZGUt
PmhkaXNwbGF5KSAtIDIwOwogCiAJCWRycSAqPSBtaXBpX2RzaV9waXhlbF9mb3JtYXRfdG9fYnBw
KGRldmljZS0+Zm9ybWF0KTsKIAkJZHJxIC89IDMyOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
