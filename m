Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CFB7670A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 15:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685906ED47;
	Fri, 26 Jul 2019 13:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760C56ED44
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 13:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 082F9FB02;
 Fri, 26 Jul 2019 15:14:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rl7091_wxe66; Fri, 26 Jul 2019 15:14:42 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 1A20646AA0; Fri, 26 Jul 2019 15:14:40 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] drm/panel: jh057n00900: Move
 mipi_dsi_dcs_set_display_off to disable()
Date: Fri, 26 Jul 2019 15:14:37 +0200
Message-Id: <e2c31d34ce1f917065d590297e5115a4ca954874.1564146727.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1564146727.git.agx@sigxcpu.org>
References: <cover.1564146727.git.agx@sigxcpu.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBtYWtlcyBpdCBzeW1tZXRyaWMgd2l0aCB0aGUgcGFuZWwgaW5pdCBoYXBwZW5pbmcgaW4g
ZW5hYmxlKCkuCgpTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5j
IHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpo
MDU3bjAwOTAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTdu
MDA5MDAuYwppbmRleCBjNmI0YmZkNzlmZGUuLmZlZDI0YzUxZDQ4YiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMKQEAgLTE1OCwx
OSArMTU4LDE5IEBAIHN0YXRpYyBpbnQgamgwNTduX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbCkKIHN0YXRpYyBpbnQgamgwNTduX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwp
CiB7CiAJc3RydWN0IGpoMDU3biAqY3R4ID0gcGFuZWxfdG9famgwNTduKHBhbmVsKTsKKwlzdHJ1
Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kgPSB0b19taXBpX2RzaV9kZXZpY2UoY3R4LT5kZXYpOwog
Ci0JcmV0dXJuIGJhY2tsaWdodF9kaXNhYmxlKGN0eC0+YmFja2xpZ2h0KTsKKwliYWNrbGlnaHRf
ZGlzYWJsZShjdHgtPmJhY2tsaWdodCk7CisJcmV0dXJuIG1pcGlfZHNpX2Rjc19zZXRfZGlzcGxh
eV9vZmYoZHNpKTsKIH0KIAogc3RhdGljIGludCBqaDA1N25fdW5wcmVwYXJlKHN0cnVjdCBkcm1f
cGFuZWwgKnBhbmVsKQogewogCXN0cnVjdCBqaDA1N24gKmN0eCA9IHBhbmVsX3RvX2poMDU3bihw
YW5lbCk7Ci0Jc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpID0gdG9fbWlwaV9kc2lfZGV2aWNl
KGN0eC0+ZGV2KTsKIAogCWlmICghY3R4LT5wcmVwYXJlZCkKIAkJcmV0dXJuIDA7CiAKLQltaXBp
X2RzaV9kY3Nfc2V0X2Rpc3BsYXlfb2ZmKGRzaSk7CiAJcmVndWxhdG9yX2Rpc2FibGUoY3R4LT5p
b3ZjYyk7CiAJcmVndWxhdG9yX2Rpc2FibGUoY3R4LT52Y2MpOwogCWN0eC0+cHJlcGFyZWQgPSBm
YWxzZTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
