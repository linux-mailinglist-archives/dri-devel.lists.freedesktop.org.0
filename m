Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1177B4AE2FB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F030310E63F;
	Tue,  8 Feb 2022 21:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A1D10E5DD
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 21:08:58 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i14so537233wrc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 13:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NyPCuPft4VaB2bVEt8jlMDRi9/YFFe0dNdOhzBh/pVo=;
 b=aawQdusFo5feJFuhXzMoJ49/qU8d+ooMce0HpRYoXBt6yGf3ijYr7CGMbFThwkAH1V
 p7p3m9MoCSYTyxYMHncWQPSc2adNdGMnIypoEoWJVsnR6Q/7IQrQzM8mdvGkU7qRXNIC
 MzBRQNoXHcMWnacdpVF7H7ZR/Vyi5dt6k9tmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NyPCuPft4VaB2bVEt8jlMDRi9/YFFe0dNdOhzBh/pVo=;
 b=XYTCpJDQ9KavSOrDHhM34svg13jjeuH/oBZlkv0l0/EzXud3ct5zv5Zkj1PxEbOL6Q
 8mc+hmlm1GB4V4HTYN8Ux9n5eoKmMlYy/YFVGBXLeMnVWU8TPMV305hwB8G/rl8cCsom
 B0n7a9VKmF98k7eZsFt/3/7Ag5YmA/jpd8oT9A8lyh4NwrsBtKIzbwV6G/sZGmOngBS+
 x2Z6RXU+9Ig5m5HpaN/848FyszDm09ryOQCVaXrLgrqhBwfJS2ihuB+kL2AIoW7l34YI
 T8SqOzK6jB8PJWpCMYD3QpI2+w+PDr0bhN+UrQ1NO2toWyIZNsS3iado97mRJDPMFKTG
 nKPQ==
X-Gm-Message-State: AOAM530VJhSm/SixQ3KCbNJcKARHciKzaS/A8vz7G1qZR9wyC4HQbWI4
 ie/essouWZOicOYJvpevkbljCrEQnIc2RA==
X-Google-Smtp-Source: ABdhPJyA7a0WtGiKEc9Hx0Id9CYQn2eyAOKKOMDLXoycCrXIIKxBobqiCvwcQ1tmmiyztoyt/Hxazg==
X-Received: by 2002:adf:f504:: with SMTP id q4mr1972172wro.670.1644354536398; 
 Tue, 08 Feb 2022 13:08:56 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o14sm3033561wmr.3.2022.02.08.13.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:08:55 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 17/19] fbcon: Maintain a private array of fb_info
Date: Tue,  8 Feb 2022 22:08:22 +0100
Message-Id: <20220208210824.2238981-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Accessing the one in fbmem.c without taking the right locks is a bad
idea. Instead maintain our own private copy, which is fully protected
by console_lock() (like everything else in fbcon.c). That copy is
serialized through fbcon_fb_registered/unregistered() calls.

Also this means we do not need to hold a full fb_info reference, which
is nice because doing so would mean a refcount loop between the
console and the fb_info. But it's also not nice since it means
console_lock() must be held absolutely everywhere. Well strictly
speaking we could still try to do some refcounting games again by
calling get_fb_info before we drop the console_lock. But things will
get tricky.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/core/fbcon.c | 82 +++++++++++++++++---------------
 1 file changed, 43 insertions(+), 39 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 944f514c77ec..6a7d470beec7 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -86,10 +86,6 @@
  * - fbcon state itself is protected by the console_lock, and the code does a
  *   pretty good job at making sure that lock is held everywhere it's needed.
  *
- * - access to the registered_fb array is entirely unprotected. This should use
- *   proper object lifetime handling, i.e. get/put_fb_info. This also means
- *   switching from indices to proper pointers for fb_info everywhere.
- *
  * - fbcon doesn't bother with fb_lock/unlock at all. This is buggy, since it
  *   means concurrent access to the same fbdev from both fbcon and userspace
  *   will blow up. To fix this all fbcon calls from fbmem.c need to be moved out
