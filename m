Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E67E13BE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F006B6E9A6;
	Wed, 23 Oct 2019 08:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030FD6E471
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:36:48 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q13so12018377wrs.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FtPUzVzlAqT3akLPjsGT7UZcGZsyWgLA88Ro+E/PyfY=;
 b=F78MOEOzDG+B6iwjVuezBS9/aga5KPnAEXplu5I0r4JQQM2aogjuq5x6mZiPk6S+hN
 mh+CO3Mr4pJwY1FD7Sk4aixDO4+OC8Pjq3RmVAP6a2CAVDQjnh/qHiqQiLBqD9H/qXOW
 LtTsv1mhRkreNv3g5DNjSlOv1+9Ks7oZRBzjkgK+stG/n766yxwJvXKy+3N9DV7FZmvs
 x19wDLFj2+7rd1J2mOJuszhZ8L0gvt29fylH0iEVg4HlHXCUWaEZU0sSVAV7/MXOvg77
 m29tBWh291anydXkvgJORfLhM3AJb1vMbmh9o1S5omKUjzxQCeZjzuIgEFBeHxHGxUgN
 LL+A==
X-Gm-Message-State: APjAAAUUXgEk9SCnj8qY14N+5koCwAgxnV6eSZDvkfqs4WFLADa8EydY
 +fKAd+axpp9bH3d+AmejJBhFCLs0sLo=
X-Google-Smtp-Source: APXvYqyYvlPaTxYAVAqEdEsldeXrdmZ2pBJNeH+VuyZo6XrzBLOioU2qWHTeegUuyOqUciCp3tgmCA==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr2335737wrw.117.1571733406592; 
 Tue, 22 Oct 2019 01:36:46 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id g17sm17115253wrq.58.2019.10.22.01.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:36:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v7 9/9] backlight: gpio: pull
 gpio_backlight_initial_power_state() into probe
Date: Tue, 22 Oct 2019 10:36:30 +0200
Message-Id: <20191022083630.28175-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022083630.28175-1-brgl@bgdev.pl>
References: <20191022083630.28175-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:09:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FtPUzVzlAqT3akLPjsGT7UZcGZsyWgLA88Ro+E/PyfY=;
 b=cRsmk4mLpvgTbx4wEvgiHZaS1tLjsi0aF4JnsopyLgGpmMEMXnYMLhL0fm42GgI70y
 XxnfMH3CqbAyZg/O28PEX1LVz/cHnOYtZeRaqgFupY16Ayblq54JIE+7se+NvkqVt4oJ
 rkrxZ4BEApr0w4Dl3bAbBNkrY4RDZDZQpIycsjrwkQAO2F/MxhV9jR84PqF1GCpkRfeh
 zUkdh3b9QBQK0qOuXbpHsQZnpHrQZTJZWgdHKh8+ww/7BucydSG0km7QHTDo5rZXH4IS
 oNR3yf1g5/XZwlKXuint/5h8UkFzAzNVIWxFNvA19Z4MTNamZGDKDsLdpg3A/rwF8i0m
 iAYA==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClRo
