Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7078971286
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B90C6E029;
	Tue, 23 Jul 2019 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DA689C69
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:03:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g17so39801366wrr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iAL0aUWAYM6zj0vm1GZ+TQ+tEc0Krf1eM+2DJqAl5SM=;
 b=lJ79SmWGReNwgnkBOZT4XAvrrGiRxDnarmjOPZ4kebl8TCppSldXDqwrhHcfWijzoj
 kF5NxdgWK/Oq7Um1sF/0JMvK9ro1RJUvKQlsAW+U4MwbcaAwpEfrXnNcf/Ooo+mQ6gaK
 PyoKpT2ZWAGGLzrqoWPTLIkovuAm8iYppl9rJuSrcS3lLcG1VwTBtfpRgaFjviZz4B7A
 sZ/dzF1OG4aPyZv4hDvOaDH0NdQuEQQHIKxw+i8I8Sxct5+UT0+MZT4UwkGOZF9hvTfk
 1hEV5qxdE4sXMwbT2aNbWwv8ORhkusX6BPkoy+2+jBQpLgCOpNNUBqoWRXcV1RucHiFH
 IxaQ==
X-Gm-Message-State: APjAAAUYG1787DXnutm2c5IPaZ676Z2B9FtDyD/+RYTTCwm29mf9RgII
 ks+pQHABGBzhNMAuyjbwGZU=
X-Google-Smtp-Source: APXvYqzv1tIQlpKco//60WYuLTW7z1oxQjMycV6JNoP/lHrYCqfsfsZK6oF4LOSUVD30btuEywALkw==
X-Received: by 2002:a5d:568e:: with SMTP id f14mr30852781wrv.167.1563807803620; 
 Mon, 22 Jul 2019 08:03:23 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:03:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 7/7] backlight: gpio: use a helper variable for &pdev->dev
Date: Mon, 22 Jul 2019 17:03:02 +0200
Message-Id: <20190722150302.29526-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722150302.29526-1-brgl@bgdev.pl>
References: <20190722150302.29526-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAL0aUWAYM6zj0vm1GZ+TQ+tEc0Krf1eM+2DJqAl5SM=;
 b=nmW74zEr5VJ6NZvm1xuolQHLV0V7JgfFdkjukAjIIj5RNLT84lt5xHJ0PLzrUJ6/ie
 RmshckVdtRD0zHSnm/JFKySIhGn9lZ2csoJYK8GGTLrpZYKGDFXm1O4UzIVaOn6wT8n+
 chPm6jnC6JBpeSfYWVmpy9xzw0ALdoGU0NGnuQGvytC2iIybCom/3uAlMfxOdEEaK5is
 Cd+Wu0BM+CzQQJq670P51jIIg8jJN+ZLA4mzlt+Ou356KV4WZV4ZhqcfU3aa+vZzLCxy
 lICAekCDmFT5JKXRYetIaIyTKTQIkoTZKT/ciUHheKR5Fsu7MGdWEjsq1YjAP1YGsQUl
 gfHQ==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCklu
c3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2ggdGltZSwgdXNlIGEgaGVscGVyIHZhcmlh
YmxlIGZvcgp0aGUgYXNzb2NpYXRlZCBkZXZpY2UgcG9pbnRlci4KClNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDIyICsrKysrKysrKysrKy0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIGIv
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwppbmRleCBjZDZhNzViY2E5
Y2MuLjA5MWZmNzk5NjU5YSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bp
b19iYWNrbGlnaHQuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdo
dC5jCkBAIC01NCwyOSArNTQsMzIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfb3Bz
IGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKIAogc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewotCXN0cnVjdCBncGlvX2JhY2tsaWdo
dF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9Ci0JCWRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7
CisJc3RydWN0IGdwaW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEgKnBkYXRhOwogCXN0cnVjdCBi
YWNrbGlnaHRfcHJvcGVydGllcyBwcm9wczsKIAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmw7
CiAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmw7CiAJZW51bSBncGlvZF9mbGFncyBmbGFnczsK
KwlzdHJ1Y3QgZGV2aWNlICpkZXY7CiAJaW50IHJldCwgZGVmX3ZhbHVlOwogCi0JZ2JsID0gZGV2
bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqZ2JsKSwgR0ZQX0tFUk5FTCk7CisJZGV2ID0g
JnBkZXYtPmRldjsKKwlwZGF0YSA9IGRldl9nZXRfcGxhdGRhdGEoZGV2KTsKKworCWdibCA9IGRl
dm1fa3phbGxvYyhkZXYsIHNpemVvZigqZ2JsKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKGdibCA9PSBO
VUxMKQogCQlyZXR1cm4gLUVOT01FTTsKIAogCWlmIChwZGF0YSkKIAkJZ2JsLT5mYmRldiA9IHBk
YXRhLT5mYmRldjsKIAotCWRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBk
ZXYtPmRldiwgImRlZmF1bHQtb24iKTsKKwlkZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVh
ZF9ib29sKGRldiwgImRlZmF1bHQtb24iKTsKIAlmbGFncyA9IGRlZl92YWx1ZSA/IEdQSU9EX09V
VF9ISUdIIDogR1BJT0RfT1VUX0xPVzsKIAotCWdibC0+Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldCgm
cGRldi0+ZGV2LCBOVUxMLCBmbGFncyk7CisJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KGRl
diwgTlVMTCwgZmxhZ3MpOwogCWlmIChJU19FUlIoZ2JsLT5ncGlvZCkpIHsKIAkJcmV0ID0gUFRS
X0VSUihnYmwtPmdwaW9kKTsKIAkJaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKSB7Ci0JCQlkZXZf
ZXJyKCZwZGV2LT5kZXYsCisJCQlkZXZfZXJyKGRldiwKIAkJCQkiRXJyb3I6IFRoZSBncGlvcyBw
YXJhbWV0ZXIgaXMgbWlzc2luZyBvciBpbnZhbGlkLlxuIik7CiAJCX0KIAkJcmV0dXJuIHJldDsK
QEAgLTg1LDExICs4OCwxMCBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJbWVtc2V0KCZwcm9wcywgMCwgc2l6ZW9mKHByb3Bz
KSk7CiAJcHJvcHMudHlwZSA9IEJBQ0tMSUdIVF9SQVc7CiAJcHJvcHMubWF4X2JyaWdodG5lc3Mg
PSAxOwotCWJsID0gZGV2bV9iYWNrbGlnaHRfZGV2aWNlX3JlZ2lzdGVyKCZwZGV2LT5kZXYsIGRl
dl9uYW1lKCZwZGV2LT5kZXYpLAotCQkJCQkmcGRldi0+ZGV2LCBnYmwsICZncGlvX2JhY2tsaWdo
dF9vcHMsCi0JCQkJCSZwcm9wcyk7CisJYmwgPSBkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0
ZXIoZGV2LCBkZXZfbmFtZShkZXYpLCBkZXYsIGdibCwKKwkJCQkJICAgICZncGlvX2JhY2tsaWdo
dF9vcHMsICZwcm9wcyk7CiAJaWYgKElTX0VSUihibCkpIHsKLQkJZGV2X2VycigmcGRldi0+ZGV2
LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGJhY2tsaWdodFxuIik7CisJCWRldl9lcnIoZGV2LCAiZmFp
bGVkIHRvIHJlZ2lzdGVyIGJhY2tsaWdodFxuIik7CiAJCXJldHVybiBQVFJfRVJSKGJsKTsKIAl9
CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
