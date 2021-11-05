Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A82F944691C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 20:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D748A6EC31;
	Fri,  5 Nov 2021 19:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F3B6E4E6;
 Fri,  5 Nov 2021 19:27:15 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id s14so10501572ilv.10;
 Fri, 05 Nov 2021 12:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J66KFihbece2lAcU0d7M95Qa/rbqjUiPkgLP3JGipo0=;
 b=Zs7izjPdlXFjhHgcGVV/4D0TKcfPMJ6/bIu99IfZYafZ6L9xSfvMl0llVYUYvQoKvN
 C+b5ytYureEUj/xGBFGDOLEC1nlkqp2EtUZqNh6SIqcEnIVKIEoxFDyLLPkAzsasJ1Ze
 mW3mY2+YIs/6+Ad3/vtfXeaJf5dHuXPg9eRkgrGJsYq8qcYLPEPir1ozQ1EcyGPLDQsk
 s/I+LRdEGwhoijCzPIajrPNdy+Jp1VhZxnKRjU9V/YFzrpvvY1+as+3J/Hp40iR3fY2w
 xZumcT1EHtV6ANVvmoU1u4cgM5WTAxrE3VRMqTnHNWluDY0sE/hnimP2UECkG3p5wmhY
 pj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J66KFihbece2lAcU0d7M95Qa/rbqjUiPkgLP3JGipo0=;
 b=eAZInv5CDY2lmM/Rersurc8xxB2BNHE1Z4pT0i37vG96FpEJkCDJsojNc2QHE5dwR7
 d02m1G8U+ksM41nrObexpWVd+/vMmryDnUu2TtDjkOtiPgifex57NG7VYtiFZX2iQ8ta
 eTJrHYG9TWQDw2B4b0yXed+bFW+ntyiTCmI9ni9Z2yWDdk96IuyF1yk39ZB/hkzCmigv
 e6alMElLvcDEQskBgWv1baeqCqhdehzOIUn6qKetdcJUcXQVUHQAQ/p4sOv90UeG5ZKE
 7Z0ZCiS/ROtWUS8Vy89Mw0uU1qDRdlRXp2AvwLw4LrspRrjsXCg7Wq6c+LxmmD0W1mE6
 0KVw==
X-Gm-Message-State: AOAM531l1YU1nV9t73+fBhCeSQEgDjgYB0wb1UIsp/SqUNou9/13sjXj
 08Y7HkI+dPVXSgNzEDOs83Q=
X-Google-Smtp-Source: ABdhPJyEoWTSNVWY0q0qCy3OT4r68a3316psnOwgktU9XkgujPXDsJangaWjRIBrZ1zLNG8cEC0Hdg==
X-Received: by 2002:a05:6e02:158c:: with SMTP id
 m12mr42153254ilu.64.1636140434310; 
 Fri, 05 Nov 2021 12:27:14 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id l18sm4338617iob.17.2021.11.05.12.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:27:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, lyude@redhat.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 07/10] drm_print: instrument drm_debug_enabled
Date: Fri,  5 Nov 2021 13:26:34 -0600
Message-Id: <20211105192637.2370737-8-jim.cromie@gmail.com>
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

Duplicate drm_debug_enabled() code into both "basic" and "dyndbg"
ifdef branches.  Then add a pr_debug("todo: ...") into the "dyndbg"
branch.

Then convert the "dyndbg" branch's code to a macro, so that the
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
 include/drm/drm_print.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 392cff7cb95c..a902bd4d8c55 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -381,6 +381,11 @@ enum drm_debug_category {
 #define DRM_DBG_CAT_DP		DRM_UT_DP
 #define DRM_DBG_CAT_DRMRES	DRM_UT_DRMRES
 
+static inline bool drm_debug_enabled(enum drm_debug_category category)
+{
+	return unlikely(__drm_debug & category);
+}
+
 #else /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
 
 /* join prefix + format in cpp so dyndbg can see it */
@@ -414,12 +419,13 @@ enum drm_debug_category {
 #define DRM_DBG_CAT_DP		"drm:dp: "
 #define DRM_DBG_CAT_DRMRES	"drm:res: "
 
-#endif /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
+#define drm_debug_enabled(category)			\
+	({						\
+	pr_debug("todo: maybe avoid via dyndbg\n");	\
+	unlikely(__drm_debug & (category));		\
+	})
 
-static inline bool drm_debug_enabled(enum drm_debug_category category)
-{
-	return unlikely(__drm_debug & category);
-}
+#endif /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
 
 /*
  * struct device based logging
@@ -582,7 +588,6 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 #define drm_dbg_drmres(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_DBG_CAT_DRMRES, fmt, ##__VA_ARGS__)
 
-
 /*
  * printk based logging
  *
-- 
2.31.1

