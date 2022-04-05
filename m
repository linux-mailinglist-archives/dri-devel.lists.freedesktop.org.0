Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4734F3F90
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3247D10EEC5;
	Tue,  5 Apr 2022 21:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5310810EEB7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b19so293480wrh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zkSaZWiAEzn1vI2UmGdVu2E73Kg6gjQbIUxAzTewX/s=;
 b=GCsDirz/ALLhTV5XRsibA0w1P1sd6snP0Vcp9TNoUziMLBWm83tspxKtHyrMcDwHg1
 r5oY/jsjHG0vKCiA2MW/Gt92kfWYxLCM24LJn/SXoUGnBsf8faCwFzlYgwMxZHEDYLFD
 oQPQwugkUyVqf93fteG9M+ZMBh6ud1X1hg7XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zkSaZWiAEzn1vI2UmGdVu2E73Kg6gjQbIUxAzTewX/s=;
 b=dWQRdORcnViSKQ0jrxQfI9pCCoLdIN5EjrsFkXRxPZdEuvGFm/39FYqWiqaS2WSqzY
 GxfvCByuFt5sTZV0cbm4wPXzht5E5PZsfDwp6l8aveAMA57Ifg+fpbcqZnx2jB8s0ue3
 A6ozkVTr/y/vzVAgdSdOhvw0hWnrdSND+jvbMexbRZ1NXOLBqpdak8wuyokzVSfaYlM/
 E5uaz22ZWoDRlVmx0zxyGWEtFWG6A/m0qF2HsNdhSvlifzY14w30JEtuqW0FiH2aUTy3
 BU5jzH+ZvXvS1JH7LvoEew+zhuO4gP+/vB1h6YQoPp6usYTcZyj2DIeSRKCcIZAcixXW
 5xyg==
X-Gm-Message-State: AOAM533IZcXYwN1anXtlJYtjPHikyuPK0bgBXu3K336urNnrqS8CsBbu
 Bao64W1ios4lHgnYIPK4p5tVTIN+10eNK9tnzyE=
X-Google-Smtp-Source: ABdhPJwomfdFv74g7LtWrv3BgKpRE1uYToOAK4I3V3CrGlNjPPs0bVax+FBzsmncsI5lXTdncewIKA==
X-Received: by 2002:adf:f1d1:0:b0:206:1303:ee49 with SMTP id
 z17-20020adff1d1000000b002061303ee49mr3980391wro.533.1649192630865; 
 Tue, 05 Apr 2022 14:03:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm4858569wmb.36.2022.04.05.14.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:03:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 10/17] fbcon: Ditch error handling for
 con2fb_release_oldinfo
Date: Tue,  5 Apr 2022 23:03:28 +0200
Message-Id: <20220405210335.3434130-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
References: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It doesn't ever fail anymore.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/video/fbdev/core/fbcon.c | 37 +++++++++++---------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index d50154b62007..d828fef16910 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -739,9 +739,8 @@ static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
 	return err;
 }
 
-static int con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
-				  struct fb_info *newinfo, int unit,
-				  int oldidx, int found)
+static void con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
+				   struct fb_info *newinfo)
 {
 	struct fbcon_ops *ops = oldinfo->fbcon_par;
 	int ret;
@@ -770,8 +769,6 @@ static int con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
 				"detected unhandled fb_set_par error, "
 				"error code %d\n", ret);
 	}
-
-	return 0;
 }
 
 static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
@@ -825,7 +822,7 @@ static int set_con2fb_map(int unit, int newidx, int user)
 	int oldidx = con2fb_map[unit];
 	struct fb_info *info = registered_fb[newidx];
 	struct fb_info *oldinfo = NULL;
-	int found, err = 0;
+	int found, err = 0, show_logo;
 
 	WARN_CONSOLE_UNLOCKED();
 
@@ -854,18 +851,15 @@ static int set_con2fb_map(int unit, int newidx, int user)
 	 * fbcon should release it.
 	 */
 	if (!err && oldinfo && !search_fb_in_map(oldidx))
-		err = con2fb_release_oldinfo(vc, oldinfo, info, unit, oldidx,
-					     found);
+		con2fb_release_oldinfo(vc, oldinfo, info);
 
-	if (!err) {
-		int show_logo = (fg_console == 0 && !user &&
-				 logo_shown != FBCON_LOGO_DONTSHOW);
+	show_logo = (fg_console == 0 && !user &&
+			 logo_shown != FBCON_LOGO_DONTSHOW);
 
-		if (!found)
-			fbcon_add_cursor_work(info);
-		con2fb_map_boot[unit] = newidx;
-		con2fb_init_display(vc, info, unit, show_logo);
-	}
+	if (!found)
+		fbcon_add_cursor_work(info);
+	con2fb_map_boot[unit] = newidx;
+	con2fb_init_display(vc, info, unit, show_logo);
 
 	if (!search_fb_in_map(info_idx))
 		info_idx = newidx;
@@ -2769,7 +2763,7 @@ static inline void fbcon_unbind(void) {}
 /* called with console_lock held */
 void fbcon_fb_unbind(struct fb_info *info)
 {
-	int i, new_idx = -1, ret = 0;
+	int i, new_idx = -1;
 	int idx = info->node;
 
 	WARN_CONSOLE_UNLOCKED();
@@ -2803,13 +2797,8 @@ void fbcon_fb_unbind(struct fb_info *info)
 			if (con2fb_map[i] == idx) {
 				con2fb_map[i] = -1;
 				if (!search_fb_in_map(idx)) {
-					ret = con2fb_release_oldinfo(vc_cons[i].d,
-								     info, NULL, i,
-								     idx, 0);
-					if (ret) {
-						con2fb_map[i] = idx;
-						return;
-					}
+					con2fb_release_oldinfo(vc_cons[i].d,
+							       info, NULL);
 				}
 			}
 		}
-- 
2.34.1

