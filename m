Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71410487274
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE67113242;
	Fri,  7 Jan 2022 05:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EDC11321F;
 Fri,  7 Jan 2022 05:29:59 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id e8so3768514ilm.13;
 Thu, 06 Jan 2022 21:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KuUpo8N7O6zfCcQlim8LLc328KIOMpVIHmOBAPahhn4=;
 b=bJ/n5Q/dPqC+YFPh92aeruYamwdqsuJZrluEKsrTDhwqmu8Fb4JTaPyRt5ppFFUgkJ
 +naYVaSeN+LIgNQsfRVtctMtWqzkwjq2WzzFqJ2qE/B91Y6WH3a1gVw7PtofKY+9/jKk
 HpuSX9xGFF3YYHcYpHzZkkXHQ8i6RFqifCkt6raVeU7hilf1KPsiARZKkm2pjgnt+fzg
 DtS6h+lnsUno5cNenvFVUBSx745HI3tL0Bbfg2E9KMDsfcvIYLSA4tiaIHUKZzW5Ciw9
 yZH5W9pJ5bVQtZERKqmG6p9llU0RE8hgM4ymHzrKsH5TmcEfxPwjM940iF8HakEwvs60
 amXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KuUpo8N7O6zfCcQlim8LLc328KIOMpVIHmOBAPahhn4=;
 b=wmKIgipcW7xXKFDl3W6OHI47VQwX7TJenqXvlIKTdmie64JPxykH38PcGCzc04R8No
 1eJJyziGfO5MA29VOmzrF+cC8czsL3GqOvE/azkSL5tnRr0Hub8Tg9JgQ1fct/8rN7tU
 dG/K1HGJiLvwW4Wtzy3q4048l9/+FXPjfdeSHcyfmSQ0uVdCiOEc+sh6lTKF2gLXgH2c
 ckkdCUhAyQrKCLM6bQjeRsvgfkvfa7IphQQSvi+js8TQOSIvUaURBqf8vikNWmfebA7V
 jK5MAeghksfdxyMiwPPVlPLbTmgp8FudVZlGtZmluNJNurMQSGmKq8wtBeQKVsZVrDqY
 qHRg==
X-Gm-Message-State: AOAM530UDKxUwH70hI60dlKeWT2pq7kpApK0GK3adNxT8rzyWI9QHAKa
 7yTEV4CLA6YVnp3eoc63chs=
X-Google-Smtp-Source: ABdhPJy2rvSWBjxrv0s0L+Dd40rEcbOGWkDTDS7wEKky+oaA8kMgIOWAJ3OBBEACDrV+n0KZGzNJKA==
X-Received: by 2002:a05:6e02:20c9:: with SMTP id
 9mr29967785ilq.108.1641533398507; 
 Thu, 06 Jan 2022 21:29:58 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:29:58 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 07/19] drm_print: condense enum drm_debug_category
Date: Thu,  6 Jan 2022 22:29:30 -0700
Message-Id: <20220107052942.1349447-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

enum drm_debug_category has 10 hardcoded values, which could be
"simplified" as sequential BIT(x)s.  But lets take it one step
further, removing the explicit initializations (other than starting at
1), and move the BIT() operation into drm_debug_enabled().

This gives us a more compact representation (4 bits), without loss of
info; all DRM.debug api calls pass an enum parameter (and not a bit-OR
of them), and the bitmask-iness of the enum's values is merely a
micro-optimization to avoid doing BIT(category) at runtime.  I doubt
the extra bit-shift would be measurable here.

And the 4-bit representation means it fits into struct
_ddebug.class_id (commit:HEAD~1), setting up for further integration.

The enum starts at 1, which respects the "reservation" of 0 as a
special case; it is a non-category, and shouldn't get treated like one.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 22fabdeed297..b4355bfd7888 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -279,49 +279,49 @@ enum drm_debug_category {
 	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
 	 * drm_memory.c, ...
 	 */
-	DRM_UT_CORE		= 0x01,
+	DRM_UT_CORE = 1,
 	/**
 	 * @DRM_UT_DRIVER: Used in the vendor specific part of the driver: i915,
 	 * radeon, ... macro.
 	 */
-	DRM_UT_DRIVER		= 0x02,
+	DRM_UT_DRIVER,
 	/**
 	 * @DRM_UT_KMS: Used in the modesetting code.
 	 */
-	DRM_UT_KMS		= 0x04,
+	DRM_UT_KMS,
 	/**
 	 * @DRM_UT_PRIME: Used in the prime code.
 	 */
-	DRM_UT_PRIME		= 0x08,
+	DRM_UT_PRIME,
 	/**
 	 * @DRM_UT_ATOMIC: Used in the atomic code.
 	 */
-	DRM_UT_ATOMIC		= 0x10,
+	DRM_UT_ATOMIC,
 	/**
 	 * @DRM_UT_VBL: Used for verbose debug message in the vblank code.
 	 */
-	DRM_UT_VBL		= 0x20,
+	DRM_UT_VBL,
 	/**
 	 * @DRM_UT_STATE: Used for verbose atomic state debugging.
 	 */
-	DRM_UT_STATE		= 0x40,
+	DRM_UT_STATE,
 	/**
 	 * @DRM_UT_LEASE: Used in the lease code.
 	 */
-	DRM_UT_LEASE		= 0x80,
+	DRM_UT_LEASE,
 	/**
 	 * @DRM_UT_DP: Used in the DP code.
 	 */
-	DRM_UT_DP		= 0x100,
+	DRM_UT_DP,
 	/**
 	 * @DRM_UT_DRMRES: Used in the drm managed resources code.
 	 */
-	DRM_UT_DRMRES		= 0x200,
+	DRM_UT_DRMRES
 };
 
 static inline bool drm_debug_enabled(enum drm_debug_category category)
 {
-	return unlikely(__drm_debug & category);
+	return unlikely(__drm_debug & BIT(category));
 }
 
 /*
-- 
2.33.1

