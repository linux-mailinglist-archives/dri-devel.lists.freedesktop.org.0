Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B32834A5107
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A9710E522;
	Mon, 31 Jan 2022 21:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88E510E4D1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:06:55 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id e8so27972038wrc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FxNR4P5lDXdqDoRY6o7wMDtTBWXikuXUtP+0kdBf7FQ=;
 b=Lo4AW9guvOF81u6WGQBXjsTZUvFuBcQIdzBj2fKuxIY0ijvWI/WKVVcAEew+wpAmNv
 T9o5T51UXeGAC8PY0e/dJSsEAeJCL79CCkRMNfyQnjXBUsH8+RxF6XddMCurXVkMGdfT
 UwQJSGBW+iiRzyYdMPsOrpy+yu64udBa1ILAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FxNR4P5lDXdqDoRY6o7wMDtTBWXikuXUtP+0kdBf7FQ=;
 b=v6WRUjyQLb9bUX5ny5UvNQBxHfaOeI7H6QM7lWYcQOt4wBMN1Ve2zkbEwcqTpfi3d0
 FYEMKb7WZI6O/rjJTm6mVuANfFeMJgIJPka/e7pCzu/7TkUxiAP216wp13OaTwDw4Jqb
 cc04/LORQlHbthTmT4A0psjW2+z/kHIOoYJVQT3NEVAZbCEzwSvF7RoqyFOAkBjOJdrV
 UE5eOWELHVb9HRZFdiQfaFfTZ6dLqMp77ZoEZ+inJiK7RZplhU+/AojqDtGpU7ttDbKq
 uTk18waTwMKSPpbJNdl2Zj57PE53Sa8l1rDi7S3YMtLE2P8zgvzsCZif1csICTncLtx8
 vklg==
X-Gm-Message-State: AOAM5320saGQu5V2SH26KmyyZ4wosmBKrK/lauv7un0wWoWNpI8EWnTo
 OCqXoWwH6dViESuemH6OCC/t02zCQfPqsQ==
X-Google-Smtp-Source: ABdhPJwF2QvK4hmf/7QGpz8EsMBpbsf23W007iTEYAPXtLNPFXTESQvIlo2rylKpGsmivnZGCNYQaQ==
X-Received: by 2002:adf:e8ce:: with SMTP id k14mr10214483wrn.284.1643663214293; 
 Mon, 31 Jan 2022 13:06:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:06:53 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 21/21] fbdev: Make registered_fb[] private to fbmem.c
Date: Mon, 31 Jan 2022 22:05:52 +0100
Message-Id: <20220131210552.482606-22-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Jens Frederich <jfrederich@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-staging@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jon Nettleton <jon.nettleton@gmail.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Well except when the olpc dcon fbdev driver is enabled, that thing
digs around in there in rather unfixable ways.

Cc oldc_dcon maintainers as fyi.

Cc: Jens Frederich <jfrederich@gmail.com>
Cc: Jon Nettleton <jon.nettleton@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Cc: linux-fbdev@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
---
 drivers/video/fbdev/core/fbmem.c | 8 ++++++--
 include/linux/fb.h               | 7 +++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 904ef1250677..dad6572942fa 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -48,10 +48,14 @@
 static DEFINE_MUTEX(registration_lock);
 
 struct fb_info *registered_fb[FB_MAX] __read_mostly;
-EXPORT_SYMBOL(registered_fb);
-
 int num_registered_fb __read_mostly;
+#if IS_ENABLED(CONFIG_OLPC_DCON)
+EXPORT_SYMBOL(registered_fb);
 EXPORT_SYMBOL(num_registered_fb);
+#endif
+#define for_each_registered_fb(i)		\
+	for (i = 0; i < FB_MAX; i++)		\
+		if (!registered_fb[i]) {} else
 
 bool fb_center_logo __read_mostly;
 
diff --git a/include/linux/fb.h b/include/linux/fb.h
index a8a00d2ba1f3..e236817502c2 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -622,16 +622,15 @@ extern int fb_get_color_depth(struct fb_var_screeninfo *var,
 extern int fb_get_options(const char *name, char **option);
 extern int fb_new_modelist(struct fb_info *info);
 
+#if IS_ENABLED(CONFIG_OLPC_DCON)
 extern struct fb_info *registered_fb[FB_MAX];
+
 extern int num_registered_fb;
+#endif
 extern bool fb_center_logo;
 extern int fb_logo_count;
 extern struct class *fb_class;
 
-#define for_each_registered_fb(i)		\
-	for (i = 0; i < FB_MAX; i++)		\
-		if (!registered_fb[i]) {} else
-
 static inline void lock_fb_info(struct fb_info *info)
 {
 	mutex_lock(&info->lock);
-- 
2.33.0

