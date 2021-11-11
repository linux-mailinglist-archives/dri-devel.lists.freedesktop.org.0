Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918B44DDB0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 23:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C3F6E9C9;
	Thu, 11 Nov 2021 22:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B606E985;
 Thu, 11 Nov 2021 22:02:44 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id y16so8765911ioc.8;
 Thu, 11 Nov 2021 14:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vpU+SSLFFT68FpBw2vFN+h9yffUizferjvptZotty9E=;
 b=PXwPCeebAKMhIluHtIjmrJ7zxCYSLLRcDFNABTvSwcImCglpOyAocqa5WoM6YWBLLo
 JOH9rNgGyrzOfQ5x2t5MUzaNvgmNniIzUEnlDPtn4dq4E41wnSs4UH1LJhwYTCSZ1jnM
 AGO8F/BNrMciuOhBJ4PWmuN3LAfOu1xQ6iPIG8FxvdoFieu7H9fJLtIan541L0rqoA1i
 oSm2lAt/uYuKQqu1XVqMD/1szRxKbnFFkSJ9stahaR3wbTa2Tm+qH/+HFcIpOC6rVHGw
 2cmxHJr5VJ92VP7WrqA9PptOX9f1ARBj2qieuH1nGyRFBD18j51rOSeRsez3zPMRpDRo
 LVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vpU+SSLFFT68FpBw2vFN+h9yffUizferjvptZotty9E=;
 b=3LJjcdAuQCGXr8cCBz/U1rgZsPD1eo0ATfG1AOnloXmw2r4tSgTNopqrnmn6+XnyFt
 KflLi0DnhW+tNg9BgXc9x7CvHL54q3AjeR5unOIjkifJh8YX40l7j8Eij++pvuam49YU
 +scavi5xrYJObMYDeIKZiIPF6etY4F6BrLVSJ9lTgdR6/VlX33uGySBQO3Mn3rXTUh7U
 hrrFWE14QJc3goyBfTdGz6ziGOJtYl9L6uHgOkwSxUZl+luwzb2VG1kgDra84oiNUEly
 XTC/+pZzH7jDLMIBFpMi8tqQCLWXDb4KHwua0+dN8NySyo1ZxjJLnbEvAn8m5olm9rE8
 GCYg==
X-Gm-Message-State: AOAM5325H5N1Jt76kzhg/AzPNTExAmoK9L4JChQJNeWkEYmb+W1PxkjS
 nGXZLtK6fDX+oNNkJmN1Ig0=
X-Google-Smtp-Source: ABdhPJxxj67R7bRoywrgZoZMCh5rlt/jJbjUlBYigfEjiF9DP1SCPjJkC7fRk7xYRcebAho0F9tTQQ==
X-Received: by 2002:a02:ceb9:: with SMTP id z25mr7777239jaq.121.1636668163065; 
 Thu, 11 Nov 2021 14:02:43 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 14:02:42 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, robdclark@gmail.com,
 sean@poorly.run, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 lyude@redhat.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 10/10] drm: use DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS in 3
 places
Date: Thu, 11 Nov 2021 15:02:06 -0700
Message-Id: <20211111220206.121610-11-jim.cromie@gmail.com>
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

add sysfs knobs to enable modules' pr_debug()s ---> tracefs

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_debug.c |  8 ++++++++
 drivers/gpu/drm/drm_print.c                    | 13 ++++++++++---
 drivers/gpu/drm/i915/intel_gvt.c               | 15 ++++++++++++---
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
index e49a755c6a69..58c56c1708e7 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -80,6 +80,14 @@ DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(debug_dc, __debug_dc,
 				DC_DYNDBG_BITMAP_DESC(debug_dc),
 				amdgpu_bitmap);
 
+#if defined(CONFIG_TRACING)
+
+unsigned long __trace_dc;
+EXPORT_SYMBOL(__trace_dc);
+DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(trace_dc, __trace_dc,
+				DC_DYNDBG_BITMAP_DESC(trace_dc),
+				amdgpu_bitmap);
+#endif
 #endif
 
 #define DC_LOGGER_INIT(logger)
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index d5e0ffad467b..ee20e9c14ce9 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -72,9 +72,16 @@ static struct dyndbg_bitdesc drm_dyndbg_bitmap[] = {
 	[8] = { DRM_DBG_CAT_DP },
 	[9] = { DRM_DBG_CAT_DRMRES }
 };
-DEFINE_DYNAMIC_DEBUG_BITGRPS(debug, __drm_debug, DRM_DEBUG_DESC,
-			     drm_dyndbg_bitmap);
-
+DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(debug, __drm_debug, DRM_DEBUG_DESC,
+				drm_dyndbg_bitmap);
+
+#ifdef CONFIG_TRACING
+struct trace_array *trace_arr;
+unsigned long __drm_trace;
+EXPORT_SYMBOL(__drm_trace);
+DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS(trace, __drm_trace, DRM_DEBUG_DESC,
+				  drm_dyndbg_bitmap);
+#endif
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index efaac5777873..84348d4aedf6 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -195,8 +195,17 @@ static struct dyndbg_bitdesc i915_dyndbg_bitmap[] = {
 	help_(7, "gvt:render:")						\
 	help_(8, "gvt:sched:")
 
-DEFINE_DYNAMIC_DEBUG_BITGRPS(debug_gvt, __gvt_debug,
-			     I915_GVT_CATEGORIES(debug_gvt),
-			     i915_dyndbg_bitmap);
+DEFINE_DYNAMIC_DEBUG_LOG_GROUPS(debug_gvt, __gvt_debug,
+				I915_GVT_CATEGORIES(debug_gvt),
+				i915_dyndbg_bitmap);
 
+#if defined(CONFIG_TRACING)
+
+unsigned long __gvt_trace;
+EXPORT_SYMBOL(__gvt_trace);
+DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS(trace_gvt, __gvt_trace,
+				  I915_GVT_CATEGORIES(trace_gvt),
+				  i915_dyndbg_bitmap);
+
+#endif
 #endif
-- 
2.31.1

