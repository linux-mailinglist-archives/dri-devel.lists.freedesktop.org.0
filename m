Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A55572EA8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B626E4F3;
	Wed, 24 Jul 2019 12:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BB46E4AD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:25:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y4so45952603wrm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VOxOTv40kWNEJHTWrrT/jLtfVvkKD73o3YTvSQ9LmQ=;
 b=nN3H/je2/NWhmOhJMNqDOE9n0MS83gjE0IYB1vTYcJooRMy9b/6RDJXRfvYyS5wzJ5
 F/4RnuCn1ci4H+6wAdHv88la/HHOwfYCdvlI+8+RgSlCVbstWm4VXb1hqPZ/OY1WPc4t
 pzWuL8/kDTMiQ6f4nCLQ/SZD5GMn/BYoI/3os+ivFd1O96PV9e58laLQPO37sPXt1278
 LodakBgs4jA8qWmVwBjnfiZB1n99Qzuc13NIiQLH1qMnZCLKbzNO8zzdv3KcsX5Q5Tds
 /m48CINXs0nmN7LWii3xFFJaiMWmFfRU3ztg+/Ydp6VTAwiMi4TJVeGYnp6m4zPk0R5q
 dmkw==
X-Gm-Message-State: APjAAAWRGi4+0TNBrwJZGpDKaML+ENajcbJU88ZEmJa97sJJHD3paoTQ
 mDs3aslSH4wk5G75ThKP3Xo=
X-Google-Smtp-Source: APXvYqylEG+5UwTbcaSwczxEISEgX+vxsc2ZxbxeF0HClQcWNGuQkAApx11b3CnWSJnzqEygUClIyQ==
X-Received: by 2002:adf:9d8b:: with SMTP id p11mr53138350wre.226.1563956714814; 
 Wed, 24 Jul 2019 01:25:14 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 01:25:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 2/7] backlight: gpio: simplify the platform data handling
Date: Wed, 24 Jul 2019 10:25:03 +0200
Message-Id: <20190724082508.27617-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
References: <20190724082508.27617-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8VOxOTv40kWNEJHTWrrT/jLtfVvkKD73o3YTvSQ9LmQ=;
 b=A9RjNrSpXlzPhVNZCXaDwouPHTi7TIFzDls2JACrq3+/shRWFCWrnrspTHTM4I91jH
 ezoziNRBN2DQ5bIkHzan2QY0fid7sIZpj+W90xAKtLRzy5mL1NxRp24QUfHTwrqT1rfx
 SeS/Go55UuBU+CS4L/Z9MgOIcU0MpICJL3kpXsMK1FqUwUkjm3pjrjKWnN9Wcb/W1ITz
 G9DtjzD0Z+mZOITUKKR0MLN6FYml6GeYFEJSF41qOE9P9NAI8NWDod7eDWBSAbqQDWCm
 XQPYIUVcqWdPPTBMLGe1uOA9+MXjiuCeZ8xuvV22AGuAK2GA0lLZDJAdjh9VDaF/qDO+
 a/uQ==
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
