Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461C3826DA0
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 13:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B2810E09A;
	Mon,  8 Jan 2024 12:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C949910E1DF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 12:18:01 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a28f66dc7ffso478102266b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 04:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704716280; x=1705321080; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ataiuoEiZAKbJMfDTmDPqOcB+hhvmSxMEb08xxsTGtE=;
 b=TSL7WiDYOWXwz6aiSBEYg0S/eIeZnboPQJiKVZUJRhLZ0MAGJUx7UfkFltH/KANhWp
 fekIyJ+kSYtL4sTbFm4nwf28QOWkzwm6uqBjumrzWgOAKqpwIdrWOpN6QDrKm3hGTji8
 sog1A3X3TkS/pCMOAr5CbkfC5n0LMH0S9mY9v72XsdPrWFDnmPubC5AOrHVwMpTh6wIJ
 NXuNkCdTZsSUwOL6VIFVEf8A+F9ALstgaC4sOJqVtuQxVpBJJYGB3RH2fV56ALk0+m4t
 9uCRxa/sULMY5apRATGd0dLcyTKLlJtjiUWsz3u2j4jF7wCFXJXVrVsr9p/uawTPPIVr
 k4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704716280; x=1705321080;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ataiuoEiZAKbJMfDTmDPqOcB+hhvmSxMEb08xxsTGtE=;
 b=UwiDUhJDHHI8gbrbd8T7nqB1an921Ba0MTL71HG/h+Wd0wYN8lJNFHyB2ZQHxfMxIL
 oDbzs6oKRBnxP6424pFBCD7K8fBiHo/s6NGPMFDTcpAdJX8bmRVUh8RkVxwchRr+BS3U
 0bIUGYYVLVFEESU+b0Oni5aE4tNO9fD8vkuLcE1EMv0mwMZF2fJ4ctwzeIZQsfTSLaqV
 9xk2Ui2WowYnjmHJqeEo4uDwDyQlnP07JImE21jnPnLg4vwSZIJvzraElBCV+wRme3bj
 7ri2DAzpq7WQ+Y3l7n0PU4RwR8pVifXdv0d7jICK8bx4cN0sSpBNvUxwyUP9n4kZgqL7
 0wow==
X-Gm-Message-State: AOJu0Ywa1Tw9W+qkV6FmcEyjlIaFz4V9u8JT5ueqKg773HReKnqyE5pf
 M5MRk/3+M5/UmAsehMrsj1c=
X-Google-Smtp-Source: AGHT+IGk837jJFvS+TcY7fBXJR80jcXc31znrg/A2V9l7q0ncwOgKoPeJG795sFAlbjTJcin9QtHhQ==
X-Received: by 2002:a17:906:7743:b0:a29:d642:46ba with SMTP id
 o3-20020a170906774300b00a29d64246bamr3042338ejn.29.1704716279986; 
 Mon, 08 Jan 2024 04:17:59 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:a060:7056:782e:5e26])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a170906551100b00a2356a7eafasm3641365ejp.199.2024.01.08.04.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 04:17:59 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Clean-up superfluously selecting VT_HW_CONSOLE_BINDING
Date: Mon,  8 Jan 2024 13:17:57 +0100
Message-Id: <20240108121757.14069-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As config FRAMEBUFFER_CONSOLE already selects VT_HW_CONSOLE_BINDING, there
is no need for any drm driver to repeat that rule for selecting.

Remove those duplications of selecting VT_HW_CONSOLE_BINDING.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/gpu/drm/ingenic/Kconfig | 1 -
 drivers/gpu/drm/mcde/Kconfig    | 1 -
 drivers/gpu/drm/pl111/Kconfig   | 1 -
 drivers/gpu/drm/tve200/Kconfig  | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index b440e0cdc057..3db117c5edd9 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -11,7 +11,6 @@ config DRM_INGENIC
 	select DRM_GEM_DMA_HELPER
 	select REGMAP
 	select REGMAP_MMIO
-	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
 	help
 	  Choose this option for DRM support for the Ingenic SoCs.
 
diff --git a/drivers/gpu/drm/mcde/Kconfig b/drivers/gpu/drm/mcde/Kconfig
index 4f3d68e11bc1..907460b69d4f 100644
--- a/drivers/gpu/drm/mcde/Kconfig
+++ b/drivers/gpu/drm/mcde/Kconfig
@@ -11,7 +11,6 @@ config DRM_MCDE
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
-	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
 	help
 	  Choose this option for DRM support for the ST-Ericsson MCDE
 	  Multi-Channel Display Engine.
diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
index ad24cdf1d992..20fe1d2c0aaf 100644
--- a/drivers/gpu/drm/pl111/Kconfig
+++ b/drivers/gpu/drm/pl111/Kconfig
@@ -9,7 +9,6 @@ config DRM_PL111
 	select DRM_GEM_DMA_HELPER
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
-	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
 	help
 	  Choose this option for DRM support for the PL111 CLCD controller.
 	  If M is selected the module will be called pl111_drm.
diff --git a/drivers/gpu/drm/tve200/Kconfig b/drivers/gpu/drm/tve200/Kconfig
index 11e865be81c6..5121fed571a5 100644
--- a/drivers/gpu/drm/tve200/Kconfig
+++ b/drivers/gpu/drm/tve200/Kconfig
@@ -9,7 +9,6 @@ config DRM_TVE200
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
-	select VT_HW_CONSOLE_BINDING if FRAMEBUFFER_CONSOLE
 	help
 	  Choose this option for DRM support for the Faraday TV Encoder
 	  TVE200 Controller.
-- 
2.17.1

