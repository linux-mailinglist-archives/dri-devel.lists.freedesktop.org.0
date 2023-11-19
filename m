Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2E7F05CF
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C2610E1E2;
	Sun, 19 Nov 2023 11:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D2E10E1CC
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:47 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9e1fb7faa9dso476677066b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393326; x=1700998126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
 b=ABqUhmxRia83k4OAXhi8w1QuUUHV++xcZlAKe4lzu4yO/8BQAYvcd6XJhble4WdlF1
 zp6wtJzXnNeaYA5TMG1D6XEvlH/100hY5Sv56cFFoh8gpJTwC9zqQX/9cn45CFOANr7A
 bfdTzuhipkzzGPaigPE3gdxcdSr7GOJ2dz1k66APRMP8RyC5DgbP2x5x4vArbD2s39NP
 rWytUXS8/7671GPWbffref4JvT9b+3h6gRtwxho1VMIv6A2f++eUz985BQPlBZgbgntr
 Fw+dXzB7pk9yvLaR8sxKK7cyFl77/o9pdgHQ/SS53IU+FOCPGMhrM22vYGfz243NyOyf
 Dj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393326; x=1700998126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
 b=PW9Z/Yh91PCP2M1MrVH/9xDqDUcVKRVh+n/9fY4UnvOgTKtM8QboYd63ed99PMGouI
 GINytf1RoxXTy4tcPSPxvpBPZXCrGQld5nJbqfCfxzgRVxksOGGJzRBRaJvMSEeUoq+w
 0SnA6zGz4sTPfUsG+EiMz2/A7ua7gA2TJ2Dt29TmKqI5K+mFqXWLoqI+YhRKXmKF1cv1
 JYf6D2SUD0nQy3blXvHW0BpPooJkBh7fMqYOYcvoEUCJao4DfIewZLuxh+VunZ55DRn7
 cWPTTPtrfDIdL4N8kx943o8ZkxmgfBlF5m694dXg+UFMjBk/LWQofFwO9ux2mKKEOLf6
 BNXw==
X-Gm-Message-State: AOJu0YwlxfUsi7tYgEoMLd6fgmtiexu0yvXALjAkbLrVpRUFNTOhcHpX
 XwS2/ey445vKGro6Xy1r680=
X-Google-Smtp-Source: AGHT+IHKw/gC9gJLG/4vNKZ0Qe1xoAFlXwe05kjZcQmwp8jadVTM2Ill34LRBvmTqhTjC6YBAI0o8w==
X-Received: by 2002:a17:907:11c9:b0:9be:30c2:b8fd with SMTP id
 va9-20020a17090711c900b009be30c2b8fdmr3210885ejb.66.1700393326334; 
 Sun, 19 Nov 2023 03:28:46 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:46 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:24 +0100
Message-ID: <20231119112826.5115-20-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-i2c@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/display/drm_dp_helper.c       |    1 -
 drivers/gpu/drm/display/drm_dp_mst_topology.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f3680f4e6..ac901f4b4 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2102,7 +2102,6 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
 	if (!aux->ddc.algo)
 		drm_dp_aux_init(aux);
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	aux->ddc.dev.parent = aux->dev;
 
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 0e0d0e76d..4376e2c1f 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5803,7 +5803,6 @@ static int drm_dp_mst_register_i2c_bus(struct drm_dp_mst_port *port)
 	aux->ddc.algo_data = aux;
 	aux->ddc.retries = 3;
 
-	aux->ddc.class = I2C_CLASS_DDC;
 	aux->ddc.owner = THIS_MODULE;
 	/* FIXME: set the kdev of the port's connector as parent */
 	aux->ddc.dev.parent = parent_dev;

