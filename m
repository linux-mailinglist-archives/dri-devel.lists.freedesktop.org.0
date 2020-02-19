Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3018B1644C3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 13:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B818D6EBCB;
	Wed, 19 Feb 2020 12:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529BB6E5B2;
 Wed, 19 Feb 2020 12:59:14 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r11so383507wrq.10;
 Wed, 19 Feb 2020 04:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=b9sG/TVUs3caIZcWR+Lmy0efYoTEJOYELaU+bfIHgUY=;
 b=BczVt1wh4yOLL+NES9v6gwV+e7nrjQnzp32Q0cvAzrgUlq1BHY/jBVFW6YH1lHaOS4
 kQ4Zfz2ihORvysfmVySDXrPoeD4x72TIQ5ofaNGJvGnsARiGsDT5Ep7S7k6x/m+UyluQ
 JtJZoUC/XOaTKOTStZ3iLES8rlQnaN1n6hz3yndLdtw7Y/Dg5VctpGIXCgXHYLr2O9qX
 7R6SIUs5YLI2IUFbkL5W9j6F8JI4sU2abcPGHYfXb6aOSv1oWMUXnfnV1FMBMfX2dQEB
 voxDApdjW6RG+5Uun8xrj8YKTrAk/Wku5hesyzb2/UaA0QUJyGtXufvpRy/IVH18KpYK
 flmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b9sG/TVUs3caIZcWR+Lmy0efYoTEJOYELaU+bfIHgUY=;
 b=KSKbyqcl5P7QyZNEt+fWfsWUSNOF3JS6aUJeyezrpy+Y43S9pJ0EwB/XU/1gzCnZko
 4UP6C97ibcob8nBQBVMzI3IJViplWm0EQaP2gJhpuzdSDoQRVBtmomcMGALfRK/dYWuH
 /M+SuCDG0/mmu4Vh8lYeWAznWNtN9PTr9oUELwhTSCnWoTDdoCyYYMmb//UFkBGJc8KW
 oALnIL+uG6Xqn5sKJY9xktxYBUo854iHMYTpo8z7JJQBUaxu8PXcGT7RBl3P+TSfUfEH
 7JzxGh2U7OGM1rdvDAAFHIbnppowcD3XEZ5k8piA18YQIc1ppQmjs7ctuqIuAk2knqPA
 pGdA==
X-Gm-Message-State: APjAAAVvqDdfx/5shOYreOMm5uZZTmCpy9bIOp6pfxowyetAyj25RcvM
 5m/aIMAT2SQAEUCia3Epv1P2Soq2
X-Google-Smtp-Source: APXvYqwom957kiBmODyKGlAOBy2ygX5dnAzUraiYqWa6AE5CXwi1ie+woKdaH2fubFeTbqA1kvR3+A==
X-Received: by 2002:adf:de0b:: with SMTP id b11mr34937028wrm.89.1582117152687; 
 Wed, 19 Feb 2020 04:59:12 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:90ea:9d7:18a3:895e])
 by smtp.gmail.com with ESMTPSA id h2sm3079024wrt.45.2020.02.19.04.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 04:59:12 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [PATCH 2/7] drm/ttm: remove the backing store if no placement is given
Date: Wed, 19 Feb 2020 13:59:05 +0100
Message-Id: <20200219125910.89147-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219125910.89147-1-christian.koenig@amd.com>
References: <20200219125910.89147-1-christian.koenig@amd.com>
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

UGlwZWxpbmUgcmVtb3ZhbCBvZiB0aGUgQk9zIGJhY2tpbmcgc3RvcmUgd2hlbiBubyBwbGFjZW1l
bnQgaXMgZ2l2ZW4KZHVyaW5nIHZhbGlkYXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCAxNTFlZGZkOGRlNzcuLjZkMWU5MWJlOWM3OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMTk2LDYgKzExOTYsMTggQEAgaW50IHR0bV9ib192YWxp
ZGF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXVpbnQzMl90IG5ld19mbGFnczsK
IAogCWRtYV9yZXN2X2Fzc2VydF9oZWxkKGJvLT5iYXNlLnJlc3YpOworCisJLyoKKwkgKiBSZW1v
dmUgdGhlIGJhY2tpbmcgc3RvcmUgaWYgbm8gcGxhY2VtZW50IGlzIGdpdmVuLgorCSAqLworCWlm
ICghcGxhY2VtZW50LT5udW1fcGxhY2VtZW50ICYmICFwbGFjZW1lbnQtPm51bV9idXN5X3BsYWNl
bWVudCkgeworCQlyZXQgPSB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhibyk7CisJCWlmIChyZXQp
CisJCQlyZXR1cm4gcmV0OworCisJCXJldHVybiB0dG1fdHRfY3JlYXRlKGJvLCBmYWxzZSk7CisJ
fQorCiAJLyoKIAkgKiBDaGVjayB3aGV0aGVyIHdlIG5lZWQgdG8gbW92ZSBidWZmZXIuCiAJICov
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