@@ -107,6 +103,13 @@ enum {
 
 static struct fbcon_display fb_display[MAX_NR_CONSOLES];
 
+struct fb_info *fbcon_registered_fb[FB_MAX];
+int fbcon_num_registered_fb;
+
+#define fbcon_for_each_registered_fb(i)		\
+	for (i = 0; WARN_CONSOLE_UNLOCKED(), i < FB_MAX; i++)		\
+		if (!fbcon_registered_fb[i]) {} else
+
 static signed char con2fb_map[MAX_NR_CONSOLES];
 static signed char con2fb_map_boot[MAX_NR_CONSOLES];
 
@@ -114,12 +117,7 @@ static struct fb_info *fbcon_info_from_console(int console)
 {
 	WARN_CONSOLE_UNLOCKED();
 
-	/*
-	 * Note that only con2fb_map is protected by the console lock,
-	 * registered_fb is protected by a separate mutex. This lookup can
-	 * therefore race.
-	 */
-	return registered_fb[con2fb_map[console]];
+	return fbcon_registered_fb[con2fb_map[console]];
 }
 
 static int logo_lines;
@@ -518,7 +516,7 @@ static int do_fbcon_takeover(int show_logo)
 {
 	int err, i;
 
-	if (!num_registered_fb)
+	if (!fbcon_num_registered_fb)
 		return -ENODEV;
 
 	if (!show_logo)
@@ -821,7 +819,7 @@ static int set_con2fb_map(int unit, int newidx, int user)
 {
 	struct vc_data *vc = vc_cons[unit].d;
 	int oldidx = con2fb_map[unit];
-	struct fb_info *info = registered_fb[newidx];
+	struct fb_info *info = fbcon_registered_fb[newidx];
 	struct fb_info *oldinfo = NULL;
 	int found, err = 0, show_logo;
 
@@ -839,7 +837,7 @@ static int set_con2fb_map(int unit, int newidx, int user)
 	}
 
 	if (oldidx != -1)
-		oldinfo = registered_fb[oldidx];
+		oldinfo = fbcon_registered_fb[oldidx];
 
 	found = search_fb_in_map(newidx);
 
@@ -931,13 +929,13 @@ static const char *fbcon_startup(void)
 	 *  If num_registered_fb is zero, this is a call for the dummy part.
 	 *  The frame buffer devices weren't initialized yet.
 	 */
-	if (!num_registered_fb || info_idx == -1)
+	if (!fbcon_num_registered_fb || info_idx == -1)
 		return display_desc;
 	/*
 	 * Instead of blindly using registered_fb[0], we use info_idx, set by
 	 * fbcon_fb_registered();
 	 */
-	info = registered_fb[info_idx];
+	info = fbcon_registered_fb[info_idx];
 	if (!info)
 		return NULL;
 	
@@ -1150,9 +1148,9 @@ static void fbcon_release_all(void)
 	struct fb_info *info;
 	int i, j, mapped;
 
-	for_each_registered_fb(i) {
+	fbcon_for_each_registered_fb(i) {
 		mapped = 0;
-		info = registered_fb[i];
+		info = fbcon_registered_fb[i];
 
 		for (j = first_fb_vc; j <= last_fb_vc; j++) {
 			if (con2fb_map[j] == i) {
@@ -1179,7 +1177,7 @@ static void fbcon_deinit(struct vc_data *vc)
 	if (idx == -1)
 		goto finished;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 
 	if (!info)
 		goto finished;
@@ -2098,9 +2096,9 @@ static int fbcon_switch(struct vc_data *vc)
 	 *
 	 * info->currcon = vc->vc_num;
 	 */
-	for_each_registered_fb(i) {
-		if (registered_fb[i]->fbcon_par) {
-			struct fbcon_ops *o = registered_fb[i]->fbcon_par;
+	fbcon_for_each_registered_fb(i) {
+		if (fbcon_registered_fb[i]->fbcon_par) {
+			struct fbcon_ops *o = fbcon_registered_fb[i]->fbcon_par;
 
 			o->currcon = vc->vc_num;
 		}
@@ -2745,7 +2743,7 @@ int fbcon_mode_deleted(struct fb_info *info,
 		j = con2fb_map[i];
 		if (j == -1)
 			continue;
-		fb_info = registered_fb[j];
+		fb_info = fbcon_registered_fb[j];
 		if (fb_info != info)
 			continue;
 		p = &fb_display[i];
@@ -2801,7 +2799,7 @@ void fbcon_fb_unbind(struct fb_info *info)
 				set_con2fb_map(i, new_idx, 0);
 		}
 	} else {
-		struct fb_info *info = registered_fb[idx];
+		struct fb_info *info = fbcon_registered_fb[idx];
 
 		/* This is sort of like set_con2fb_map, except it maps
 		 * the consoles to no device and then releases the
@@ -2831,6 +2829,9 @@ void fbcon_fb_unregistered(struct fb_info *info)
 
 	console_lock();
 
+	fbcon_registered_fb[info->node] = NULL;
+	fbcon_num_registered_fb--;
+
 	if (deferred_takeover) {
 		console_unlock();
 		return;
@@ -2845,7 +2846,7 @@ void fbcon_fb_unregistered(struct fb_info *info)
 	if (idx == info_idx) {
 		info_idx = -1;
 
-		for_each_registered_fb(i) {
+		fbcon_for_each_registered_fb(i) {
 			info_idx = i;
 			break;
 		}
@@ -2861,7 +2862,7 @@ void fbcon_fb_unregistered(struct fb_info *info)
 	if (primary_device == idx)
 		primary_device = -1;
 
-	if (!num_registered_fb)
+	if (!fbcon_num_registered_fb)
 		do_unregister_con_driver(&fb_con);
 	console_unlock();
 }
@@ -2936,6 +2937,9 @@ int fbcon_fb_registered(struct fb_info *info)
 	else
 		atomic_inc(&ignore_console_lock_warning);
 
+	fbcon_registered_fb[info->node] = info;
+	fbcon_num_registered_fb++;
+
 	idx = info->node;
 	fbcon_select_primary(info);
 
@@ -3055,9 +3059,9 @@ int fbcon_set_con2fb_map_ioctl(void __user *argp)
 		return -EINVAL;
 	if (con2fb.framebuffer >= FB_MAX)
 		return -EINVAL;
-	if (!registered_fb[con2fb.framebuffer])
+	if (!fbcon_registered_fb[con2fb.framebuffer])
 		request_module("fb%d", con2fb.framebuffer);
-	if (!registered_fb[con2fb.framebuffer]) {
+	if (!fbcon_registered_fb[con2fb.framebuffer]) {
 		return -EINVAL;
 	}
 
@@ -3124,10 +3128,10 @@ static ssize_t store_rotate(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	if (idx == -1 || registered_fb[idx] == NULL)
+	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 	rotate = simple_strtoul(buf, last, 0);
 	fbcon_rotate(info, rotate);
 err:
@@ -3146,10 +3150,10 @@ static ssize_t store_rotate_all(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	if (idx == -1 || registered_fb[idx] == NULL)
+	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 	rotate = simple_strtoul(buf, last, 0);
 	fbcon_rotate_all(info, rotate);
 err:
@@ -3166,10 +3170,10 @@ static ssize_t show_rotate(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	if (idx == -1 || registered_fb[idx] == NULL)
+	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 	rotate = fbcon_get_rotate(info);
 err:
 	console_unlock();
@@ -3186,10 +3190,10 @@ static ssize_t show_cursor_blink(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	if (idx == -1 || registered_fb[idx] == NULL)
+	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 	ops = info->fbcon_par;
 
 	if (!ops)
@@ -3212,10 +3216,10 @@ static ssize_t store_cursor_blink(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	if (idx == -1 || registered_fb[idx] == NULL)
+	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
 
-	info = registered_fb[idx];
+	info = fbcon_registered_fb[idx];
 
 	if (!info->fbcon_par)
 		goto err;
@@ -3275,8 +3279,8 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
 	deferred_takeover = false;
 	logo_shown = FBCON_LOGO_DONTSHOW;
 
-	for_each_registered_fb(i)
-		fbcon_fb_registered(registered_fb[i]);
+	fbcon_for_each_registered_fb(i)
+		fbcon_fb_registered(fbcon_registered_fb[i]);
 
 	console_unlock();
 }
-- 
2.34.1

