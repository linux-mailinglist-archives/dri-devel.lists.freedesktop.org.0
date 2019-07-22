Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA86D7127A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138FD8933C;
	Tue, 23 Jul 2019 07:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D8289C37
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:03:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x4so39750819wrt.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VOxOTv40kWNEJHTWrrT/jLtfVvkKD73o3YTvSQ9LmQ=;
 b=ofn4labH9mlTz5rg72U3V3Rd3zT2bCkeYuRVx1T3QUTatTo7qNMaXGVEALnLtzOqcm
 vl6N90kYNGpZBKr/mDf/fef5eoKGT+avGNiLdBJJiUBNhJfdxXqoW69OeBn8HTdPYVuw
 2Nett3umO5Y/zJ8BNW/eGosS+mFjpATZIlINjNQJANOcbE7ifGeb1K09Go22FxRN614v
 vJbGiD/y+EOf6EHwackcITG2XQulWJclt0JCbaNYNmYf3RKwHHZ75BgDfueRdVXPojOH
 XPLtfWstjo8I2vgVDJfC49j3MKjxBsPE2Ko6mg/Jc0SdEohSMzz19vhDy+qAnRCDZQYR
 17Aw==
X-Gm-Message-State: APjAAAX+3qBOVUg/S4INabrS21m5wKWCD+RrCZSuI0ALfChdMFqx/DAc
 t4U9DZsaL4FbWOLA9z7o6Vg=
X-Google-Smtp-Source: APXvYqzNd/LYOJoiuysHC+W3E9wdzoFkN6mdzKjvmD/65FPIUftUgWabjvssAUboPGNuJIx70c28qQ==
X-Received: by 2002:adf:ed04:: with SMTP id a4mr70026812wro.86.1563807797982; 
 Mon, 22 Jul 2019 08:03:17 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:03:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/7] backlight: gpio: simplify the platform data handling
