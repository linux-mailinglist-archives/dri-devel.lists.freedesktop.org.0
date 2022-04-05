Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB94F3F8F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ED310EEBE;
	Tue,  5 Apr 2022 21:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A1110EEBF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:51 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id h16so258613wmd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8rYfHIFLuEVdqgbByRRE103PNE72AQwfEHR9ORD+wyM=;
 b=fT8a4VHizz87sNqqy3e+wv9IWPu4eai7VGMpuPJ5Rp6jzrf+dstBuDa6YkOMVgllSY
 DB0PzFP+yGqN7RpDVQs+zn3UdC/y1YzqqMcwNJfct0+3blx3OKL3aUAoY4N3jl9mB7Zk
 L8NIHcmGpwYVuPVlzpB4HwhAQRPczoKAnBur4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8rYfHIFLuEVdqgbByRRE103PNE72AQwfEHR9ORD+wyM=;
 b=6OwVYSkobrykiXsuojyXBbxnnN62tKF+VsdhnOMDzrs5Glsm2gOc4Tqm2z2DBB7M2M
 cZclvGCWye28In6cyFXGvoBv//YUe5NxoL+o2KTyT3KisjlBVznepuhfsHz4S8oGRR9k
 W+YvoJcocMLA63v8OlG/Z/8oX46ePZojqFUmLN57NDEMK65o54MtY7lIlNesANAOJA4B
 qevDh7oEK045n75x/6Nun+2SJkOO126Vn22tICO8njzq8h9rz5VaFRtBYOHFRsHtH3XH
 /dtKzHPxvLp9Djmgv198ILoLgsiD8fQSd9QN+rapHZl6/p/jm6TGRSLf7OvaY2dMNJ76
 jiVg==
X-Gm-Message-State: AOAM532FxbjuE6EUT+JjSsiDR6OBkDKeh7g2KvrSf6APNANIoC3T7k8C
 Wb6pt33+n1h2BE2R46fAUzVh9CRr2xYFi6rCyiA=
X-Google-Smtp-Source: ABdhPJwNjo0O3n7lTKxze4sE298xXbIvmQibaWZH/0jv7vW7hEyT2GLPWZiEhAC2+YnAkZMroudZNw==
X-Received: by 2002:a7b:cb56:0:b0:38e:7e24:33ab with SMTP id
 v22-20020a7bcb56000000b0038e7e2433abmr4645567wmj.182.1649192630046; 
 Tue, 05 Apr 2022 14:03:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm4858569wmb.36.2022.04.05.14.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:03:49 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 09/17] fbcon: Extract fbcon_open/release helpers
Date: Tue,  5 Apr 2022 23:03:27 +0200
Message-Id: <20220405210335.3434130-10-daniel.vetter@ffwll.ch>
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
Cc: Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's two minor behaviour changes in here:
- in error paths we now consistently call fb_ops->fb_release
- fb_release really can't fail (fbmem.c ignores it too) and there's no
  reasonable cleanup we can do anyway.

Note that everything in fbcon.c is protected by the big console_lock()
lock (especially all the global variables), so the minor changes in
ordering of setup/cleanup do not matter.

v2: Explain a bit better why this is all correct (Sam)

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Du Cheng <ducheng2@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 107 +++++++++++++++----------------
 1 file changed, 53 insertions(+), 54 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 81860ca80838..d50154b62007 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -682,19 +682,37 @@ static int fbcon_invalid_charcount(struct fb_info *info, unsigned charcount)
 
 #endif /* CONFIG_MISC_TILEBLITTING */
 
