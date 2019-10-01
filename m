Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65AFC4830
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00DB6E8AE;
	Wed,  2 Oct 2019 07:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619166E788
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 12:59:34 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id i16so3275356wmd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 05:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AptOB7aQMzupkvqKi0d1i4i7uXh0E5N7gRvX5FWeAOU=;
 b=XAYDuxDPmoq2S0rtpKTcIS4OoArQ0aIv59f/hkjhiXZ91Bp65zjE3IwGZfbOZrqIf6
 K22fBtrJ59csGDh9lhJSneyAwA5eEFSikydg9RpcYBrkAOExXDUaH494jezx+Je0iaGT
 XT7ab90yel5KVzgOqYE5TqlJPdZDXhtK4mulz2BjfdIEDNyzd0Dt6za0UM5+d9HR0KTs
 PaoGh982uJ9iuRKVNuGeLnVZ29wXQ9pIGOi2DNUOIqpdkUnqN2XSVb8xoqMZEFUmSogQ
 n3yruOJ6zEukSasITPZSGFWOOkDsIk/pocDq6USZUg+f5Gmos/mKujNXjJo0AHFOALPk
 TCmQ==
X-Gm-Message-State: APjAAAUmnRkYkWGOXnC7kDuNnOIq8+QEY/r7wkXppo3nJSJ/X+7+nmDD
 6nzY5aiwlNxl6chJREQK0I3//g==
X-Google-Smtp-Source: APXvYqx3q+9sUGs6+xirhCygiJCG0L1MJfnhI1dmSdWZ8G1s1CHPmFRdObGuXQg/gt02Yp/yvI/WGg==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr3594356wmc.141.1569934773015; 
 Tue, 01 Oct 2019 05:59:33 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 05:59:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 7/7] backlight: gpio: pull
 gpio_backlight_initial_power_state() into probe
