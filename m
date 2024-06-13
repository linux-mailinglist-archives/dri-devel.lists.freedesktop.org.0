Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627C1906894
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B10D10E9C3;
	Thu, 13 Jun 2024 09:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fKzX+7ec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB8D10E957
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:23:53 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7046e87e9afso439086b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718245433; x=1718850233; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xUjht48J7dsm1Tn0/F91cVOkdnbOXQiOPfNatpSgQlw=;
 b=fKzX+7ecOsvzXkuLY8LlSTO71k4egYthn+9IkHVp1tuCR3NBOlpvMjye34UR5Ok8rI
 nITRD0z+ZoMW8cT4dvrtNLOVNj4IfAgoyOlGgBWJEFe8Xg+fEs/dWcUb3aGy24CnuYEG
 IT6xQ3FT6rjKfepJS620Jbcj+oXtQJxWIqfFuAccRB9HPkkRft0rMYnepb5Gx67oX1BV
 uppjVmZr6nCEI+dE5t504gL1iVY7wDZiHH4T7f/UG3qEFPsZBCeTA63MuBEZf5OUFHGx
 44ljzRVTPkCj0gH5RyUkFGapYoFMQgMO3Zskt28ELWH1GwjU1oN+g26Q4YKOi3AM8DhD
 wt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718245433; x=1718850233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xUjht48J7dsm1Tn0/F91cVOkdnbOXQiOPfNatpSgQlw=;
 b=ktzsC7gE50bQnodXX9pSSlx/yRHHChdpo2ePvb2r6DOadcD2eTsI8tUNHom9/Wa6wV
 R6F3Dbe4qskSwG99I96RMVwnO85e5E5W/dByeFIDlfiG9R+TyQmuUkdYa+m6H+eIVROI
 0yL2kcg0tremKKTNuD6dOsAmSRjO/ky3xrrPu/aLeagyIHi2wUJlRmDWFoXXrWigRabg
 9r8a6/stoSKx8pM5JJBDLjaA3MZZKMKrZVvhwSiHRr7oGVk5jX65O9C6qG1LyQ9+5VE0
 I/YtmTEhrZR64RQFowbUF3YkAJPPPyl53E9Q3GBYqTnJipV++ZaJa4vrep6x+wTUu8Eg
 Wjcg==
X-Gm-Message-State: AOJu0Yx8ppz0tbkjSaE9rFPmGr188D+lh9gXDpFGapeJHeWqncNxOI3s
 pSD4mrwRVtLh9sIwpC1RdUzm+MhOpFmuMWBu9IiTw4G+dpgx8E+K
X-Google-Smtp-Source: AGHT+IE2iwinCeB9k3K5qLgg7zDZ/LK8vlMZbX4WchD+FxeLkqtT++VG9m8KJeat+vEAIEwIKIepIg==
X-Received: by 2002:a05:6a00:1786:b0:705:b2c8:a23 with SMTP id
 d2e1a72fcca58-705bcdcc62bmr4052829b3a.5.1718245433170; 
 Wed, 12 Jun 2024 19:23:53 -0700 (PDT)
Received: from FLYINGPENG-MB1.tencent.com ([103.7.29.30])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb71222sm258080b3a.170.2024.06.12.19.23.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Jun 2024 19:23:52 -0700 (PDT)
From: flyingpenghao@gmail.com
X-Google-Original-From: flyingpeng@tencent.com
To: airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Peng Hao <flyingpeng@tencent.com>
Subject: [PATCH] i915: increase frame warning limit in intel_workaround when
 using KASAN or KCSAN
Date: Thu, 13 Jun 2024 10:23:43 +0800
Message-Id: <20240613022343.49254-1-flyingpeng@tencent.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jun 2024 09:26:31 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Peng Hao <flyingpeng@tencent.com>

When building kernel with clang, which will typically
have sanitizers enabled, there is a warning about a large stack frame.

drivers/gpu/drm/i915/gt/intel_workarounds.c:3044:6: error: stack frame size (5176)
exceeds limit (2048) in 'intel_engine_init_workarounds' [-Werror,-Wframe-larger-than]
void intel_engine_init_workarounds(struct intel_engine_cs *engine)
     ^
128/5176 (2.47%) spills, 5048/5176 (97.53%) variables

so increase the limit for configurations that have KASAN or KCSAN enabled for not
breaking the majority of builds.

Signed-off-by: Peng Hao <flyingpeng@tencent.com>
---
 drivers/gpu/drm/i915/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index fba73c38e235..884e2f010bdd 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -36,7 +36,11 @@ subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 CFLAGS_i915_pci.o = -Wno-override-init
 CFLAGS_display/intel_display_device.o = -Wno-override-init
 CFLAGS_display/intel_fbdev.o = -Wno-override-init
-
+ifneq ($(CONFIG_FRAME_WARN),0)
+ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
+CFLAGS_gt/intel_workarounds.o = -Wframe-larger-than=5272
+endif
+endif
 # Support compiling the display code separately for both i915 and xe
 # drivers. Define I915 when building i915.
 subdir-ccflags-y += -DI915
-- 
2.27.0