+static int fbcon_open(struct fb_info *info)
+{
+	if (!try_module_get(info->fbops->owner))
+		return -ENODEV;
+
+	if (info->fbops->fb_open &&
+	    info->fbops->fb_open(info, 0)) {
+		module_put(info->fbops->owner);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void fbcon_release(struct fb_info *info)
+{
+	if (info->fbops->fb_release)
+		info->fbops->fb_release(info, 0);
+
+	module_put(info->fbops->owner);
+}
 
 static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
 				  int unit, int oldidx)
 {
 	struct fbcon_ops *ops = NULL;
-	int err = 0;
-
-	if (!try_module_get(info->fbops->owner))
-		err = -ENODEV;
+	int err;
 
-	if (!err && info->fbops->fb_open &&
-	    info->fbops->fb_open(info, 0))
-		err = -ENODEV;
+	err = fbcon_open(info);
+	if (err)
+		return err;
 
 	if (!err) {
 		ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
@@ -715,7 +733,7 @@ static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
 
 	if (err) {
 		con2fb_map[unit] = oldidx;
-		module_put(info->fbops->owner);
+		fbcon_release(info);
 	}
 
 	return err;
@@ -726,45 +744,34 @@ static int con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
 				  int oldidx, int found)
 {
 	struct fbcon_ops *ops = oldinfo->fbcon_par;
-	int err = 0, ret;
+	int ret;
 
-	if (oldinfo->fbops->fb_release &&
-	    oldinfo->fbops->fb_release(oldinfo, 0)) {
-		con2fb_map[unit] = oldidx;
-		if (!found && newinfo->fbops->fb_release)
-			newinfo->fbops->fb_release(newinfo, 0);
-		if (!found)
-			module_put(newinfo->fbops->owner);
-		err = -ENODEV;
-	}
+	fbcon_release(oldinfo);
 
-	if (!err) {
-		fbcon_del_cursor_work(oldinfo);
-		kfree(ops->cursor_state.mask);
-		kfree(ops->cursor_data);
-		kfree(ops->cursor_src);
-		kfree(ops->fontbuffer);
-		kfree(oldinfo->fbcon_par);
-		oldinfo->fbcon_par = NULL;
-		module_put(oldinfo->fbops->owner);
-		/*
-		  If oldinfo and newinfo are driving the same hardware,
-		  the fb_release() method of oldinfo may attempt to
-		  restore the hardware state.  This will leave the
-		  newinfo in an undefined state. Thus, a call to
-		  fb_set_par() may be needed for the newinfo.
-		*/
-		if (newinfo && newinfo->fbops->fb_set_par) {
-			ret = newinfo->fbops->fb_set_par(newinfo);
+	fbcon_del_cursor_work(oldinfo);
+	kfree(ops->cursor_state.mask);
+	kfree(ops->cursor_data);
+	kfree(ops->cursor_src);
+	kfree(ops->fontbuffer);
+	kfree(oldinfo->fbcon_par);
+	oldinfo->fbcon_par = NULL;
+	/*
+	  If oldinfo and newinfo are driving the same hardware,
+	  the fb_release() method of oldinfo may attempt to
+	  restore the hardware state.  This will leave the
+	  newinfo in an undefined state. Thus, a call to
+	  fb_set_par() may be needed for the newinfo.
+	*/
+	if (newinfo && newinfo->fbops->fb_set_par) {
+		ret = newinfo->fbops->fb_set_par(newinfo);
 
-			if (ret)
-				printk(KERN_ERR "con2fb_release_oldinfo: "
-					"detected unhandled fb_set_par error, "
-					"error code %d\n", ret);
-		}
+		if (ret)
+			printk(KERN_ERR "con2fb_release_oldinfo: "
+				"detected unhandled fb_set_par error, "
+				"error code %d\n", ret);
 	}
 
-	return err;
+	return 0;
 }
 
 static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
@@ -919,7 +926,6 @@ static const char *fbcon_startup(void)
 	struct fbcon_display *p = &fb_display[fg_console];
 	struct vc_data *vc = vc_cons[fg_console].d;
 	const struct font_desc *font = NULL;
-	struct module *owner;
 	struct fb_info *info = NULL;
 	struct fbcon_ops *ops;
 	int rows, cols;
@@ -938,17 +944,12 @@ static const char *fbcon_startup(void)
 	if (!info)
 		return NULL;
 	
-	owner = info->fbops->owner;
-	if (!try_module_get(owner))
+	if (fbcon_open(info))
 		return NULL;
-	if (info->fbops->fb_open && info->fbops->fb_open(info, 0)) {
-		module_put(owner);
-		return NULL;
-	}
 
 	ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
 	if (!ops) {
-		module_put(owner);
+		fbcon_release(info);
 		return NULL;
 	}
 
@@ -3314,10 +3315,6 @@ static void fbcon_exit(void)
 		}
 
 		if (mapped) {
-			if (info->fbops->fb_release)
-				info->fbops->fb_release(info, 0);
-			module_put(info->fbops->owner);
-
 			if (info->fbcon_par) {
 				struct fbcon_ops *ops = info->fbcon_par;
 
@@ -3327,6 +3324,8 @@ static void fbcon_exit(void)
 				kfree(info->fbcon_par);
 				info->fbcon_par = NULL;
 			}
+
+			fbcon_release(info);
 		}
 	}
 }
-- 
2.34.1

