Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F158E8E8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 10:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DA1F267E;
	Wed, 10 Aug 2022 08:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A027F25E0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 08:37:23 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id p8so13603933plq.13
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 01:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=d90Ctq/OPngocvREk+GXxmfwi7GNqq+AEV+FEzVAMS8=;
 b=kXHsqDzg9eFLQNS73LhRngPr30CHfcOtnrah6S6sVl9bt1OpLuScI1Zn6wFnBUBXIq
 cKku8Wa99+gE+HGDwuBY0f6+iBb8Y0laxczs5RIzTZyjyOaN1bZXzMXsRd6HhrzF4Flr
 kekIFKWe8xGQopgxPPi6GWS5K2ACZZ4BILipySPbsz+GHkOfcFaQua392ZOTQG459rK6
 IOT9emkCQ3BZwgec3fRYs9v9rrnbVoLMMguWToloIJ6J9te3ehVNYTK0HXUh1LxuTf1t
 C9PfZWgKkCt6enCdmtIWEyjyXLnD4HL2miXLeevY3sL/5/TlfD3Um7xxi0FgiVcgY5fL
 TXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=d90Ctq/OPngocvREk+GXxmfwi7GNqq+AEV+FEzVAMS8=;
 b=4iqMSpMs5tiUVsAbSrFG56IaTjv1/8U4Ick46ysYcsz9gYh0HWUT0tix2cf8ri/RWB
 JuCxMHx8XcB4eLOxBf8bnel6I9mmXhHKsdXIOWNi5XciSdu2Dj+qIn7Egjhy45k4nkgS
 +QODAm1+a6BSy4TfYfmKSkciMyQiT4wkK4iomhf88c/R7PZFI6FKFCt5/p3+g9WanvJe
 cNToAkQPnpKJ+Fqr8ecToA73noVzQZXaiXpoZoPUabPmTa5oHnxhpO9HB8lkS4wrgNxV
 ZGsW1Eox3fOmcifZwN58tUBxqFSdy4GE85b2+atoAqQbohheNRynY++IzpuN7fry4nk+
 9X5A==
X-Gm-Message-State: ACgBeo1vkFHIwEYTcclcBMQ7OHRUAlW4AkDUAzKlG2sDxmR0dOnrvOGU
 ur+qYOiJq3i33+7Mj+SWdz2QZR6QABEt+w==
X-Google-Smtp-Source: AA6agR7U/tzZCTxijYOzxq+LH0GDr3RTwNGfEtRLSKlLBM1JnsO6+XPGZRMXp+ZL6lnN4uyCR67a/w==
X-Received: by 2002:a17:903:25d2:b0:16d:d026:daed with SMTP id
 jc18-20020a17090325d200b0016dd026daedmr27123381plb.101.1660120642794; 
 Wed, 10 Aug 2022 01:37:22 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0052d63fb109asm1323607pfk.20.2022.08.10.01.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 01:37:22 -0700 (PDT)
From: Takanari Hayama <taki@igel.co.jp>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/3] media: vsp1: add premultiplied alpha support
Date: Wed, 10 Aug 2022 17:37:09 +0900
Message-Id: <20220810083711.219642-2-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220810083711.219642-1-taki@igel.co.jp>
References: <20220810083711.219642-1-taki@igel.co.jp>
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
Cc: Takanari Hayama <taki@igel.co.jp>, airlied@linux.ie,
 kieran.bingham+renesas@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support DRM blend mode in R-Car DU driver, we must be able to pass
a plane with the premultiplied alpha. Adding a new property to
vsp1_du_atomic_config allows the R-Car DU driver to pass the
premultiplied alpha plane.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 2 ++
 include/media/vsp1.h                           | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 0c2507dc03d6..019e18976bd8 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -856,6 +856,8 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 	rpf->mem.addr[1] = cfg->mem[1];
 	rpf->mem.addr[2] = cfg->mem[2];
 
+	rpf->format.flags = (cfg->premult) ? V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;
+
 	vsp1->drm->inputs[rpf_index].crop = cfg->src;
 	vsp1->drm->inputs[rpf_index].compose = cfg->dst;
 	vsp1->drm->inputs[rpf_index].zpos = cfg->zpos;
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index cc1b0d42ce95..48f4a5023d81 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -51,6 +51,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
  * @dst: destination rectangle on the display (integer coordinates)
  * @alpha: alpha value (0: fully transparent, 255: fully opaque)
  * @zpos: Z position of the plane (from 0 to number of planes minus 1)
+ * @premult: true for premultiplied alpha
  */
 struct vsp1_du_atomic_config {
 	u32 pixelformat;
@@ -60,6 +61,7 @@ struct vsp1_du_atomic_config {
 	struct v4l2_rect dst;
 	unsigned int alpha;
 	unsigned int zpos;
+	bool premult;
 };
 
 /**
-- 
2.25.1

