Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1FD4F3FAB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EC010EEDC;
	Tue,  5 Apr 2022 21:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3DC10EED1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r13so305831wrr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PCYS5QyMNkkwqTDkShTEbfPtwnFmBXM7JP7Pazg2YKM=;
 b=G48KVChpjq4e/JccWqM/mY/3davozcw/HqBSDFbhPTSz8msFQqzvin+/rurHdhNYkN
 Fe1wzSlQ8I+Xz8+vLXjIm4NkVxb+xdaAXXyjD+/c+LUNSZtI08c2svqOT5L7rSE6D41t
 BVXSpLeKOXaIKUNmwvynP04e5YJYq6MBJJFkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PCYS5QyMNkkwqTDkShTEbfPtwnFmBXM7JP7Pazg2YKM=;
 b=My3BD0m6AFxF5Da6m0gRlxuQb0Xb2jUJBv2i/El6ok51sWgaR34jn6NL2Eo6Ptird8
 /+9xOUjn8fr2UYt22AxAk2ORA57jUpws/5XHXDX5oaops0cRAhwMIBp1XT/AA+qrJDHp
 H/IYRe5mBFOZK07oBCK/t2+uJlUwp10YaD7TqHI+WDRinVj9IuyCuXKFZyYQ2RSv+IbY
 rqeQroZqHQoylp2uPUW9T4tnRG5JTPa8v9gP0yXLeFILaAxOQ3CHUfC5O6XZTeVSxUks
 kCaqQPonl96Lv7oNXzRL+gkjMn6rTfar0or/sLZsaVS3eMYrlcdLCMIWnwq8wnJewGud
 5VyQ==
X-Gm-Message-State: AOAM533IXPKlsI+bG8b81Ae8DsSmjEL9Q8RiZ11eTrEXnZIE9kvyFP94
 lwD8LvmFkLPy9dyv8sKdN5FyScdYN8mlxV+1A0o=
X-Google-Smtp-Source: ABdhPJxq9N8HrrUKmjP14U4S1iUxgtrBii9fCE+XuNMssmQGZA3oC7MomXxvrczDBt6/5XhRCU6egg==
X-Received: by 2002:a5d:47a9:0:b0:205:d662:c1e1 with SMTP id
 9-20020a5d47a9000000b00205d662c1e1mr4107534wrb.577.1649192637326; 
 Tue, 05 Apr 2022 14:03:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm4858569wmb.36.2022.04.05.14.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:03:56 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 16/17] fbcon: untangle fbcon_exit
Date: Tue,  5 Apr 2022 23:03:34 +0200
Message-Id: <20220405210335.3434130-17-daniel.vetter@ffwll.ch>
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

There's a bunch of confusions going on here:
- The deferred fbcon setup notifier should only be cleaned up from
  fb_console_exit(), to be symmetric with fb_console_init()
- We also need to make sure we don't race with the work, which means
  temporarily dropping the console lock (or we can deadlock)
- That also means no point in clearing deferred_takeover, we are
  unloading everything anyway.
- Finally rename fbcon_exit to fbcon_release_all and move it, since
  that's what's it doing when being called from consw->con_deinit
  through fbcon_deinit.

To answer a question from Sam just quoting my own reply:

> We loose the call to fbcon_release_all() here [in fb_console_exit()].
> We have part of the old fbcon_exit() above, but miss the release parts.

Ah yes that's the entire point of this change. The release_all in the
fbcon exit path was only needed when fbcon was a separate module
indepedent from core fb.ko. Which means it was possible to unload fbcon
while having fbdev drivers registered.

But since we've merged them that has become impossible, so by the time the
fb.ko module can be unloaded, there's guaranteed to be no fbdev drivers
left. And hence removing them is pointless.

v2: Explain the why better (Sam)

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/video/fbdev/core/fbcon.c | 63 ++++++++++++++++----------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 685b4a9e5546..944f514c77ec 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -187,7 +187,6 @@ static void fbcon_redraw_move(struct vc_data *vc, struct fbcon_display *p,
 			      int line, int count, int dy);
 static void fbcon_modechanged(struct fb_info *info);
 static void fbcon_set_all_vcs(struct fb_info *info);
-static void fbcon_exit(void);
 
 static struct device *fbcon_device;
 
@@ -1146,6 +1145,27 @@ static void fbcon_free_font(struct fbcon_display *p, bool freefont)
 
 static void set_vc_hi_font(struct vc_data *vc, bool set);
 
+static void fbcon_release_all(void)
+{
+	struct fb_info *info;
+	int i, j, mapped;
+
+	for_each_registered_fb(i) {
+		mapped = 0;
+		info = registered_fb[i];
+
+		for (j = first_fb_vc; j <= last_fb_vc; j++) {
+			if (con2fb_map[j] == i) {
+				mapped = 1;
+				con2fb_map[j] = -1;
+			}
+		}
+
+		if (mapped)
+			fbcon_release(info);
+	}
+}
+
 static void fbcon_deinit(struct vc_data *vc)
 {
 	struct fbcon_display *p = &fb_display[vc->vc_num];
@@ -1185,7 +1205,7 @@ static void fbcon_deinit(struct vc_data *vc)
 		set_vc_hi_font(vc, false);
 
 	if (!con_is_bound(&fb_con))
-		fbcon_exit();
+		fbcon_release_all();
 
 	if (vc->vc_num == logo_shown)
 		logo_shown = FBCON_LOGO_CANSHOW;
@@ -3296,34 +3316,6 @@ static void fbcon_start(void)
 #endif
 }
 
-static void fbcon_exit(void)
-{
-	struct fb_info *info;
-	int i, j, mapped;
-
-#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
-	if (deferred_takeover) {
-		dummycon_unregister_output_notifier(&fbcon_output_nb);
-		deferred_takeover = false;
-	}
-#endif
-
-	for_each_registered_fb(i) {
-		mapped = 0;
-		info = registered_fb[i];
-
-		for (j = first_fb_vc; j <= last_fb_vc; j++) {
-			if (con2fb_map[j] == i) {
-				mapped = 1;
-				con2fb_map[j] = -1;
-			}
-		}
-
-		if (mapped)
-			fbcon_release(info);
-	}
-}
-
 void __init fb_console_init(void)
 {
 	int i;
@@ -3363,10 +3355,19 @@ static void __exit fbcon_deinit_device(void)
 
 void __exit fb_console_exit(void)
 {
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
+	console_lock();
+	if (deferred_takeover)
+		dummycon_unregister_output_notifier(&fbcon_output_nb);
+	console_unlock();
+
+	cancel_work_sync(&fbcon_deferred_takeover_work);
+#endif
+
 	console_lock();
 	fbcon_deinit_device();
 	device_destroy(fb_class, MKDEV(0, 0));
-	fbcon_exit();
+
 	do_unregister_con_driver(&fb_con);
 	console_unlock();
 }	
-- 
2.34.1

