Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042094A50FB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FEB10E58B;
	Mon, 31 Jan 2022 21:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3EC10E4F6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:06:52 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so259700wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DLCFktF5bXfVELdSs1sFnaEEXohencjsFb8X+BTPOv4=;
 b=IHzC2SevZm5+o9SbqNmhgWdJDul0iEkmYGyVGe/SmayW6tHVYAPf+A5/26FIZeTE+D
 0VOw3ADfS5vBpiQTuUGs2n8y+G19uSujvFy7DZ7THok1dM7BC3LIlrb046oFUnkEtglA
 ktiGzuVyyG84pbn82uIEzbyH2elqAexWphQIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DLCFktF5bXfVELdSs1sFnaEEXohencjsFb8X+BTPOv4=;
 b=6b1S7t8VsGqMomKcWNLGEW/e0pBjEpznEmeIMO4MmYTKJb3nEBVG9seFrSCedRDKcd
 XyTURHSL8hVH2KaT/88q4adKHVBEl9yzaNGX74F4vjdFosmwIVWP4SYcmH/GmklDysnp
 C4/itSJ1fSbQEsmeO7Sa3WIWW0lqfuXbukAF2f3AhrqIAF9Gj/lnmo80gNT1oUc7CUac
 MVjiGPtYOf8sGQfJi4FOMmI9OAnUKzIDgQYEN+sori78sgANofXMBtM6ULPzfhwQuuZp
 IHkwbtIMPmYujtlqct8LNkuJtCo1GTvGedH92zjOmgZ/JIn4cNSR2Incpg9aeBfJpjwZ
 /JNQ==
X-Gm-Message-State: AOAM530bzeysPHomL0jIcFqub/rGKBROLKUXD8onw3uXnvsFDYPSSo7Q
 stLR82B6WfCTyFT9n5zE/2GS3HVvJDD82A==
X-Google-Smtp-Source: ABdhPJwL5EQol13tK1r2sH3cLNG0kbIqqGvoNKhVRDedFDmv74vH5tVE+s2M6mlbGpn9cwEZu83+7w==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr28651132wmq.44.1643663210600; 
 Mon, 31 Jan 2022 13:06:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:06:50 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/21] fbcon: Move more code into fbcon_release
Date: Mon, 31 Jan 2022 22:05:48 +0100
Message-Id: <20220131210552.482606-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

con2fb_release_oldinfo() has a bunch more kfree() calls than
fbcon_exit(), but since kfree() on NULL is harmless doing that in both
places should be ok. This is also a bit more symmetric now again with
fbcon_open also allocating the fbcon_ops structure.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Claudio Suarez <cssk@net-c.es>
---
 drivers/video/fbdev/core/fbcon.c | 33 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index e5e8aaf6f60d..5c14e24d14a1 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -688,6 +688,18 @@ static void fbcon_release(struct fb_info *info)
 	unlock_fb_info(info);
 
 	module_put(info->fbops->owner);
+
+	if (info->fbcon_par) {
+		struct fbcon_ops *ops = info->fbcon_par;
+
+		fbcon_del_cursor_work(info);
+		kfree(ops->cursor_state.mask);
+		kfree(ops->cursor_data);
+		kfree(ops->cursor_src);
+		kfree(ops->fontbuffer);
+		kfree(info->fbcon_par);
+		info->fbcon_par = NULL;
+	}
 }
 
 static int fbcon_open(struct fb_info *info)
@@ -741,18 +753,10 @@ static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
 static void con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
 				   struct fb_info *newinfo)
 {
-	struct fbcon_ops *ops = oldinfo->fbcon_par;
 	int ret;
 
 	fbcon_release(oldinfo);
 
-	fbcon_del_cursor_work(oldinfo);
-	kfree(ops->cursor_state.mask);
-	kfree(ops->cursor_data);
-	kfree(ops->cursor_src);
-	kfree(ops->fontbuffer);
-	kfree(oldinfo->fbcon_par);
-	oldinfo->fbcon_par = NULL;
 	/*
 	  If oldinfo and newinfo are driving the same hardware,
 	  the fb_release() method of oldinfo may attempt to
@@ -3335,19 +3339,8 @@ static void fbcon_exit(void)
 			}
 		}
 
-		if (mapped) {
-			if (info->fbcon_par) {
-				struct fbcon_ops *ops = info->fbcon_par;
-
-				fbcon_del_cursor_work(info);
-				kfree(ops->cursor_src);
-				kfree(ops->cursor_state.mask);
-				kfree(info->fbcon_par);
-				info->fbcon_par = NULL;
-			}
-
+		if (mapped)
 			fbcon_release(info);
-		}
 	}
 }
 
-- 
2.33.0

