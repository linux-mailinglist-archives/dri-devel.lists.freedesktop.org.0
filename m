Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8147D761BC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4956ECC5;
	Fri, 26 Jul 2019 09:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFAE6ECC4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 09:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 36EF2FB02;
 Fri, 26 Jul 2019 11:21:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pzp7XX_0MVCj; Fri, 26 Jul 2019 11:21:44 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 3841746A9F; Fri, 26 Jul 2019 11:21:43 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/panel: jh057n00900: Move mipi_dsi_dcs_set_display_off
 to disable()
Date: Fri, 26 Jul 2019 11:21:42 +0200
Message-Id: <b139adf5f47a0988b12542780963a5fbabb77389.1564132646.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1564132646.git.agx@sigxcpu.org>
References: <cover.1564132646.git.agx@sigxcpu.org>
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
IHwgMTAgKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3Rl
Y2gtamgwNTduMDA5MDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1q
aDA1N24wMDkwMC5jCmluZGV4IGM2YjRiZmQ3OWZkZS4uY2M4OTgzMWUzMGE2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYwpAQCAt
MTU4LDE5ICsxNTgsMjMgQEAgc3RhdGljIGludCBqaDA1N25fZW5hYmxlKHN0cnVjdCBkcm1fcGFu
ZWwgKnBhbmVsKQogc3RhdGljIGludCBqaDA1N25fZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbCkKIHsKIAlzdHJ1Y3QgamgwNTduICpjdHggPSBwYW5lbF90b19qaDA1N24ocGFuZWwpOwor
CXN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSA9IHRvX21pcGlfZHNpX2RldmljZShjdHgtPmRl
dik7CisJaW50IHJldDsKKworCXJldCA9IGJhY2tsaWdodF9kaXNhYmxlKGN0eC0+YmFja2xpZ2h0
KTsKKwlpZiAocmV0IDwgMCkKKwkJcmV0dXJuIHJldDsKIAotCXJldHVybiBiYWNrbGlnaHRfZGlz
YWJsZShjdHgtPmJhY2tsaWdodCk7CisJcmV0dXJuIG1pcGlfZHNpX2Rjc19zZXRfZGlzcGxheV9v
ZmYoZHNpKTsKIH0KIAogc3RhdGljIGludCBqaDA1N25fdW5wcmVwYXJlKHN0cnVjdCBkcm1fcGFu
ZWwgKnBhbmVsKQogewogCXN0cnVjdCBqaDA1N24gKmN0eCA9IHBhbmVsX3RvX2poMDU3bihwYW5l
bCk7Ci0Jc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNpID0gdG9fbWlwaV9kc2lfZGV2aWNlKGN0
eC0+ZGV2KTsKIAogCWlmICghY3R4LT5wcmVwYXJlZCkKIAkJcmV0dXJuIDA7CiAKLQltaXBpX2Rz
aV9kY3Nfc2V0X2Rpc3BsYXlfb2ZmKGRzaSk7CiAJcmVndWxhdG9yX2Rpc2FibGUoY3R4LT5pb3Zj
Yyk7CiAJcmVndWxhdG9yX2Rpc2FibGUoY3R4LT52Y2MpOwogCWN0eC0+cHJlcGFyZWQgPSBmYWxz
ZTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
