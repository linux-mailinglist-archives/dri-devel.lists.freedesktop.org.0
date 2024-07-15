Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F033F930CF2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 05:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C82210E19C;
	Mon, 15 Jul 2024 03:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="x3T+nv3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C0910E19C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 03:19:27 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7662181d487so1811097a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 20:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721013567; x=1721618367; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2Ay8dHb/d/u1SYxFKuzba6qcuASuaNu7Y01CqhutO6A=;
 b=x3T+nv3ZUPXftqSQEK2OQnGtkdFzfhF5ylWvTb/fSxJ9yzbOiHMoUmvxAEX81+S/Mc
 uRfki3EA7hOcZJmjQs+xcZ4ZH4GG2aYFCF5HuAi3Ll/zVLDGxATL6sUjw2aeU0HFtbMh
 Csz/5WbubSB46UwWjaZyWzBsMM59vcEirmU2smY+vJqR7JSAdRYYQC32z+FZS8eCZPDs
 EEBkj+YOIMuHMX41652Bs1uy/ubtqXzxs7JchZ2SZSHbltwiCsYHPPmDI0vR3dgvsiat
 u9G3PYuYuGUXmGXlCgVr6xRt+n32QyoYt68127mpJoeCBVJqAig3RKIcfMYubC41H4sb
 WElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721013567; x=1721618367;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Ay8dHb/d/u1SYxFKuzba6qcuASuaNu7Y01CqhutO6A=;
 b=IlJoDMvlXFtuaBJWl06JnDj0Gl84Dq5mcdArCs/P/aHVHXcZ3xL9mf1utsKYnP3Bp7
 0qTWiyb1q/k8S8tLbosCQZ9qS1Fed7FaT4i03dD3O6hqD3ZVxTAIsNbQBSi1hgDooOaU
 haCrLFZX9HxQjumyosqmkaqRcPz7CT87qBYdzXW9MbDBgic+k0/wWIDIsx7sERFZa/8C
 lBlQd46H+2N4H6GnSBVVIdSB9nHmJJm2/+kzqy4PI+bnPBbFS8MM3LecctjqZQGe1w1e
 pA+9yojyXUxH8WiCXj4dDFIgVOws0beXi9tGr1hTLMnUR0R7oFyIQsd9O1WCqC98TEAm
 LtHw==
X-Gm-Message-State: AOJu0YxJSVEotqiPqGrFNTwUihPHBw4ocCoK2cJOxeCaDK2VYLCbYcsN
 JtI4eaqkGphTic7yxhcwEaDt2XUOTZ4js/zUxciOgU3ggRybCinGqEE42K0QUdU=
X-Google-Smtp-Source: AGHT+IHtAU4k8V9WMmfWGlFSBuSRGwKW+2XcDchRVew5q6MSnM4nfRhYNT80/b+1aNDq+glL+2iEVQ==
X-Received: by 2002:a05:6a20:4320:b0:1c2:8af6:31d3 with SMTP id
 adf61e73a8af0-1c29820b81dmr20549419637.10.1721013566064; 
 Sun, 14 Jul 2024 20:19:26 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc451e4sm29962635ad.247.2024.07.14.20.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 20:19:25 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 mripard@kernel.org, dianders@google.com, hsinyi@google.com,
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/1] drm/panel: boe-th101mb31ig002 : Fix the way to get
 porch parameters
Date: Mon, 15 Jul 2024 11:18:45 +0800
Message-Id: <20240715031845.6687-2-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240715031845.6687-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240715031845.6687-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

