Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3288D1E9029
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 11:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4FB6E9C8;
	Sat, 30 May 2020 09:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF3C6E90C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 14:03:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s8so3693660wrt.9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 07:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RwXGTrTSkhfIwmTsFAlwLp31G8dXS8cicMkf9zgOj/A=;
 b=GvVSrVsvM86uEOHuD6a/Cgoc0Fr2OaKCfja3DhluouGDDWpSsF4CjGxXuRUh1EqQLj
 bLCvMXlIYeO714pksvToQBttxtopmn2mgRIk14KMvZmSQOzQ6ciIjkja4RBIcHEBxaDo
 pTfGBEj0aJ1U19aZI8TYHPm4EbfdQmFi8NOMJR3cQCwUsj7At3qVHeCh0GBvHq83jLdF
 1CEXEpSfIZEmu4buwrTgwFCSiQb7GQ+d9v8POSp9551eJJNXJcco8tL/TDk9MPtpA5aY
 7IW/V3YVCwIWGfLt4k6Jb3LpeLng3ZZF0L3Hat2ax2NEIwWivJ0uwYQTbnPvg1QJR9kC
 EHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RwXGTrTSkhfIwmTsFAlwLp31G8dXS8cicMkf9zgOj/A=;
 b=LPA3/Lj1mrh69HNjlD/VVVGbU6scaa4YTb3jLdtOYKZii8sYT7FZV5abIDk2fp/bc3
 l2YxMglWf/A6boI9ExVDMkh1GSs8jUwSOiX1FU5KoxVTQ3MQK6hDql3yyT3xYVk08Yr8
 Noe9Dt4NXF8JCVh+Tc2jcf+giYBsgpW92UMf2/nBPYhR+zNiwYIxb92nYcoB6Ru2SKWy
 XdfPtcroTbq8YR7SoOlppCGGEZLwK9C6lmhGsADizpus5zk5suiF6Np5JwlqDTjwt9wf
 kuP2r1le4jF0K+8sbkj+KbwHvEttZS9tZ8HGuM3u32NWFT0gMS2aQJHgFwx9RWNm2zUT
 qJYA==
X-Gm-Message-State: AOAM530dlSrw6aGdkLbXt0kXrnzXeTHMQsfpTGxT2jt34RO6YIrCB2bl
 BF1/ut0JZCC+lIMpIveZvBKDmmzsEpI=
X-Google-Smtp-Source: ABdhPJxy5LbmVodZhUe6FwuHEakfNuJvHsmJ0XcDapuhsLv3T7SqQf1VEPd5pFN8RIfgUOIh3S29lg==
X-Received: by 2002:adf:9b9e:: with SMTP id d30mr9071909wrc.345.1590761015673; 
 Fri, 29 May 2020 07:03:35 -0700 (PDT)
Received: from localhost.localdomain
 (p200300c58f1f0600dbea65ed0a386805.dip0.t-ipconnect.de.
 [2003:c5:8f1f:600:dbea:65ed:a38:6805])
 by smtp.gmail.com with ESMTPSA id q13sm4900300wro.5.2020.05.29.07.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 07:03:34 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/mm: fix hole size comparison
Date: Fri, 29 May 2020 16:04:01 +0200
Message-Id: <20200529140401.39396-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 May 2020 09:42:14 +0000
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, christian.koenig@amd.com,
 chris@chris-wilson.co.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXM6IDBjZGVhNDQ1NWFjZDM1MGEgKCJkcm0vbW06IG9wdGltaXplIHJiX2hvbGVfYWRkciBy
YnRyZWUgc2VhcmNoIikKClNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1k
LmNvbT4KUmVwb3J0ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21tLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9tbS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jCmluZGV4IGY0Y2Ex
ZmY4MGFmOS4uNjBlOWE5YzkxZTlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21t
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tbS5jCkBAIC00MDcsNyArNDA3LDcgQEAgbmV4
dF9ob2xlX2hpZ2hfYWRkcihzdHJ1Y3QgZHJtX21tX25vZGUgKmVudHJ5LCB1NjQgc2l6ZSkKIAkJ
bGVmdF9ub2RlID0gcmJfZW50cnkobGVmdF9yYl9ub2RlLAogCQkJCSAgICAgc3RydWN0IGRybV9t
bV9ub2RlLCByYl9ob2xlX2FkZHIpOwogCQlpZiAoKGxlZnRfbm9kZS0+c3VidHJlZV9tYXhfaG9s
ZSA8IHNpemUgfHwKLQkJICAgICBlbnRyeS0+c2l6ZSA9PSBlbnRyeS0+c3VidHJlZV9tYXhfaG9s
ZSkgJiYKKwkJICAgICBIT0xFX1NJWkUoZW50cnkpID09IGVudHJ5LT5zdWJ0cmVlX21heF9ob2xl
KSAmJgogCQkgICAgcGFyZW50X3JiX25vZGUgJiYgcGFyZW50X3JiX25vZGUtPnJiX2xlZnQgIT0g
cmJfbm9kZSkKIAkJCXJldHVybiByYl9ob2xlX2FkZHJfdG9fbm9kZShwYXJlbnRfcmJfbm9kZSk7
CiAJfQpAQCAtNDQ3LDcgKzQ0Nyw3IEBAIG5leHRfaG9sZV9sb3dfYWRkcihzdHJ1Y3QgZHJtX21t
X25vZGUgKmVudHJ5LCB1NjQgc2l6ZSkKIAkJcmlnaHRfbm9kZSA9IHJiX2VudHJ5KHJpZ2h0X3Ji
X25vZGUsCiAJCQkJICAgICAgc3RydWN0IGRybV9tbV9ub2RlLCByYl9ob2xlX2FkZHIpOwogCQlp
ZiAoKHJpZ2h0X25vZGUtPnN1YnRyZWVfbWF4X2hvbGUgPCBzaXplIHx8Ci0JCSAgICAgZW50cnkt
PnNpemUgPT0gZW50cnktPnN1YnRyZWVfbWF4X2hvbGUpICYmCisJCSAgICAgSE9MRV9TSVpFKGVu
dHJ5KSA9PSBlbnRyeS0+c3VidHJlZV9tYXhfaG9sZSkgJiYKIAkJICAgIHBhcmVudF9yYl9ub2Rl
ICYmIHBhcmVudF9yYl9ub2RlLT5yYl9yaWdodCAhPSByYl9ub2RlKQogCQkJcmV0dXJuIHJiX2hv
bGVfYWRkcl90b19ub2RlKHBhcmVudF9yYl9ub2RlKTsKIAl9Ci0tIAoyLjI2LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
