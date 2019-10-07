Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3797CDC1E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A6B6E4A1;
	Mon,  7 Oct 2019 07:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A586E450
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 03:32:07 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 205so7749570pfw.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2019 20:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nGttCXCUTufQ00gCZ8QmnQ1I5lZpZkhALPcK59Skk0o=;
 b=tQYhiVWfzKfIp/LLolz4tTXV9GgxH2GTyHl8Hp5hHs4LKqL5k4QSF7C0chmoUtjf6K
 Dh9YTK/PacQmYk7BGkp4iK3GZVrz8lwvAXHb6FNRX8BXjqS9b9Y6/c7FADyY/knyJCQ5
 ZyYxsKWDM3eRUhbbW056njuw7XN5pz72jRKjDxaHp/Lx5UvPxKNOderK/gZVKjdAj1l7
 mgREJVQb9e+g5CnsuOJxsmNS5LzZpgQWiFI2RNGYJZKIjo5ZZvajwyZerCFQN0ezwO0J
 yK74i2k0y1Ze3E4yB2/cWb1fIYRVV2RJdXiLE8QFv74WObvkIrhRknzLvODGZgnM4V7m
 UDrA==
X-Gm-Message-State: APjAAAW1QbQlSmIaels4zlEu9OYYBSK1xfPuhCmptlT2YPvk0TOnP0MW
 tDimhg4ylY/QVvIcm7wPgRZxuQ==
X-Google-Smtp-Source: APXvYqx76nXvhspQY2IMt3FPcRnICCEPJ2Mzepztm3g6/xdrNMu+Cnj8pAQbJAyORrvFBRAd3/uLNw==
X-Received: by 2002:a17:90a:8001:: with SMTP id
 b1mr32016772pjn.56.1570419127187; 
 Sun, 06 Oct 2019 20:32:07 -0700 (PDT)
Received: from debian-brgl.local (96-95-220-76-static.hfc.comcastbusiness.net.
 [96.95.220.76])
 by smtp.gmail.com with ESMTPSA id x10sm16377720pfr.44.2019.10.06.20.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 20:32:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v5 3/7] backlight: gpio: simplify the platform data handling
