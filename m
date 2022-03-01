Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F65F4C90C1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 17:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D179810E6F3;
	Tue,  1 Mar 2022 16:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BA210E6B3;
 Tue,  1 Mar 2022 16:46:55 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id j5so13017323ila.2;
 Tue, 01 Mar 2022 08:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZXNUqubAB8NNsFmaxywjAoPOWysBIvPMcZdY6L3itE=;
 b=cBscgP41htfLiQ2OxXZNjPjNT9epnka4RNeYhMMNLhyziuaJKqWOTub2OdKwwH+Odg
 J81R3HY12eJs4g9jm8hFhikPRdw6qltg4xzra8tbEs3CjKMzN6in5GunPnNjmfjsjaiG
 t4ebdJlrUqEuN3pXln5duyqK4vRfkT1DYJJNirI9i9zrekSiuqB8QcqS8UDKyEZFRPqU
 nDmtvEHpFBOZGze2PwgXG69dTSUgVZGOPFnpm019TLO/CRtkIX9DmS76vLmXKfstiTCe
 efQB6kpsKZ3f/wz++gAVH2/IqK9MFU0Mh3mzGpPrY0n7uWiHaMmfqE00x6Ppn5EtM/op
 Us5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZXNUqubAB8NNsFmaxywjAoPOWysBIvPMcZdY6L3itE=;
 b=u6s1zD8Xfkr07kf0bb72tVTZM8zlEkoAVLufSRJoAYAynR7ha4XivAJ8NynF/38hV7
 wsZtRTiwRDZoPt/B0FXCoELkOKUDkIeml7K/SVrz42ZabPt1ocml54DPLMr3rMpGU4p6
 y9foQgquMaVQhQAStxFquGOYS1W7wWRnRHCxjBUbKq2YxqF2MpBPfgu5fn7FRAdllxqZ
 wQPKWtlclzOFoPlaoDq8XkEQIFCh7UUm+Hz1ZQBIcNEVKGWO2w1VYbxae8wVrnSrjeRR
 GLG+zak5X22cbrcY+v3igSsrwprgXeqxLJ5YiumF+EVETwBiOHUj6T1XGHo1coxzXmtf
 asdA==
X-Gm-Message-State: AOAM532Dcm9ceIO4peH5AF9/3k1UDfAZQv8y2r9boc/g2LKjLRwx1D7Q
 iArd3lzTkDV51B1cBz0jLhQ=
X-Google-Smtp-Source: ABdhPJwoqnkXIbxFZaZCJRvZ08M8RqoA/qmhVFDfhpmycRS1WR6s4XCCJA+9fPCrhqrKWS3Wy3AylQ==
X-Received: by 2002:a92:c26b:0:b0:2c2:9037:a788 with SMTP id
 h11-20020a92c26b000000b002c29037a788mr23790624ild.95.1646153215064; 
 Tue, 01 Mar 2022 08:46:55 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 o3-20020a6b5a03000000b00640a33c5b0dsm7272411iob.17.2022.03.01.08.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 08:46:54 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/13] drm_print: condense enum drm_debug_category
Date: Tue,  1 Mar 2022 09:46:23 -0700
Message-Id: <20220301164629.3814634-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301164629.3814634-1-jim.cromie@gmail.com>
References: <20220301164629.3814634-1-jim.cromie@gmail.com>
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