Date: Mon, 22 Jul 2019 17:02:57 +0200
Message-Id: <20190722150302.29526-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722150302.29526-1-brgl@bgdev.pl>
References: <20190722150302.29526-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8VOxOTv40kWNEJHTWrrT/jLtfVvkKD73o3YTvSQ9LmQ=;
 b=y/bfQV37drOfVrF4n+Iqq4NGk+7tKntp1pEhzWKHHRbiBdgwKFn5ULWP6hZT5WjrpQ
 KSmH6Gwv36Cmuit2W2oi+R7e/Sse8GlHM5GCVVh3iyZ7zTuVrLZluj9cEhZ+z8ALiExU
 K+guiU7eeyH2GcErUOnZTfQKo1mU9soy5jkATQRCpeEZQynuPngCDIDsfB1ThYKeKBxP
 vXNRA4vOqomu3/g1DTfGIWUnZjmP/hmiZ5tsttLzqE/Cg5nEeIPdrV7Qw1GbqjByCHlO
 j32I4tBQQfldKTGkt72MjMY1rAknjvyyCqPjEy1B4FtXrrHt1tZJ/Hv00wvl4+eEmtO4
 0CYg==
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
LS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIHwgNjQgKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNTEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19i
YWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKaW5k
ZXggZTg0ZjMwODdlMjlmLi4wMTI2MjE4NmZhMWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
Z3Bpb19iYWNrbGlnaHQuYwpAQCAtNTUsMzAgKzU1LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBi
YWNrbGlnaHRfb3BzIGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKIAkuY2hlY2tfZmIJPSBncGlvX2Jh
Y2tsaWdodF9jaGVja19mYiwKIH07CiAKLXN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmVf
ZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKLQkJCQkgICBzdHJ1Y3QgZ3Bpb19iYWNr
bGlnaHQgKmdibCkKLXsKLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwotCWVudW0g
Z3Bpb2RfZmxhZ3MgZmxhZ3M7Ci0JaW50IHJldDsKLQotCWdibC0+ZGVmX3ZhbHVlID0gZGV2aWNl
X3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7Ci0JZmxhZ3MgPSBnYmwtPmRl
Zl92YWx1ZSA/IEdQSU9EX09VVF9ISUdIIDogR1BJT0RfT1VUX0xPVzsKLQotCWdibC0+Z3Bpb2Qg
PSBkZXZtX2dwaW9kX2dldChkZXYsIE5VTEwsIGZsYWdzKTsKLQlpZiAoSVNfRVJSKGdibC0+Z3Bp
b2QpKSB7Ci0JCXJldCA9IFBUUl9FUlIoZ2JsLT5ncGlvZCk7Ci0KLQkJaWYgKHJldCAhPSAtRVBS
T0JFX0RFRkVSKSB7Ci0JCQlkZXZfZXJyKGRldiwKLQkJCQkiRXJyb3I6IFRoZSBncGlvcyBwYXJh
bWV0ZXIgaXMgbWlzc2luZyBvciBpbnZhbGlkLlxuIik7Ci0JCX0KLQkJcmV0dXJuIHJldDsKLQl9
Ci0KLQlyZXR1cm4gMDsKLX0KLQogc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0
Zm9ybV9kYXRhICpwZGF0YSA9CkBAIC04Niw2ICs2Miw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNr
bGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgYmFja2xp
Z2h0X3Byb3BlcnRpZXMgcHJvcHM7CiAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsOwogCXN0
cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOworCWVudW0gZ3Bpb2RfZmxhZ3MgZmxhZ3M7CiAJaW50
IHJldDsKIAogCWdibCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmdibCksIEdG
UF9LRVJORUwpOwpAQCAtOTQsMzUgKzcxLDIwIEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWdibC0+ZGV2ID0gJnBkZXYt
PmRldjsKIAotCWlmIChwZGV2LT5kZXYuZndub2RlKSB7Ci0JCXJldCA9IGdwaW9fYmFja2xpZ2h0
X3Byb2JlX2R0KHBkZXYsIGdibCk7Ci0JCWlmIChyZXQpCi0JCQlyZXR1cm4gcmV0OwotCX0gZWxz
ZSBpZiAocGRhdGEpIHsKLQkJLyoKLQkJICogTGVnYWN5IHBsYXRmb3JtIGRhdGEgR1BJTyByZXRy
aWV2ZWFsLiBEbyBub3QgZXhwYW5kCi0JCSAqIHRoZSB1c2Ugb2YgdGhpcyBjb2RlIHBhdGgsIGN1
cnJlbnRseSBvbmx5IHVzZWQgYnkgb25lCi0JCSAqIFNIIGJvYXJkLgotCQkgKi8KLQkJdW5zaWdu
ZWQgbG9uZyBmbGFncyA9IEdQSU9GX0RJUl9PVVQ7Ci0KKwlpZiAocGRhdGEpCiAJCWdibC0+ZmJk
ZXYgPSBwZGF0YS0+ZmJkZXY7Ci0JCWdibC0+ZGVmX3ZhbHVlID0gcGRhdGEtPmRlZl92YWx1ZTsK
LQkJZmxhZ3MgfD0gZ2JsLT5kZWZfdmFsdWUgPyBHUElPRl9JTklUX0hJR0ggOiBHUElPRl9JTklU
X0xPVzsKLQotCQlyZXQgPSBkZXZtX2dwaW9fcmVxdWVzdF9vbmUoZ2JsLT5kZXYsIHBkYXRhLT5n
cGlvLCBmbGFncywKLQkJCQkJICAgIHBkYXRhID8gcGRhdGEtPm5hbWUgOiAiYmFja2xpZ2h0Iik7
Ci0JCWlmIChyZXQgPCAwKSB7Ci0JCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJ1bmFibGUgdG8gcmVx
dWVzdCBHUElPXG4iKTsKLQkJCXJldHVybiByZXQ7CisKKwlnYmwtPmRlZl92YWx1ZSA9IGRldmlj
ZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1bHQtb24iKTsKKwlmbGFncyA9
IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOworCisJZ2Js
LT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KCZwZGV2LT5kZXYsIE5VTEwsIGZsYWdzKTsKKwlpZiAo
SVNfRVJSKGdibC0+Z3Bpb2QpKSB7CisJCXJldCA9IFBUUl9FUlIoZ2JsLT5ncGlvZCk7CisJCWlm
IChyZXQgIT0gLUVQUk9CRV9ERUZFUikgeworCQkJZGV2X2VycigmcGRldi0+ZGV2LAorCQkJCSJF
cnJvcjogVGhlIGdwaW9zIHBhcmFtZXRlciBpcyBtaXNzaW5nIG9yIGludmFsaWQuXG4iKTsKIAkJ
fQotCQlnYmwtPmdwaW9kID0gZ3Bpb190b19kZXNjKHBkYXRhLT5ncGlvKTsKLQkJaWYgKCFnYmwt
PmdwaW9kKQotCQkJcmV0dXJuIC1FSU5WQUw7Ci0JfSBlbHNlIHsKLQkJZGV2X2VycigmcGRldi0+
ZGV2LAotCQkJImZhaWxlZCB0byBmaW5kIHBsYXRmb3JtIGRhdGEgb3IgZGV2aWNlIHRyZWUgbm9k
ZS5cbiIpOwotCQlyZXR1cm4gLUVOT0RFVjsKKwkJcmV0dXJuIHJldDsKIAl9CiAKIAltZW1zZXQo
JnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
