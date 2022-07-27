Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B938F582139
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 09:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31FBC1E84;
	Wed, 27 Jul 2022 07:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E4BC1CF9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 07:08:24 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id g24so12077028qtu.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 00:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=streamunlimited.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyyO3i1v16awzlQfFzZWgMicARjUE5W8d3bIsv/OgNE=;
 b=mJFiwyzHl75IMZ8ucjWQXx6hvsV4XWr5nHjqYFHrjRKyhGKgh948OvOKF9+y/ZtevT
 YbF6R8O855DD/LtEHZ0KY8BQp4g1HgHeCgi7TTPXNf06zAOr+EoSi5Q5o2EIBggI78H+
 JLRduYEAy2fDKRwMjhOkzuziXSGvbHXLj2+uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyyO3i1v16awzlQfFzZWgMicARjUE5W8d3bIsv/OgNE=;
 b=eQ0P/HUKXl1OCp7yziNyVltSX1TAkTWTjapUWqbOYiKMKLn5RSI7wUYZydmfuaiXe0
 EbK1m5PAwBUCaRftsqtS1oawyLGH3p2O5Alrw0wAjHHv7ODV7y6gwPKcdghzqcV7YhvE
 JWb/W0l4LOBOotZ1/PuAknZ0imb+nOIcFujyWUV76sIt/Oq2T6f4/lw+nV7MMUjZ/XJm
 wHVtXmWVbdOYBTe4vVMftwCwa8ovUrOXio26ZJC0O5opR/WEMYcwtNGsE1ff9xbIKsAu
 K4SwtyO0MKHU7I5Ds9EUHnwKwChFgIueXS79ui0lFSDOp2+Hqz0FiVVPi+725vZAMTuF
 r8cQ==
X-Gm-Message-State: AJIora89YYmHngJcOlph4BroYrUCksMeerMemIZ1yN1Ha2XPjiT5cLe3
 CJIiYH8lSavYOLjTnuRsnyMjeA==
X-Google-Smtp-Source: AGRyM1sKKtleTGian1VChNl553V9Yw0pvi8UIZxWLqXfq44/w+W/AU43ZicsJpg0Tc6g6tlY2AolQw==
X-Received: by 2002:a05:622a:44e:b0:31f:4cf7:3abc with SMTP id
 o14-20020a05622a044e00b0031f4cf73abcmr31806qtx.124.1658905703974; 
 Wed, 27 Jul 2022 00:08:23 -0700 (PDT)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05620a280e00b006b5bf5d45casm12585198qkp.27.2022.07.27.00.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:08:23 -0700 (PDT)
From: Peter Suti <peter.suti@streamunlimited.com>
To: chuansheng.liu@intel.com, dan.carpenter@oracle.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2] staging: fbtft: core: set smem_len before
 fb_deferred_io_init call
Date: Wed, 27 Jul 2022 09:07:23 +0200
Message-Id: <20220727070723.1489599-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726161347.GR2338@kadam>
References: <20220726161347.GR2338@kadam>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 Jul 2022 07:37:27 +0000
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

