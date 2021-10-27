Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A56F143C1A4
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 06:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C9A89165;
	Wed, 27 Oct 2021 04:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43E36E520;
 Wed, 27 Oct 2021 04:37:20 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id 3so1598854ilq.7;
 Tue, 26 Oct 2021 21:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RJ9lw29NNoHoUgxjgpM5Z3ZVWZtIWAaSNjc0Og+vuzw=;
 b=YOAEMYkJjgS1gBlRU8vCO7dIRKl5YayIZsHUaDyXXsdnXsjfRaxJ1U8ucMzx93lt0m
 l8YtxetASYq0F4wP5mEKE+s0h6zoTOEZDbLBZ4VtLkeoQnl5OETVpbNfH8Wi1Cz6ghio
 2mJkfGnSqgpX8uTj5lm7NFFbXbmpfnVEZ/+xFfYw4BWE0kv7R4BWS9fKLrnt7/VNRMEk
 OsLwoBoUEcgdrgNPyYoze5Ie4bddC7JSpJk34nHGWLSxhqHNLMgjzBPQnkHJdvrcLGAD
 MG4gSo5ndt6Qup8BTuDa/3ydIaAcW4HVWUccpjICLAK2c+nHQb3u3ehNjmxonM08/r4f
 vGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RJ9lw29NNoHoUgxjgpM5Z3ZVWZtIWAaSNjc0Og+vuzw=;
 b=W5tpJ0buS8MQcSSy26AvVCV7uUPpjtIJe9qsjK5NN1XSCRj4audkp6GUKh9SHRZQ34
 E6E+ByDXs4erv/y6Xw8Ca7n52MFneaBjeX0CptS4NNS87A4OucmkGE4u7ma/PpAk1wmX
 0ybHqvo4UdmnaGIsxwRNHJxhPFBuwVOP3E2icbUXeoFs7fGDBOGf1/GU2/MSvPj+sU78
 OxqU9HpnPbSH3hICmAUzh079VOhYAmM0IzewtzFFtcLx28Gc3hCrve/ro12SrAK74CHd
 d4zMferVezchBUkhpDzRzo53D07Eq8E9zo9E5MVLXlqNBLJEWaDaAqWD9qxtzvUZWfV4
 CT+A==
X-Gm-Message-State: AOAM533f/RO4v6Qw8Q1gJSp6zgEktntQzpehccUAOqLqAjfHZ/pvKYUq
 /eLQtN9aM0IRXan2zn4ls0k=
X-Google-Smtp-Source: ABdhPJzLcXpN5rm0lt9foWqbfPaTbUgfz73EYAXxjloUAgHBp2bUecYXQajekgWoXbOwV6yRzDdmuA==
X-Received: by 2002:a05:6e02:1646:: with SMTP id
 v6mr3387552ilu.282.1635309440025; 
 Tue, 26 Oct 2021 21:37:20 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a15sm2030404ilj.81.2021.10.26.21.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:37:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 03/10] amdgpu: use dyndbg.CATEGORIES to control existing
 pr_dbgs
Date: Tue, 26 Oct 2021 22:36:38 -0600
Message-Id: <20211027043645.153133-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027043645.153133-1-jim.cromie@gmail.com>
References: <20211027043645.153133-1-jim.cromie@gmail.com>
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

logger_types.h defines many DC_LOG_*() categorized debug wrappers.
Most of these already use DRM debug API, so are controllable using
drm.debug, but others use a bare pr_debug("$prefix: .."), with 1 of 13
different class-prefixes matching [:uppercase:]

Use DEFINE_DYNAMIC_DEBUG_CATEGORIES to create a sysfs location which
maps from bits to these 13 sets of categorized pr_debugs to en/disable.

Makefile adds -DDYNAMIC_DEBUG_MODULE for CONFIG_DYNAMIC_DEBUG_CORE,
otherwise BUILD_BUG_ON triggers (obvious errors on subtle misuse is
better than mysterious ones).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |  2 +
 .../gpu/drm/amd/display/dc/core/dc_debug.c    | 44 ++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 8d0748184a14..26d974edd5c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -38,6 +38,8 @@ ccflags-y := -I$(FULL_AMD_PATH)/include/asic_reg \
 	-I$(FULL_AMD_DISPLAY_PATH)/amdgpu_dm \
 	-I$(FULL_AMD_PATH)/amdkfd
 
+ccflags-$(CONFIG_DYNAMIC_DEBUG_CORE) += -DYNAMIC_DEBUG_MODULE
+
 amdgpu-y := amdgpu_drv.o
 
 # add KMS driver
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
index 21be2a684393..f08d9cf6c4b3 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -36,8 +36,50 @@
 
 #include "resource.h"
 
-#define DC_LOGGER_INIT(logger)
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+/* define a drm.debug style dyndbg pr-debug control point */
+#include <linux/dynamic_debug.h>
+
+unsigned long __debug_dc;
+EXPORT_SYMBOL(__debug_dc);
+
+#define help_(_N, _cat)	"\t  Bit-" #_N "\t" _cat "\n"
+
+#define DC_DYNDBG_BITMAP_DESC(name)					\
+	"Control pr_debugs via /sys/module/amdgpu/parameters/" #name	\
+	", where each bit controls a debug category.\n"			\
+	help_(0, "[SURFACE]:")						\
+	help_(1, "[CURSOR]:")						\
+	help_(2, "[PFLIP]:")						\
+	help_(3, "[VBLANK]:")						\
+	help_(4, "[HW_LINK_TRAINING]:")				\
+	help_(5, "[HW_AUDIO]:")					\
+	help_(6, "[SCALER]:")						\
+	help_(7, "[BIOS]:")						\
+	help_(8, "[BANDWIDTH_CALCS]:")					\
+	help_(9, "[DML]:")						\
+	help_(10, "[IF_TRACE]:")					\
+	help_(11, "[GAMMA]:")						\
+	help_(12, "[SMU_MSG]:")
+
+DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_dc, __debug_dc,
+				DC_DYNDBG_BITMAP_DESC(debug_dc),
+				[0] = { "[CURSOR]:" },
+				[1] = { "[PFLIP]:" },
+				[2] = { "[VBLANK]:" },
+				[3] = { "[HW_LINK_TRAINING]:" },
+				[4] = { "[HW_AUDIO]:" },
+				[5] = { "[SCALER]:" },
+				[6] = { "[BIOS]:" },
+				[7] = { "[BANDWIDTH_CALCS]:" },
+				[8] = { "[DML]:" },
+				[9] = { "[IF_TRACE]:" },
+				[10] = { "[GAMMA]:" },
+				[11] = { "[SMU_MSG]:" });
+
+#endif
 
+#define DC_LOGGER_INIT(logger)
 
 #define SURFACE_TRACE(...) do {\
 		if (dc->debug.surface_trace) \
-- 
2.31.1

