Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5495E288C16
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 17:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6366ED09;
	Fri,  9 Oct 2020 15:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7003E6ED09
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 15:03:48 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id c22so13578857ejx.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MkTgctKmN/+akcDLdg3dMFFDd8/FeV1m0XEzLiveir0=;
 b=AGNyrdR7ovbvwJNKv5ShYQCGvaCPWMmDRaTW8qFyGws/zj5z3jnoqEBR9M1d8zZE9Q
 jAk6GE/rpLdeexJkeXjFnem3hWHuZIeIlIu2oYCnFR9FljYxFEIImO4DFZPcYp3a/IJU
 ksXRHC/0Glzu1uQnao8735fyHT/dBdhu4m5EMqDOtHJ5GcjNcBxeNi09cFjne+MbmsCR
 up0c37ZFeDZEzWeWAUHS3G0wM2twAG54Nn5vszFVqfa/YipqiiaAOO9t9Xgck5CQP6gc
 TmIX6Pbg9w3ySpPvLK8s77mld/oQKFhR9HY9wQFxzrvQdE6DYWu3dHcS2m9u47vqcESC
 ncMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MkTgctKmN/+akcDLdg3dMFFDd8/FeV1m0XEzLiveir0=;
 b=pJjlqx5V2dWNRL5dLXjZfnj/y2WKV1Bjp6+HOg4RZ8h+S3FhjgGkHzZL0q/8uKK3h/
 GpEMJSwloavicREWN5kTcQ++4ezKSxU1KqSx93EgHrP4z1Bl75TagaZnH/sl0YIfTvvA
 T3g3L46dO9xtlxV9ymJP9Pc1dC9kc9zVrDveeOYiONEkirCPK2GTD8vHVex5jcuM6Cja
 UvUXzmUix2cygBd17q9IeyWMHIjJxoDqWW5jZ/q8pK/WxhsOIEBctMt40JByEknxB/Ls
 t4Z2oggXw3KkJko5+s/FEHR0gOmjLCU1TyUCXnEA1kcwJb8BwHNkziEh0a1CcnRl0PDb
 egiw==
X-Gm-Message-State: AOAM531a0hbNex7zfnp0ODNHdRSGxeapN37HUAZvhSUiJvD3qsAI0JeO
 CsV1UXGInudaNzhV1PmQ0ZU=
X-Google-Smtp-Source: ABdhPJxX/Ju3hIyvLL3zSpMfzkxoIFpTpsg2eOHcQ1zbkD40IYw/NBRbhJgYcsG8QXE4hPf8JNVcAA==
X-Received: by 2002:a17:906:11d3:: with SMTP id
 o19mr12363058eja.287.1602255827107; 
 Fri, 09 Oct 2020 08:03:47 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:65f3:51d4:50d0:15b0])
 by smtp.gmail.com with ESMTPSA id v14sm789364edy.68.2020.10.09.08.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 08:03:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk, airlied@redhat.com,
 akpm@linux-foundation.org, daniel@ffwll.ch, sumit.semwal@linaro.org,
 willy@infradead.org, jhubbard@nvidia.com, jgg@ziepe.ca
Subject: [PATCH 3/6] drm/radeon: stop using pages with
 drm_prime_sg_to_page_addr_arrays
Date: Fri,  9 Oct 2020 17:03:39 +0200
Message-Id: <20201009150342.1979-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201009150342.1979-1-christian.koenig@amd.com>
References: <20201009150342.1979-1-christian.koenig@amd.com>
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

VGhpcyBpcyBkZXByZWNhdGVkLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X3R0bS5jIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
dHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwppbmRleCA2M2UzOGIw
NWE1YmMuLjRiOTJjZGJjZDI5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKQEAg
LTQ3NCw4ICs0NzQsOCBAQCBzdGF0aWMgaW50IHJhZGVvbl90dG1fdHRfcGluX3VzZXJwdHIoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fdHQgKgogCWlmIChyKQogCQlnb3Rv
IHJlbGVhc2Vfc2c7CiAKLQlkcm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0tPnNn
LCB0dG0tPnBhZ2VzLAotCQkJCQkgZ3R0LT50dG0uZG1hX2FkZHJlc3MsIHR0bS0+bnVtX3BhZ2Vz
KTsKKwlkcm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0tPnNnLCBOVUxMLCBndHQt
PnR0bS5kbWFfYWRkcmVzcywKKwkJCQkJIHR0bS0+bnVtX3BhZ2VzKTsKIAogCXJldHVybiAwOwog
CkBAIC02NDIsOCArNjQyLDkgQEAgc3RhdGljIGludCByYWRlb25fdHRtX3R0X3BvcHVsYXRlKHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCX0KIAogCWlmIChzbGF2ZSAmJiB0dG0tPnNnKSB7
Ci0JCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2csIHR0bS0+cGFnZXMs
Ci0JCQkJCQkgZ3R0LT50dG0uZG1hX2FkZHJlc3MsIHR0bS0+bnVtX3BhZ2VzKTsKKwkJZHJtX3By
aW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXModHRtLT5zZywgTlVMTCwKKwkJCQkJCSBndHQtPnR0
bS5kbWFfYWRkcmVzcywKKwkJCQkJCSB0dG0tPm51bV9wYWdlcyk7CiAJCXR0bV90dF9zZXRfcG9w
dWxhdGVkKHR0bSk7CiAJCXJldHVybiAwOwogCX0KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
