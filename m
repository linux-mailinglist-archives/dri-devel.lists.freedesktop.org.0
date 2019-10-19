Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB4BDDBA1
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB5389CB9;
	Sun, 20 Oct 2019 00:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEF689F2D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 08:36:22 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id i16so8366109wmd.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 01:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+aYo/jE0l+r2VpUneeIaMs1HWjXHH9okkuy6GJ4hUcw=;
 b=QorKHs8fZPKlSk22EQplhL9TSYJ7vzZCWXrhHd88QA8A49cAmjM13JmZjsxDi6Z33B
 Nj/e0eg9EzyFsb4gbXes/5nCMthXV4JoOScNdEA2J92IAhqj2lwGm4CXixqcx3+S/LH6
 ojH5yoKm451pw4AoNmmIj8mW1xSiAVSYYbmzEjdnCg9lMumLMeJdoMHj4yLmlXi7ZJlp
 pbHL6R0s3jUFVga2Qjo4dMzPEJ5mFpxEGUmwTZXLstvjd5BC/gIN4dD5Ztya8N6jfxrI
 GPVnIHg16UjOTrprZaM0y1nC/8AMZllnFBMXzxYjn5qYcMOrQ+R58LtnCbs8sOs3Oxtz
 iihw==
X-Gm-Message-State: APjAAAVqE8zlvoP5lk+VRvKRtv054IsE8Cn5EuGGNXUoD9vOtVN6SmP4
 ykP6pUZKyC90gd3IDJJtv1hCTWiBtIc=
X-Google-Smtp-Source: APXvYqwmPVh7r2j/5vnVETV3Itb96Hdk3RmxzyJeWRMyIuLuB2/Jd+9kynJT4aIzf2BZC4ibMUZKdA==
X-Received: by 2002:a1c:9894:: with SMTP id a142mr10577174wme.70.1571474180785; 
 Sat, 19 Oct 2019 01:36:20 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 01:36:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 8/9] backlight: gpio: use a helper variable for &pdev->dev
