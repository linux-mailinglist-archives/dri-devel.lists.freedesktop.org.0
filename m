Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6B15B147
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C877F89DE1;
	Sun, 30 Jun 2019 18:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059986E8BD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:03:07 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a15so8492486wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 03:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/MIsV0iC74yf/kLB48zP5Mu3PghPcknjMYE++qerELQ=;
 b=Cm5rsdB+v5tsBhHwT14w4ppX8Sk3wE7by8u0bbe2pH3kSej2GF4U6gj2H1fDdOANMF
 Brmr+SXCT3gKxFqVIyt8oKlPYhszS6hauQ5IrMqkPKfLZpZ0zf1UxXDpNrOPjHp+znn6
 fQyEwO90x6B7VjCMa3TcfPzqC5IYDhj9hgz3weVkJJAN9pU8NQ2WUBK9ejSIxJ4LeBnQ
 7bYu2YUf5QeKLK/R/Q7F2VujpDNJqQv0F9FvzVmop3Ed3RDGtidzvwxhs5VaGrG8SxuW
 fitHIzqLEh+1/9NYAmX8v5BsvAX4d73IF5qaZy5X7CkBsZmNkqe10RpwE2W6vZQYOzqy
 GR3A==
X-Gm-Message-State: APjAAAUuni4jTamwE95AA4Kn5V51fY0dDse1bSKzLzU7d+bWYPErWVaJ
 L6T3NQxF5c1E2H8gKsFjiIgriw==
X-Google-Smtp-Source: APXvYqxMlO8Fzv7j1/DeSmWZz7jyRkBp7z4c54hGgmLMAGP1WzXIA6YdHeK1AoOXmA8GXduiCgXd+g==
X-Received: by 2002:a1c:f102:: with SMTP id p2mr6197653wmh.60.1561716185658;
 Fri, 28 Jun 2019 03:03:05 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id l124sm1628874wmf.36.2019.06.28.03.03.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 03:03:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH RFT 2/4] backlight: gpio: simplify the platform data handling
Date: Fri, 28 Jun 2019 12:02:51 +0200
Message-Id: <20190628100253.8385-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628100253.8385-1-brgl@bgdev.pl>
References: <20190628100253.8385-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/MIsV0iC74yf/kLB48zP5Mu3PghPcknjMYE++qerELQ=;
 b=RKbWobwqHCIrkwBTlOa2hdgmXhCQq1JvHVtNEOm0X33A/V3lRp6rBHwJTZOS2ZlrsC
 D/JTSQ4w5KTYhNV7l4mm1L9tL+8Zv5GX6ZX01CI+2pG2sbWZU2YGEk/dBx9zz50MHA5t
 fGLjObyRZ8ialJJ9Ujpck3pa0VCU+xs/7VClJN4UFUf2LPq4xfUkko0QaDjNN5EJwXDp
 8koiUs4eI/hXyoZIHCY3WcCI5QQOhM2wYhdYEmHzm0aWdgYpa0xpfF3eVQ9lrv708D5D
 PCpptKKMn0a/FEuX2WMu3OkGWWHI69qpmuwM5vMFKoPbKnuxudAFGMZQcI/SHE5jz99U
 5Ztg==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCk5v
