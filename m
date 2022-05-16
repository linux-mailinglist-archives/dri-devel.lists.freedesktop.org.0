Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1299529456
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA7610EB92;
	Mon, 16 May 2022 22:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABFD10F1D5;
 Mon, 16 May 2022 22:57:27 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id l15so11555902ilh.3;
 Mon, 16 May 2022 15:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=it6bLhFwPCS9KNMNbVAc9u0r1hyTQEpcTOU7DVjaIzc=;
 b=cLcNGP066hHaVqlFNtXCmZ1CGCDAlRmjr8Ddi2wGeCAS0G188epVjNoMgFTsYz1FhS
 KwC/fi5w0MCKcVhAzgWTaAyw+jbVNB24fPtZqpyM2QJFQ425pkWWyCI9IkbK/sjrV1Nr
 VH0wWrWNzvvR6xEjBnwkVSgs88cMc3hP8dkgdaIQ1LrtD/VWN/UO2s3FRnPa5oMd5so8
 fSnTqRZENTyoMjCDNvkBUwdEdImN8cxny/1EuyBgylEspCk+qlkkMhhF7mjiK7FL010n
 kgcvXTfvTotxDueX1P4iF6MOjOgVE7J7E3ZeBWAm2Cih8qFLTTugQGWmxTynuy+uGziA
 gtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=it6bLhFwPCS9KNMNbVAc9u0r1hyTQEpcTOU7DVjaIzc=;
 b=Ixm+ezK+sjoxCMQ4vWbAzQTcFueoY5bJ+UdlIYELHTWpoPKOKkXfn4sTdAooHUTQT4
 7BaIP7BbTuJT90uHX6k4W0wkpA59hE+egMuuzi838td9ko7gl4IQggZnbYwDOSTizDJE
 DZHERLbic+k5T+s9nJKDM/bk3DsyLTaAi1y8wvA44kcuMP/eU+dvFefzu1gz0Ue++8RH
 nWXhHeLZ99iT8UZlCe03JIbgza8xhgkyuMjK5F+oDV62T2hBc759PynZYEcwK4Wzeo/G
 ZQbHw2ojYM6X09vaJzhH4hUWCS+RfqR+lpaJ261JVichn7DFmDX2e27XG7ocpmq5NUzI
 OHkA==
X-Gm-Message-State: AOAM533zJQkPC0A3yVpjpLs3c5R5zHJhv3NqtCw1a92EOYpZIhUvvaIg
 dY5c8Ea+6jACpLm7+71HDAk=
X-Google-Smtp-Source: ABdhPJxL66r9um/Qj19jzq2i+w5GjaE1kV2BNicea7CTlLXB+S6WjzXBR8GSASV1PB+CpOnfV72D2w==
X-Received: by 2002:a05:6e02:1d8a:b0:2cd:fa75:6395 with SMTP id
 h10-20020a056e021d8a00b002cdfa756395mr10067705ila.294.1652741845777; 
 Mon, 16 May 2022 15:57:25 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:25 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 20/27] drm_print: refine drm_debug_enabled for jump-label
Date: Mon, 16 May 2022 16:56:33 -0600
Message-Id: <20220516225640.3102269-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to use dynamic-debug's jump-label optimization in drm-debug,
its clarifying to refine drm_debug_enabled into 3 uses:

1.   drm_debug_enabled - legacy, public
2. __drm_debug_enabled - optimized for dyndbg jump-label enablement.
3.  _drm_debug_enabled - pr_debug instrumented, observable

1. The legacy version always checks the bits.

2. is privileged, for use by __drm_dbg(), __drm_dev_dbg(), which do an
early return unless the category is enabled (free of call/NOOP side
effects).  For dyndbg builds, debug callsites are selectively
"pre-enabled", so __drm_debug_enabled() short-circuits to true there.
Remaining callers of 1 may be able to use 2, case by case.

3. is 1st wrapped in a macro, with a pr_debug, which reports each
usage in /proc/dynamic_debug/control, making it observable in the
logs.  The macro lets the pr_debug see the real caller, not an inline
function.

When plugged into 1, it identified ~10 remaining callers of the
function, leading to the follow-on cleanup patch, and would allow
activating the pr_debugs, estimating the callrate, and the potential
savings by using the wrapper macro.  It is unused ATM, but it fills
out the picture.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c |  4 ++--
 include/drm/drm_print.h     | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 5192533794a2..22b7ab1c5c40 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -272,7 +272,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
@@ -295,7 +295,7 @@ void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 	struct va_format vaf;
 	va_list args;
 
-	if (!drm_debug_enabled(category))
+	if (!__drm_debug_enabled(category))
 		return;
 
 	va_start(args, format);
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 5c39bacac2b3..ccd177236ab3 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -324,11 +324,39 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+/*
+ * 3 name flavors of drm_debug_enabled:
+ *   drm_debug_enabled - public/legacy, always checks bits
+ *  _drm_debug_enabled - instrumented to observe call-rates, est overheads.
+ * __drm_debug_enabled - privileged - knows jump-label state, can short-circuit
+ */
 static inline bool drm_debug_enabled(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
 }
 
+/*
+ * Wrap fn in macro, so that the pr_debug sees the actual caller, not
+ * the inline fn.  Using this name creates a callsite entry / control
+ * point in /proc/dynamic_debug/control.
+ */
+#define _drm_debug_enabled(category)				\
+	({							\
+		pr_debug("todo: maybe avoid via dyndbg\n");     \
+		drm_debug_enabled(category);			\
+	})
+
+#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+/*
+ * dyndbg is wrapping the drm.debug API, so as to avoid the runtime
+ * bit-test overheads of drm_debug_enabled() in those api calls.
+ * In this case, executed callsites are known enabled, so true.
+ */
+#define __drm_debug_enabled(category)	true
+#else
+#define __drm_debug_enabled(category)	drm_debug_enabled(category)
+#endif
+
 /*
  * struct device based logging
  *
-- 
2.35.3

