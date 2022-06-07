Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F799540AD0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFE010F2DD;
	Tue,  7 Jun 2022 18:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF3210F28F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654626234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P4f3wHn7jIrIURtw341a5ADfTmzk5i8t59cyMFQz5Qc=;
 b=ZXcp5JOvzCI0VYPfzLt77WWjJvPlVrG0a9uxlABOLKS4XO82WjZEe5ccZw+so/YuACnh2A
 eeN/kFfDGMOdsnyI3K6KoN4ZgQoBV09VI9wV7lrei9HxJo3ptLMGuO2Y5WyR1ZLhNHbz6I
 4EffH7WBI7u+88eE8aUa+uB1/LMEncM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-1cOJ_udUPzWCW07lLaziFw-1; Tue, 07 Jun 2022 14:23:53 -0400
X-MC-Unique: 1cOJ_udUPzWCW07lLaziFw-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay1-20020a05600c1e0100b0039c3a3fc6a4so6049427wmb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 11:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P4f3wHn7jIrIURtw341a5ADfTmzk5i8t59cyMFQz5Qc=;
 b=bYl3vGp9oQkd9vExzhur5FuRz8F8syOWy8BFLb2vBP4h6dnFBZ4pUIQxIeqrU+l7bR
 I5bO31y/7dAqnk0sFBCeb2HX0ZxRkHiLvlqgtjhzryxNbypIMO41eDs2S4iwqGL+Dqk8
 zBbhaRwUWJQjJzCrGyTMVRemcQmoF03ZaWxul3YTwky+Kw/TnAakQ+T57nMb/qBkYlpy
 mnw42j+KdbgRwpuGtXMcpA3h/2yOvgvcH+qSAOst1csj9WEmTI7+97pZFF4bwB6N+wER
 jOar09SB2pKgt7ZiIoCMAEUy4PTu6OAkdfqfqGnx62z+7JjvTBJ6MwLGH16befAEMUFO
 sTAg==
X-Gm-Message-State: AOAM533tHKiujAxU8iRk/EOrd1WXiZyy7zPxa6M2rBc9v45Jgt9Ibu2e
 PTUua963y7+6n8qgXI9sbBAfrcvtPZKkIkthubtmAz8G6/eHQraed1IZyfGVJuwNy8WlBBul+k1
 T8grC/utqMvIU9E57FGNXx/aiAYRh
X-Received: by 2002:a05:6000:711:b0:217:371e:b7ff with SMTP id
 bs17-20020a056000071100b00217371eb7ffmr16261827wrb.127.1654626232063; 
 Tue, 07 Jun 2022 11:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/N4WjMmddIXMJgSScZ/qUGCGSnIp6UQDq474dS3NmqfffRft8Ws4ePchj9FzlpDpPJ0DOSA==
X-Received: by 2002:a05:6000:711:b0:217:371e:b7ff with SMTP id
 bs17-20020a056000071100b00217371eb7ffmr16261787wrb.127.1654626231742; 
 Tue, 07 Jun 2022 11:23:51 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b003942a244f51sm28267502wmq.42.2022.06.07.11.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:23:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/5] fbdev: Make registered_fb[] private to fbmem.c
Date: Tue,  7 Jun 2022 20:23:38 +0200
Message-Id: <20220607182338.344270-6-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607182338.344270-1-javierm@redhat.com>
References: <20220607182338.344270-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
 kvm@vger.kernel.org, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jon Nettleton <jon.nettleton@gmail.com>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Jens Frederich <jfrederich@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Laszlo Ersek <lersek@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Williamson <alex.williamson@redhat.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

Well except when the olpc dcon fbdev driver is enabled, that thing
digs around in there in rather unfixable ways.

Cc oldc_dcon maintainers as fyi.

v2: I typoed the config name (0day)

Cc: kernel test robot <lkp@intel.com>
Cc: Jens Frederich <jfrederich@gmail.com>
Cc: Jon Nettleton <jon.nettleton@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
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
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/video/fbdev/core/fbmem.c | 8 ++++++--
 include/linux/fb.h               | 7 +++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index e0720fef0ee6..bdb08b665b43 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -50,10 +50,14 @@
 static DEFINE_MUTEX(registration_lock);
 
 struct fb_info *registered_fb[FB_MAX] __read_mostly;
-EXPORT_SYMBOL(registered_fb);
-
 int num_registered_fb __read_mostly;
+#if IS_ENABLED(CONFIG_FB_OLPC_DCON)
+EXPORT_SYMBOL(registered_fb);
 EXPORT_SYMBOL(num_registered_fb);
+#endif
+#define for_each_registered_fb(i)		\
+	for (i = 0; i < FB_MAX; i++)		\
+		if (!registered_fb[i]) {} else
 
 bool fb_center_logo __read_mostly;
 
diff --git a/include/linux/fb.h b/include/linux/fb.h
index bbe1e4571899..c563e24b6293 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -632,16 +632,15 @@ extern int fb_get_color_depth(struct fb_var_screeninfo *var,
 extern int fb_get_options(const char *name, char **option);
 extern int fb_new_modelist(struct fb_info *info);
 
+#if IS_ENABLED(CONFIG_FB_OLPC_DCON)
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
2.36.1

