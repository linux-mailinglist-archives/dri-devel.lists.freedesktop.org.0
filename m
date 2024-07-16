Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E878693264A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C03610E698;
	Tue, 16 Jul 2024 12:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="obRC1GzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D87E10E699
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:11:28 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-70aec66c936so3953178b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721131888; x=1721736688; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=blbSlELLECRmvXwv7SN5IDYSjruj8AHGnyhct2EWwU4=;
 b=obRC1GzVqEnJVLIuY4EwlyhKchqZBoJK4FTspiPuOQnDn3TxU5U6NFtaEWn90/Yvf1
 UiQ69xI4QOwea/Kb1s/OiRnkwRhhoiflJVU3N6Wdn8RT+PXCMYDbw2UUvTnayuLxx19L
 2LFy3E41giuAzZfNconssM9JiZmKIkMOQAAfLB8abOGfSjDKV2pZ7L2o0v+GCBhVdpwz
 dLRHRgX7tfFvu5CB/Rws7s2R2lbTwll/DPlnO0OO2DLWXUhWQTkTbnJNAmDTCCGXjev2
 bKEKpbyJNB5xe9838dosQWipOck4C3HGmiMgBzmlOrtmD0wFvOR3CEKOnSvD7LUzncQ8
 Kztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721131888; x=1721736688;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=blbSlELLECRmvXwv7SN5IDYSjruj8AHGnyhct2EWwU4=;
 b=gOlOgDMUPkF5MmrbBULmFH1RMfB7rK/Gpeyaqw7ShWNsFhT3crD/CRTZyR71XRcKhA
 KfyA0AwxZRZqd82FTKktcAAZACQz7eEfPXIYdACZSnkcFI+hZEuFLy1hJ7FDwi+nYvB2
 vbbY6R/Vj3zcnoYQib1f8gUTuMzg6YamprMeOzG0Zku6Naohxwgop/orntjzoDMl8AYK
 9NnDioA59kQvCcsAdxp32kZ4q22I8JuN1em6eTVKjNM3XrtDB/ZSorveEPUap2RUTwPe
 4SZvK/QEvbKUQCDWdBddppnZaEB0A5QTf6W3450JJyGAZOejgifBVQSswW0UwL5tVPyz
 Bcgg==
X-Gm-Message-State: AOJu0YwnaPg5kyLN3Vj5E1CoerZDC7NmhHFbrU5xtVwY+dcriofHl4hb
 qJxju6ylQpXTUkUcA3kpGnVnAoEt7Q34XjKyJMXtQuClPzORxV5NdTDoWP15GEE=
X-Google-Smtp-Source: AGHT+IH/k4jWImyIjbW7yGtrYYEDR8z48Mphe/dvltvql6yF6cg+o7MKJy0g0ldWT8SGBXoYS+4sGA==
X-Received: by 2002:a05:6a00:3a19:b0:706:5dab:83c4 with SMTP id
 d2e1a72fcca58-70c1fba1248mr2131358b3a.14.1721131887544; 
 Tue, 16 Jul 2024 05:11:27 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eccc48bsm6114065b3a.203.2024.07.16.05.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:11:27 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 mripard@kernel.org, dianders@chromium.org, hsinyi@google.com,
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/2] drm/panel: boe-th101mb31ig002 : Fix the way to get
 porch parameters
Date: Tue, 16 Jul 2024 20:11:11 +0800
Message-Id: <20240716121112.14435-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240716121112.14435-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240716121112.14435-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

The current driver can only obtain the porch parameters
of boe-th101mb31ig002. Modify it to obtain the porch
parameters of the panel currently being used.

Fixes: 24179ff9a2e4524 ("drm/panel: boe-th101mb31ig002 : Make it compatible with other panel.")
Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V2 and V1:
-  1. No changes, Modify the commit information format.
v1: https://lore.kernel.org/all/20240715031845.6687-2-lvzhaoxiong@huaqin.corp-partner.google.com/
---
 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index b55cf80c5522..d4e4abd103bb 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -312,15 +312,14 @@ static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
 	struct boe_th101mb31ig002 *ctx = container_of(panel,
 						      struct boe_th101mb31ig002,
 						      panel);
+	const struct drm_display_mode *desc_mode = ctx->desc->modes;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev,
-				  &boe_th101mb31ig002_default_mode);
+	mode = drm_mode_duplicate(connector->dev, desc_mode);
 	if (!mode) {
 		dev_err(panel->dev, "Failed to add mode %ux%u@%u\n",
-			boe_th101mb31ig002_default_mode.hdisplay,
-			boe_th101mb31ig002_default_mode.vdisplay,
-			drm_mode_vrefresh(&boe_th101mb31ig002_default_mode));
+			desc_mode->hdisplay, desc_mode->vdisplay,
+			drm_mode_vrefresh(desc_mode));
 		return -ENOMEM;
 	}
 
-- 
2.17.1

