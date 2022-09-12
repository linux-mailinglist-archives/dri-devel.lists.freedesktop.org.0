Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263EC5B5381
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 07:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8136510E0D4;
	Mon, 12 Sep 2022 05:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D38E10E0EC;
 Mon, 12 Sep 2022 05:29:12 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id g12so3456835ilj.5;
 Sun, 11 Sep 2022 22:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XL7ChPS99XFJL4oCOKSZfP/JHI1hyG5bYnzMTIDbg5Q=;
 b=ZPz/N1MZg7ftF0tlcoRwr9HNj0wMrzzU21myESb5DbbDCQo4xNwx0qr2GossY/Q+uO
 ZdpsYR6a9TLoWWI0eDoBTYm4MnozH77pypOSGaDyQIl4oefREBwcO/EJS16nj18QJtwq
 0TwpXRFSqPJodz6YVHbri98npEro/MGK6/DNd2yaWRYDZS/AV7i5FvuiVN1NH6w9hDQX
 f3U/bWFDOcVK9ezCKsiVEVx1FsO0cVIIZUyHq0XODhXrol856oqiGW4oq7Evgh4EM5oO
 lRuFkAM/jpe7Ztz6wB17kJCX/13m/ha0hPZ/RzLt0H9haHMTvpcVsVvKOa+E/Rlucqbh
 muxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XL7ChPS99XFJL4oCOKSZfP/JHI1hyG5bYnzMTIDbg5Q=;
 b=HAj/j1MWXDW2nxrTMERzjTaxvbh3aZPG7wkPHIZ3j/CPnudukrcPsNfXuBQCFp2vA4
 qLArPY/czuJVGj8ZDSzl67dwfkhvdnw/+nZ5TtJzYMtwiwJ3Bq+8PdojZcHB0YsyAiHb
 FRAeabM6HpV3fSWCdnICAGj6GUqMwiQdivZww1prSZGPFVQ5Ep1dZovntL24paGUuKcl
 /pSK5WOuyjqxJ8uAItJrxC1xOAYBjY0QoGXrxCFggLeaJ9h9Lj/26jMQdWoT40INSUZi
 LZitliixcR263W7GBJu+1Q+UIa6XLeMujRNsQ/nl2UMpB9Ec31XRLHWSPLoxjjvojrIt
 xU9g==
X-Gm-Message-State: ACgBeo38EFzIeqymPRl6E+Nr37tn2bsIzRcDv1o3DVr58CJsZ+xhu6KN
 kvQwWizCjGwACaFWKgJT9KQ=
X-Google-Smtp-Source: AA6agR47BQemS+MqJvt/2ptLpkQUnDhJDO4pC9EpCD+Bj0LzBAng5f40HRcbFyGQO4ZMBWidtzdolA==
X-Received: by 2002:a05:6e02:2195:b0:2eb:8a31:43d8 with SMTP id
 j21-20020a056e02219500b002eb8a3143d8mr9194040ila.315.1662960552177; 
 Sun, 11 Sep 2022 22:29:12 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020a056e02079000b002eb75fb01dbsm3006057ils.28.2022.09.11.22.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 22:29:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/9] drm_print: optimize drm_debug_enabled for jump-label
Date: Sun, 11 Sep 2022 23:28:50 -0600
Message-Id: <20220912052852.1123868-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912052852.1123868-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
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

When CONFIG_DRM_USE_DYNAMIC_DEBUG=y, the drm.debug API (a macro stack,
calling _+drm_*dbg() eventually) invokes a dyndbg Factory macro to
create a descriptor for each callsite, thus making them individually
>control-able.

In this case, the calls to _drm_*dbg are unreachable unless the
callsite is enabled.  So those calls can short-circuit their early
do-nothing returns.  Provide and use __drm_debug_enabled(), to do this
when config'd, or the _raw flags-check otherwize.

And since dyndbg is in use, lets also instrument the remaining users
of drm_debug_enabled, by wrapping the _raw in a macro with a:

  pr_debug("todo: is this frequent enough to optimize ?\n");

