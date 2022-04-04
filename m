Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39684F113C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 10:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F26510EB4D;
	Mon,  4 Apr 2022 08:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D1A10EB46
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 08:47:53 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 j20-20020a17090ae61400b001ca9553d073so2266843pjy.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 01:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Dp26xvo/OWBw1ANhAEXpc1rNkAlB/vfXe93IpIqI6Y=;
 b=N7B4YUdHA5X14Z98xRic3ph/TDam03J6r+SaLio3r0NOrD/uN9H48sTbuxImkJLW6I
 E8YSiitNg3JBfvyiLYk0iX5RhtHSWP8CCCzGIxGBUIjIVEDMkhTXu66s5tVJt4nXf77d
 fnW3+qY01p2fv5GqiFsqluOe0hfxdqab2PqDznLJ/IsyhuwRHxm2nx9FFq0aYTHvH1Iy
 r357HRXMjj2B2PkwGIoMFVRn4nGBsZ2qS/VczSqSQoVcO38+AyBhGhlApWOns/NUXmII
 /imIbWKUoE62Q1s1yjN+kpBOaZzHqCvzg2F4JLGaO2i5roWGM8IuN1RUbmNuehZfZDGQ
 a88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Dp26xvo/OWBw1ANhAEXpc1rNkAlB/vfXe93IpIqI6Y=;
 b=clHHxJfIUroIxsCy/qKEM9FWk+t1x1plfB9loQpJCGcQBHxzm+uu6Dvp8FJFauAFqn
 9HaeiOTl35qaNJQjHNmvXNb6wbmT1qxX+8dzR7KxN2OxlEyzd93IiAzgr0jc7s8RcQ4p
 JRLmPTjy4ANmllTCn6uRJ35Iph9hPVNYzyCbsowqRXlYFwlp7UVpccMjjkyBZIZCl2si
 prUkcuEPAhjn2KVELXLlgYPwvzksQCJX5nzSEmC7CVtrzRRVGm58IcgpPzbfXl9a5Hi7
 ITgL/nAg1GwZN7oCMrpQK2M1jGgkx/klQlj6S6FX0Nk4j2zHwiDPrnvXR2TbYwZ5+i0o
 pldg==
X-Gm-Message-State: AOAM531HBl22dEE1H+CDRmb1L7ZDQWp8aP7G6y2OpMgOiPj6h2T/z7BD
 DNw/quY4LbVk2TgJZn18Hg==
X-Google-Smtp-Source: ABdhPJy72jA/2st/G//51PTWh7W6OWC4XiZ2I9BsaCCF+sqVXaF/3AWziOFSL05+SBew/BNAaFPMKQ==
X-Received: by 2002:a17:902:e746:b0:156:9eed:d2d6 with SMTP id
 p6-20020a170902e74600b001569eedd2d6mr4849504plf.144.1649062073047; 
 Mon, 04 Apr 2022 01:47:53 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a17090a3fc600b001ca88b0bdfesm3991960pjm.13.2022.04.04.01.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 01:47:52 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de
Subject: [PATCH 3/7] video: fbdev: kyro: Error out if 'lineclock' equals zero
Date: Mon,  4 Apr 2022 16:47:19 +0800
Message-Id: <20220404084723.79089-4-zheyuma97@gmail.com>
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
ioctl() interface. If the driver doesn't check the value of 'lineclock',
it may cause divide error.

Fix this by checking whether 'lineclock' is zero.

The following log reveals it:

[   33.404918] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
[   33.404932] RIP: 0010:kyrofb_set_par+0x30d/0xd80
[   33.404976] Call Trace:
[   33.404978]  <TASK>
[   33.404987]  fb_set_var+0x604/0xeb0
[   33.405038]  do_fb_ioctl+0x234/0x670
[   33.405083]  fb_ioctl+0xdd/0x130
[   33.405091]  do_syscall_64+0x3b/0x90

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/kyro/fbdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 25801e8e3f74..d57772f96ad2 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -494,6 +494,8 @@ static int kyrofb_set_par(struct fb_info *info)
 				    info->var.hsync_len +
 				    info->var.left_margin)) / 1000;
 
+	if (!lineclock)
+		return -EINVAL;
 
 	/* time for a frame in ns (precision in 32bpp) */
 	frameclock = lineclock * (info->var.yres +
-- 
2.25.1

