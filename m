Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C831C56448
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBEE6E30C;
	Wed, 26 Jun 2019 08:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F486E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:34:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p13so18610056wru.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9jHnEFpHn7uzznoO3/dgHPquJFVDhGL7Sa3AB/IK/o8=;
 b=LOIKBj+gWqNCEJs2UH6xWiYcJtOMtskiclRi/DUUvr5aparL6y7HyWLTPkumkV83HX
 4mlzHi3rTd2UPfMy2N4esjLbJgZQskJ7xNfKcMm2f+YGMqk5R/XlHYDQnm2eX3sWcxCO
 9Cs8m0rXMdXewKBkQsuw7Y0MZ9DJm0KdZdfShjFMjux2PsJXUZcCflo4TFsnWYO/Znzd
 TjQp6W016Av3fDBWI/dS8n+UnsVMQEuNzEb7hgOlhUjUfQRLafCxb63e1UvVXnB8k70D
 iG1yp7SuYOnejB0cc3VeLbYk8v+eWbj79+HFn/QL1Vbnby4A5lc9M9W26k9X/mP6qc96
 JUlA==
X-Gm-Message-State: APjAAAX9134aGRfOz7LRf1kLR2pBE17joQBywdJNfVW76PlDsbOTmvPq
 S5NE6UAcL82lzFN3pN2UWL9koA==
X-Google-Smtp-Source: APXvYqwy7zacb5a2dIAzBH+DNPJmE7Ud9HzGmZ8XgxvKZbiQHoYeDIvLxGo471H1Sy/xZiRyc+Eftg==
X-Received: by 2002:a5d:4fc8:: with SMTP id h8mr26465755wrw.124.1561480495518; 
 Tue, 25 Jun 2019 09:34:55 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.34.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:34:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 03/12] backlight: gpio: pull the non-pdata device probing code
 into probe()
Date: Tue, 25 Jun 2019 18:34:25 +0200
Message-Id: <20190625163434.13620-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9jHnEFpHn7uzznoO3/dgHPquJFVDhGL7Sa3AB/IK/o8=;
 b=hn0sJGMrU38ycKfPEcke4oemjMf5nF19She6rrogMdb5v0F2pBQBNKFb+k/+2MJbvv
 x0AL7iJN38li9VNodfle2pG9gu9d2FJ3tvO7WCdfFllzJdndvifHLTLjRDM4aDml+Kuj
 ARXR5bllOgDLUQO3pl4c5PKCRuEuqrBRd/sgqgOD1M5Honf1Q9rxMnOT9Gtrbba1Pc6q
 WCixZR6JX0xgDU+5eMlm3aDNlNwAqfajTgyiKEnyZ2eYijvvzNfmrix4ZFYvnBzoboQW
 vWSvbCOsW9ZdQYXrDXj4UOEBCHTBJKcTLpDkXcvPZbiDAcrZsqeJshpkE3iV/v/oMDyN
 QHOw==
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClRo
ZXJlJ3Mgbm8gZ29vZCByZWFzb24gdG8gaGF2ZSB0aGUgZ2VuZXJpYyBwcm9iaW5nIGNvZGUgaW4g
YSBzZXBhcmF0ZQpyb3V0aW5lLiBUaGlzIGZ1bmN0aW9uIGlzIHNob3J0IGFuZCBpcyBpbmxpbmVk
IGJ5IHRoZSBjb21waWxlciBhbnl3YXkuCk1vdmUgaXQgaW50byBwcm9iZSB1bmRlciB0aGUgcGRh
dGEtc3BlY2lmaWMgcGFydC4KClNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJn
b2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bp
b19iYWNrbGlnaHQuYyB8IDM5ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9ncGlvX2JhY2tsaWdodC5jCmluZGV4IDhhZGJjOGQ3NTA5Ny4uODllMTBiY2NmZDNjIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCisrKyBi
L2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKQEAgLTU0LDMwICs1NCw2
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xpZ2h0X29wcyBncGlvX2JhY2tsaWdodF9vcHMg
PSB7CiAJLmNoZWNrX2ZiCT0gZ3Bpb19iYWNrbGlnaHRfY2hlY2tfZmIsCiB9OwogCi1zdGF0aWMg
aW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlX3Byb3Aoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
diwKLQkJCQkgICAgIHN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsKQotewotCXN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZwZGV2LT5kZXY7Ci0JZW51bSBncGlvZF9mbGFncyBmbGFnczsKLQlpbnQgcmV0
OwotCi0JZ2JsLT5kZWZfdmFsdWUgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwgImRl
ZmF1bHQtb24iKTsKLQlmbGFncyA9IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBH
UElPRF9PVVRfTE9XOwotCi0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgTlVMTCwg
ZmxhZ3MpOwotCWlmIChJU19FUlIoZ2JsLT5ncGlvZCkpIHsKLQkJcmV0ID0gUFRSX0VSUihnYmwt
PmdwaW9kKTsKLQotCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpIHsKLQkJCWRldl9lcnIoZGV2
LAotCQkJCSJFcnJvcjogVGhlIGdwaW9zIHBhcmFtZXRlciBpcyBtaXNzaW5nIG9yIGludmFsaWQu
XG4iKTsKLQkJfQotCQlyZXR1cm4gcmV0OwotCX0KLQotCXJldHVybiAwOwotfQotCiBzdGF0aWMg
aW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7
CiAJc3RydWN0IGdwaW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEgKnBkYXRhID0KQEAgLTg2LDYg
KzYyLDcgQEAgc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7CiAJc3RydWN0
IGJhY2tsaWdodF9kZXZpY2UgKmJsOwogCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOworCWVu
dW0gZ3Bpb2RfZmxhZ3MgZmxhZ3M7CiAJaW50IHJldDsKIAogCWdibCA9IGRldm1fa3phbGxvYyhk
ZXYsIHNpemVvZigqZ2JsKSwgR0ZQX0tFUk5FTCk7CkBAIC0xMTYsOSArOTMsMTkgQEAgc3RhdGlj
IGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CQlpZiAoIWdibC0+Z3Bpb2QpCiAJCQlyZXR1cm4gLUVJTlZBTDsKIAl9IGVsc2UgewotCQlyZXQg
PSBncGlvX2JhY2tsaWdodF9wcm9iZV9wcm9wKHBkZXYsIGdibCk7Ci0JCWlmIChyZXQpCisJCWdi
bC0+ZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9u
Iik7CisJCWZsYWdzID0gZ2JsLT5kZWZfdmFsdWUgPyBHUElPRF9PVVRfSElHSCA6IEdQSU9EX09V
VF9MT1c7CisKKwkJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KGRldiwgTlVMTCwgZmxhZ3Mp
OworCQlpZiAoSVNfRVJSKGdibC0+Z3Bpb2QpKSB7CisJCQlyZXQgPSBQVFJfRVJSKGdibC0+Z3Bp
b2QpOworCisJCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpIHsKKwkJCQlkZXZfZXJyKGRldiwK
KwkJCQkJIkVycm9yOiBUaGUgZ3Bpb3MgcGFyYW1ldGVyIGlzIG1pc3Npbmcgb3IgaW52YWxpZC5c
biIpOworCQkJfQogCQkJcmV0dXJuIHJldDsKKwkJfQogCX0KIAogCW1lbXNldCgmcHJvcHMsIDAs
IHNpemVvZihwcm9wcykpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
