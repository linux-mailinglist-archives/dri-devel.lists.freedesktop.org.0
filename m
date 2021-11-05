Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C932446924
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C6E6ECC3;
	Fri,  5 Nov 2021 19:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEC96EAD0;
 Fri,  5 Nov 2021 19:27:18 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id i79so11592152ioa.13;
 Fri, 05 Nov 2021 12:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vpU+SSLFFT68FpBw2vFN+h9yffUizferjvptZotty9E=;
 b=NN0Np2pW3UrsG+9AqO+AohEktBfzKGEDHpdeKujznu3pDIYoBDhDZOXQ6P1lTZBMpB
 2JkWUN4ZodhwWgqXtdvceIMDWR0CVlVHYdhsQsSKy2wgT/wvfiPDDiCSpklNzQ7YsiuA
 79Y5TJGzTZRddQel5VH8D0BBtGZXuADlBj7MbqBQD6tRwcqhoTafPJpqeb8eoqpF5Rnl
 9ahVbAQm8bsLhNfPbH909uvS/4cXOneOAoDI7B6K6jptVpUzL32IhgkgAqVlSSOpp/9A
 PENpqdIPEAedlQZ91CCy2ozBx2xiBApHQbJ3A8mJon9utYPwDXeLipWnBybv1vkX8+5x
 OF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vpU+SSLFFT68FpBw2vFN+h9yffUizferjvptZotty9E=;
 b=y6k/XYleq+eUFQnm/kAZfWKuSYiWT/Q6Y1rrrtdaNlIBUk8K6Ptu7dernrsmdzxI7e
 iL3FQn6C8zAJhc+JGoH++VyQOQjoCjdVdkkffF43tYGe5A0dyCZ5vuEASrbPjy+5Voi2
 VF+o49+qXuafxhIuJRzXKxZMvrYyCU7Ft5xmBX8o4NxIG4mA0thjmlcnqPq5RovcOn0s
 BH45UG1Ljec1+CDX0ysAuO3i1LAzhi1g8ZBQGSppLIfarLwp2gyd1BoJUyFytv5E3AmS
 RPec+H7f5bXqMoWb738dzUxAExC+wdPB0TZk76XCS3xtskC092G+jJr584fR0aEkXaCT
 Zuaw==
X-Gm-Message-State: AOAM533/S6QJIoaGwgzNnv//WLPa+AtPCaa4OTPWkuIcIWUqaxT2SAow
 ODspY8iOaYR6oaVE4x/Etew=
X-Google-Smtp-Source: ABdhPJzkRMbSENTrjwDyn1PtHkgzb9XW0WXE5GZRnPEmxet7Nadw/IFlSp9CRcRmJAGvoHxlipKbOQ==
X-Received: by 2002:a05:6638:613:: with SMTP id
 g19mr285013jar.77.1636140437436; 
 Fri, 05 Nov 2021 12:27:17 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id l18sm4338617iob.17.2021.11.05.12.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:27:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, lyude@redhat.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 10/10] drm: use DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS in 3
 places
Date: Fri,  5 Nov 2021 13:26:37 -0600
Message-Id: <20211105192637.2370737-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105192637.2370737-1-jim.cromie@gmail.com>
References: <20211105192637.2370737-1-jim.cromie@gmail.com>
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
Cc: Jim Cromie <jim.cromie@gmail.com>
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

