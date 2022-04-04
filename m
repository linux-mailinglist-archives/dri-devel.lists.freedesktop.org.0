Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F054F113F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 10:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F75910EB46;
	Mon,  4 Apr 2022 08:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E6110EB4B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 08:47:58 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id c11so7765614pgu.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SWpUGp4NjV3mF23nQixJRErG81vz0xeRsfDHiseYmFE=;
 b=b0BitWdvZHTGzL4flNceTWdnxQtwSwZY5rAnnRUa1Ml+nFqLcBJ2kKJx/fs6xfPFvl
 CnhHwqlgN/roC4WdLsqaGZsrjw6Ld8wHYNg7TEz0LuvMMuJCYT1osfRnlImjbXzJc5Gj
 9vDQNbKfeIWAgtHngp01v6YPYfxabAvWqaqYHRs2bqWl2kkaRyMwlJu+2ZrhHUj5PLrs
 yjl5sBxSLIL93Y2FN9GX0kX6956qgWteXsvblXuZLS6Fbf4RptxQoU6nDZ3xBJFrZK1w
 V/7LXCAYAJvqjwVBn/J4+KZoqUzskh2ygSUXO4hEz6OnN7FCJ/rzL3/obwNAklbZ0TYN
 kF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SWpUGp4NjV3mF23nQixJRErG81vz0xeRsfDHiseYmFE=;
 b=sRnYUlHAGg/c146ryV4mN5pepLxXcM/5+e3tl7ElP5y8mqSZIZTyBxxVnR2LTFGYeE
 giFRoQT6dlH2K1v1/vv39QZLMszBf+p/i8cbRWwX8a+ezzKpmZVT2Z4L7mYVLTSvalqs
 RQf6El+PgLTaAyH0v0BiQhXf6CiRQj8ZhxM4dh+755AqidfZUJj+AIEpPKo1P9c+hJ7Z
 76AmSHITYIjs9K5u7XEjxSZ0CGUF4PIppuaSYOYU/wz2ilW9zDb5eRIeFbLYMnB60ZQ8
 ZJmyJtIHWW8ERuUdUP1zNOIY52Vb26df+KUQXZiFW1UE03OPs/bJCqHZnf4xN1jCgluQ
 bjIQ==
X-Gm-Message-State: AOAM531UgIBQDPxIEZpNHBT997bvFviQXbrEtxXeM5x+eOTqKwCqj/6J
 PLbieYubIgYKDgj/UhLYtQ==
X-Google-Smtp-Source: ABdhPJxz/8JcRIXtURoXNzWsyUQjQh/GXQxIkNp1/xI8KkbxCy3Pghw6PtQScHAtt2QEukPM+DPMqg==
X-Received: by 2002:a63:4f08:0:b0:34c:6090:603e with SMTP id
 d8-20020a634f08000000b0034c6090603emr24435870pgb.15.1649062077959; 
 Mon, 04 Apr 2022 01:47:57 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a17090a3fc600b001ca88b0bdfesm3991960pjm.13.2022.04.04.01.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:47:57 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de
Subject: [PATCH 5/7] video: fbdev: tridentfb: Error out if 'pixclock' equals
 zero
Date: Mon,  4 Apr 2022 16:47:21 +0800
Message-Id: <20220404084723.79089-6-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404084723.79089-1-zheyuma97@gmail.com>
References: <20220404084723.79089-1-zheyuma97@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The userspace program could pass any values to the driver through
ioctl() interface. If the driver doesn't check the value of 'pixclock',
it may cause divide error.

Fix this by checking whether 'pixclock' is zero.

The following log reveals it:

[   38.260715] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
[   38.260733] RIP: 0010:tridentfb_check_var+0x853/0xe60
[   38.260791] Call Trace:
[   38.260793]  <TASK>
[   38.260796]  fb_set_var+0x367/0xeb0
[   38.260879]  do_fb_ioctl+0x234/0x670
[   38.260922]  fb_ioctl+0xdd/0x130
[   38.260930]  do_syscall_64+0x3b/0x90

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/tridentfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index 4d20cb557ff0..319131bd72cf 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -996,6 +996,9 @@ static int tridentfb_check_var(struct fb_var_screeninfo *var,
 	int ramdac = 230000; /* 230MHz for most 3D chips */
 	debug("enter\n");
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	/* check color depth */
 	if (bpp == 24)
 		bpp = var->bits_per_pixel = 32;
-- 
2.25.1

