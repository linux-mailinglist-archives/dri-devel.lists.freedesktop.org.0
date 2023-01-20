Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF154675427
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0943610EA34;
	Fri, 20 Jan 2023 12:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB78210EA36
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674216516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zizGqLgDtMjJvJ8Y3gxXr4ehRe41Dz0Ln+Ptew+d+Lc=;
 b=AYQ+Yw7oytz3aKFLrgvCMYFXWEz4+CV6tCqzG8dHFk2cyTnh4WPrIpYxn2JaPs62XThakM
 k7SBdwjSVfMkTKDcaCv01RnIYb9kapycYGsA09fB2I6XikJlUhCqorLxwlTXL1Dcyp5vRC
 2tLT1s0JTmCXncq2Np7TD7CSveubX7I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-mLLV-Mr9Mvyg7GYx1bvGpg-1; Fri, 20 Jan 2023 07:08:30 -0500
X-MC-Unique: mLLV-Mr9Mvyg7GYx1bvGpg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o22-20020a05600c511600b003db02b921f1so4681450wms.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zizGqLgDtMjJvJ8Y3gxXr4ehRe41Dz0Ln+Ptew+d+Lc=;
 b=o0wG6dlFjkc6P2t1CgFkVnXfq1zDQIPrNNht8IPLbrMkREFUZgxOVIE1c9TG3mqCc+
 KFLzVVwZ/GvifsQhZh4wld5hJdGw5vy9z2ux7SZ1YeaOkQnvV0onBOXQxZO9LOyxUDV0
 3X1rZ53QSRdHbIHuxd3Ah95UqSZacZibPyMzr111loWquEIb8e7uQ4CQEodLdHFbsOHG
 dsj1oRaurJ3O0ZyEdL8+GlUwFOs3tNw44nc3vcY+jwIFPIULySme69RFmf25K4ncS/X1
 WTKltE+tIfUdqtnxf4RQGTo+Lq0rl+XbRc9W2Ef/l6I7ASRu57cyI+ra3aR6fHJLi/7Z
 +GCA==
X-Gm-Message-State: AFqh2kpd5KNum4vEiC4OfPd1pzxWxXn79BmCJidkNwBsFZePBdNf496o
 lbfXGgR6+mWC6IoO7hVKg+t5yuY3dAC/pTA04132llbOmThylU6tVZRmK0vR+7/HiNMRV3SL7SQ
 1UXTcZZeUGgiFQUM2wXzJb4EgvV3/
X-Received: by 2002:a05:6000:178a:b0:2be:276c:fb60 with SMTP id
 e10-20020a056000178a00b002be276cfb60mr15613281wrg.64.1674216508964; 
 Fri, 20 Jan 2023 04:08:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXviXDLfJrvvimx9Nj+OGPkScIhm/b1eowt9jkmdc00+VtEL6f75NCTIAkwUkDVqtpQmvMRwHg==
X-Received: by 2002:a05:6000:178a:b0:2be:276c:fb60 with SMTP id
 e10-20020a056000178a00b002be276cfb60mr15613257wrg.64.1674216508766; 
 Fri, 20 Jan 2023 04:08:28 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b002bbb2d43f65sm32766336wrx.14.2023.01.20.04.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 04:08:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] fbdev: Remove unused struct fb_deferred_io .first_io field
Date: Fri, 20 Jan 2023 13:08:20 +0100
Message-Id: <20230120120822.2536032-2-javierm@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120120822.2536032-1-javierm@redhat.com>
References: <20230120120822.2536032-1-javierm@redhat.com>
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
---

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

