Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C017CDC06
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60956E456;
	Mon,  7 Oct 2019 07:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com
 [IPv6:2a00:1098:0:86:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73A16E0BA
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 16:04:55 +0000 (UTC)
Received: from [199.195.250.187] (port=53656 helo=hermes.aosc.io)
 by haggis.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1iH91f-00055b-TT; Sun, 06 Oct 2019 17:04:52 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 1475B8289D;
 Sun,  6 Oct 2019 16:04:45 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jagan Teki <jagan@amarulasolutions.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/3] drm/sun4i: sun6i_mipi_dsi: fix DCS long write packet
 length
Date: Mon,  7 Oct 2019 00:03:02 +0800
Message-Id: <20191006160303.24413-4-icenowy@aosc.io>
In-Reply-To: <20191006160303.24413-1-icenowy@aosc.io>
References: <20191006160303.24413-1-icenowy@aosc.io>
MIME-Version: 1.0
X-BlackCat-Spam-Score: 50
X-Spam-Status: No, score=5.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:50 +0000
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

VGhlIHBhY2tldCBsZW5ndGggb2YgRENTIGxvbmcgd3JpdGUgcGFja2V0IHNob3VsZCBub3QgYmUg
YWRkZWQgd2l0aCAxCndoZW4gY29uc3RydWN0aW5nIGxvbmcgd3JpdGUgcGFja2V0LgoKRml4IHRo
aXMuCgpTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuNmlfbWlwaV9kc2kuYwppbmRleCA4ZmU4MDUxYzM0ZTYuLmM5NThjYTliYWU2MyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmMKQEAgLTgzMiw4ICs4MzIsOCBAQCBz
dGF0aWMgdTMyIHN1bjZpX2RzaV9kY3NfYnVpbGRfcGt0X2hkcihzdHJ1Y3Qgc3VuNmlfZHNpICpk
c2ksCiAJdTMyIHBrdCA9IG1zZy0+dHlwZTsKIAogCWlmIChtc2ctPnR5cGUgPT0gTUlQSV9EU0lf
RENTX0xPTkdfV1JJVEUpIHsKLQkJcGt0IHw9ICgobXNnLT50eF9sZW4gKyAxKSAmIDB4ZmZmZikg
PDwgODsKLQkJcGt0IHw9ICgoKG1zZy0+dHhfbGVuICsgMSkgPj4gOCkgJiAweGZmZmYpIDw8IDE2
OworCQlwa3QgfD0gKChtc2ctPnR4X2xlbikgJiAweGZmZmYpIDw8IDg7CisJCXBrdCB8PSAoKCht
c2ctPnR4X2xlbikgPj4gOCkgJiAweGZmZmYpIDw8IDE2OwogCX0gZWxzZSB7CiAJCXBrdCB8PSAo
KCh1OCAqKW1zZy0+dHhfYnVmKVswXSA8PCA4KTsKIAkJaWYgKG1zZy0+dHhfbGVuID4gMSkKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
