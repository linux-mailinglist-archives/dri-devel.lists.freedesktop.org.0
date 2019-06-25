Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567A56441
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EF56E319;
	Wed, 26 Jun 2019 08:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E50C6E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:34:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r16so18594308wrl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8iezztZquUE7VOJu2VvhRUb2IfrZ8cIwgoI4gm0DrkM=;
 b=LF3zGLCe9KmBkm+s1jWI6EtLdWvgv+M6f6zNEHf8kLzNvYdHpBWv/SNdTA7XEvbB9K
 QPZxc3G9nOS0E9RMEufNEj20Ix5L1p49bA5Ujrd3dFs07EaDH6/L/ft+po33VKpw28eC
 J5i0w4nQWXtvLjYJUblxibpl3NqvBrcklLDIz9iBMxpubK1BiKmV9NqGSnbyDQ5/ojRB
 UQS21ifV3rt4GVLuTu4sHICT5CYfNoIwfSghXxKmnZTeyerBuOo/i+/JRLvPVaW4Y4GM
 tGEWmZquNdpLJ1//8XopLbhXdWpVDy00Ofdd2hal8tdmCEXVF1uhvDVW9kpFJzeNbUY1
 y7KA==
X-Gm-Message-State: APjAAAVlvONCEiUFjPH3TiusMkG/ohAW5UWK/rQIQtIV0n7B2qKJrte0
 zOuWnBqfQr2m5QN9fzuyZXNHzQ==
X-Google-Smtp-Source: APXvYqzDDJRCAp4r9gihTWEjB9YUiMxhVdwQYB5zhog7hsqmsGPPt4gRXpZAivYIHwx1NdMTVydW+w==
X-Received: by 2002:adf:81c8:: with SMTP id 66mr110996508wra.261.1561480494146; 
 Tue, 25 Jun 2019 09:34:54 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.34.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:34:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 02/12] backlight: gpio: use a helper variable for &pdev->dev
Date: Tue, 25 Jun 2019 18:34:24 +0200
Message-Id: <20190625163434.13620-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8iezztZquUE7VOJu2VvhRUb2IfrZ8cIwgoI4gm0DrkM=;
 b=rgxXlRAaV6xZXnZFHal/gjCfi7ThDBTYi4zQlerr90dKuypsYo0mb+p33lydeL4eKn
 2Cg8TDpnk1TQyWRPgE7auXmAdnsrV7xq0CkHwBoS14Z8stdjg5sO1sgEu4CXM0obe8GT
 HtDtgDT/yuWJ/6FSenaU3s3kQIgEWAOjiCDWUhU8Pfhoj3WCpQG547MgKdHM7a0QE2ml
 oMYIbV67RK1VeetSwtj5yG0Sb0iifz24h/amsfYK1tn89rbBjiyJy6Dq7HfJ6k7U1O2X
 NjWCVLOG8O2PA2zG7LLOXV9LLX5jw93wHA6dgCylVM+dJAI+sj7QPNmJX6O7U4MR7nGO
 8GcQ==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCklu
c3RlYWQgb2YgZGVyZWZlcmVuY2luZyBwZGV2IGVhY2ggdGltZSwgdXNlIGEgaGVscGVyIHZhcmlh
YmxlIGZvcgp0aGUgYXNzb2NpYXRlZCBkZXZpY2UgcG9pbnRlci4KClNpZ25lZC1vZmYtYnk6IEJh
cnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVy
cy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDE0ICsrKysrKystLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgYi9kcml2ZXJzL3Zp
ZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCmluZGV4IDY1NGMxOWQzYTgxZC4uOGFkYmM4
ZDc1MDk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdo
dC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKQEAgLTgz
LDE1ICs4MywxNiBAQCBzdGF0aWMgaW50IGdwaW9fYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IGdwaW9fYmFja2xpZ2h0X3BsYXRmb3JtX2RhdGEg
KnBkYXRhID0KIAkJZGV2X2dldF9wbGF0ZGF0YSgmcGRldi0+ZGV2KTsKIAlzdHJ1Y3QgYmFja2xp
Z2h0X3Byb3BlcnRpZXMgcHJvcHM7CisJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsK
IAlzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmw7CiAJc3RydWN0IGdwaW9fYmFja2xpZ2h0ICpn
Ymw7CiAJaW50IHJldDsKIAotCWdibCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2Yo
KmdibCksIEdGUF9LRVJORUwpOworCWdibCA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZ2Js
KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKGdibCA9PSBOVUxMKQogCQlyZXR1cm4gLUVOT01FTTsKIAot
CWdibC0+ZGV2ID0gJnBkZXYtPmRldjsKKwlnYmwtPmRldiA9IGRldjsKIAogCWlmIChwZGF0YSkg
ewogCQkvKgpAQCAtMTA4LDcgKzEwOSw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJcmV0ID0gZGV2bV9ncGlvX3JlcXVl
c3Rfb25lKGdibC0+ZGV2LCBwZGF0YS0+Z3BpbywgZmxhZ3MsCiAJCQkJCSAgICBwZGF0YSA/IHBk
YXRhLT5uYW1lIDogImJhY2tsaWdodCIpOwogCQlpZiAocmV0IDwgMCkgewotCQkJZGV2X2Vycigm
cGRldi0+ZGV2LCAidW5hYmxlIHRvIHJlcXVlc3QgR1BJT1xuIik7CisJCQlkZXZfZXJyKGRldiwg
InVuYWJsZSB0byByZXF1ZXN0IEdQSU9cbiIpOwogCQkJcmV0dXJuIHJldDsKIAkJfQogCQlnYmwt
PmdwaW9kID0gZ3Bpb190b19kZXNjKHBkYXRhLT5ncGlvKTsKQEAgLTEyMywxMSArMTI0LDEwIEBA
IHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAltZW1zZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsKIAlwcm9wcy50eXBlID0g
QkFDS0xJR0hUX1JBVzsKIAlwcm9wcy5tYXhfYnJpZ2h0bmVzcyA9IDE7Ci0JYmwgPSBkZXZtX2Jh
Y2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoJnBkZXYtPmRldiwgZGV2X25hbWUoJnBkZXYtPmRldiks
Ci0JCQkJCSZwZGV2LT5kZXYsIGdibCwgJmdwaW9fYmFja2xpZ2h0X29wcywKLQkJCQkJJnByb3Bz
KTsKKwlibCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXYsIGRldl9uYW1lKGRl
diksIGRldiwgZ2JsLAorCQkJCQkgICAgJmdwaW9fYmFja2xpZ2h0X29wcywgJnByb3BzKTsKIAlp
ZiAoSVNfRVJSKGJsKSkgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gcmVnaXN0
ZXIgYmFja2xpZ2h0XG4iKTsKKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgYmFj
a2xpZ2h0XG4iKTsKIAkJcmV0dXJuIFBUUl9FUlIoYmwpOwogCX0KIAotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
