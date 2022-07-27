Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707635839D0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 09:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F41294CDC;
	Thu, 28 Jul 2022 07:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6304D90E9B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 07:36:22 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id c24so12711449qkm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=streamunlimited.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rO4phdManN60SPf1W9WiyPdt9raYFpN1OI/PcK1NnQ0=;
 b=uf7lDkpVYO56NWMPL08t3bV7ykOUYmDaRNEf57tqkkhLMFpNUwzcla0Lokoe8tkjv6
 GY7TYiWRZHqk7bMBMb76LrdFBYz0PHG29omXVyfilS5Kj7k2Y34QjUeFMx9v5Rx6hD86
 OatRJqn2LPFVr9JyH10I7+SY5t911D/Yjk6Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rO4phdManN60SPf1W9WiyPdt9raYFpN1OI/PcK1NnQ0=;
 b=SZnVPcvWYjWK2AwmhKuJ5ZZ7vRsa1qR0RE1tvhONJtCDiWcg/NCgRPdXe0YU1djiVF
 yzM/i5j9yW+Bdu+v8h9Gf4lik8qRT1nohyQsTQ0SbXZQsStDYZUofAXnKnOn0PkM1ljq
 icVy9tuUy4/qIt3koyrLokqvlSv4AtnCSs5pJHuA3ho4Uu13RPv0rqMsYWImN70OX4lE
 BMoX4mUydVWJB/bHGXX8Y9MtM/uX+n71vBc+6Nz0K0E3XmhImALWZ9K4F5sjzDrmCFRB
 jH28p03U1hsmzgdgk0fHPCbO5AJ5SbFRyPRc78vJBtUzlaNFtmP6kRg/ThpXG0duAeuX
 18mQ==
X-Gm-Message-State: AJIora9KzRg9019REkK5faa59veTorp1Vb13qTTO2BvpdWTLmw3JLL+p
 fk0Lqu3C77D7FvUl/+X7LnCPZg==
X-Google-Smtp-Source: AGRyM1tTVXmc9JrwYNXN2698PGpq5P5gj2i9zaPSZqNDeI8sJMebG7pGAmT8yx65QQjJq/P/t8m5dQ==
X-Received: by 2002:a05:620a:2552:b0:6b4:8dbf:8992 with SMTP id
 s18-20020a05620a255200b006b48dbf8992mr15785127qko.109.1658907381478; 
 Wed, 27 Jul 2022 00:36:21 -0700 (PDT)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
 by smtp.gmail.com with ESMTPSA id
 x22-20020ac86b56000000b0031f4007dd92sm2709526qts.89.2022.07.27.00.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:36:21 -0700 (PDT)
From: Peter Suti <peter.suti@streamunlimited.com>
To: chuansheng.liu@intel.com, dan.carpenter@oracle.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v3] staging: fbtft: core: set smem_len before
 fb_deferred_io_init call
Date: Wed, 27 Jul 2022 09:35:50 +0200
Message-Id: <20220727073550.1491126-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YuDlfLeossnntH/C@kroah.com>
References: <YuDlfLeossnntH/C@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Jul 2022 07:49:19 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Suti <peter.suti@streamunlimited.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbtft_framebuffer_alloc() calls fb_deferred_io_init() before
initializing info->fix.smem_len.  It is set to zero by the
framebuffer_alloc() function.  It will trigger a WARN_ON() at the
start of fb_deferred_io_init() and the function will not do anything.

Fixes: 856082f021a2 ("fbdev: defio: fix the pagelist corruption")

Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
---
 V2 -> V3: Add patch changelog 
 V1 -> V2: Change commit message and base on top of linux-next

 drivers/staging/fbtft/fbtft-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 9b3eaed80cdd..afaba94d1d1c 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -654,7 +654,6 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	fbdefio->delay =            HZ / fps;
 	fbdefio->sort_pagereflist = true;
 	fbdefio->deferred_io =      fbtft_deferred_io;
-	fb_deferred_io_init(info);
 
 	snprintf(info->fix.id, sizeof(info->fix.id), "%s", dev->driver->name);
 	info->fix.type =           FB_TYPE_PACKED_PIXELS;
@@ -665,6 +664,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	info->fix.line_length =    width * bpp / 8;
 	info->fix.accel =          FB_ACCEL_NONE;
 	info->fix.smem_len =       vmem_size;
+	fb_deferred_io_init(info);
 
 	info->var.rotate =         pdata->rotate;
 	info->var.xres =           width;
-- 
2.25.1

