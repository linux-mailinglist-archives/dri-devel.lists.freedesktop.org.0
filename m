Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448074F3FA6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7FE10EED6;
	Tue,  5 Apr 2022 21:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7068010EEC8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q19so326197wrc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eAf6GnUNR4qzkfmM8oxrtWzw19A6DGGVW1uJzOzW25Q=;
 b=iRAaJ9nYq8r39GMvZWhwWGnCjiicvFhrWQUozK78cMDTl5Ovcicvhcn/I4K9GIsZsm
 DSFbabJ9O3KsR3OS35kqw4Zh9RDNHJryz3fL3WQAIdS4i0HkPYLa21YG/K6Sp9qjUZsr
 TiNk5EIAx9y0NdXxlL74P0rwLA5hS+eulSJlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eAf6GnUNR4qzkfmM8oxrtWzw19A6DGGVW1uJzOzW25Q=;
 b=H9XrPo1K6zG/n6MlbmVxzivhZSpGzcHG3xOKm7n4DlFwzxQ4Jls9E4GqNPoJmd86T2
 QRVITi/ytkPP4nSDtX+R36M2aR4SNffhVSRpTNBSSO+o+qT2rCNoSE+9NxBvWDd7f2lA
 meBcBhJHHxscp4pKoTum/uT3axtaGcXFH3F1mXfWdUfbtlxm1GKxG4jun/5a2KH6rOOt
 7d+f5nBtP9jdmoo2fiDkOpfYAlhFkkOKhVxMMBItfmT6JPSy3gpyw/HZwOgblxD20Psh
 XS04HU6CPNanjWevFQ8XbKlco1ZkFLG8nU9TWrbAHJPbKzMG9D5bBIrVnGRBrDizVh25
 dE8g==
X-Gm-Message-State: AOAM530lY9Ca3TJ7XBwLv/ilPlnGpX1EOLa9BLJHt4HZ3YXJJFShvFco
 XoxoUso6PDzo4rmeG/29eyzHrRaG/hUC4jJE1dI=
X-Google-Smtp-Source: ABdhPJwZUOZ464Nx7G+r+V0R4B61UmlM8FngsriGZzYkWXARhQ5fVzXYfdItCCHo99mvdjptjEngtQ==
X-Received: by 2002:a05:6000:15c3:b0:204:1185:7033 with SMTP id
 y3-20020a05600015c300b0020411857033mr3940754wry.625.1649192632993; 
 Tue, 05 Apr 2022 14:03:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm4858569wmb.36.2022.04.05.14.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:03:52 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 12/17] fbcon: use lock_fb_info in fbcon_open/release
Date: Tue,  5 Apr 2022 23:03:30 +0200
Message-Id: <20220405210335.3434130-13-daniel.vetter@ffwll.ch>
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zheyu Ma <zheyuma97@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 William Kucharski <william.kucharski@oracle.com>,
 Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now we get to the real motiviation, because fbmem.c insists that
that's the right lock for these.

Ofc fbcon.c has a lot more places where it probably should call
lock_fb_info(). But looking at fbmem.c at least most of these seem to
be protected by console_lock() too, which is probably what papers over
any issues.

Note that this means we're shuffling around a bit the locking sections
for some of the console takeover and unbind paths, but not all:
- console binding/unbinding from the console layer never with
lock_fb_info
- unbind (as opposed to unlink) never bother with lock_fb_info

Also the real serialization against set_par and set_pan are still
doing by wrapping the entire ioctl code in console_lock(). So this
shuffling shouldn't be worse than what we had from a "can you trigger
races?" pov, but it's at least clearer.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: William Kucharski <william.kucharski@oracle.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Zheyu Ma <zheyuma97@gmail.com>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>
---
 drivers/video/fbdev/core/fbcon.c | 5 +++++
 drivers/video/fbdev/core/fbmem.c | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index f0213a0e3870..cc960bf49991 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -684,8 +684,10 @@ static int fbcon_invalid_charcount(struct fb_info *info, unsigned charcount)
 
 static void fbcon_release(struct fb_info *info)
 {
+	lock_fb_info(info);
 	if (info->fbops->fb_release)
 		info->fbops->fb_release(info, 0);
+	unlock_fb_info(info);
 
 	module_put(info->fbops->owner);
 }
@@ -697,11 +699,14 @@ static int fbcon_open(struct fb_info *info)
 	if (!try_module_get(info->fbops->owner))
 		return -ENODEV;
 
+	lock_fb_info(info);
 	if (info->fbops->fb_open &&
 	    info->fbops->fb_open(info, 0)) {
+		unlock_fb_info(info);
 		module_put(info->fbops->owner);
 		return -ENODEV;
 	}
+	unlock_fb_info(info);
 
 	ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
 	if (!ops) {
diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 34d6bb1bf82e..0e68d9456bc2 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1670,9 +1670,7 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 		console_lock();
 	else
 		atomic_inc(&ignore_console_lock_warning);
-	lock_fb_info(fb_info);
 	ret = fbcon_fb_registered(fb_info);
-	unlock_fb_info(fb_info);
 
 	if (!lockless_register_fb)
 		console_unlock();
@@ -1689,9 +1687,7 @@ static void unbind_console(struct fb_info *fb_info)
 		return;
 
 	console_lock();
-	lock_fb_info(fb_info);
 	fbcon_fb_unbind(fb_info);
-	unlock_fb_info(fb_info);
 	console_unlock();
 }
 
-- 
2.34.1

