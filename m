Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795AC7F1FAA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E281110E154;
	Mon, 20 Nov 2023 21:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AF810E1BB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:46 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32ddfb38c02so3238162f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516805; x=1701121605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
 b=JpDKwaBWcRFV9YDHF73bdmc8pA2whsFlozTFx6bwaxa60bWaj4cXV8vVA90DIW1Gza
 xUmIxhoj0X908zeolGYs6yXSFoW9FlSx7KGnU3kkSjBAdlkWW5JxHlQmMe867fj3BgPx
 k/vbEn8GUWbAGiemTBfcie+gGamCvZn1p6bNhvoGvaSNZNBtuGfZyLiCgPTuy6YwgUM9
 YUpbE1cG00RiOUSwXTvkdbIkhvG4SHHGLRVMuAdQPS2qMCgDMAGFnrRmGcJcL04fVolz
 w7dIykVUyhCEuiR4axfUQi+ga0imMXvKn37sYtiUG0zM3RjmsC4A1atkiHMXcEhwnRxi
 pprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516805; x=1701121605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFB7iCk0Bd2syBjc9Ptoymcq6fnpGc3VauDL49PiFhg=;
 b=fqR92jh2PizWU1nzvBS8E0tAVLU9ZTTPM2W2Rll0lvz+5//D09F8QG/30WGc0iwfvC
 dCGagFNDQ8G3RhUqa86V0xz112/4qvkCnV0K0eGL5fDS1fiKwkMnTXFfeJcPoxD0pNeo
 8cUZSbRLXGsYITBV2QYTB1nlGFoUSd+U0G7Lxu3cdBc+qSROhm+i9TFZjCLq5CLtqOpw
 POSs/Iaf63H84F73/H/MnuGRu9VRL9+BjlLw2HOLLRw7xVm23n43E5+LWq3qixkK+yYU
 NvpkoVxG8S3hu/7yg/p7TMiMGjO9q/9mjPR5ujmNkHsBKD2q34/XTBsNjApDn6N6muNT
 fzUQ==
X-Gm-Message-State: AOJu0YzyNr3c9s2IPi1z+abFQnVHd7sYVNERXcuZfQqyFnzonx44suQv
 5Y2npAIkcsh270OwoIq1gKAwFRDkZRi7AQ==
X-Google-Smtp-Source: AGHT+IFO9ZmrSbH6A+/A5LyWdCeKfgaeedlrEYc7qHHXqeUF8v+awr8pU44qCeg4rV4R9MhiuP768w==
X-Received: by 2002:a05:6000:18ad:b0:32d:b06c:d30b with SMTP id
 b13-20020a05600018ad00b0032db06cd30bmr6861142wri.55.1700516804962; 
 Mon, 20 Nov 2023 13:46:44 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:44 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Mon, 20 Nov 2023 22:46:22 +0100
Message-ID: <20231120214624.9378-20-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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

