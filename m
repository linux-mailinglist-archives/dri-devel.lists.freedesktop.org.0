Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C8D2C04
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 16:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385186EB4E;
	Thu, 10 Oct 2019 14:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833006EB4E;
 Thu, 10 Oct 2019 14:03:15 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i76so3751544pgc.0;
 Thu, 10 Oct 2019 07:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IewVY57uz1/Kiphd8vb0bt/QUlZQEPyJi2R//qFblJc=;
 b=Q6C3xkMrmzki73LFWbYOky8/YNEU3oxRAZaGGh7y3lnF0I3hZLfm2Md2dbYhUgYOt6
 hCAMShMyJ589VFa0vWaJja4rRYhWExRmq+9jQweEzUGZC2oFMx8UiYparRF033mxIBZc
 b3U5XyGVgzptxfyTn/O6t65oSvbIVDbRgILFJ1eqo14v2QyQetI+qIDLldCUiPQlQdBZ
 5XVSMKswYTBC0cdX7+3hRDzXZfL5eHILnVRQovp6C+D+Lz367uugx4xpoadkCFHQhvhW
 nyWrXwPXIcQRRdUg6ynXN56xp+gjt7mskDkWmx0l9mLZ+bUQ6B5uS32HRBmH2x2o++Ba
 77tA==
X-Gm-Message-State: APjAAAU8rlIDG7usIxwhvUHPcY+qWn1CYu49MV/a1TnTSoz1mQbOW8WN
 JrgPneDF4y8dH4emvOeb59QJRZd5Bbg=
X-Google-Smtp-Source: APXvYqw/6s0G32k+wU3EgmEOjvkhCtrWEdR/ys/wReF3V2JKGJPv6VOqLvhBkMPgmYoFAEaROt7oQg==
X-Received: by 2002:a17:90a:bc41:: with SMTP id
 t1mr11532426pjv.67.1570716194485; 
 Thu, 10 Oct 2019 07:03:14 -0700 (PDT)
Received: from localhost.localdomain (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 h14sm5523371pfo.15.2019.10.10.07.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 07:03:13 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/3] drm/lima: add __GFP_NOWARN flag to all dma_alloc_wc
Date: Thu, 10 Oct 2019 22:01:52 +0800
Message-Id: <20191010140152.17747-4-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010140152.17747-1-yuq825@gmail.com>
References: <20191010140152.17747-1-yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IewVY57uz1/Kiphd8vb0bt/QUlZQEPyJi2R//qFblJc=;
 b=AGm9LzhsHj2mSPK6XzZPf4a9jdFceo6KmnMxVYg+oNSW1c6xe5QL4/Y/bOIAyModji
 Jy8azHHgcU9MgLazsFHOgraVZGmOtoGMnpawCJHEMZTaRt6swufDRf64wxRRUEV+WkBs
 P/6neGYfzVmr4f/74ilS8E5jd7pSSV1py2gQjV+HfVLwNaUVnydZN7oXpjc8P9x+9hud
 KI76KRYpuBb75PASva77Rjrf6V7j9ufxg7g1ktU3QzzVW921X/IlF3kCARrhS9PQ9Msw
 4oqqOJNxQhvu2MKEy9GzvHUzTCcP97AsrDm1dj5XGgMfZ1PJ+MJDxtcLghWvjdwb8Lwv
 9OgA==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Qiang Yu <yuq825@gmail.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwcmV2ZW50IENNQSBwcmludGluZyBkdW15ICJQRk5zIGJ1c3kiIGluZm8gd2hpY2ggaXMK
Y2F1c2VkIGJ5IGFsbG9jIGZhaWwgcmUtdHJ5IGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBRaWFuZyBZ
dSA8eXVxODI1QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2Rldmlj
ZS5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5jICAgICB8IDQgKystLQog
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9saW1hL2xpbWFfZGV2aWNlLmMKaW5kZXggZTNlMGNhMTEzODJlLi4xOTgyOWI1NDMwMjQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYwpAQCAtMzE0LDcgKzMxNCw3IEBAIGludCBsaW1h
X2RldmljZV9pbml0KHN0cnVjdCBsaW1hX2RldmljZSAqbGRldikKIAkJbGRldi0+dmFfZW5kID0g
TElNQV9WQV9SRVNFUlZFX1NUQVJUOwogCQlsZGV2LT5kbGJ1X2NwdSA9IGRtYV9hbGxvY193YygK
IAkJCWxkZXYtPmRldiwgTElNQV9QQUdFX1NJWkUsCi0JCQkmbGRldi0+ZGxidV9kbWEsIEdGUF9L
RVJORUwpOworCQkJJmxkZXYtPmRsYnVfZG1hLCBHRlBfS0VSTkVMIHwgX19HRlBfTk9XQVJOKTsK
IAkJaWYgKCFsZGV2LT5kbGJ1X2NwdSkgewogCQkJZXJyID0gLUVOT01FTTsKIAkJCWdvdG8gZXJy
X291dDI7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3ZtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbGltYS9saW1hX3ZtLmMKaW5kZXggOGU2OWM0NTQwZThiLi44NDBlMjM1MGQ4
NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfdm0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vbGltYS9saW1hX3ZtLmMKQEAgLTU2LDcgKzU2LDcgQEAgc3RhdGljIGludCBs
aW1hX3ZtX21hcF9wYWdlKHN0cnVjdCBsaW1hX3ZtICp2bSwgZG1hX2FkZHJfdCBwYSwgdTMyIHZh
KQogCiAJCXZtLT5idHNbcGJlXS5jcHUgPSBkbWFfYWxsb2Nfd2MoCiAJCQl2bS0+ZGV2LT5kZXYs
IExJTUFfUEFHRV9TSVpFIDw8IExJTUFfVk1fTlVNX1BUX1BFUl9CVF9TSElGVCwKLQkJCSZ2bS0+
YnRzW3BiZV0uZG1hLCBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7CisJCQkmdm0tPmJ0c1twYmVd
LmRtYSwgR0ZQX0tFUk5FTCB8IF9fR0ZQX05PV0FSTiB8IF9fR0ZQX1pFUk8pOwogCQlpZiAoIXZt
LT5idHNbcGJlXS5jcHUpCiAJCQlyZXR1cm4gLUVOT01FTTsKIApAQCAtMjA4LDcgKzIwOCw3IEBA
IHN0cnVjdCBsaW1hX3ZtICpsaW1hX3ZtX2NyZWF0ZShzdHJ1Y3QgbGltYV9kZXZpY2UgKmRldikK
IAlrcmVmX2luaXQoJnZtLT5yZWZjb3VudCk7CiAKIAl2bS0+cGQuY3B1ID0gZG1hX2FsbG9jX3dj
KGRldi0+ZGV2LCBMSU1BX1BBR0VfU0laRSwgJnZtLT5wZC5kbWEsCi0JCQkJICBHRlBfS0VSTkVM
IHwgX19HRlBfWkVSTyk7CisJCQkJICBHRlBfS0VSTkVMIHwgX19HRlBfTk9XQVJOIHwgX19HRlBf
WkVSTyk7CiAJaWYgKCF2bS0+cGQuY3B1KQogCQlnb3RvIGVycl9vdXQwOwogCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
