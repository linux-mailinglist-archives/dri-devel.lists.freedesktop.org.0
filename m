Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C87F5B55
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF60A10E6FF;
	Thu, 23 Nov 2023 09:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E1E10E6F3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:41:02 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a04196fc957so84141066b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732461; x=1701337261; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aq+Z35kBN2Z5WfXGmAWrEgYrcQFVHuODhyHjoCApg/g=;
 b=dKqhYi9LV+VrOVM5IsnSnU57FtMOfSLxeyJhO263uan538AqHdGAvyZgGPt20qPMo3
 geFJU3FEn2pqXppAI3fbYJaUlK7BqaBYdZ9Mhj/wButNejMo/S9sAx7Zg15wKXAhzTG5
 uBjXNiLeq7HwsTU4LSBSS0fM58398RIGux2wQKVnub31TInHGZjsSjRGp42TSnyo/KqC
 pHhPPfNYnOYLcfkcDXyhJRDTxFZEwrVs84nUW9Q6Z51yPArvPXzVZrMAqLa144yU2Vnt
 QRmCGI1BiAGz6x70Osd39hLL6hwmDDSMUmBGlLfc/l33SNI4CkALjraj+RpNYnoDYzNm
 9gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732461; x=1701337261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aq+Z35kBN2Z5WfXGmAWrEgYrcQFVHuODhyHjoCApg/g=;
 b=pJYVBcyP/NzQn43s8QS5U80LMUYah57exmKNO6SdwtSO24xtdYN1eJ8LjyC1rnDZbQ
 uyFT3dAaN25WaUuVGfwic5fxEMJ+uGOSJZB6Lo97N6c12ycie8yle3pIIfjrrVm5a1mh
 Qoycg3ZtSk31xwaLcq1BcrCRu1z8ov6813ryvxdeE40jTejm1FJwF9WYT96zV65cdw6t
 Hv6orexPFRKT9EHXB2FfOPWcDZQ8JEnLHrQNYiRnLGjluxBcO/LfvD6EzOXHu37egcT5
 m1BvXM8Jpc+Dq409j4trNG1B2hM/t6Cq7p1g8Gkpe17xMp0PI7V1CWZOHK2R45nslxLQ
 XY+g==
X-Gm-Message-State: AOJu0Yz7WDssaQ64eB0OnyZqb2CrUKdzya5ko//0Xcld64bl6RBnXw7P
 5dZwbXPXTDF/CHly9uI1Zkg=
X-Google-Smtp-Source: AGHT+IEV+7/puW0dt9JkKFWNyuf9FB8n8CqRgv0YKKalYf/l6B4ZXh/aBJaazGmziZBUrdXnlZahBA==
X-Received: by 2002:a17:906:74c7:b0:a01:8957:7c75 with SMTP id
 z7-20020a17090674c700b00a0189577c75mr3683442ejl.11.1700732461099; 
 Thu, 23 Nov 2023 01:41:01 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:41:00 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v5 19/20] drivers/gpu/drm/display: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:39 +0100
Message-ID: <20231123094040.592-20-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

