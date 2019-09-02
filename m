Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD3A5D02
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B8089A1E;
	Mon,  2 Sep 2019 20:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8467389105
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 12:34:56 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k1so14412491wmi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 05:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BL5f9WSqt28IVM1CG9ys+RYTknuQ0t6Rc6b4s1XAIZ8=;
 b=bggm1ysTSESbNS1dSTXcn1LwSIe0Sv9wPjiuFquIsLcYEXEOHDVqHxzKtwJIBcWt3l
 sWW50Jb+ktdIUxRU9WPt6IBJAQzv3nxWBZl03tcI7UMtShKPShWg0SbPKa2DAmU9+mJI
 E+VK7+RToIth0Xt8y27UjBAdLKUePSgVdQyOyjWveqnDgVYPy9v6gyh/p3YBhHM+3ANR
 AMd33lQ5BJqMkvdryIR2JiVtCpn2VXwXYddRWkhTGmnAWMFfjAXpslCsVw5znhT0xg7Y
 1lTHoTpCKyIC48lWkcbsXtUM0msV6mDMNAae3hkLDO0vGnIPj4wbK5AaxpRtrtji3GNJ
 L/Xw==
X-Gm-Message-State: APjAAAV5KLCtdwDk3lDOZh/gdvPiFTyVN2HkxANeWGiHZJ0Xn3C1cNGg
 VNL0ciHZQCUmVH854e3vMChlfw==
X-Google-Smtp-Source: APXvYqw1vz/mtFNdoDGOV50/DImERrrRBV3tvDbaoTe+05TZiaB3djOsEA+nb+UY0M6oucgCg7AZUQ==
X-Received: by 2002:a1c:2b85:: with SMTP id r127mr19669113wmr.30.1567427695064; 
 Mon, 02 Sep 2019 05:34:55 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id k9sm22645759wrd.7.2019.09.02.05.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 05:34:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [RESEND PATCH v3 2/7] backlight: gpio: simplify the platform data
 handling
