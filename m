Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF6D1F0EF3
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51D66E39B;
	Sun,  7 Jun 2020 19:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970AE6E945
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 16:15:54 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id k2so2765005pjs.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fuq8iZ/w30hGFlRF7P+LbLAz0hBlIdSZDfbjIwkl+Ys=;
 b=MttvX8sgmxw6H5NSZaRGauZRhobavEOiAKvRo0ATGJCUoMGnKdk/fOph76//jM0WtB
 hI1o++k/E5WSqsPG3+snSomrZmq03ik1WZV8syJgto7yOOBqR3u1v4d7WyAfNwii+ryQ
 FsTf5b7/qZJwcD4yUmaYBuO/cF/262SwLp/o79UopfS3oCmY3ej3Dd+xK/NPYmmUKb8w
 0GPNNvBejEWzW+/37kuMLoSuBdUjUc1qfM1t+hS9qzqZEQISQ5d4umuKrVK2VxqZTzoC
 EpEpDSETY+CuB6AmdsG0fGilKthilo6GE7WiOFD42IHE47ErvP0srMy28Ra0Ewh1ae+v
 DkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fuq8iZ/w30hGFlRF7P+LbLAz0hBlIdSZDfbjIwkl+Ys=;
 b=f13qgKvmvw1DD69E7sDtNN2x8cHt/0FkGuskFnqCtDUYISGrkVrYK6jVgfhhY7WmUr
 JYxU2PJeURUmXNCtdUG/1hVlcFzRNYLcv+tULchkOFzeE1KwzM5F7HYqzum8I/peLPpl
 2V2PTUzJG2HRkuB96pE5VEdUVTvmSVTOJxH3AlqhViMO4gp5N3hj5HJQdP1I+JFaAXnf
 8rshY2G+z8SBn9rrYcDwqg+EKzkJ6rSj0tW1XsbeYlJWjVneVoZVFnMF9EwUqAM9Gxbd
 E5l6bAj7ZwouAJmWinWLjjvMlrYvRaoK6CsqPogMWhwZD3SzgS8i+y+e52Z9a5wvV3Nl
 WqIg==
X-Gm-Message-State: AOAM5313pYMMcmzqqyJn2EQjnAGr4l3tSTwNKznIrzyfG1TkWFB/AA6Q
 0iciDHNiwz5VUYaCx9kow6Y=
X-Google-Smtp-Source: ABdhPJw+Yh+6a9DtpZMLVt18+l2rdWHlZ/HrTCVinrjrjK1NAV9KB7wxpACoWzuM2Yd6mArQ1x72xQ==
X-Received: by 2002:a17:902:bc4c:: with SMTP id
 t12mr10171340plz.141.1591373754191; 
 Fri, 05 Jun 2020 09:15:54 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id h17sm62665pgv.41.2020.06.05.09.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 09:15:53 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v2] fbdev: geode: Add the missed pci_disable_device() in
 gx1fb_map_video_memory()
Date: Sat,  6 Jun 2020 00:14:58 +0800
Message-Id: <20200605161458.2513177-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: Andrew Morton <akpm@osdl.org>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Adrian Bunk <bunk@stusta.de>, Markus Elfring <Markus.Elfring@web.de>,
 Andres Salomon <dilinger@queued.net>, David Vrabel <dvrabel@arcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although gx1fb_probe() has handled the failure of gx1fb_map_video_memory()
partly, it does not call pci_disable_device() as gx1fb_map_video_memory()
calls pci_enable_device().
Add the missed function call to fix the bug.

Fixes: 53eed4ec8bcd ("[PATCH] fbdev: geode updates]")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Fix the typo in the subject.
  - Modify the label of error handler.
  - Refactor the code.
 
 drivers/video/fbdev/geode/gx1fb_core.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/geode/gx1fb_core.c b/drivers/video/fbdev/geode/gx1fb_core.c
index 5d34d89fb665..15645244e4d0 100644
--- a/drivers/video/fbdev/geode/gx1fb_core.c
+++ b/drivers/video/fbdev/geode/gx1fb_core.c
@@ -208,29 +208,39 @@ static int gx1fb_map_video_memory(struct fb_info *info, struct pci_dev *dev)
 
 	ret = pci_request_region(dev, 0, "gx1fb (video)");
 	if (ret < 0)
-		return ret;
+		goto err_disable_device;
 	par->vid_regs = pci_ioremap_bar(dev, 0);
 	if (!par->vid_regs)
-		return -ENOMEM;
+		goto err_nomem;
 
-	if (!request_mem_region(gx_base + 0x8300, 0x100, "gx1fb (display controller)"))
-		return -EBUSY;
+	if (!request_mem_region(gx_base + 0x8300, 0x100,
+				"gx1fb (display controller)")) {
+		ret = -EBUSY;
+		goto err_disable_device;
+	}
 	par->dc_regs = ioremap(gx_base + 0x8300, 0x100);
 	if (!par->dc_regs)
-		return -ENOMEM;
+		goto err_nomem;
 
 	if ((fb_len = gx1_frame_buffer_size()) < 0)
-		return -ENOMEM;
+		goto err_nomem;
+
 	info->fix.smem_start = gx_base + 0x800000;
 	info->fix.smem_len = fb_len;
 	info->screen_base = ioremap(info->fix.smem_start, info->fix.smem_len);
 	if (!info->screen_base)
-		return -ENOMEM;
+		goto err_nomem;
 
 	dev_info(&dev->dev, "%d Kibyte of video memory at 0x%lx\n",
 		 info->fix.smem_len / 1024, info->fix.smem_start);
 
 	return 0;
+
+err_nomem:
+	ret = -ENOMEM;
+err_disable_device:
+	pci_disable_device(dev);
+	return ret;
 }
 
 static int parse_panel_option(struct fb_info *info)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
