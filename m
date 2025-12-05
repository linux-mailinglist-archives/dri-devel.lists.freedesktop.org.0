Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DAECA796C
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8065910EAC8;
	Fri,  5 Dec 2025 12:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ulz0fKjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D0410EB11
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:38:33 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-595825c8eb3so2046721e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 04:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764938312; x=1765543112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=klcElJtkzI0lLp3wntIo4gO11oCbbXWvHu4Lghm8pn8=;
 b=ulz0fKjsS8vKVKE5Ks1nx9f+xy0vFY72p15BRinSM2sbZdkW5X/IWiXWI+n7zi4xtB
 O4G5GFu4JW33ibvWKLiZC4EfAwoIKNM0Mx3w6/snByFFzCelokcik3seP3S2mUZo4gKf
 +vXLSstAkQYTkeSiZmOhi1mlH0FFjHHayDWApGmFBKH1Bab80Zwsv68EabFvpNV/4bmX
 2KekfBfZR3Cl5Hj959AfGAnAY9VjXhEsnwj/eE5JYH0GnaJsyP3jpMjdFfsRiKAUZemJ
 AUF3sJz8tHMnPjSmPYqETKZGcJ6g58pr9hEHj1z3zxl1hfm+eunBOm/pU/MOpx98WBjO
 NweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764938312; x=1765543112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=klcElJtkzI0lLp3wntIo4gO11oCbbXWvHu4Lghm8pn8=;
 b=KJVUc0qX+EU8EUbE0fPILrlsrWzLQw1PSzZdJRhK8bPkiccova93kbKf/BegFqlljK
 fAjUyF+h4iCPmyxxiv438qdaXJI+wG8BIWVDJN8/qhaMElcdwuxWTlZhXJqe3g9iTWP5
 is2goq4WjCcYU2kqMZGrmRYdL0B5JLkFI+7Y1jxPb1ctknTqw+UKp1Ye/yDtS3eXFidC
 sBZellwutOfxd3prLapQUtLhMzRgbVChJAhQSvSKJP5miumLWelHlHNrSDYf7V90Slba
 v5CsXLk8+HEc7+Wudx8dQwCEsxdgTTe9mwsBS1rxwnvBFPB7fcYx2/Iqh+/XgXLDKKxJ
 bhiA==
X-Gm-Message-State: AOJu0YxzNc0LgGq0yuGyFm4KyB5FgzWQ1D1mxEWa3IZjXjRbhQdcKScW
 kvV2HFsnkQJMQ+fV8GwPE1E+zlpqs6avl2j7JOPdvY8l7eyBkzizQxEYJfQcjEADDTC2FOITWHm
 EhFMP
X-Gm-Gg: ASbGnctU8uXMXXgsMFlLmO8AKqaBj7Yuw9cZTU78CWbi3b8HCMEDYm6kTKn8GeKCkkM
 u4RQU0u00coQ+9dKNBzGMKOXw8xHApLnWEhsyERXhbjIIBIq1ZhRqDPxMEh/c6EQblg8GRmHrbL
 y4Y8cdvSMjvJIYrIQIA5SD4UriCVX5VPjDcHzP0xNRiyU5TrJjKuQrl17CL7DyFfTubYD1U1LFy
 23+0NE9VeiiS7Qq4ysxDr3aZPiGp183fZK4Hxl9AzAiwn+fw3OPigqTXWvwr6B1S6FDFIyuouJ/
 26q/W8tNagJT0YfvCxzt85tN636c7Y2X7oU3iITGP8K+0Uo8MnAzLdjCfYdHAp2wbsJB7+2EyQH
 IhrK+qnx2gE08uAytsdIDvX3nETRDjvHnufURJI0jUrijG1K2Ndq5T1EoyMOsox0tKbFpOxrPbX
 sg3O/WzrdLwVwl1VEOwCaPl/0Zst4/R+7L97812zmGvpWP
X-Google-Smtp-Source: AGHT+IFTlZw+oR2sw8F587+gt4VtLs/GMa9dNBWEO0QK962QEdEh8y33WxXMT99Jaj5hQoXnehj+Zw==
X-Received: by 2002:a05:6512:124b:b0:595:8200:9f7e with SMTP id
 2adb3069b0e04-597d669ff19mr2333117e87.20.1764938311848; 
 Fri, 05 Dec 2025 04:38:31 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7b1a3d9sm1462351e87.4.2025.12.05.04.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 04:38:31 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Mikko Rapeli <mikko.rapeli@linaro.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, stable@vger.kernel.org
Subject: [PATCH 2/2] drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
Date: Fri,  5 Dec 2025 14:37:51 +0200
Message-ID: <20251205123751.2257694-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
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

Xorg fails to start with defaults on AMD KV260, /var/log/Xorg.0.log:

