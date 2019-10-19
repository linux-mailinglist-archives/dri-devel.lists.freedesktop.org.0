Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D47DDDB9F
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DAB89CB2;
	Sun, 20 Oct 2019 00:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C290489E98
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 08:36:17 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o18so8510049wrv.13
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 01:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ksGbh2X5I7ivactCI4jvvNOH5FLCJouedGn4qvIRcNU=;
 b=STckBBShsnCU1t/2YRh3uuUODePVw5DOfPLMuIREtN3Pf1AKmusnh+N4o/wjJ5LdRz
 724bMLlW5TDX5jazDzosuTUVMsbxgpYD9f9XtHSi1o9pJ5n7v6E0ItqSK1d0CNp8ywqC
 zRGSkzi81YezTyfWvU68foK7N2Hwdu2qc5PO49I4IvgHeFt2oMphTVBrKcXfrnc7M88n
 x87FYiYg+BmTJjf/wQJqdFOHz2sqe2xWmDGaV46PScQpBDCGjI4mZh8EXGHo10ZgGe77
 ztf2glschyk2uRv1QnzB+evBlkb8zpqQAmcdfTAXRP+bDCs1QUpHV3LzHIbwZu3AKHGF
 BIRw==
X-Gm-Message-State: APjAAAXjyS8Qixs1VnHaJHg7M4f2K6knAYu2mYh+Px2tsH857Iip/49V
 prIidT85MMmr+OseOA0Pqor+4g==
X-Google-Smtp-Source: APXvYqzhnMfMaC2te5kIWP+ytu4oY/8aZLqHAo+n+DgYWHtp3A8jMe6Heme4rvVnO3syXrWNgDgWzQ==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr441610wrx.254.1571474176300;
 Sat, 19 Oct 2019 01:36:16 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 01:36:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 5/9] backlight: gpio: simplify the platform data handling
Date: Sat, 19 Oct 2019 10:35:52 +0200
Message-Id: <20191019083556.19466-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ksGbh2X5I7ivactCI4jvvNOH5FLCJouedGn4qvIRcNU=;
 b=qeOCviH9003fSdmW3/WDVHuU60mlmScEI6hXW5V2tWsOYH2Z4L87RI3RE1zmNsjFpz
 HU/WC9cjHVDL0FKV3NBNOJIKPKlaNzplvhQ0GWgwxpCJkm2beIaNXRkvTzCIPiO5dOhI
 qP1saqHI/GypMHBl7SCYCSGsxJD3CTqvrHoRgxMpibdKCppYCOa2+xrnocMVE+7bRgHZ
 b4NvHCz0m/hig86Pi2rwAIiHwPjXrj7PdZQLDxWmXA8QZihX0I5T92Gla+rWCWCScrpC
 WfjxCm5QKFuvKG62W/GiP41uYibEfNhmWh/7WQrePCdGYVmbtl5/1+HmURyjDw+EHdKK
 obtQ==
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
LmMKaW5kZXggYTM2YWMzYTQ1YjgxLi5jODI5YjgyZjUzNzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwpAQCAtNiw3ICs2LDYgQEAKICNpbmNsdWRlIDxsaW51eC9i
YWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KICNpbmNsdWRlIDxsaW51eC9mYi5o
PgotI2luY2x1ZGUgPGxpbnV4L2dwaW8uaD4gLyogT25seSBmb3IgbGVnYWN5IHN1cHBvcnQgKi8K
ICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvaW5pdC5o
PgogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgpAQCAtNjEsMjggKzYwLDYgQEAgc3RhdGljIGNv
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
PSBnYmwtPmRldi0+b2Zfbm9kZTsKQEAgLTExNCwzNSArOTEsMTggQEAgc3RhdGljIGludCBncGlv
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