Date: Mon,  2 Sep 2019 14:34:39 +0200
Message-Id: <20190902123444.19924-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190902123444.19924-1-brgl@bgdev.pl>
References: <20190902123444.19924-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BL5f9WSqt28IVM1CG9ys+RYTknuQ0t6Rc6b4s1XAIZ8=;
 b=rmo8A0Zr2T09cfLgGzsV0Bv0DY26U1tZoxBktgQg61gBBmcsgf7oBMC/JOqQUap7Vr
 Uxva4NKecBHq/4m6i7sdpbgu9CI/K679poVQjtDoeCzgT5Xwq3/1QcXUFf45+7bqRLq0
 5CWLZLS4Vo1G3nUG1Xy9F9n9c4fynoLJZ/gE2KF3ZzwPFqw+sqwr/oBrrmloN/rnvkYi
 FkiGssbjvpCHYHWKU7uc2oxFkuZoOnZSh0Z6GOzJDmo8qYyOOEE2egU0TFImJ0P2qM7o
 eJaMEOjRkIzClQMCPKD/6LrBRaq8w4DAG5pvwgy+nuK+le1fggH+IeILoFvaKyujzQwV
 Md3A==
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
LmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jIHwgNjQg
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KSwgNTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQv
Z3Bpb19iYWNrbGlnaHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0
LmMKaW5kZXggZTg0ZjMwODdlMjlmLi4wMTI2MjE4NmZhMWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvZ3Bpb19iYWNrbGlnaHQuYwpAQCAtNTUsMzAgKzU1LDYgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBiYWNrbGlnaHRfb3BzIGdwaW9fYmFja2xpZ2h0X29wcyA9IHsKIAkuY2hlY2tfZmIJPSBn
cGlvX2JhY2tsaWdodF9jaGVja19mYiwKIH07CiAKLXN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRf
cHJvYmVfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKLQkJCQkgICBzdHJ1Y3QgZ3Bp
b19iYWNrbGlnaHQgKmdibCkKLXsKLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owot
CWVudW0gZ3Bpb2RfZmxhZ3MgZmxhZ3M7Ci0JaW50IHJldDsKLQotCWdibC0+ZGVmX3ZhbHVlID0g
ZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChkZXYsICJkZWZhdWx0LW9uIik7Ci0JZmxhZ3MgPSBn
YmwtPmRlZl92YWx1ZSA/IEdQSU9EX09VVF9ISUdIIDogR1BJT0RfT1VUX0xPVzsKLQotCWdibC0+
Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldChkZXYsIE5VTEwsIGZsYWdzKTsKLQlpZiAoSVNfRVJSKGdi
bC0+Z3Bpb2QpKSB7Ci0JCXJldCA9IFBUUl9FUlIoZ2JsLT5ncGlvZCk7Ci0KLQkJaWYgKHJldCAh
PSAtRVBST0JFX0RFRkVSKSB7Ci0JCQlkZXZfZXJyKGRldiwKLQkJCQkiRXJyb3I6IFRoZSBncGlv
cyBwYXJhbWV0ZXIgaXMgbWlzc2luZyBvciBpbnZhbGlkLlxuIik7Ci0JCX0KLQkJcmV0dXJuIHJl
dDsKLQl9Ci0KLQlyZXR1cm4gMDsKLX0KLQogc3RhdGljIGludCBncGlvX2JhY2tsaWdodF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBncGlvX2JhY2tsaWdo
dF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9CkBAIC04Niw2ICs2Miw3IEBAIHN0YXRpYyBpbnQgZ3Bp
b19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3Qg
YmFja2xpZ2h0X3Byb3BlcnRpZXMgcHJvcHM7CiAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJs
OwogCXN0cnVjdCBncGlvX2JhY2tsaWdodCAqZ2JsOworCWVudW0gZ3Bpb2RfZmxhZ3MgZmxhZ3M7
CiAJaW50IHJldDsKIAogCWdibCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmdi
bCksIEdGUF9LRVJORUwpOwpAQCAtOTQsMzUgKzcxLDIwIEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNr
bGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWdibC0+ZGV2ID0g
JnBkZXYtPmRldjsKIAotCWlmIChwZGV2LT5kZXYuZndub2RlKSB7Ci0JCXJldCA9IGdwaW9fYmFj
a2xpZ2h0X3Byb2JlX2R0KHBkZXYsIGdibCk7Ci0JCWlmIChyZXQpCi0JCQlyZXR1cm4gcmV0Owot
CX0gZWxzZSBpZiAocGRhdGEpIHsKLQkJLyoKLQkJICogTGVnYWN5IHBsYXRmb3JtIGRhdGEgR1BJ
TyByZXRyaWV2ZWFsLiBEbyBub3QgZXhwYW5kCi0JCSAqIHRoZSB1c2Ugb2YgdGhpcyBjb2RlIHBh
dGgsIGN1cnJlbnRseSBvbmx5IHVzZWQgYnkgb25lCi0JCSAqIFNIIGJvYXJkLgotCQkgKi8KLQkJ
dW5zaWduZWQgbG9uZyBmbGFncyA9IEdQSU9GX0RJUl9PVVQ7Ci0KKwlpZiAocGRhdGEpCiAJCWdi
bC0+ZmJkZXYgPSBwZGF0YS0+ZmJkZXY7Ci0JCWdibC0+ZGVmX3ZhbHVlID0gcGRhdGEtPmRlZl92
YWx1ZTsKLQkJZmxhZ3MgfD0gZ2JsLT5kZWZfdmFsdWUgPyBHUElPRl9JTklUX0hJR0ggOiBHUElP
Rl9JTklUX0xPVzsKLQotCQlyZXQgPSBkZXZtX2dwaW9fcmVxdWVzdF9vbmUoZ2JsLT5kZXYsIHBk
YXRhLT5ncGlvLCBmbGFncywKLQkJCQkJICAgIHBkYXRhID8gcGRhdGEtPm5hbWUgOiAiYmFja2xp
Z2h0Iik7Ci0JCWlmIChyZXQgPCAwKSB7Ci0JCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJ1bmFibGUg
dG8gcmVxdWVzdCBHUElPXG4iKTsKLQkJCXJldHVybiByZXQ7CisKKwlnYmwtPmRlZl92YWx1ZSA9
IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1bHQtb24iKTsKKwlm
bGFncyA9IGdibC0+ZGVmX3ZhbHVlID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOwor
CisJZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KCZwZGV2LT5kZXYsIE5VTEwsIGZsYWdzKTsK
KwlpZiAoSVNfRVJSKGdibC0+Z3Bpb2QpKSB7CisJCXJldCA9IFBUUl9FUlIoZ2JsLT5ncGlvZCk7
CisJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikgeworCQkJZGV2X2VycigmcGRldi0+ZGV2LAor
CQkJCSJFcnJvcjogVGhlIGdwaW9zIHBhcmFtZXRlciBpcyBtaXNzaW5nIG9yIGludmFsaWQuXG4i
KTsKIAkJfQotCQlnYmwtPmdwaW9kID0gZ3Bpb190b19kZXNjKHBkYXRhLT5ncGlvKTsKLQkJaWYg
KCFnYmwtPmdwaW9kKQotCQkJcmV0dXJuIC1FSU5WQUw7Ci0JfSBlbHNlIHsKLQkJZGV2X2Vycigm
cGRldi0+ZGV2LAotCQkJImZhaWxlZCB0byBmaW5kIHBsYXRmb3JtIGRhdGEgb3IgZGV2aWNlIHRy
ZWUgbm9kZS5cbiIpOwotCQlyZXR1cm4gLUVOT0RFVjsKKwkJcmV0dXJuIHJldDsKIAl9CiAKIAlt
ZW1zZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
