Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C974C9B2CD4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412D810E459;
	Mon, 28 Oct 2024 10:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="d87JvhaI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D6410E45C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:26:27 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a9a2cdc6f0cso558805166b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730111186; x=1730715986;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIDm7KBT1s0AbOc3yV3TQ9ohvs8sUqIvua5HhBI5V8A=;
 b=d87JvhaIK4ycF9Ro+0G5wQInl+JP3NMIbKmwFygiv2m2raSHdDyLlCIX/g6ZFOwT+X
 AWf81v8uYgH4qagmUQ/l9Kt13BmBBgPoZDW/SRPVfXWYPRJOpDLVzPHporu6Qjmw2b0C
 tMt/8a8x+x4U12LQClcf0Yz5FVKGd/kOBVpFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111186; x=1730715986;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aIDm7KBT1s0AbOc3yV3TQ9ohvs8sUqIvua5HhBI5V8A=;
 b=iSG9Uj+dC43Lp+QtP5W4HQnRvd/4Rx4IOlMovVl9vXyLiHj7dUdce2VacQVLG+Y35N
 p38H22TzypTBGToDQKha/h0nZGpEdJZCu5WQArU2u6z96l8WzbYAsFwFLHwQOID6nfsw
 Xm0KcidWD7sSdNmyoHJFAy0rIqVY0879bG+3fYYD/rnKamaXTIo3Xu+yvJiu4HLAB516
 voc74UPcenBY9qBULhIwJCJYz2WATHMc56faaq04qBV7E7naJcEsQZ4Mh49byoWHKSCh
 RwzA/XrNoPzOxheS0D9kKoCSDp6fJ4+MV8CWTidMWqnW9ZCaSnghbTUs+a5avxCDfD1T
 XQxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG7Zz1kp20uYXo5s7Er6l499r86D38aHs0OJLhWPTQEDBTtgiadz41/xh93CK5DBQN3Day5I4Z/ok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF0KfF29NiTkbNW7QJrwuOT5f6quckM1k952cbHLRWbN+tffkA
 588eebybCdcKpL8F9jm4mnbpbogtXtemdLKAjeGWHihmwY739NO18OgXkZ1XipA=
X-Google-Smtp-Source: AGHT+IEA5nCg2j7DVomJoAqNLW+z2Nbv9V6XM3cl17RychbK0FRUPkeqVCDGC4TH9y5e5TfNamZx8g==
X-Received: by 2002:a17:906:da8a:b0:a99:425c:c653 with SMTP id
 a640c23a62f3a-a9de5ce24f6mr866426966b.22.1730111185881; 
 Mon, 28 Oct 2024 03:26:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:26:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 10/10] drm/mxsfb: stop controller and drain FIFOs if
 already initialized
Date: Mon, 28 Oct 2024 11:25:33 +0100
Message-ID: <20241028102559.1451383-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

You can't re-program the controller if it is still running. This may
lead to shifted pictures, so stop the controller and drain its FIFOs
in case it's already properly setup.
This patch is crucial when supporting the simple framebuffer, as the
controller has already been initialized by the bootloader.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/gpu/drm/mxsfb/mxsfb_drv.c |  3 +++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 14 +++++++++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index cb5ce4e81fc7..38c94cdc8f6c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -10,6 +10,7 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
+#include <linux/of.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -221,6 +222,8 @@ static int mxsfb_load(struct drm_device *drm,
 	if (!mxsfb)
 		return -ENOMEM;
 
+	mxsfb->enabled =
+		of_property_read_bool(drm->dev->of_node, "fsl,boot-on");
 	mxsfb->drm = drm;
 	drm->dev_private = mxsfb;
 	mxsfb->devdata = devdata;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index d160d921b25f..0f9ae4ce450c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -47,6 +47,7 @@ struct mxsfb_drm_private {
 	struct drm_bridge		*bridge;
 
 	bool				crc_active;
+	bool                            enabled;
 };
 
 static inline struct mxsfb_drm_private *
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 7ed2516b6de0..d064a2bb65df 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -202,9 +202,11 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
 	writel(reg, mxsfb->base + LCDC_CTRL1);
 
 	writel(CTRL_RUN, mxsfb->base + LCDC_CTRL + REG_SET);
+
+	mxsfb->enabled = true;
 }
 
-static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
+static void _mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 {
 	u32 reg;
 
@@ -221,6 +223,13 @@ static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 	reg &= ~VDCTRL4_SYNC_SIGNALS_ON;
 	writel(reg, mxsfb->base + LCDC_VDCTRL4);
 
+	mxsfb->enabled = false;
+}
+
+static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
+{
+	_mxsfb_disable_controller(mxsfb);
+
 	clk_disable_unprepare(mxsfb->clk);
 	if (mxsfb->clk_disp_axi)
 		clk_disable_unprepare(mxsfb->clk_disp_axi);
@@ -354,6 +363,9 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	u32 bus_format = 0;
 	dma_addr_t dma_addr;
 
+	if (mxsfb->enabled)
+		_mxsfb_disable_controller(mxsfb);
+
 	pm_runtime_get_sync(drm->dev);
 	mxsfb_enable_axi_clk(mxsfb);
 
-- 
2.43.0

