Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B21761BF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79E96ECC6;
	Fri, 26 Jul 2019 09:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180FE6ECC2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 09:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id B11E3FB05;
 Fri, 26 Jul 2019 11:21:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZTomQ0x7jPSO; Fri, 26 Jul 2019 11:21:43 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 3348346A9D; Fri, 26 Jul 2019 11:21:43 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/panel: jh057n00900: Move panel DSI init to enable()
Date: Fri, 26 Jul 2019 11:21:41 +0200
Message-Id: <965bed10ddfc6c14d074520d55bde7bb1ffce5d1.1564132646.git.agx@sigxcpu.org>
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

SWYgdGhlIHBhbmVsIGlzIHdyYXBwZWQgaW4gYSBwYW5lbF9icmlkZ2UgaXQgZ2V0cyBwcmVwYXIo
KWVkIGJlZm9yZSB0aGUKdXBzdHJlYW0gRFNJIGJyaWRnZSB3aGljaCBjYW4gY2F1c2UgaGFuZ3Mg
KGUuZy4gd2l0aCBpbXgtbndsIHNpbmNlIGNsb2NrcwphcmUgbm90IGVuYWJsZWQgeWV0KS4gVG8g
YXZvaWQgdGhpcyBtb3ZlIHRoZSBwYW5lbCdzIGZpcnN0IERTSSBhY2Nlc3MgdG8KZW5hYmxlKCkg
c28gdGhlIHVwc3RyZWFtIGJyaWRnZSBjYW4gcHJlcGFyZSB0aGUgRFNJIGhvc3QgY29udHJvbGxl
ciBpbgppdCdzIHByZV9lbmFibGUoKS4KClRoaXMgaXMgYWxzbyBpbiBsaW5lIHdpdGggb3RoZXIg
cGFuZWwgZHJpdmVycy4KClNpZ25lZC1vZmYtYnk6IEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNw
dS5vcmc+Ci0tLQogLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAu
YyAgICB8IDE1ICsrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtcm9ja3RlY2gtamgwNTduMDA5MDAuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1y
b2NrdGVjaC1qaDA1N24wMDkwMC5jCmluZGV4IDEyNzRiNTRmMjY3Mi4uYzZiNGJmZDc5ZmRlIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5
MDAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9ja3RlY2gtamgwNTduMDA5
MDAuYwpAQCAtMTQzLDYgKzE0MywxNCBAQCBzdGF0aWMgaW50IGpoMDU3bl9pbml0X3NlcXVlbmNl
KHN0cnVjdCBqaDA1N24gKmN0eCkKIHN0YXRpYyBpbnQgamgwNTduX2VuYWJsZShzdHJ1Y3QgZHJt
X3BhbmVsICpwYW5lbCkKIHsKIAlzdHJ1Y3QgamgwNTduICpjdHggPSBwYW5lbF90b19qaDA1N24o
cGFuZWwpOworCWludCByZXQ7CisKKwlyZXQgPSBqaDA1N25faW5pdF9zZXF1ZW5jZShjdHgpOwor
CWlmIChyZXQgPCAwKSB7CisJCURSTV9ERVZfRVJST1IoY3R4LT5kZXYsICJQYW5lbCBpbml0IHNl
cXVlbmNlIGZhaWxlZDogJWRcbiIsCisJCQkgICAgICByZXQpOworCQlyZXR1cm4gcmV0OworCX0K
IAogCXJldHVybiBiYWNrbGlnaHRfZW5hYmxlKGN0eC0+YmFja2xpZ2h0KTsKIH0KQEAgLTE5Nywx
MyArMjA1LDYgQEAgc3RhdGljIGludCBqaDA1N25fcHJlcGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbCkKIAlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoY3R4LT5yZXNldF9ncGlvLCAwKTsKIAlt
c2xlZXAoMjApOwogCi0JcmV0ID0gamgwNTduX2luaXRfc2VxdWVuY2UoY3R4KTsKLQlpZiAocmV0
IDwgMCkgewotCQlEUk1fREVWX0VSUk9SKGN0eC0+ZGV2LCAiUGFuZWwgaW5pdCBzZXF1ZW5jZSBm
YWlsZWQ6ICVkXG4iLAotCQkJICAgICAgcmV0KTsKLQkJcmV0dXJuIHJldDsKLQl9Ci0KIAljdHgt
PnByZXBhcmVkID0gdHJ1ZTsKIAogCXJldHVybiAwOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