Date: Tue,  1 Oct 2019 14:58:37 +0200
Message-Id: <20191001125837.4472-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001125837.4472-1-brgl@bgdev.pl>
References: <20191001125837.4472-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AptOB7aQMzupkvqKi0d1i4i7uXh0E5N7gRvX5FWeAOU=;
 b=Mj8KL/3yO/+8pQR6hKmMxjehp8UsaQmJXB+50w4JFC0Jbpw/bv2KHHtQqu6BYcbZ0s
 GnstolGS0HMZooKY2nCYemYIsdaW8nlkyXolNB7aBZ2wQgg3+tC6mtqu6pxs7bjcCWXy
 7cPPNplvd38z+flfRXABRtkSJsSPiN7w4B2Z5mXYR4SNSpvQjEYEP05z6/up9NkcTA3h
 r36ddCNTZVeEErft7TF+UYk0jwcNEJCYfaFm1PMfMF+x+dFlzVYdG6Dlz00VIYzPoksO
 1NiE+Kx8avaQAi9fzsQecRgxXfikJ7hT2QJFzwEMqauBQWPwUJyenh0Ni5myYPeN0+5a
 veOQ==
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
R29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDM2ICsrKysrKysrLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2
ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCmluZGV4IDYyNDc2ODdiNjMzMC4u
MzdlYzE4NGYwYzVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2Jh
Y2tsaWdodC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMK
QEAgLTE3LDExICsxNyw4IEBACiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogCiBzdHJ1Y3QgZ3Bp
b19iYWNrbGlnaHQgewotCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlzdHJ1Y3QgZGV2aWNlICpmYmRl
djsKLQogCXN0cnVjdCBncGlvX2Rlc2MgKmdwaW9kOwotCWludCBkZWZfdmFsdWU7CiB9OwogCiBz
dGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJhY2tsaWdodF9k
ZXZpY2UgKmJsKQpAQCAtNTMsNDEgKzUwLDI0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xp
Z2h0X29wcyBncGlvX2JhY2tsaWdodF9vcHMgPSB7CiAJLmNoZWNrX2ZiCT0gZ3Bpb19iYWNrbGln
aHRfY2hlY2tfZmIsCiB9OwogCi1zdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X2luaXRpYWxfcG93
ZXJfc3RhdGUoc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpnYmwpCi17Ci0Jc3RydWN0IGRldmljZV9u
b2RlICpub2RlID0gZ2JsLT5kZXYtPm9mX25vZGU7Ci0KLQkvKiBOb3QgYm9vdGVkIHdpdGggZGV2
aWNlIHRyZWUgb3Igbm8gcGhhbmRsZSBsaW5rIHRvIHRoZSBub2RlICovCi0JaWYgKCFub2RlIHx8
ICFub2RlLT5waGFuZGxlKQotCQlyZXR1cm4gZ2JsLT5kZWZfdmFsdWUgPyBGQl9CTEFOS19VTkJM
QU5LIDogRkJfQkxBTktfUE9XRVJET1dOOwotCi0JLyogaWYgdGhlIGVuYWJsZSBHUElPIGlzIGRp
c2FibGVkLCBkbyBub3QgZW5hYmxlIHRoZSBiYWNrbGlnaHQgKi8KLQlpZiAoZ3Bpb2RfZ2V0X3Zh
bHVlX2NhbnNsZWVwKGdibC0+Z3Bpb2QpID09IDApCi0JCXJldHVybiBGQl9CTEFOS19QT1dFUkRP
V047Ci0KLQlyZXR1cm4gRkJfQkxBTktfVU5CTEFOSzsKLX0KLQotCiBzdGF0aWMgaW50IGdwaW9f
YmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0
IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZv
cm1fZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7CisJc3RydWN0IGRldmljZV9u
b2RlICpvZl9ub2RlID0gZGV2LT5vZl9ub2RlOwogCXN0cnVjdCBiYWNrbGlnaHRfcHJvcGVydGll
cyBwcm9wczsKIAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmw7CiAJc3RydWN0IGdwaW9fYmFj
a2xpZ2h0ICpnYmw7Ci0JaW50IHJldDsKKwlpbnQgcmV0LCBkZWZfdmFsdWU7CiAKIAlnYmwgPSBk
ZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmdibCksIEdGUF9LRVJORUwpOwogCWlmIChnYmwgPT0g
TlVMTCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKLQlnYmwtPmRldiA9IGRldjsKLQogCWlmIChwZGF0
YSkKIAkJZ2JsLT5mYmRldiA9IHBkYXRhLT5mYmRldjsKIAotCWdibC0+ZGVmX3ZhbHVlID0gZGV2
aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7CisJZGVmX3ZhbHVlID0g
ZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7CiAKIAlnYmwtPmdw
aW9kID0gZGV2bV9ncGlvZF9nZXQoZGV2LCBOVUxMLCBHUElPRF9BU0lTKTsKIAlpZiAoSVNfRVJS
KGdibC0+Z3Bpb2QpKSB7CkBAIC0xMDksNyArODksMTUgQEAgc3RhdGljIGludCBncGlvX2JhY2ts
aWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gUFRSX0VS
UihibCk7CiAJfQogCi0JYmwtPnByb3BzLnBvd2VyID0gZ3Bpb19iYWNrbGlnaHRfaW5pdGlhbF9w
b3dlcl9zdGF0ZShnYmwpOworCS8qIE5vdCBib290ZWQgd2l0aCBkZXZpY2UgdHJlZSBvciBubyBw
aGFuZGxlIGxpbmsgdG8gdGhlIG5vZGUgKi8KKwlpZiAoIW9mX25vZGUgfHwgIW9mX25vZGUtPnBo
YW5kbGUpCisJCWJsLT5wcm9wcy5wb3dlciA9IGRlZl92YWx1ZSA/IEZCX0JMQU5LX1VOQkxBTksK
KwkJCQkJICAgIDogRkJfQkxBTktfUE9XRVJET1dOOworCWVsc2UgaWYgKGdwaW9kX2dldF92YWx1
ZV9jYW5zbGVlcChnYmwtPmdwaW9kKSA9PSAwKQorCQlibC0+cHJvcHMucG93ZXIgPSBGQl9CTEFO
S19QT1dFUkRPV047CisJZWxzZQorCQlibC0+cHJvcHMucG93ZXIgPSBGQl9CTEFOS19VTkJMQU5L
OworCiAJYmwtPnByb3BzLmJyaWdodG5lc3MgPSAxOwogCiAJYmFja2xpZ2h0X3VwZGF0ZV9zdGF0
dXMoYmwpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