[    23.491] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    23.491] (II) Module fbdev: vendor="X.Org Foundation"
[    23.491]    compiled for 1.21.1.18, module version = 0.5.1
[    23.491]    Module class: X.Org Video Driver
[    23.491]    ABI class: X.Org Video Driver, version 25.2
[    23.491] (II) modesetting: Driver for Modesetting Kernel Drivers:
kms
[    23.491] (II) FBDEV: driver for framebuffer: fbdev
[    23.510] (II) modeset(0): using drv /dev/dri/card1
[    23.511] (WW) Falling back to old probe method for fbdev
[    23.511] (II) Loading sub module "fbdevhw"
[    23.511] (II) LoadModule: "fbdevhw"
[    23.511] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    23.511] (II) Module fbdevhw: vendor="X.Org Foundation"
[    23.511]    compiled for 1.21.1.18, module version = 0.0.2
[    23.511]    ABI class: X.Org Video Driver, version 25.2
[    23.512] (II) modeset(0): Creating default Display subsection in
Screen section
        "Default Screen Section" for depth/fbbpp 24/32
[    23.512] (==) modeset(0): Depth 24, (==) framebuffer bpp 32
[    23.512] (==) modeset(0): RGB weight 888
[    23.512] (==) modeset(0): Default visual is TrueColor
...
[    23.911] (II) Loading sub module "fb"
[    23.911] (II) LoadModule: "fb"
[    23.911] (II) Module "fb" already built-in
[    23.911] (II) UnloadModule: "fbdev"
[    23.911] (II) Unloading fbdev
[    23.912] (II) UnloadSubModule: "fbdevhw"
[    23.912] (II) Unloading fbdevhw
[    24.238] (==) modeset(0): Backing store enabled
[    24.238] (==) modeset(0): Silken mouse enabled
[    24.249] (II) modeset(0): Initializing kms color map for depth 24, 8
bpc.
[    24.250] (==) modeset(0): DPMS enabled
[    24.250] (II) modeset(0): [DRI2] Setup complete
[    24.250] (II) modeset(0): [DRI2]   DRI driver: kms_swrast
[    24.250] (II) modeset(0): [DRI2]   VDPAU driver: kms_swrast
...
[    24.770] (II) modeset(0): Disabling kernel dirty updates, not
required.
[    24.770] (EE) modeset(0): failed to set mode: Invalid argument

xorg tries to use 24 and 32 bpp which pass on the fb API but which
don't actually work on AMD KV260 when Xorg starts. As a workaround
Xorg config can set color depth to 16 using /etc/X11/xorg.conf snippet:

Section "Screen"
        Identifier     "Default Screen"
        Monitor        "Configured Monitor"
        Device         "Configured Video Device"
        DefaultDepth   16
EndSection

But this is cumbersome on images meant for multiple different arm64
devices and boards. So instead set 16 bpp as preferred depth
in zynqmp_kms fb driver which is used by Xorg in the logic to find
out a working depth.

Now Xorg startup and bpp query using fb API works and HDMI display
shows graphics. /var/log/Xorg.0.log shows:

[    23.219] (II) LoadModule: "fbdev"
[    23.219] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    23.219] (II) Module fbdev: vendor="X.Org Foundation"
[    23.219]    compiled for 1.21.1.18, module version = 0.5.1
[    23.219]    Module class: X.Org Video Driver
[    23.219]    ABI class: X.Org Video Driver, version 25.2
[    23.219] (II) modesetting: Driver for Modesetting Kernel Drivers:
kms
[    23.219] (II) FBDEV: driver for framebuffer: fbdev
[    23.238] (II) modeset(0): using drv /dev/dri/card1
[    23.238] (WW) Falling back to old probe method for fbdev
[    23.238] (II) Loading sub module "fbdevhw"
[    23.238] (II) LoadModule: "fbdevhw"
[    23.239] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    23.239] (II) Module fbdevhw: vendor="X.Org Foundation"
[    23.239]    compiled for 1.21.1.18, module version = 0.0.2
[    23.239]    ABI class: X.Org Video Driver, version 25.2
[    23.240] (II) modeset(0): Creating default Display subsection in Screen section
        "Default Screen Section" for depth/fbbpp 16/16
[    23.240] (==) modeset(0): Depth 16, (==) framebuffer bpp 16
[    23.240] (==) modeset(0): RGB weight 565
[    23.240] (==) modeset(0): Default visual is TrueColor
...
[    24.015] (==) modeset(0): Backing store enabled
[    24.015] (==) modeset(0): Silken mouse enabled
[    24.027] (II) modeset(0): Initializing kms color map for depth 16, 6 bpc.
[    24.028] (==) modeset(0): DPMS enabled
[    24.028] (II) modeset(0): [DRI2] Setup complete
[    24.028] (II) modeset(0): [DRI2]   DRI driver: kms_swrast
[    24.028] (II) modeset(0): [DRI2]   VDPAU driver: kms_swrast

Cc: Bill Mills <bill.mills@linaro.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index ccc35cacd10cb..a42192c827af0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -506,6 +506,7 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 	drm->mode_config.min_height = 0;
 	drm->mode_config.max_width = ZYNQMP_DISP_MAX_WIDTH;
 	drm->mode_config.max_height = ZYNQMP_DISP_MAX_HEIGHT;
+	drm->mode_config.preferred_depth = 16;
 
 	ret = drm_vblank_init(drm, 1);
 	if (ret)
-- 
2.34.1

