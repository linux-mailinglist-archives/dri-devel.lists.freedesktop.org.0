Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E810C3FCE7F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 22:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548246E0ED;
	Tue, 31 Aug 2021 20:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B062E6E0CA;
 Tue, 31 Aug 2021 20:21:46 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id z2so637749iln.0;
 Tue, 31 Aug 2021 13:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/aQgzlM6bufLJJz+lhddL1EzpIX3TCLzK+pfF17zKmc=;
 b=HZi4nhNHvgUWeuFtXbQxyQmtp+hamEPox812vfdSm9trSzRzb4PrgLdRxfZw/MwOg4
 88PQyG6djgMEbvT9q/RiXmMK7GkLsnoX8UeLTQxb1zpeuMdVU5pi8TEQKIuVg7KIrBln
 QBV9vriJ9c0ryb7mH8wq1NS8PfjmBRDlmbzviAvTuyRH/ibjGWCgyPssKMV4wTgzMJh0
 UoDwLv/MUkUSJq4RdDan7+mCZzxPS72qzgkac5lANtTo0/2YuIxQiVJvrDO/0onhbzMQ
 HXwjU16jjZNySuAJEIt5f3Ry9IqUyIs8nTD269GcxqAjT0d3m4SaOErgjSx+gIjDSy3V
 yewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/aQgzlM6bufLJJz+lhddL1EzpIX3TCLzK+pfF17zKmc=;
 b=nhB/iUWS3Gr233HQgYsHeBig2qVrz5JuRicsJHiNFqGMwmD2MlasiK6iGBK+kcS56M
 CSOeIV651KjcFIXJ+w5ajP74ty2rikCF6zbGwsjRiZC5z0tAcQTZFRPIh9CQ1inu9FEb
 L3Nw3DMtpQkBUiQsnFfV0WrO6+1yFFAzaG7TvrwO+6Qo/xKIuN31+Q0Osce69MM39wGe
 pDj9vzmYeLJQ6spMAS/z62LvHLji+PfF4khbaBfonyVQnFy5PENCSofNjTWlK4f3tbJV
 l6jdWJL6UexDoc+ZkiDzoCuIereTDAr5sU5lK2BwBUCYlLABktAsPz5w+fZBUK+fmPc9
 jsCA==
X-Gm-Message-State: AOAM533i5R+UiyWv0RDtBCfPU5egLiAlKEyX1VOUqm7MQEj+JtOEHI6/
 K9pu1rtzHMsIAaH1qglMu8w=
X-Google-Smtp-Source: ABdhPJwm+w3tlXwW2CSDZpMztq6O6HI+4KqEByRUeDEkX0QkIUL05KoKl6K2RdTvpHIwZihdpooYzw==
X-Received: by 2002:a92:c241:: with SMTP id k1mr21807966ilo.270.1630441305804; 
 Tue, 31 Aug 2021 13:21:45 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id u15sm10597384ilk.53.2021.08.31.13.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:21:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7 6/8] drm_print: instrument drm_debug_enabled
Date: Tue, 31 Aug 2021 14:21:31 -0600
Message-Id: <20210831202133.2165222-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831202133.2165222-1-jim.cromie@gmail.com>
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
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
 include/drm/drm_print.h | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 973443040561..03f9ae83fade 100644
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