Date: Sat, 19 Oct 2019 10:35:55 +0200
Message-Id: <20191019083556.19466-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+aYo/jE0l+r2VpUneeIaMs1HWjXHH9okkuy6GJ4hUcw=;
 b=h0zJaikzGMrQw/8lBb8sYuz2WDIJK2djdadS0yQaFn8WT5woxc5FUsuVZG+wAXttYG
 iHwMNTLMjhuKALsd3KJvXMCsxUdR+J58mQ6O1+I8jBn+8yDzdtEkwgPtbZKE9jUa3qLF
 UOlhDeSMehnwZiRaWSDC2KjDp6B3UEMLcX/BO//N3Odg99NHuaYUVRLmkJceoGeVxIoD
 4op/vdrRCqyx9zBi0qM+4v1vUKsvdAxXa5lzG28v5SviLf1vGhNZvTamx8PZkKA5Momy
 qyDXuhvg2Hn2smrWGwoY6GH+GwXdsPfjHPTETa4xb6YommzinQgnvlZmWP4hg0P6vzat
 +Png==
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
cnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBE
YW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTog
QW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyB8IDIzICsrKysrKysrKysr
LS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGln
aHQuYyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMKaW5kZXggYzgy
OWI4MmY1MzcyLi43YjQxMWY2ZWUxNWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L2dwaW9fYmFja2xpZ2h0LmMKKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19i
YWNrbGlnaHQuYwpAQCAtNzgsMjkgKzc4LDI5IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRf
aW5pdGlhbF9wb3dlcl9zdGF0ZShzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibCkKIAogc3RhdGlj
IGludCBncGlvX2JhY2tsaWdodF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewotCXN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9Ci0JCWRldl9n
ZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7CisJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRl
djsKKwlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZvcm1fZGF0YSAqcGRhdGEgPSBkZXZfZ2V0
X3BsYXRkYXRhKGRldik7CiAJc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVzIHByb3BzOwogCXN0
cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibDsKIAlzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHQgKmdibDsK
IAlpbnQgcmV0LCBpbml0X2JyaWdodG5lc3M7CiAKLQlnYmwgPSBkZXZtX2t6YWxsb2MoJnBkZXYt
PmRldiwgc2l6ZW9mKCpnYmwpLCBHRlBfS0VSTkVMKTsKKwlnYmwgPSBkZXZtX2t6YWxsb2MoZGV2
LCBzaXplb2YoKmdibCksIEdGUF9LRVJORUwpOwogCWlmIChnYmwgPT0gTlVMTCkKIAkJcmV0dXJu
IC1FTk9NRU07CiAKLQlnYmwtPmRldiA9ICZwZGV2LT5kZXY7CisJZ2JsLT5kZXYgPSBkZXY7CiAK
IAlpZiAocGRhdGEpCiAJCWdibC0+ZmJkZXYgPSBwZGF0YS0+ZmJkZXY7CiAKLQlnYmwtPmRlZl92
YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woJnBkZXYtPmRldiwgImRlZmF1bHQtb24i
KTsKKwlnYmwtPmRlZl92YWx1ZSA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LCAiZGVm
YXVsdC1vbiIpOwogCi0JZ2JsLT5ncGlvZCA9IGRldm1fZ3Bpb2RfZ2V0KCZwZGV2LT5kZXYsIE5V
TEwsIEdQSU9EX0FTSVMpOworCWdibC0+Z3Bpb2QgPSBkZXZtX2dwaW9kX2dldChkZXYsIE5VTEws
IEdQSU9EX0FTSVMpOwogCWlmIChJU19FUlIoZ2JsLT5ncGlvZCkpIHsKIAkJcmV0ID0gUFRSX0VS
UihnYmwtPmdwaW9kKTsKIAkJaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQotCQkJZGV2X2Vycigm
cGRldi0+ZGV2LAorCQkJZGV2X2VycihkZXYsCiAJCQkJIkVycm9yOiBUaGUgZ3Bpb3MgcGFyYW1l
dGVyIGlzIG1pc3Npbmcgb3IgaW52YWxpZC5cbiIpOwogCQlyZXR1cm4gcmV0OwogCX0KQEAgLTEw
OCwxMSArMTA4LDEwIEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIAltZW1zZXQoJnByb3BzLCAwLCBzaXplb2YocHJvcHMpKTsK
IAlwcm9wcy50eXBlID0gQkFDS0xJR0hUX1JBVzsKIAlwcm9wcy5tYXhfYnJpZ2h0bmVzcyA9IDE7
Ci0JYmwgPSBkZXZtX2JhY2tsaWdodF9kZXZpY2VfcmVnaXN0ZXIoJnBkZXYtPmRldiwgZGV2X25h
bWUoJnBkZXYtPmRldiksCi0JCQkJCSZwZGV2LT5kZXYsIGdibCwgJmdwaW9fYmFja2xpZ2h0X29w
cywKLQkJCQkJJnByb3BzKTsKKwlibCA9IGRldm1fYmFja2xpZ2h0X2RldmljZV9yZWdpc3Rlcihk
ZXYsIGRldl9uYW1lKGRldiksIGRldiwgZ2JsLAorCQkJCQkgICAgJmdwaW9fYmFja2xpZ2h0X29w
cywgJnByb3BzKTsKIAlpZiAoSVNfRVJSKGJsKSkgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJm
YWlsZWQgdG8gcmVnaXN0ZXIgYmFja2xpZ2h0XG4iKTsKKwkJZGV2X2VycihkZXYsICJmYWlsZWQg
dG8gcmVnaXN0ZXIgYmFja2xpZ2h0XG4iKTsKIAkJcmV0dXJuIFBUUl9FUlIoYmwpOwogCX0KIApA
QCAtMTIyLDcgKzEyMSw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpbml0X2JyaWdodG5lc3MgPSBncGlvX2JhY2tsaWdo
dF9nZXRfY3Vycl9icmlnaHRuZXNzKGJsKTsKIAlyZXQgPSBncGlvZF9kaXJlY3Rpb25fb3V0cHV0
KGdibC0+Z3Bpb2QsIGluaXRfYnJpZ2h0bmVzcyk7CiAJaWYgKHJldCkgewotCQlkZXZfZXJyKCZw
ZGV2LT5kZXYsICJmYWlsZWQgdG8gc2V0IGluaXRpYWwgYnJpZ2h0bmVzc1xuIik7CisJCWRldl9l
cnIoZGV2LCAiZmFpbGVkIHRvIHNldCBpbml0aWFsIGJyaWdodG5lc3NcbiIpOwogCQlyZXR1cm4g
cmV0OwogCX0KIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
