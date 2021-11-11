Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5AC44DD86
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 23:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264906E959;
	Thu, 11 Nov 2021 22:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C016E959;
 Thu, 11 Nov 2021 22:02:26 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id x9so7186666ilu.6;
 Thu, 11 Nov 2021 14:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/eb6uDj0ZcPussZNWTyXvX7+BhhrBBdZ4eRtPk3Njs=;
 b=pkmN9aFmUvCHVM0y8octaoOSLL2D84Qi2xdBg4z2fk3sW6d1XPH/q4CjvttBUKGjeC
 xIwejMZMQO9qi1vwAb7AChnONzCruzpGLlDyXqVc01g98NrZVL1/DIcEhuml3Ibup6Xj
 nLcN5fjd/zzLCdt9ipYhqyGfsgNHQ6jMdJn3inmE5tp0XM6A4PYJVhtGXn69a+vcG3Q6
 xzF5QFCGjsnxnr2BADQSUzRnc6R+NhF+duXC/MbAVuHi9gVsgGjT8I7TCO12mHC9Ty2P
 OvtmmU+mbzRMEXBtShHLgsd7ZE7xBTQISLD/edfdUr7T3zxN29wWB9PcNqR0ppi5esYx
 c6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/eb6uDj0ZcPussZNWTyXvX7+BhhrBBdZ4eRtPk3Njs=;
 b=qEvqdAkAgcFqDQtCyCaTaXyUy05K0NrXmkvDdyJuZtwU16l9D+zXEr9jN2VsLmlnxX
 jrbV0GN9/pNDgglLiugMjrMIi8rsO1nZXuGGxXhp3cZs6WXawrQHC+cfz+W3GfmD2sgh
 NE6E7Z3MkIQx5ea+66+Xgor07e3RMg8e6dHoT2AT13G42RX2VXz3eOoWrNLHjPGOFJHN
 Mu97bugeyYCKd82Pz/V3T+I2t1L9Fs1zQnavbj+1UWpIOSEMHx6kpsgNoEASYSXG+wPN
 B5AftUTLcUuUWN1OCH994l2SOdSChycKXPjqIMddht6sAtDACyvW+L0ZUGI/WbF/dMBw
 0BIg==
X-Gm-Message-State: AOAM5318mBsz26JCu8GDGciWDXZopR8eqFqziZJ+khWFyQQ16OBswWxp
 DB394ZUK0BSKsVCtmYZnJ8E=
X-Google-Smtp-Source: ABdhPJx6anogQ0dO7LsuIXNJzXEDRujujjsWcMLO0UFoTgFFwFE9Z53u3/uEPFJpppNAdDHHm6d0tA==
X-Received: by 2002:a05:6e02:1709:: with SMTP id
 u9mr6278973ill.242.1636668145701; 
 Thu, 11 Nov 2021 14:02:25 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 14:02:25 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, robdclark@gmail.com,
 sean@poorly.run, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 lyude@redhat.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 03/10] amdgpu: use dyndbg.BITGRPS to control existing
 pr_debugs
Date: Thu, 11 Nov 2021 15:01:59 -0700
Message-Id: <20211111220206.121610-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111220206.121610-1-jim.cromie@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
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

logger_types.h defines many DC_LOG_*() categorized debug wrappers.
Most of these already use DRM debug API, so are controllable using
drm.debug, but others use a bare pr_debug("$prefix: .."), with 1 of 13
different class-prefixes matching [:uppercase:]

Use DEFINE_DYNAMIC_DEBUG_BITGRPS to create a sysfs location which maps
from bits to these 13 sets of categorized pr_debugs to en/disable.

Makefile adds -DDYNAMIC_DEBUG_MODULE for CONFIG_DYNAMIC_DEBUG_CORE,
otherwise BUILD_BUG_ON triggers (obvious errors on subtle misuse is
better than mysterious ones).

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |  2 +
 .../gpu/drm/amd/display/dc/core/dc_debug.c    | 47 ++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 653726588956..077342ca803f 100644
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
index 21be2a684393..e49a755c6a69 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -36,8 +36,53 @@
 
 #include "resource.h"
 
-#define DC_LOGGER_INIT(logger)
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
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
+	help_(4, "[HW_LINK_TRAINING]:")					\
+	help_(5, "[HW_AUDIO]:")						\
+	help_(6, "[SCALER]:")						\
+	help_(7, "[BIOS]:")						\
+	help_(8, "[BANDWIDTH_CALCS]:")					\
+	help_(9, "[DML]:")						\
+	help_(10, "[IF_TRACE]:")					\
+	help_(11, "[GAMMA]:")						\
+	help_(12, "[SMU_MSG]:")
+
+static struct dyndbg_bitdesc amdgpu_bitmap[] = {
+	[0] = { "[CURSOR]:" },
+	[1] = { "[PFLIP]:" },
+	[2] = { "[VBLANK]:" },
+	[3] = { "[HW_LINK_TRAINING]:" },
+	[4] = { "[HW_AUDIO]:" },
+	[5] = { "[SCALER]:" },
+	[6] = { "[BIOS]:" },
+	[7] = { "[BANDWIDTH_CALCS]:" },
+	[8] = { "[DML]:" },
+	[9] = { "[IF_TRACE]:" },
+	[10] = { "[GAMMA]:" },
+	[11] = { "[SMU_MSG]:" }
+};
+
+DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(debug_dc, __debug_dc,
+				DC_DYNDBG_BITMAP_DESC(debug_dc),
+				amdgpu_bitmap);
+
+#endif
 
+#define DC_LOGGER_INIT(logger)
 
 #define SURFACE_TRACE(...) do {\
 		if (dc->debug.surface_trace) \
-- 
2.31.1