Date: Mon,  7 Oct 2019 05:31:56 +0200
Message-Id: <20191007033200.13443-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007033200.13443-1-brgl@bgdev.pl>
References: <20191007033200.13443-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nGttCXCUTufQ00gCZ8QmnQ1I5lZpZkhALPcK59Skk0o=;
 b=QaDNsl3lPwrys6+c19cQUZfN0xEVA2hqhmRXa+jPGCf/gwFHbGVgNlFNFZLRqm4hnC
 oqAvQl6hnUUr6+BTy5Q7rxw5MxVik5BNrTgF/4EFIOC+3QpNGOgammIc3qALq9oXw1Vc
 P0vcG8uL3K5yRSciO/VHo0q/sa4MJIvXWsyYNAMV+kfB4aoB9T6LGYYA5I/mPkAQ/+h3
 TdglHQdO7nLnEwp6nVMd0wbNwb0vmW7KlgL7gzsugljN1hSSqvG4kw3cJEzS/4GqRnG9
 4YatOb+M1flLT7qU31ciQFAinvCoH5QW6JLWmcZnjf8Ou78XdpP0AsUWmmkbD13Iv5Tk
 g8BA==
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
UmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KUmV2
aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+ClJl
dmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVs
LmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIHwgNjIg
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgNTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
Z3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0
LmMKaW5kZXggN2UxOTkwMTk5ZmFlLi4yMGM1MzExYzdlZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwpAQCAtNiw3ICs2LDYgQEAKICNpbmNsdWRlIDxsaW51eC9i
YWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KICNpbmNsdWRlIDxsaW51eC9mYi5o
PgotI2luY2x1ZGUgPGxpbnV4L2dwaW8uaD4gLyogT25seSBmb3IgbGVnYWN5IHN1cHBvcnQgKi8K
ICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvaW5pdC5o
PgogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgpAQCAtNTQsMjggKzUzLDYgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBiYWNrbGlnaHRfb3BzIGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKIAkuY2hlY2tf
ZmIJPSBncGlvX2JhY2tsaWdodF9jaGVja19mYiwKIH07CiAKLXN0YXRpYyBpbnQgZ3Bpb19iYWNr
bGlnaHRfcHJvYmVfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKLQkJCQkgICBzdHJ1
Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKLXsKLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+
ZGV2OwotCWludCByZXQ7Ci0KLQlnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFk
X2Jvb2woZGV2LCAiZGVmYXVsdC1vbiIpOwotCi0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0
KGRldiwgTlVMTCwgR1BJT0RfQVNJUyk7Ci0JaWYgKElTX0VSUihnYmwtPmdwaW9kKSkgewotCQly
ZXQgPSBQVFJfRVJSKGdibC0+Z3Bpb2QpOwotCi0JCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikg
ewotCQkJZGV2X2VycihkZXYsCi0JCQkJIkVycm9yOiBUaGUgZ3Bpb3MgcGFyYW1ldGVyIGlzIG1p
c3Npbmcgb3IgaW52YWxpZC5cbiIpOwotCQl9Ci0JCXJldHVybiByZXQ7Ci0JfQotCi0JcmV0dXJu
IDA7Ci19Ci0KIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfaW5pdGlhbF9wb3dlcl9zdGF0ZShz
dHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKIHsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUg
PSBnYmwtPmRldi0+b2Zfbm9kZTsKQEAgLTEwNywzNSArODQsMTggQEAgc3RhdGljIGludCBncGlv
X2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJZ2JsLT5k
ZXYgPSAmcGRldi0+ZGV2OwogCi0JaWYgKHBkZXYtPmRldi5md25vZGUpIHsKLQkJcmV0ID0gZ3Bp
b19iYWNrbGlnaHRfcHJvYmVfZHQocGRldiwgZ2JsKTsKLQkJaWYgKHJldCkKLQkJCXJldHVybiBy
ZXQ7Ci0JfSBlbHNlIGlmIChwZGF0YSkgewotCQkvKgotCQkgKiBMZWdhY3kgcGxhdGZvcm0gZGF0
YSBHUElPIHJldHJpZXZlYWwuIERvIG5vdCBleHBhbmQKLQkJICogdGhlIHVzZSBvZiB0aGlzIGNv
ZGUgcGF0aCwgY3VycmVudGx5IG9ubHkgdXNlZCBieSBvbmUKLQkJICogU0ggYm9hcmQuCi0JCSAq
LwotCQl1bnNpZ25lZCBsb25nIGZsYWdzID0gR1BJT0ZfRElSX09VVDsKLQorCWlmIChwZGF0YSkK
IAkJZ2JsLT5mYmRldiA9IHBkYXRhLT5mYmRldjsKLQkJZ2JsLT5kZWZfdmFsdWUgPSBwZGF0YS0+
ZGVmX3ZhbHVlOwotCQlmbGFncyB8PSBnYmwtPmRlZl92YWx1ZSA/IEdQSU9GX0lOSVRfSElHSCA6
IEdQSU9GX0lOSVRfTE9XOwotCi0JCXJldCA9IGRldm1fZ3Bpb19yZXF1ZXN0X29uZShnYmwtPmRl
diwgcGRhdGEtPmdwaW8sIGZsYWdzLAotCQkJCQkgICAgcGRhdGEgPyBwZGF0YS0+bmFtZSA6ICJi
YWNrbGlnaHQiKTsKLQkJaWYgKHJldCA8IDApIHsKLQkJCWRldl9lcnIoJnBkZXYtPmRldiwgInVu
YWJsZSB0byByZXF1ZXN0IEdQSU9cbiIpOwotCQkJcmV0dXJuIHJldDsKLQkJfQotCQlnYmwtPmdw
aW9kID0gZ3Bpb190b19kZXNjKHBkYXRhLT5ncGlvKTsKLQkJaWYgKCFnYmwtPmdwaW9kKQotCQkJ
cmV0dXJuIC1FSU5WQUw7Ci0JfSBlbHNlIHsKLQkJZGV2X2VycigmcGRldi0+ZGV2LAotCQkJImZh
aWxlZCB0byBmaW5kIHBsYXRmb3JtIGRhdGEgb3IgZGV2aWNlIHRyZWUgbm9kZS5cbiIpOwotCQly
ZXR1cm4gLUVOT0RFVjsKKworCWdibC0+ZGVmX3ZhbHVlID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRf
Ym9vbCgmcGRldi0+ZGV2LCAiZGVmYXVsdC1vbiIpOworCisJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bp
b2RfZ2V0KCZwZGV2LT5kZXYsIE5VTEwsIEdQSU9EX0FTSVMpOworCWlmIChJU19FUlIoZ2JsLT5n
cGlvZCkpIHsKKwkJcmV0ID0gUFRSX0VSUihnYmwtPmdwaW9kKTsKKwkJaWYgKHJldCAhPSAtRVBS
T0JFX0RFRkVSKQorCQkJZGV2X2VycigmcGRldi0+ZGV2LAorCQkJCSJFcnJvcjogVGhlIGdwaW9z
IHBhcmFtZXRlciBpcyBtaXNzaW5nIG9yIGludmFsaWQuXG4iKTsKKwkJcmV0dXJuIHJldDsKIAl9
CiAKIAltZW1zZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
