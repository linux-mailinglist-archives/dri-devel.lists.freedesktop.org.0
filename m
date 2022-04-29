Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 992AA514484
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3874710FBB3;
	Fri, 29 Apr 2022 08:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4485F10FBAD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GpZJ4wX7kOe8KNr9fDnXvQai/0Kn9GYbVZ0gMqgfC8g=;
 b=hRKmsg+MSYp2cGdQ/Jo8j4aYXe5fYPqgTz+Ll1pA+JVdWYMIser7WRpCVH4GPmd0ekN6Lt
 tqKV5yZPt9DRZw+FSoc3aOakFMjt7O3JHhJmVWmHHaHAjG3LZffoVH8BkBhafHUj7xXEDv
 2FM921qpwI2RJizGVibPUDVPPW942xE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-IGFKO6ByOPCdP3zXkeqpSQ-1; Fri, 29 Apr 2022 04:43:24 -0400
X-MC-Unique: IGFKO6ByOPCdP3zXkeqpSQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so2801100wrg.19
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GpZJ4wX7kOe8KNr9fDnXvQai/0Kn9GYbVZ0gMqgfC8g=;
 b=pT7NIUgUjV1zcmxeeoykWZDcbbSSL/MDLgsFcAKMSLIafz0THgt70sWvQ/UpeNB1OR
 b38O51hYrt6iVoqBBX37GF4uhdkx8DsmZo+vnusTgT6hv3JP5XzqkyJ1T4qJT6fGIwaM
 BAwBa0vPwd+YzwE6LPFOOJ2Q9IevZbKtxJbSGLJjv2zED49EMX+NheOA4+B9vXZ3ngSn
 a6nrDBE8CxQuBlFqDU/4U9GbXPovcrfVW9FT3szaBoyuj9xWOAvIL/yFYSqfiS9V2lqR
 rkn4bpJZ6wX9HJCaBmLfqdcFRrhTpoDcKRGRIHkP4s6mew2fxKgfziyr8WjMeZv8WkIE
 LvWA==
X-Gm-Message-State: AOAM533SzhXX9IWly109jtcPsGOat/dtf9CektgP6KednIR7nkZdCj3Q
 1G7Y42WMb+7udMC/DNqBoS8aYA2NWDYc5oxeykZAurB3uH9tjBZ38O2RHo74h6Y/74Z70ztd3/p
 jHFW0/BBaV1ZduZwHy4wGGfKZ4WgW
X-Received: by 2002:a05:600c:4ec6:b0:394:1f35:4c69 with SMTP id
 g6-20020a05600c4ec600b003941f354c69mr1752579wmq.61.1651221802224; 
 Fri, 29 Apr 2022 01:43:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhmIBm7Rgju2BXAxf7jfHuCnxn2Uoy7l4mQ/iKVv2qM/3Q7Bt+zoSMdfHM0/61ANAlGkIsNA==
X-Received: by 2002:a05:600c:4ec6:b0:394:1f35:4c69 with SMTP id
 g6-20020a05600c4ec600b003941f354c69mr1752548wmq.61.1651221802012; 
 Fri, 29 Apr 2022 01:43:22 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b00393f1393abfsm7199256wmq.41.2022.04.29.01.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:43:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 11/11] fbdev: Make registered_fb[] private to fbmem.c
Date: Fri, 29 Apr 2022 10:42:53 +0200
Message-Id: <20220429084253.1085911-12-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429084253.1085911-1-javierm@redhat.com>
References: <20220429084253.1085911-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jon Nettleton <jon.nettleton@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 kernel test robot <lkp@intel.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Jens Frederich <jfrederich@gmail.com>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Guenter Roeck <linux@roeck-us.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
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
index 7583296481b0..1ce5b0f3abd4 100644
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
index b781bc721113..208bca693b33 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -623,16 +623,15 @@ extern int fb_get_color_depth(struct fb_var_screeninfo *var,
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
2.35.1

