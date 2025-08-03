Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3438BB1923A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 06:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6189F10E4D0;
	Sun,  3 Aug 2025 03:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SzLDC3l2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0754D10E4DA;
 Sun,  3 Aug 2025 03:59:58 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3e3f152700fso12489755ab.0; 
 Sat, 02 Aug 2025 20:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193597; x=1754798397; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6zBJEgANuVffuY9NQJyHG8/+Xeax9coZJWuW6ZJ2WM=;
 b=SzLDC3l22MaKFjvgO5c5XhUoUqNGeRQ/Ps5dg6AjSI9kX2G+zT5+UUOoWFfylmvWB0
 3iOvM9+UEmILWB8admPVOe6pa9Fdc6rjwJJsOlMco/CiahA4hJGbRmintJbPErNVktoy
 UtlJC1Bp67BwvkbpkzYP87IJw45AzO55biuL0rel1KaSXMvPl9isKXIaPxq8Xc79s2or
 MUNZ2aAN+YseUarIQJiUPYvvumTYFUUx8yYaK+2pzIrnmj284H12EXartEYn7nFScwnt
 YFOg64PfHoV1u2J2R7SCBh/glVhs1Sur7YemrRBQ3NBIAnMtFeeWo6eG1C7QQRGLuXrM
 DB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193597; x=1754798397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6zBJEgANuVffuY9NQJyHG8/+Xeax9coZJWuW6ZJ2WM=;
 b=Nv8kTryvDn/SbfIlmEAf8Y3VbN5g+/PsUDWzeEvoPWcXvLfwiWXjjsSdTjIfQtzwOb
 aD69jPP977mXsmfSr6YmLDmXjRhxDnG/Rv89cNJZHjcv4d102Fk2KFs+0ASClNMGKaU3
 gEYM85uaWCOAQEWpZx1AFAWUZIz8yvn5/JcPvPpkShzH4kFYHNtL+IQnMnceHPq9SyP/
 sVIVDRTQ3MZfREFI7nKU65zgHAOyOem/Pl/J3Wr0TgteFc49pDqH06OrgpEz7J2xeR7Z
 DUvSlbHGJZIZs1ZfXb11MYGqREsqD8TM3sjbbdC3GcGPNNwooXrhvcFfAFAA7DqE58xU
 cONQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcb3VnuyR9+Eyn1qD59X/gFrx9SoIlXNv7NAvvPAZ+vMdah85XLeMRXoBvtplMfHEwrxP/2SlcjWmQ2HCBpQ==@lists.freedesktop.org,
 AJvYcCW604kGVv+iu+7/Ezq+DBNnmqwvl9mNLAOXxsQGVp4dYSqXocL0pMOpYrYx/9RKzNv8UUcKUnfj@lists.freedesktop.org,
 AJvYcCWrPP+srOizS6ob5uKWpLFtpa7nlmI+r0QxOZujT6B6AOJxOUWsPc//YPasPn/Q/B7DIF3krJkfIsba@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzetdHpgcWFwSQaC7Asdeov3nDV1Gy+JxwEKWsTB1AcFP1aT93h
 ZaogkDMgTcijOBdeYCTU8N5SFPcWahhK0i/klMzpZ0TrVjfJ5I/t4YzV
X-Gm-Gg: ASbGncujqbyJOwmzsOvGyeXWan/SZChgVSfhXjvHjdELDb5TdxGPa37bWIdo2n+QM6I
 iRlQE2nyCeG+nZ8LIwKNDVWw8zzNn1rBwxgzHtHKrPL3yLsSlrBjxHLqHUFjkuJYjNi3Dc598vI
 V9vNEy4GnKJBab5WZiETcgvNsJHE1L+nQ/bMy/LoWfIXg3Msp3Jskp8yyLz3pSeIkG3guHdabdx
 UoXea8g05ZrWMmQCgoa8w3Y+lNar+GfDQ10H94gh/YrxIPNaa0+RNVZhXG3/y6m6kE1kFfaq8DC
 2IRoV7uVNTZLjvgppBbgytyqFHdhN00VQwnYlGjV451gEf13HKt+stVUo95zMB4m71Wote7eh7V
 1Iwz9AW5ueTsF7iRg+hej8YavPn8Lju/1udLaXkkAKnnzt+wG9k4wImA8Q5RMm/MpWPvYZcP/od
 DwPnTynDTuy7Id
