Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92FA3F4220
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A7589F8B;
	Sun, 22 Aug 2021 22:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979A389ECB;
 Sun, 22 Aug 2021 22:20:55 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so31199886otk.9; 
 Sun, 22 Aug 2021 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NImqTCiBgLna+lubDsLYPmHeBlSQY6fcNq9UxNqMtcA=;
 b=gcJjRMlmfyYaQaYcrxuoWI1sdIm6jiEox/ljCzceKl0L/Ap7JN0JsfIVafUKj85N9E
 G2lf+V18utvTMHSTWSczKVtnsc9ojwXdzhWmjbN1h1chu80rse41Md3rXCB/KyyyKHAU
 oXmvVPNUBehVI0LR71zTk8V1gFHsz+KYfcXvw0IBrK3phXdZ4PzOibutYFjjBibz8UvR
 3ZHnWYFJf8+XbrjQqmlGkEoCZ+n41dwRooGhtPKX6L4SYvGB1n58F82g6BBeIqwNSmEv
 e0SbHjYFsc7gRBMWNL1Y2o+tAAszwzWbU50TEs3rfWU9ZXATaHtvpXJxuvkK5zVFBkiM
 feoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NImqTCiBgLna+lubDsLYPmHeBlSQY6fcNq9UxNqMtcA=;
 b=hYds2tR4ED5SeQTObk0sHu7J3t2RxoihIrueIWxS0fR23dmdkR+jp0TFZG55pXdx18
 6xTkd5mOp6HHEz4p+0m1YwcRZNmxnaECHF0ZjFWnQrAe6blWOJnFlIgAX5xd85FpN30R
 eS3WBLUh8JwKJdVgvq1RMqO0aOv90QrgLwBRcgxWzzBqof6carcbwdTH61tJhUF+iiuW
 AOj7nG4pNBrHg1ILosiv+3t9crIBkSNtRrkcLCL7QnNY4UeBtTc/pFzgvwgXgu3Re2se
 6vJBB8Os2K+95KuXUEvhz27DnDLW3qOLk8HdAjj7vc92RozJUHiYbHWEcXfjUXHMh+Vh
 bB9Q==
X-Gm-Message-State: AOAM532hAArHMSN5Osrve4BBRomP1HVoCrkhTmkNYzCAAshUG6DOFlcg
 8I20TFJPT3DiZRk7NlHONY8=
X-Google-Smtp-Source: ABdhPJyM08jOd2qVALAViUlN3DnSciVGzMWk6TyGhrmK2Jl2EvKGNdE0c+udOzGzbasoNVBn1iQpjQ==
X-Received: by 2002:a05:6808:9b4:: with SMTP id
 e20mr9610450oig.57.1629670854613; 
 Sun, 22 Aug 2021 15:20:54 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x198sm2964122ooa.43.2021.08.22.15.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 15:20:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, seanpaul@chromium.org,
 jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 07/11] drm_print: instrument drm_debug_enabled
Date: Sun, 22 Aug 2021 16:20:05 -0600
Message-Id: <20210822222009.2035788-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822222009.2035788-1-jim.cromie@gmail.com>
References: <20210822222009.2035788-1-jim.cromie@gmail.com>
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

Duplicate drm_debug_enabled() code into both "basic" and "dyndbg"
ifdef branches.  Then add a pr_debug("todo: ...") into the "dyndbg"
branch.

Then convert the "dyndbg" branch's code to a macro, so that its
pr_debug() get its callsite info from the invoking function, instead
of from drm_debug_enabled() itself.

This gives us unique callsite info for the 8 remaining users of
drm_debug_enabled(), and lets us enable them individually to see how
much logging traffic they generate.  The oft-visited callsites can
then be reviewed for runtime cost and possible optimizations.

Heres what we get:

bash-5.1# modprobe drm
dyndbg: 384 debug prints in module drm
bash-5.1# grep todo: /proc/dynamic_debug/control
drivers/gpu/drm/drm_edid.c:1843 [drm]connector_bad_edid =_ "todo: maybe avoid via dyndbg\012"
drivers/gpu/drm/drm_print.c:309 [drm]___drm_dbg =p "todo: maybe avoid via dyndbg\012"
drivers/gpu/drm/drm_print.c:286 [drm]__drm_dev_dbg =p "todo: maybe avoid via dyndbg\012"
drivers/gpu/drm/drm_vblank.c:1491 [drm]drm_vblank_restore =_ "todo: maybe avoid via dyndbg\012"
drivers/gpu/drm/drm_vblank.c:787 [drm]drm_crtc_vblank_helper_get_vblank_timestamp_internal =_ "todo: maybe avoid via dyndbg\012"
drivers/gpu/drm/drm_vblank.c:410 [drm]drm_crtc_accurate_vblank_count =_ "todo: maybe avoid via dyndbg\012"
drivers/gpu/drm/drm_atomic_uapi.c:1457 [drm]drm_mode_atomic_ioctl =_ "todo: maybe avoid via dyndbg\012"
drivers/gpu/drm/drm_edid_load.c:178 [drm]edid_load =_ "todo: maybe avoid via dyndbg\012"

At quick glance, edid won't qualify, drm_print might, drm_vblank is
strongest chance, maybe atomic-ioctl too.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 include/drm/drm_print.h | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 8775b67ecb30..1f8a65eb5d9a 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -378,6 +378,11 @@ enum drm_debug_category {
 #define DRM_DBG_CAT_DP		DRM_UT_DP
 #define DRM_DBG_CAT_DRMRES	DRM_UT_DRMRES
 
+static inline bool drm_debug_enabled(enum drm_debug_category category)
+{
+	return unlikely(__drm_debug & category);
+}
+
 #else /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
 
 /* join prefix+format in cpp so dyndbg can see it */
@@ -397,12 +402,13 @@ enum drm_debug_category {
 #define DRM_DBG_CAT_DP		"drm:dp: "
 #define DRM_DBG_CAT_DRMRES	"drm:res: " /* not in MODULE_PARM_DESC */
 
-#endif /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
+#define drm_debug_enabled(category)			\
+	({						\
+	pr_debug("todo: maybe avoid via dyndbg\n");	\
+	unlikely(__drm_debug & category);		\
+	})
 
-static inline bool drm_debug_enabled(enum drm_debug_category category)
-{
-	return unlikely(__drm_debug & category);
-}
+#endif /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
 
 /*
  * struct device based logging
-- 
2.31.1