For CONFIG_DRM_USE_DYNAMIC_DEBUG=n, do no site instrumenting at all,
since JUMP_LABEL might be off, and we don't want to make work.

With drm, amdgpu, i915, nouveau loaded, heres remaining uses of
drm_debug_enabled(), which costs ~1.5kb data to control the
pr_debug("todo:..")s.

Some of those uses might be ok to use __drm_debug_enabled() by
inspection, others might warrant conversion to use dyndbg Factory
macros, and that would want callrate data to estimate the savings
possible.  TBH, any remaining savings are probably small; drm.debug
covers the vast bulk of the uses.  Maybe "vblank" is the exception.

:#> grep todo /proc/dynamic_debug/control | wc
     21     168    2357
:#> grep todo /proc/dynamic_debug/control
drivers/gpu/drm/drm_edid_load.c:178 [drm]edid_load =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/drm_vblank.c:410 [drm]drm_crtc_accurate_vblank_count =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/drm_vblank.c:787 [drm]drm_crtc_vblank_helper_get_vblank_timestamp_internal =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/drm_vblank.c:1491 [drm]drm_vblank_restore =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/drm_vblank.c:1433 [drm]drm_vblank_enable =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/drm_plane.c:2168 [drm]drm_mode_setplane =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/display/drm_dp_mst_topology.c:1359 [drm_display_helper]drm_dp_mst_wait_tx_reply =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/display/drm_dp_mst_topology.c:2864 [drm_display_helper]process_single_tx_qlock =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/display/drm_dp_mst_topology.c:2909 [drm_display_helper]drm_dp_queue_down_tx =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/display/drm_dp_mst_topology.c:1686 [drm_display_helper]drm_dp_mst_update_slots =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/display/intel_dp.c:1111 [i915]intel_dp_print_rates =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/display/intel_backlight.c:5434 [i915]cnp_enable_backlight =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/display/intel_backlight.c:5459 [i915]intel_backlight_device_register =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/display/intel_opregion.c:43 [i915]intel_opregion_notify_encoder =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/display/intel_opregion.c:53 [i915]asle_set_backlight =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/display/intel_bios.c:1088 [i915]intel_bios_is_dsi_present =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/display/intel_display_debugfs.c:6153 [i915]i915_drrs_ctl_set =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/intel_pcode.c:26 [i915]snb_pcode_read =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/i915_getparam.c:785 [i915]i915_getparam_ioctl =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:282 [amdgpu]vcn_v2_5_process_interrupt =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c:433 [amdgpu]vcn_v2_0_process_interrupt =_ "todo: maybe avoid via dyndbg\n"
:#>

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
- simplify drm-debug-enabled choices, @DanVet
---
 drivers/gpu/drm/drm_print.c |  4 ++--
 include/drm/drm_print.h     | 21 ++++++++++++++++++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 29a29949ad0b..cb203d63b286 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -285,7 +285,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
@@ -308,7 +308,7 @@ void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index dfdd81c3287c..9af57d3df259 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -321,11 +321,30 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
-static inline bool drm_debug_enabled(enum drm_debug_category category)
+static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
 }
 
+#define drm_debug_enabled_instrumented(category)			\
+	({								\
+		pr_debug("todo: is this frequent enough to optimize ?\n"); \
+		drm_debug_enabled_raw(category);			\
+	})
+
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+/*
+ * the drm.debug API uses dyndbg, so each drm_*dbg macro/callsite gets
+ * a descriptor, and only enabled callsites are reachable.  They use
+ * the private macro to avoid re-testing the enable-bit.
+ */
+#define __drm_debug_enabled(category)	true
+#define drm_debug_enabled(category)	drm_debug_enabled_instrumented(category)
+#else
+#define __drm_debug_enabled(category)	drm_debug_enabled_raw(category)
+#define drm_debug_enabled(category)	drm_debug_enabled_raw(category)
+#endif
+
 /*
  * struct device based logging
  *
-- 
2.37.3