X-Google-Smtp-Source: AGHT+IGUOgHvStYGi2AGuiva7QKSCj6X9DfG9+bxlaldERvaqq+8SW2QK11YiYCBPzmbmAT64CKkJw==
X-Received: by 2002:a05:6602:6c01:b0:881:4a70:4651 with SMTP id
 ca18e2360f4ac-88168309e74mr805665539f.3.1754193597187; 
 Sat, 02 Aug 2025 20:59:57 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:56 -0700 (PDT)
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
Subject: [PATCH v4 58/58] accel: add -DDYNAMIC_DEBUG_MODULE to subdir-cflags -
 RFC
Date: Sat,  2 Aug 2025 21:58:16 -0600
Message-ID: <20250803035816.603405-59-jim.cromie@gmail.com>
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

Currently amdxdna uses drm_dbg, so it needs this cflag in order to
compile; it currently gets the cflag from its own Makefile.

If other accel modules want to use DRM.debug, they will need this flag
too, so add it in accel/Makefile.

NOTE: ivpu has its own CLASS-ish dbg system:

./drivers/accel/ivpu$ grep IVPU_DBG_ *
ivpu_drv.c:MODULE_PARM_DESC(dbg_mask, "Driver debug mask. See IVPU_DBG_* macros.");
ivpu_drv.h:#define IVPU_DBG_REG	 BIT(0)
ivpu_drv.h:#define IVPU_DBG_IRQ	 BIT(1)
ivpu_drv.h:#define IVPU_DBG_MMU	 BIT(2)
ivpu_drv.h:#define IVPU_DBG_FILE	 BIT(3)
ivpu_drv.h:#define IVPU_DBG_MISC	 BIT(4)
ivpu_drv.h:#define IVPU_DBG_FW_BOOT BIT(5)
ivpu_drv.h:#define IVPU_DBG_PM	 BIT(6)
ivpu_drv.h:#define IVPU_DBG_IPC	 BIT(7)
ivpu_drv.h:#define IVPU_DBG_BO	 BIT(8)
ivpu_drv.h:#define IVPU_DBG_JOB	 BIT(9)
ivpu_drv.h:#define IVPU_DBG_JSM	 BIT(10)
ivpu_drv.h:#define IVPU_DBG_KREF	 BIT(11)
ivpu_drv.h:#define IVPU_DBG_RPM	 BIT(12)
ivpu_drv.h:#define IVPU_DBG_MMU_MAP BIT(13)
ivpu_drv.h:	if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                         \

./drivers/accel/ivpu$ grep ivpu_dbg * | cut -f1,2 -d, | cut -d: -f2- | perl -pe 's/\s+/ /' | sort -u
extern int ivpu_dbg_mask;
 if (unlikely(IVPU_DBG_##type & ivpu_dbg_mask))                         \
int ivpu_dbg_mask;
 ivpu_dbg_bo(vdev, bo
 ivpu_dbg(vdev, BO
 ivpu_dbg(vdev, FILE
 ivpu_dbg(vdev, FW_BOOT
 ivpu_dbg(vdev, IPC
 ivpu_dbg(vdev, IRQ
 ivpu_dbg(vdev, JOB
 ivpu_dbg(vdev, JSM
 ivpu_dbg(vdev, KREF
 ivpu_dbg(vdev, MISC
 ivpu_dbg(vdev, MMU
 ivpu_dbg(vdev, MMU_MAP
 ivpu_dbg(vdev, PM
 ivpu_dbg(vdev, REG
module_param_named(dbg_mask, ivpu_dbg_mask
static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo

This looks readily convertible to a dyndbg classmap and controlling kparam.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/accel/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index a301fb6089d4c..e437549cba8ac 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+subdir-cflags-$(CONFIG_DYNAMIC_DEBUG_CORE) == -DDYNAMIC_DEBUG_MODULE
+
 obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
-- 
2.50.1

