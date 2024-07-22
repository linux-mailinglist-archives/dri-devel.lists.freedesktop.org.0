Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF77A938BFE
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 11:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3392310E48A;
	Mon, 22 Jul 2024 09:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ZsEWtvMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E4110E48A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 09:24:48 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-70364e06dc6so1717387a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 02:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721640287; x=1722245087; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TB89ZlKNnXu3g5oV+TfDlJrKIEZjcQAqTnoqfzrRSzQ=;
 b=ZsEWtvMis4rIz4lBxRvuLNlWpTskxOUSaZ/+PbLncGFeRZuA0k48kt/NPCzv6GHD4H
 KgKPa8D5vNWU8Y7vjpzreHA/46FmcRxc7xLbqIkE5lZrkWQAiF55u/NemMHXK7TtcIca
 W0128sAZKv74ogWV7tMMlAc2W8szcY8SKDK/6jVRhOxpoluStvoDyStCYrhV/8EIUXVd
 JOT1Fwo/RZLOlWu1ZbJwzMePWHWyjjD02inpfpmS/sXQfStzzikdOg/iTSVeHbOzQwKK
 T19KImHRofuKz8q0un079JbJpgK7l5mIMRCFvWcrIRdkW4AhLKmzqDCnt4TA4UvzGxBi
 5Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721640287; x=1722245087;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TB89ZlKNnXu3g5oV+TfDlJrKIEZjcQAqTnoqfzrRSzQ=;
 b=PiOv/OmTMpJQdAjD0QBdR9knOcAQYY/JKPQUz9Suu2enuEoNzw4r7P1aEN00xr8Ehh
 Op8xgqkMg/0QkJ17Gm1rVvUJaXszEFc4P6mHL0/LWDQFs3g9FCiGst3xAqC3iOuP3iEH
 kcL1wIuaOZ3Hz0fwzsJoQPtTmOaqppkhxlbykpqndiIiYRuRLIm9oSG6pKm3V/CzkHiz
 AVILrVkzIryDOALpTMiQsYWVm027nPuw9BuHUT/ZPew134brbn13+q66gRgnupvJCTsM
 usdg+PdWE5MkjkBEU8cUmrdv8KQiXF1j6EZ3d8uM0vRamfhhq09W5q2gHB+Yvrnq5oc1
 dx9w==
X-Gm-Message-State: AOJu0YxzRONyomMyMZZmRpxIU03chQVw70VZNQA3OGMLN777onrXdmaw
 gCdDcRD8YVTCOyRYFgrKQVeHoLLRR9RBxCHicKDJUMUQXyOrOWIgoxKIU4Khdws=
X-Google-Smtp-Source: AGHT+IFfThZoo9NFJtDQgeJWtBACTXjfL99jN1cVv6gplQuuD4LIHLvJVra5GuCL4Hfsc/oHk1k2mg==
X-Received: by 2002:a05:6870:4714:b0:261:fd5:aa34 with SMTP id
 586e51a60fabf-263ab54f89amr3032889fac.30.1721640287279; 
 Mon, 22 Jul 2024 02:24:47 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70d26efe61dsm1639901b3a.149.2024.07.22.02.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 02:24:46 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dianders@chromium.org, hsinyi@google.com, awarnecke002@hotmail.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v3 1/2] drm/panel: boe-th101mb31ig002 : Fix the way to get
 porch parameters
Date: Mon, 22 Jul 2024 17:24:27 +0800
Message-Id: <20240722092428.24499-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240722092428.24499-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240722092428.24499-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
Changes between V3 and V2:
-  1. No changes.
v2: https://lore.kernel.org/all/20240716121112.14435-2-lvzhaoxiong@huaqin.corp-partner.google.com/

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

