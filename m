Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592BEB19214
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A547810E4CA;
	Sun,  3 Aug 2025 03:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HXatSOKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F346A10E4CD;
 Sun,  3 Aug 2025 03:59:34 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3e3c34a9b4cso38297935ab.3; 
 Sat, 02 Aug 2025 20:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193574; x=1754798374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyXTuG/pzO1S6KpBihte/IbjP5bnnmbeKtywtvutYYE=;
 b=HXatSOKbiGXxLRs7GBkWYn1sXHBv3uwcfNk1lEook7ibuak7S4KVjEQk2ynoju4u/e
 swqiq/bVqDmj3oAypEYpZSEAhd68wvi0TePZNG8HeOvKnZ01qYES8AVqIjS3aMM0dLUC
 D28eOA0aHQIf/jGs1VFp3ATnkfgGzu7RCL5kkioprpxwX0Bz35UZammtqiwzRbtV5u7c
 rd8PEaYuMLDD8QK1CxB/XyYlcF1UpHrnkIlhso61v1AtUGND8SeCK/QPX0PGOLoodHZ9
 WIVAVe8EN5Vs5IKpuFkM5ala3SAVL4bVz6UJZW5j69e4yhubXv11PZjWwcIIDBlDvb7s
 VOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193574; x=1754798374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyXTuG/pzO1S6KpBihte/IbjP5bnnmbeKtywtvutYYE=;
 b=Ns0w78do0rKWX9BT3BWUf8OU9X3vzbnptBHGyMoJBe6bnkkatksgmxVkBYcFCQ27mQ
 0VZVOIdbjB6QBUeHQ3IMFMtXNViJtuMdhSKxITOY7f3BFhuOFuCqGViry2JwPlXp/e1C
 WMpS59tF+EauVFvtyjRWtQdIn+DCNspYJE8ZdxTAijwsP6Qun6ZFwN3lz2yAySgwRrOc
 vO0XibYwoBwTiRY6UkvApm1bRH+hV9DB5XH3x8SzDQpU5cixKnOTF3izD+P1+jgYlGl1
 WbO5qqEzLeFERsooAOfr9sbLpiNByCG/yKbklVZS5/2tWZXemOz8l3fAsZMGyObCohxu
 dxzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFNe5Qo34BKPrl9KhhDrwuB/F5XSjvQ5PJo1pN8JDgTPJToe/Ik9Tr4OTE+09Sh5+MdBOiq1+d@lists.freedesktop.org,
 AJvYcCV1w+zAKwS85iNumUjEGVUQSOB5S/5OqChAl2SSAj6yXV7p1SX0+Mf6bWyDTo1oO+cMI2GpgB6uXyKNZoCvHg==@lists.freedesktop.org,
 AJvYcCXCMjjDfT1Tt89/f5JE2JUuj48VhajJ3nyMVDJ55VfCzrryzN3pAsOsddKNkYud4RUC1bBHpAUH9+xk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQEPI+S8stO4xv+JezNXn6QEgI9L+6riQ/lWb/MM+KcS2yNWfo
 jD3lfg2i/ZW+B/C4HWSwsAR8ULMsSNKEhT2yfC3ni6dzkZkLX9eFkGfH
X-Gm-Gg: ASbGnctoGG3DEmzkRIFAftSgRbs0zZoayE0X+NLLa3xzWP17cqmmL2An3SMSgQXRhsm
 DQXP3r0Z2OeK/mWoIvGjMCwz3ZhlBcQwfJ0Nfh6mlyr1e8ejhK+h+I8KYzP5x640juAxZQHuLQV
 m9sGOZiWHh0ild56Y2Hbz2Tio7Y/KP/k3MyZve8deew/JYV7U5s0SnKE6YXUOMmUm4f06Ypu8yI
 5RpZ4+7TvzzSnl1rHDX+KaNAobYa5PPxz3MEDYHis8YFSg1G4HAeGCcz0zV1megPwLkcgToRlc3
 r6jxLOGvDrz72gEYHtwpUTSGNsW6DRNJTbMPy0VAFSWt26K4S5UnZPElAlJYohHjrhZ34x8jM5Y
 xviyUxzEoPbmYKv5LEUrOxWCSihCFlWei8yy9QtWxB9pvI9w+HOlBRhqmPcWAPOWwCS4XTGVBpu
 NwWQ==
X-Google-Smtp-Source: AGHT+IHHqpsxNwrIe1Yt8T+K5YT7f/N6jKSRjyJTXO375mjvAA+bcSXnn5xdTY/xrxu6S63FNdOpXA==
X-Received: by 2002:a05:6602:1545:b0:87c:41d0:9982 with SMTP id
 ca18e2360f4ac-881683515dfmr900119439f.6.1754193574199; 
 Sat, 02 Aug 2025 20:59:34 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 41/58] drm-dyndbg: DRM_CLASSMAP_USE in nouveau
Date: Sat,  2 Aug 2025 21:57:59 -0600
Message-ID: <20250803035816.603405-42-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013a..67caebf768483 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -74,17 +74,7 @@
 #include "nouveau_uvmm.h"
 #include "nouveau_sched.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 MODULE_PARM_DESC(config, "option string to pass to driver core");
 static char *nouveau_config;
-- 
2.50.1

