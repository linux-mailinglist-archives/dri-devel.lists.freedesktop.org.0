Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9924170D6EB
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421DF10E402;
	Tue, 23 May 2023 08:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A623C10E35F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 15:51:29 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-76fe43b85e4so253094039f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684770688; x=1687362688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LhuzJwhh6mnZlX4PQopnboCuSOMKbOzXG9sCr2vCvAE=;
 b=GyKNmw4M61HlUKBmnJPPQdV+xuIVSgNOTjin1tPfYgKQLY3lqXt9GGGeg3LqIHYLuk
 DhfNvaXVBWierYQ+zWgQgKWuqQzJ9TDqVHzXLwSezPx1I6pxysuLL0Dpg7MU7suOGtxi
 rkdXMOtlu9u70RUnNqCmkBV0yP+uLHGk5rVxvE9Xa7CwRT8fFnd5qxB0ik20mz6mWuuw
 VPF3Rkfwd3qnZKRpY+RO52vO9TFiZ6tRCI/idfRjWUw0pFHBFLNd9YiWTvY3Pp7C3pOx
 4KX1Jhxo9eCTsypu+avRJ02gkinD3l7v1LADVIbK6QzrCXpVO0fH1rVf8+rxH7HIGyD7
 LYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684770688; x=1687362688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LhuzJwhh6mnZlX4PQopnboCuSOMKbOzXG9sCr2vCvAE=;
 b=bgGYEcEwcCsAkYisSOn9UiNQLJ3hhcjbcPf3epVi2IE6oMcdALzMdiyZvBwj4FXm4g
 aRxZi8nS2o14pIo/GrC445tJ3auoqpaGOxg+cHAM9c4k+wKUCUQSGmYroQGjGCmuTD7C
 iYAnepSjV2QZs2em39U4FRamDqMusQu6jYB6mxzkBQwLskqF0BbWlkJL3WhKTAEnTEzI
 loSygpyrk7nbwyzFHI0arUsnYP67Nwbz0X5Ceh7n40Upi+tRM8mFOHouN1Ss0NMT3TCB
 7WhhsLHEJ8ma3zPHj6xd1Dur5Xg4yw+yVo8nnPZOp/NYsaDpHeNbYTnilTnSB9mYgYSG
 CnJw==
X-Gm-Message-State: AC+VfDxCendW4iSIrR5SOtiUBhcHXhtn2c+VKdGckxookXPwLQnc+obA
 st6LCk7HbbZyg3dopjtxGEg=
X-Google-Smtp-Source: ACHHUZ50S0WdrHtGiSqdzAgGyIj68c4wFN8q4WJZnLuyt1t64JmYhQnvvzndzV1N5JjZUZhaApRjpQ==
X-Received: by 2002:a92:c98b:0:b0:335:2e4c:f0e5 with SMTP id
 y11-20020a92c98b000000b003352e4cf0e5mr6867585iln.13.1684770688239; 
 Mon, 22 May 2023 08:51:28 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com
 (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a056638150700b0040fbb3bd38csm1831753jat.145.2023.05.22.08.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 08:51:27 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/display/dp_mst: Replace all non-returning strlcpy with
 strscpy
Date: Mon, 22 May 2023 15:51:24 +0000
Message-ID: <20230522155124.2336545-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Azeem Shaikh <azeemshaikh38@gmail.com>, linux-hardening@vger.kernel.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().
No return values were used, so direct replacement is safe.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c       |    2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |    2 +-
 drivers/gpu/drm/drm_mipi_dsi.c                |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 16565a0a5da6..e6a78fd32380 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2103,7 +2103,7 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
 	aux->ddc.owner = THIS_MODULE;
 	aux->ddc.dev.parent = aux->dev;
 
-	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
+	strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
 		sizeof(aux->ddc.name));
 
 	ret = drm_dp_aux_register_devnode(aux);
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 38dab76ae69e..8f7403149b2b 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5702,7 +5702,7 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 	aux->ddc.dev.parent = parent_dev;
 	aux->ddc.dev.of_node = parent_dev->of_node;
 
-	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(parent_dev),
+	strscpy(aux->ddc.name, aux->name ? aux->name : dev_name(parent_dev),
 		sizeof(aux->ddc.name));
 
 	return i2c_add_adapter(&aux->ddc);
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 3fd6c733ff4e..6252ac01e945 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -223,7 +223,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *host,
 
 	device_set_node(&dsi->dev, of_fwnode_handle(info->node));
 	dsi->channel = info->channel;
-	strlcpy(dsi->name, info->type, sizeof(dsi->name));
+	strscpy(dsi->name, info->type, sizeof(dsi->name));
 
 	ret = mipi_dsi_device_add(dsi);
 	if (ret) {