dyB0aGF0IHRoZSBsYXN0IHVzZXIgb2YgcGxhdGZvcm0gZGF0YSAoc2ggZWNvdmVjMjQpIGRlZmlu
ZXMgYSBwcm9wZXIKR1BJTyBsb29rdXAgYW5kIHNldHMgdGhlICdkZWZhdWx0LW9uJyBkZXZpY2Ug
cHJvcGVydHksIHdlIGNhbiBkcm9wIHRoZQpwbGF0Zm9ybV9kYXRhLXNwZWNpZmljIEdQSU8gaGFu
ZGxpbmcgYW5kIHVuaWZ5IGEgYmlnIGNodW5rIG9mIGNvZGUuCgpUaGUgb25seSBmaWVsZCB1c2Vk
IGZyb20gdGhlIHBsYXRmb3JtIGRhdGEgaXMgbm93IHRoZSBmYmRldiBwb2ludGVyLgoKU2lnbmVk
LW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4K
LS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIHwgNDYgKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMzMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19i
YWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKaW5k
ZXggODllMTBiY2NmZDNjLi5iMjBkMmQ1ZDUxOTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
Z3Bpb19iYWNrbGlnaHQuYwpAQCAtNzEsNDEgKzcxLDIxIEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNr
bGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWdibC0+ZGV2ID0g
ZGV2OwogCi0JaWYgKHBkYXRhKSB7Ci0JCS8qCi0JCSAqIExlZ2FjeSBwbGF0Zm9ybSBkYXRhIEdQ
SU8gcmV0cmlldmVhbC4gRG8gbm90IGV4cGFuZAotCQkgKiB0aGUgdXNlIG9mIHRoaXMgY29kZSBw
YXRoLCBjdXJyZW50bHkgb25seSB1c2VkIGJ5IG9uZQotCQkgKiBTSCBib2FyZC4KLQkJICovCi0J
CXVuc2lnbmVkIGxvbmcgZmxhZ3MgPSBHUElPRl9ESVJfT1VUOwotCisJaWYgKHBkYXRhKQogCQln
YmwtPmZiZGV2ID0gcGRhdGEtPmZiZGV2OwotCQlnYmwtPmRlZl92YWx1ZSA9IHBkYXRhLT5kZWZf
dmFsdWU7Ci0JCWZsYWdzIHw9IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0ZfSU5JVF9ISUdIIDogR1BJ
T0ZfSU5JVF9MT1c7Ci0KLQkJcmV0ID0gZGV2bV9ncGlvX3JlcXVlc3Rfb25lKGdibC0+ZGV2LCBw
ZGF0YS0+Z3BpbywgZmxhZ3MsCi0JCQkJCSAgICBwZGF0YSA/IHBkYXRhLT5uYW1lIDogImJhY2ts
aWdodCIpOwotCQlpZiAocmV0IDwgMCkgewotCQkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8gcmVx
dWVzdCBHUElPXG4iKTsKLQkJCXJldHVybiByZXQ7Ci0JCX0KLQkJZ2JsLT5ncGlvZCA9IGdwaW9f
dG9fZGVzYyhwZGF0YS0+Z3Bpbyk7Ci0JCWlmICghZ2JsLT5ncGlvZCkKLQkJCXJldHVybiAtRUlO
VkFMOwotCX0gZWxzZSB7Ci0JCWdibC0+ZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRf
Ym9vbChkZXYsICJkZWZhdWx0LW9uIik7Ci0JCWZsYWdzID0gZ2JsLT5kZWZfdmFsdWUgPyBHUElP
RF9PVVRfSElHSCA6IEdQSU9EX09VVF9MT1c7Ci0KLQkJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2Rf
Z2V0KGRldiwgTlVMTCwgZmxhZ3MpOwotCQlpZiAoSVNfRVJSKGdibC0+Z3Bpb2QpKSB7Ci0JCQly
ZXQgPSBQVFJfRVJSKGdibC0+Z3Bpb2QpOwotCi0JCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIp
IHsKLQkJCQlkZXZfZXJyKGRldiwKLQkJCQkJIkVycm9yOiBUaGUgZ3Bpb3MgcGFyYW1ldGVyIGlz
IG1pc3Npbmcgb3IgaW52YWxpZC5cbiIpOwotCQkJfQotCQkJcmV0dXJuIHJldDsKKworCWdibC0+
ZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7
CisJZmxhZ3MgPSBnYmwtPmRlZl92YWx1ZSA/IEdQSU9EX09VVF9ISUdIIDogR1BJT0RfT1VUX0xP
VzsKKworCWdibC0+Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldChkZXYsIE5VTEwsIGZsYWdzKTsKKwlp
ZiAoSVNfRVJSKGdibC0+Z3Bpb2QpKSB7CisJCXJldCA9IFBUUl9FUlIoZ2JsLT5ncGlvZCk7CisK
KwkJaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKSB7CisJCQlkZXZfZXJyKGRldiwKKwkJCQkiRXJy
b3I6IFRoZSBncGlvcyBwYXJhbWV0ZXIgaXMgbWlzc2luZyBvciBpbnZhbGlkLlxuIik7CiAJCX0K
KwkJcmV0dXJuIHJldDsKIAl9CiAKIAltZW1zZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
