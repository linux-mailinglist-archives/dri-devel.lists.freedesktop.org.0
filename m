Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6A2074B0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 15:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B346EB4E;
	Wed, 24 Jun 2020 13:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA726EB61
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:36:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 22so2356320wmg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CIxynmvYWdccitkAHy6KD/MJFkhEsX9yHQ5P8H6zA7E=;
 b=vKGt9NgtnC5Fq0R+fiTFi0z7pqZ/e/J9Ujph8lBXPTZyXYIwDuuABxtzMIiAme+oth
 RDvPlQ1KvFHaSYDMfDM7AlHpdSpzbw2TAQg3jHBMmonirmFrPF2n/U+cv8QLLtm6B1Sr
 O19O3aIBvZZb0Hu8GiuI4dipY2thlf3y/gy4QT1WEqW6Wpve3h/WyLSPqiFhNtLuPiGf
 XedVRo6Gs3ti1dtLHgsGYGxWpLMkrHZpH9TR4JhP12m+G9CIDFoKlVPPy824nWvqwEE8
 Qd3gC7afndL91zbyZrwTsRwex0LPl6HeK3tiGnh9w6Tb2X852y3PFSMDBgaHnCRHxyPe
 ubkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CIxynmvYWdccitkAHy6KD/MJFkhEsX9yHQ5P8H6zA7E=;
 b=i86SrmYTtNt3RS7z/f/73SFTVWxLMqq6TZtbLpmi4Xyygj0P6FSM2LHpQUhyNZ+s3T
 qIDFWt1e//9inlOqh+pv1DMEMxdAxNnmp3iLD06G+jRYR8f8PnrIrlVCnCf+k2UsZ7f9
 ZEw6ENu2fMcv54RITKVghozCckMznYU/1p9+cztidGHD/eqBCMT9USznLCgrS19QretD
 oeDPCrOXHmC4LliEABn6Tac4DK5O6VB9YnRs/l6xNsi8SQImVjMlaqMRrFLKVT985fcB
 r1HO9+ema4JhAbR2NNw3g/A33ZiMFyukk1cgeb0dV3Xu0ytRhBkw7AwTVrU8oE3/1xd3
 aC5Q==
X-Gm-Message-State: AOAM533j8PFSpbyimRVqrMgtUlDYUvdZt6naX3K1+zVDeHDhYenO9Ieh
 iDK7WhYZZdzEGzFAe0tvdsweWl5p
X-Google-Smtp-Source: ABdhPJx9eC/7YPVbqnbrjwjeVo+O5VnSKOdgxLTFt+u6h487DkqJfDvaxsR34g9svq2WkZ1MwulKdg==
X-Received: by 2002:a1c:9ac2:: with SMTP id c185mr19141572wme.24.1593005760809; 
 Wed, 24 Jun 2020 06:36:00 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c15c:78bc:8f52:920c])
 by smtp.gmail.com with ESMTPSA id c6sm7762862wma.15.2020.06.24.06.36.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 06:36:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: make TT creation purely optional
