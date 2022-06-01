Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1D753A03B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039DF10E97E;
	Wed,  1 Jun 2022 09:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D9A10E97E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:23:22 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id l13so1694269lfp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/bEhvBt3CrgVF2zXHQVSMGh/ISUabtR6+ut7aiJlO7I=;
 b=ZVU6CG9iZJlFeNsIEouKB+StMc/YyV+omkWwKG+iBWn800Fa44mN9Bii31jMYOpupr
 G6u7Iru+NYnIbHvNj7gmQus2hW/yIoD3Rp/+aO0XcNuC3Jaz0xguz1fLVu/PZGPv0aSa
 jokFooOB0RwzYmQDbDXSnzLjtsqkzp3Lbhq0vRdzbemMygcjq6eWFfUvu7vc8bTKi1H8
 w+Pp//IwxlqwhwTGWgTQ07Y3Q4u1ueD+JhLZZO1C/6ntUIq/43EWRmErNA6ynJXyrT5X
 P4UZJz/waTmPZBcg0sJx6vU10fu80juGs/a+Gm+EEP/frJ17+LzPshruy5D2t5t2kdgc
 YaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bEhvBt3CrgVF2zXHQVSMGh/ISUabtR6+ut7aiJlO7I=;
 b=IF8bYJl9iVCtWcSaqiD21H4w7eQ2tnzdcugsNd8soGKQUmICQ44hVC+8Si1Zoh74H3
 Pigmd2eaNSi7WSsYSUQdSL0jHqd/TZx9J7VGgWpqONPD8MuFb9yT4bACZNuUhBmt3uQf
 AqO+NHKzLxPgK3XcE4wv6uNxkPCzKEXk1d7dfdMlyqDYoXG2jW7ZolEPVchSyyfnWjiR
 gOFvJJoQTGzSSQL7WCZQBTYbwJ6aNu/695q4tnVjVdnhWMCgJceUeycmZPhgA5lhX5oX
 RKC4EIbgjsLfOoaQOibW0kFDR9qXzKrq5I+F+32yevZntEwnPIYxxhlN1ZUlJtIGd+l/
 c9uQ==
X-Gm-Message-State: AOAM533Of9S+9epxY4yNu4fry7bY2bNyDteUpaX0FMERmynsYlpwsk6T
 TXkQotEhDbMB3zSnNXhwx8nVa2rnSMs=
X-Google-Smtp-Source: ABdhPJz2W2G3e1RFW4TzYwbXQ5M1zSnePZhTbn4GDqVYHaE6NpCpgEDE9sur04rI1oVjh4XDDnFSpA==
X-Received: by 2002:a05:6512:3050:b0:470:8f74:4373 with SMTP id
 b16-20020a056512305000b004708f744373mr46046669lfb.149.1654075401478; 
 Wed, 01 Jun 2022 02:23:21 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512308e00b00478f60ca3a4sm257065lfd.56.2022.06.01.02.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:23:21 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/gma500: Read EDID from the correct i2c adapter
Date: Wed,  1 Jun 2022 11:23:11 +0200
Message-Id: <20220601092311.22648-9-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
References: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
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
Cc: tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Someone made the mistake to try reading EDID from the backlight i2c
adapter. This has been wrong for a very long time but since we read out
the modes correctly on init and don't hotplug lvds it has been working
anyway. Correct this by using connector->ddc instead of
encoder->i2c_bus. Both PSB and CDV are affected but this bug.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 3 +--
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 846ce1546030..be6efcaaa3b3 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -298,11 +298,10 @@ static int cdv_intel_lvds_get_modes(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 	int ret;
 
-	ret = psb_intel_ddc_get_modes(connector, &gma_encoder->i2c_bus->base);
+	ret = psb_intel_ddc_get_modes(connector, connector->ddc);
 
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 1121bb155c5e..7ee6c8ce103b 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -491,12 +491,10 @@ static int psb_intel_lvds_get_modes(struct drm_connector *connector)
 	struct drm_device *dev = connector->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
-	struct psb_intel_lvds_priv *lvds_priv = gma_encoder->dev_priv;
 	int ret = 0;
 
 	if (!IS_MRST(dev))
-		ret = psb_intel_ddc_get_modes(connector, &lvds_priv->i2c_bus->base);
+		ret = psb_intel_ddc_get_modes(connector, connector->ddc);
 
 	if (ret)
 		return ret;
-- 
2.36.1

