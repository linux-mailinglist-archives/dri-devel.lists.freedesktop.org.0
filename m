Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAA84B971D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:49:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8379F10E7AC;
	Thu, 17 Feb 2022 03:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278F910E798;
 Thu, 17 Feb 2022 03:48:49 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id p11so1386872ils.1;
 Wed, 16 Feb 2022 19:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZXNUqubAB8NNsFmaxywjAoPOWysBIvPMcZdY6L3itE=;
 b=AwrxFJhmF4G+MvuDdELRdQNvbWui/ZmZm5aRVhg7QpY32AwSFVlNWa7zOXHeQ0e+cH
 wtknls6AXe3/sQ615mZwc3LxxjbFp5vdYoENvncru8NXiKtvRjVHDHOcc1czRzm11p/d
 5gMpGvKHvpvTD5QXZ7+3u0PE5bimGbjnxkwavRK/JEbo5dFnfHPVsji4YrIJWXz9uBRO
 0Lp/qC0XJyvGgMXBUJNhtBQzXfDabdhJ0aiT0Xn/+2m7taSwrj79YKTaGPXihjNwuE6y
 l5mZvDvxxG7gI/At8IpBjPFc32pigevpyz8mtnKwBqem5o0q5ZZ/unnFLYHjoX5mUiqL
 5kIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZXNUqubAB8NNsFmaxywjAoPOWysBIvPMcZdY6L3itE=;
 b=1B8sGp3kUY1idIH7GsOdkhjxjNn6nluR+0iUpgKAEBRghZq7ME3IRax4SSzTvjPS6n
 5CDHl9D/zTuMiXkalTdhJZRH9aCViVgqyxCFG38F5FXKxuLjXb/130LpEiR7YwaPAqXN
 /rkKK4tCncn6zlUKFFOVzW9ygfcM2/rBYA1MFH5PQnxv9CnpjaeUWabI9KyWgiJg6Btg
 qLpkCJMs3CpMtttyBZVST9gUe52rvyhaPGvP4XYAJE+fq8ESAuyU5bR3F1CPezKd6mx1
 IonA9IB/CKgBEYRt+NxzJsQk2EIbiDBM2NR5dfSPIacTrvUEzWfNUoK9JiGDXdu3DNtQ
 v6QQ==
X-Gm-Message-State: AOAM533d3EqW5UmmHEfcRvOz4a4kBiEBBjrekF89jfefpK7wbq6u+5QC
 bzBWQV0I5Gbxcbej65vkeXKlIG1QWxQmQg==
X-Google-Smtp-Source: ABdhPJy1Fv4risoix7swzSlE1sOKWWdc6gcHljvdxt8ZU2IPf0XZA3hS8LpNHrUIAPX2AlZXkOxl1A==
X-Received: by 2002:a05:6e02:1a0d:b0:2bf:58c2:97af with SMTP id
 s13-20020a056e021a0d00b002bf58c297afmr770183ild.85.1645069728378; 
 Wed, 16 Feb 2022 19:48:48 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::1b19])
 by smtp.googlemail.com with ESMTPSA id l16sm1127874ilc.54.2022.02.16.19.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:48:48 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/13] drm_print: condense enum drm_debug_category
Date: Wed, 16 Feb 2022 20:48:23 -0700
Message-Id: <20220217034829.64395-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217034829.64395-1-jim.cromie@gmail.com>
References: <20220217034829.64395-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

enum drm_debug_category has 10 "classes", explicitly initialized with
0x-bitmasks which could be simplified as BIT(X)s.  But lets go
further: use natural enumeration (int, starting at 0), and do the
BIT(cat) in drm_debug_enabled(cat) at runtime.

While this slightly pessimizes the bit-test, the category now fits in
4 bits, allowing it in struct _ddebug.class_id:4.  This sets us up to
adapt drm to use dyndbg with JUMP_LABEL, thus avoiding all those
bit-tests anyway.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 22fabdeed297..b3b470440e46 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -279,49 +279,49 @@ enum drm_debug_category {
 	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
 	 * drm_memory.c, ...
 	 */
-	DRM_UT_CORE		= 0x01,
+	DRM_UT_CORE,
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
2.35.1