Date: Wed, 24 Jun 2020 15:35:58 +0200
Message-Id: <20200624133558.1758-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624133558.1758-1-christian.koenig@amd.com>
References: <20200624133558.1758-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugb25seSBuZWVkIHRoZSBwYWdlIGFycmF5IHdoZW4gdGhlIEJPIGlzIGFib3V0IHRvIGJlIGFj
Y2Vzc2VkLgoKU28gbm90IG9ubHkgcG9wdWxhdGUsIGJ1dCBhbHNvIGNyZWF0ZSBpdCBvbiBkZW1h
bmQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAgICAgIHwgMjYgKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8
ICA5ICsrKysrKystLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyAgIHwgIDUgKysr
KysKIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMKaW5kZXggMTVmOWIxOWZhMDBkLi4wZTBhOWRhZGYzZWQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwpAQCAtNjY3LDEzICs2NjcsOCBAQCBzdGF0aWMgaW50IHR0bV9ib19ldmljdChz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXBsYWNlbWVudC5udW1fYnVzeV9wbGFjZW1l
bnQgPSAwOwogCWJkZXYtPmRyaXZlci0+ZXZpY3RfZmxhZ3MoYm8sICZwbGFjZW1lbnQpOwogCi0J
aWYgKCFwbGFjZW1lbnQubnVtX3BsYWNlbWVudCAmJiAhcGxhY2VtZW50Lm51bV9idXN5X3BsYWNl
bWVudCkgewotCQlyZXQgPSB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhibyk7Ci0JCWlmIChyZXQp
Ci0JCQlyZXR1cm4gcmV0OwotCi0JCXJldHVybiB0dG1fdHRfY3JlYXRlKGJvLCBmYWxzZSk7Ci0J
fQorCWlmICghcGxhY2VtZW50Lm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVudC5udW1fYnVzeV9w
bGFjZW1lbnQpCisJCXJldHVybiB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhibyk7CiAKIAlldmlj
dF9tZW0gPSBiby0+bWVtOwogCWV2aWN0X21lbS5tbV9ub2RlID0gTlVMTDsKQEAgLTEyMDAsMTMg
KzExOTUsOCBAQCBpbnQgdHRtX2JvX3ZhbGlkYXRlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sCiAJLyoKIAkgKiBSZW1vdmUgdGhlIGJhY2tpbmcgc3RvcmUgaWYgbm8gcGxhY2VtZW50IGlz
IGdpdmVuLgogCSAqLwotCWlmICghcGxhY2VtZW50LT5udW1fcGxhY2VtZW50ICYmICFwbGFjZW1l
bnQtPm51bV9idXN5X3BsYWNlbWVudCkgewotCQlyZXQgPSB0dG1fYm9fcGlwZWxpbmVfZ3V0dGlu
Zyhibyk7Ci0JCWlmIChyZXQpCi0JCQlyZXR1cm4gcmV0OwotCi0JCXJldHVybiB0dG1fdHRfY3Jl
YXRlKGJvLCBmYWxzZSk7Ci0JfQorCWlmICghcGxhY2VtZW50LT5udW1fcGxhY2VtZW50ICYmICFw
bGFjZW1lbnQtPm51bV9idXN5X3BsYWNlbWVudCkKKwkJcmV0dXJuIHR0bV9ib19waXBlbGluZV9n
dXR0aW5nKGJvKTsKIAogCS8qCiAJICogQ2hlY2sgd2hldGhlciB3ZSBuZWVkIHRvIG1vdmUgYnVm
ZmVyLgpAQCAtMTIyMywxNCArMTIxMyw2IEBAIGludCB0dG1fYm9fdmFsaWRhdGUoc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIAkJdHRtX2ZsYWdfbWFza2VkKCZiby0+bWVtLnBsYWNlbWVu
dCwgbmV3X2ZsYWdzLAogCQkJCX5UVE1fUExfTUFTS19NRU1UWVBFKTsKIAl9Ci0JLyoKLQkgKiBX
ZSBtaWdodCBuZWVkIHRvIGFkZCBhIFRUTS4KLQkgKi8KLQlpZiAoYm8tPm1lbS5tZW1fdHlwZSA9
PSBUVE1fUExfU1lTVEVNICYmIGJvLT50dG0gPT0gTlVMTCkgewotCQlyZXQgPSB0dG1fdHRfY3Jl
YXRlKGJvLCB0cnVlKTsKLQkJaWYgKHJldCkKLQkJCXJldHVybiByZXQ7Ci0JfQogCXJldHVybiAw
OwogfQogRVhQT1JUX1NZTUJPTCh0dG1fYm9fdmFsaWRhdGUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jCmluZGV4IDUyZDJiNzFmMTU4OC4uZjg0MTRmODIwMzUwIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdXRpbC5jCkBAIC01ODAsMTIgKzU4MCwxNyBAQCBzdGF0aWMgaW50IHR0bV9ib19rbWFw
X3R0bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkuaW50ZXJydXB0aWJsZSA9IGZh
bHNlLAogCQkubm9fd2FpdF9ncHUgPSBmYWxzZQogCX07Ci0Jc3RydWN0IHR0bV90dCAqdHRtID0g
Ym8tPnR0bTsKKwlzdHJ1Y3QgdHRtX3R0ICp0dG07CiAJcGdwcm90X3QgcHJvdDsKIAlpbnQgcmV0
OwogCi0JQlVHX09OKCF0dG0pOworCWlmICghYm8tPnR0bSkgeworCQlyZXQgPSB0dG1fdHRfY3Jl
YXRlKGJvLCB0cnVlKTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisJfQogCisJdHRtID0g
Ym8tPnR0bTsKIAlyZXQgPSB0dG1fdHRfcG9wdWxhdGUodHRtLCAmY3R4KTsKIAlpZiAocmV0KQog
CQlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0u
YyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggMGFkMzBiMTEyOTgyLi5i
ZGZlZDY3MjVkNmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAtMzQ5LDYgKzM0OSwxMSBA
QCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZt
ZiwKIAogCQl9OwogCisJCWlmICghYm8tPnR0bSAmJiB0dG1fdHRfY3JlYXRlKGJvLCB0cnVlKSkg
eworCQkJcmV0ID0gVk1fRkFVTFRfT09NOworCQkJZ290byBvdXRfaW9fdW5sb2NrOworCQl9CisK
IAkJdHRtID0gYm8tPnR0bTsKIAkJaWYgKHR0bV90dF9wb3B1bGF0ZShiby0+dHRtLCAmY3R4KSkg
ewogCQkJcmV0ID0gVk1fRkFVTFRfT09NOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