ZSBwcm9iZSBmdW5jdGlvbiBpbiB0aGUgZ3Bpby1iYWNrbGlnaHQgZHJpdmVyIGlzIHF1aXRlIHNo
b3J0LiBJZiB3ZQpwdWxsIGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3RhdGUoKSBpbnRv
IHByb2JlIHdlIGNhbiBkcm9wIHR3bwptb3JlIGZpZWxkcyBmcm9tIHN0cnVjdCBncGlvX2JhY2ts
aWdodCBhbmQgc2hyaW5rIHRoZSBkcml2ZXIgY29kZS4KClNpZ25lZC1vZmYtYnk6IEJhcnRvc3og
R29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+CkFja2VkLWJ5OiBEYW5pZWwg
VGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgfCAzOCArKysrKysrKystLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIGIvZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwppbmRleCBkNjk2OWZhZTI1Y2QuLjc1
NDA5ZGRmYmEzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNr
bGlnaHQuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCkBA
IC0xNywxMSArMTcsOCBAQAogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KIAogc3RydWN0IGdwaW9f
YmFja2xpZ2h0IHsKLQlzdHJ1Y3QgZGV2aWNlICpkZXY7CiAJc3RydWN0IGRldmljZSAqZmJkZXY7
Ci0KIAlzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvZDsKLQlpbnQgZGVmX3ZhbHVlOwogfTsKIAogc3Rh
dGljIGludCBncGlvX2JhY2tsaWdodF9nZXRfbmV4dF9icmlnaHRuZXNzKHN0cnVjdCBiYWNrbGln
aHRfZGV2aWNlICpibCkKQEAgLTYwLDQxICs1NywyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJh
Y2tsaWdodF9vcHMgZ3Bpb19iYWNrbGlnaHRfb3BzID0gewogCS5jaGVja19mYgk9IGdwaW9fYmFj
a2xpZ2h0X2NoZWNrX2ZiLAogfTsKIAotc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9pbml0aWFs
X3Bvd2VyX3N0YXRlKHN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQotewotCXN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbm9kZSA9IGdibC0+ZGV2LT5vZl9ub2RlOwotCi0JLyogTm90IGJvb3RlZCB3aXRo
IGRldmljZSB0cmVlIG9yIG5vIHBoYW5kbGUgbGluayB0byB0aGUgbm9kZSAqLwotCWlmICghbm9k
ZSB8fCAhbm9kZS0+cGhhbmRsZSkKLQkJcmV0dXJuIGdibC0+ZGVmX3ZhbHVlID8gRkJfQkxBTktf
VU5CTEFOSyA6IEZCX0JMQU5LX1BPV0VSRE9XTjsKLQotCS8qIGlmIHRoZSBlbmFibGUgR1BJTyBp
cyBkaXNhYmxlZCwgZG8gbm90IGVuYWJsZSB0aGUgYmFja2xpZ2h0ICovCi0JaWYgKGdwaW9kX2dl
dF9kaXJlY3Rpb24oZ2JsLT5ncGlvZCkgPT0gMCAmJgotCSAgICBncGlvZF9nZXRfdmFsdWVfY2Fu
c2xlZXAoZ2JsLT5ncGlvZCkgPT0gMCkKLQkJcmV0dXJuIEZCX0JMQU5LX1BPV0VSRE9XTjsKLQot
CXJldHVybiBGQl9CTEFOS19VTkJMQU5LOwotfQotCiBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGRldmljZSAq
ZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZvcm1fZGF0YSAq
cGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7CisJc3RydWN0IGRldmljZV9ub2RlICpvZl9u
b2RlID0gZGV2LT5vZl9ub2RlOwogCXN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGllcyBwcm9wczsK
IAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmw7CiAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpn
Ymw7Ci0JaW50IHJldCwgaW5pdF9icmlnaHRuZXNzOworCWludCByZXQsIGluaXRfYnJpZ2h0bmVz
cywgZGVmX3ZhbHVlOwogCiAJZ2JsID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpnYmwpLCBH
RlBfS0VSTkVMKTsKIAlpZiAoZ2JsID09IE5VTEwpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JZ2Js
LT5kZXYgPSBkZXY7Ci0KIAlpZiAocGRhdGEpCiAJCWdibC0+ZmJkZXYgPSBwZGF0YS0+ZmJkZXY7
CiAKLQlnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZGVm
YXVsdC1vbiIpOworCWRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAi
ZGVmYXVsdC1vbiIpOwogCiAJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgTlVMTCwg
R1BJT0RfQVNJUyk7CiAJaWYgKElTX0VSUihnYmwtPmdwaW9kKSkgewpAQCAtMTE1LDcgKzk1LDE3
IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAkJcmV0dXJuIFBUUl9FUlIoYmwpOwogCX0KIAotCWJsLT5wcm9wcy5wb3dlciA9
IGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93ZXJfc3RhdGUoZ2JsKTsKKwkvKiBTZXQgdGhlIGlu
aXRpYWwgcG93ZXIgc3RhdGUgKi8KKwlpZiAoIW9mX25vZGUgfHwgIW9mX25vZGUtPnBoYW5kbGUp
CisJCS8qIE5vdCBib290ZWQgd2l0aCBkZXZpY2UgdHJlZSBvciBubyBwaGFuZGxlIGxpbmsgdG8g
dGhlIG5vZGUgKi8KKwkJYmwtPnByb3BzLnBvd2VyID0gZGVmX3ZhbHVlID8gRkJfQkxBTktfVU5C
TEFOSworCQkJCQkgICAgOiBGQl9CTEFOS19QT1dFUkRPV047CisJZWxzZSBpZiAoZ3Bpb2RfZ2V0
X2RpcmVjdGlvbihnYmwtPmdwaW9kKSA9PSAwICYmCisJCSBncGlvZF9nZXRfdmFsdWVfY2Fuc2xl
ZXAoZ2JsLT5ncGlvZCkgPT0gMCkKKwkJYmwtPnByb3BzLnBvd2VyID0gRkJfQkxBTktfUE9XRVJE
T1dOOworCWVsc2UKKwkJYmwtPnByb3BzLnBvd2VyID0gRkJfQkxBTktfVU5CTEFOSzsKKwogCWJs
LT5wcm9wcy5icmlnaHRuZXNzID0gMTsKIAogCWluaXRfYnJpZ2h0bmVzcyA9IGdwaW9fYmFja2xp
Z2h0X2dldF9uZXh0X2JyaWdodG5lc3MoYmwpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
