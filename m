Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED301676861
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 20:24:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9EC10E331;
	Sat, 21 Jan 2023 19:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5BC10E3BC
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674329088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5yb3FH8jX0MWRXyzAKd1yTC1HwTjMT1KOtJHzdpTmLM=;
 b=HJKYABfG95WWJlDm2YCjpgkSomuS1KRjTmsLzRDQoTy3AXvS527wFcXY0k8+W3brz/dA4C
 XUGXLzOeiZFaau2o4pDpwG+Ia9UnUg8h7poh+uHWCD9ZVFOLRdsQJGmTG8aPCni7oxz7l2
 gwds1dRrW8wLXhVQBP8I03LkvwQxm6I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-74-FdwyvzHNO2GDPD57mGg9EA-1; Sat, 21 Jan 2023 14:24:47 -0500
X-MC-Unique: FdwyvzHNO2GDPD57mGg9EA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v20-20020adfc5d4000000b002bdfcdb4c51so1410326wrg.9
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 11:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yb3FH8jX0MWRXyzAKd1yTC1HwTjMT1KOtJHzdpTmLM=;
 b=w068caedxwqxPafJWN6D5eXWucYuVxdiR+l1afWtzZAyeBmx/WzlKA5BQVOx8y68UB
 Tbrr3Q7rTR6FzBBha3Uiwe+LbvS/lobmjrQ1f4oCgtSL2zWZni5i/jT8rGNE+RiAKgXa
 S26M9aeVxU2P67e+pOQNvIfuibhNrgiRRIEbmght3z+NJ8mhOTS/jZXu+LyBWQaf2kh/
 sqwjjmj73lzQxkpaPaXXrEkRaoADa+TJyV0/gk1yJHFY+N6yq85BXCA6jnlffwH0uAQj
 r/L8HuxZ6lAmowgM/nrIw/3Moj5glppATm7REaLfsZ2KCNRp+CkMwp0zELpkAyiY005a
 wDkA==
X-Gm-Message-State: AFqh2kp+RxRJbj6PEV0MbYZrZxqBNo9Pjn2HGn1qffLqh6qMxR0INkEV
 kYxVCUbD3wIJULbEeMHzyxgSrJj0zodvBkK5dqNSA85NDrfEzR+hUQG/Dh/dCdHUt8EGBI+LAp5
 1XrJu/uUh3PDmCt4jHY4EAM0mabUF
X-Received: by 2002:a05:600c:2255:b0:3da:f950:8168 with SMTP id
 a21-20020a05600c225500b003daf9508168mr17593299wmm.35.1674329085899; 
 Sat, 21 Jan 2023 11:24:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu7/XGYvbQvHdPX4KdE971lVGAfQ0ExgfrXkYtLzVOSmg7BGN71xkjtA3ao8ZGPeTndCrBicQ==
X-Received: by 2002:a05:600c:2255:b0:3da:f950:8168 with SMTP id
 a21-20020a05600c225500b003daf9508168mr17593290wmm.35.1674329085743; 
 Sat, 21 Jan 2023 11:24:45 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003daff80f16esm8544321wmg.27.2023.01.21.11.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 11:24:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] fbdev: Remove unused struct fb_deferred_io .first_io
 field
Date: Sat, 21 Jan 2023 20:24:16 +0100
Message-Id: <20230121192418.2814955-2-javierm@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121192418.2814955-1-javierm@redhat.com>
References: <20230121192418.2814955-1-javierm@redhat.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Jaya Kumar <jayalk@intworks.biz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This optional callback was added in the commit 1f45f9dbb392 ("fb_defio:
add first_io callback") but it was never used by a driver. Let's remove
it since it's unlikely that will be used after a decade that was added.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/video/fbdev/core/fb_defio.c | 4 ----
 include/linux/fb.h                  | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index c730253ab85c..1b680742b7f3 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -157,10 +157,6 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
 	/* protect against the workqueue changing the page list */
 	mutex_lock(&fbdefio->lock);
 
-	/* first write in this cycle, notify the driver */
-	if (fbdefio->first_io && list_empty(&fbdefio->pagereflist))
-		fbdefio->first_io(info);
-
 	pageref = fb_deferred_io_pageref_get(info, offset, page);
 	if (WARN_ON_ONCE(!pageref)) {
 		ret = VM_FAULT_OOM;
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 30183fd259ae..daf336385613 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -215,7 +215,6 @@ struct fb_deferred_io {
 	struct mutex lock; /* mutex that protects the pageref list */
 	struct list_head pagereflist; /* list of pagerefs for touched pages */
 	/* callback */
-	void (*first_io)(struct fb_info *info);
 	void (*deferred_io)(struct fb_info *info, struct list_head *pagelist);
 };
 #endif
-- 
2.39.0

