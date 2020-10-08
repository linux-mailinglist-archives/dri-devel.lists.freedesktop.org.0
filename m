Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55828733E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 13:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787F06E364;
	Thu,  8 Oct 2020 11:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78A06E342
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 11:23:47 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id a3so7520893ejy.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 04:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MkTgctKmN/+akcDLdg3dMFFDd8/FeV1m0XEzLiveir0=;
 b=N72ShT079eXQazlnE4442KsEjcieKGhUZ1afEO0IPorQavbqRU0ZxaG0ZRbxEyqGem
 Zx47TfD8/NAi6oQnUr7c9xV4sr2Q0DfHH0IQWtuJrGMGMWlcNSrD9Vqi3XLo1gbyiyAW
 DP9j8NEPbHN6ejO8Hh3Ike4eC8QhwNR3CK51RSGGTQNvIr6Cny38/8E7l1YYGbh7xtfj
 VfXDQxkNCUpazWHChb3RD62Au5iMbkOGIAv/dqXajlxntP8EdKjWnrjIth9+YtsGYOzo
 x80XrVVy20COvcFAhhLqdMyinw9dPHAw8BaZ5cq0nj8eZKj7sGLu9I04HzAvT1pG5zPs
 jorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MkTgctKmN/+akcDLdg3dMFFDd8/FeV1m0XEzLiveir0=;
 b=k0mi6JhlUz86l99HFexJijDSM56B4rRuo/CtD9eHioXe9fITLQWsxAwWxhHYu/V/WJ
 ArbRTmNxRogHjsPlkA8b8AnNTVQQ3eXJPPRsqdmIiz7W3/hLdFnqzAF8KQ8hJ4ExtlJC
 xXG0hu5Xbrh1gBXR8bR9ZVc3zuU9U760pIN7MxYcFW8oSdUKZ9PL2bhKxlXXYT0ivDf5
 kd19qb+fqupzU1MpaIlNb0478TOrnWqxF+kkogYkYjquhirqkpuLuJS3GdeWnCdYNUln
 y8acoyfG+4aD4EPQ9PbWnoeLzvxJmvy0ELJyPIfFPGRurhaUVoLP38b+zRP1Df6Jauiv
 ifBg==
X-Gm-Message-State: AOAM533yQxp3iPRmA+OMDElodRM3gKzQb8hH07j35DnIFBD/HBtX+INp
 lOPsqClIgR5Z3XNgS+w+ne4=
X-Google-Smtp-Source: ABdhPJydc6wMYfotM6Ls7zhjsrHFWLvCwnPy4prHIfnBFnQVlWjXOhRunGbHJon/G6KJb7Y66ZUIsg==
X-Received: by 2002:a17:906:7d7:: with SMTP id
 m23mr8424563ejc.47.1602156226681; 
 Thu, 08 Oct 2020 04:23:46 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4c64:a9a0:5e0:905a])
 by smtp.gmail.com with ESMTPSA id i20sm3529030edv.96.2020.10.08.04.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 04:23:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk, airlied@redhat.com,
 akpm@linux-foundation.org, daniel@ffwll.ch, sumit.semwal@linaro.org
Subject: [PATCH 3/4] drm/radeon: stop using pages with
 drm_prime_sg_to_page_addr_arrays
Date: Thu,  8 Oct 2020 13:23:41 +0200
Message-Id: <20201008112342.9394-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201008112342.9394-1-christian.koenig@amd.com>
References: <20201008112342.9394-1-christian.koenig@amd.com>
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
