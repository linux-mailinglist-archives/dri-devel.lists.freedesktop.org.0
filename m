Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAF8DDB8F
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1895E89A91;
	Sun, 20 Oct 2019 00:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B016F89F2D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 08:36:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r3so8553728wrj.6
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 01:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qycHXMO6hwxhUdb3jdVqS6gIVNXR0dtaUr+q4ZsWEBE=;
 b=otqun2oT+qiR2BsAtHs7TFifHMUxaR7Sj0/Q9iMw4yjaje5YrO+STUyQqZY5R3EcDb
 xjDnfPcWDtNAHRGhgWMZHzgCfKpmRHJRBxJOnmk4tTFw50qnVU9AfFoaUvgsRwDR+/kT
 Ynlq6EFAhvxZkJQkVa0l/5seSs+zScM2iHVOkYEM0+hlZ8KeJzg5+ct7Usp3HM+mq/y0
 kwzkmFaS8UElXyOyP4YWxGUG1KVXIIZxVaTFhcg6p1pKu7Hq3zx87DbHGmCO1etFJQ7m
 l078pb3PvayVWlW7KGzWM1JB4OWIsTTbgEonf6Gsexjtp8S3RbyGxORXKHFNlvnkNQsd
 RK5A==
X-Gm-Message-State: APjAAAWU6wkEyy3Zy71YdB0zXz6J2zlfEwWfzLylICvhZGFLLxOAeC0y
 p3tM3WXM8Z969c28tgcaV3ontg==
X-Google-Smtp-Source: APXvYqxL4ngNwJD3Ia6U3FUSz7NI06K8MQss3MsCYJfxqtNfTF2X+Kq18B1s3ij+8TKee2gNA8Mvcg==
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr10803495wrs.37.1571474182248; 
 Sat, 19 Oct 2019 01:36:22 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 01:36:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 9/9] backlight: gpio: pull
 gpio_backlight_initial_power_state() into probe
Date: Sat, 19 Oct 2019 10:35:56 +0200
Message-Id: <20191019083556.19466-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qycHXMO6hwxhUdb3jdVqS6gIVNXR0dtaUr+q4ZsWEBE=;
 b=Jk5EBmYa+f25dVL0ytlmaRtf8WAVFhl1TWLYulD/cjGDX1wCaySBwWD/vh2NWZbHVD
 5niPb2mYSBspLggl0tema5K8Qd8+JzAAcvvu2lPy3+1NRihUAq2JxJ+U490BS8+w0udd
 t4XfieezI2QS399OfGYDN0hIKV10tM5OK2EICaKM2qjVBAoJ4TJWV1ckCVAhKi4xVHVR
 QrENWpsMNxsrVai6eEP6BAsNmRZHafdwOW+Q7Y1XYH+rqy2dJEVhPp/9PkmRjJrViH5x
 tQvWbNZ6yFRV4KParbooJKpz3bzQ20Mn0F+ULmYO5KMaC4yAG2FyBZfAd3ofmJEjIwBm
 IcjQ==
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
cy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwppbmRleCA3YjQxMWY2ZWUxNWEuLjQz
MzZkYjZiZjZiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNr
bGlnaHQuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCkBA
IC0xNywxMSArMTcsOCBAQAogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KIAogc3RydWN0IGdwaW9f
YmFja2xpZ2h0IHsKLQlzdHJ1Y3QgZGV2aWNlICpkZXY7CiAJc3RydWN0IGRldmljZSAqZmJkZXY7
Ci0KIAlzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvZDsKLQlpbnQgZGVmX3ZhbHVlOwogfTsKIAogc3Rh
dGljIGludCBncGlvX2JhY2tsaWdodF9nZXRfY3Vycl9icmlnaHRuZXNzKHN0cnVjdCBiYWNrbGln
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
Z2h0X2dldF9jdXJyX2JyaWdodG5lc3MoYmwpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
