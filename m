Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B89754852F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8A610E75A;
	Mon, 13 Jun 2022 12:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3229010E75A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:35:02 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id y29so6011159ljd.7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g2qph4nC9r6Yu7EsMy5d/ZtimwMDZrD7L9NUry9ikIc=;
 b=hSeR8bsRWKEjB5SrJ9TjCl94fgc2BAl9oxEPxPwIiaGN1YBt3Pk4WQPREzOGE368GX
 oKMuu0a82OjBFe+aDJomEk/Tfch5xyADWAXZvnn2QLSsB4XNC/hjIQAy4s2meUhafTda
 7yes5YeoR5qXuomIJ7/lS2iLJduJD1hAEhkv194YulhssCrHHJ3JRuIIW6gwzVRl5qsh
 OjtNitkMYTr9sV1KLIOXjXRGtfuLTmjjE8+sqntT4bg9RzmrA0yondjfdrmZW6oQGAUM
 nxqD+M49jXYrYouCeRXGKDEnHsC/RfHu/jkL9CbLMQZ7JKinMkthVIHvTNAkFq6R2zLm
 mU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g2qph4nC9r6Yu7EsMy5d/ZtimwMDZrD7L9NUry9ikIc=;
 b=URrp29zevzV8sJf4Hl0gr6uK2IICJpDjyw3sg4Sdpf/uqXQX3yhB8f3vsC25UY9WbW
 nDdSO1YjTLi5h2nuDE93uoE/zFogA9wWknm8pyT4v0WRX16aEbIuHRFC78AGuViNu3yE
 Y4xqqcztdW5y/9mFw8sbGE5+ddqWi1y18qarUQ/fkq4gpk9/ockciLTvNuk06kOx/6GI
 +xoSLqpodRfO7Ddv6Rse6u1pgLLlEHWpEcqMQC0zl/T6PzYrJxyANOvVTmgfoAEt1KL0
 CkD5UMYbqlWNdfX8d38G58XqARXRFTsovGhOvtPNtUQsob8Z8OVHW6ffwdQz3EEbyeX+
 jNpQ==
X-Gm-Message-State: AOAM533SNdaBMekGcNFy0eCJuOfo7hh5onkVgl474GWzqWzt8lpO0XJj
 U7SuFgSIC4yFKFxE14cYSwKiMyMUcd4=
X-Google-Smtp-Source: ABdhPJyb1t5xc5P3V0v3BcsCxzUJT1WEjCSpDIg3k09ZhPWrYE6aKM6ULGrBQTTpQaRZHsktnl3dUg==
X-Received: by 2002:a05:651c:1029:b0:255:7038:f7e8 with SMTP id
 w9-20020a05651c102900b002557038f7e8mr30708779ljm.377.1655123700088; 
 Mon, 13 Jun 2022 05:35:00 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:59 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/19] drm/gma500: Use i2c_bus in gma_encoder for PSB
Date: Mon, 13 Jun 2022 14:34:33 +0200
Message-Id: <20220613123436.15185-17-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PSB stores the backlight i2c adapter in lvds_priv. CDV stores it in
gma_encoder. Neither place is perfect but lets pick gma_encoder to make
life simple.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gma_lvds.h       |  2 --
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 10 +++++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index 5c7da22400fb..dcba810dc470 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -19,8 +19,6 @@ struct gma_lvds_priv {
 	uint32_t savePFIT_CONTROL;
 	uint32_t savePFIT_PGM_RATIOS;
 	uint32_t saveBLC_PWM_CTL;
-
-	struct gma_i2c_chan *i2c_bus;
 };
 
 u32 gma_lvds_get_max_backlight(struct drm_device *dev);
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index f129e53f0233..ea5f2f078a7f 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -306,14 +306,14 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	 * Set up I2C bus
 	 * FIXME: distroy i2c_bus when exit
 	 */
-	lvds_priv->i2c_bus = gma_i2c_create(dev, GPIOB, "LVDSBLC_B");
-	if (!lvds_priv->i2c_bus) {
+	gma_encoder->i2c_bus = gma_i2c_create(dev, GPIOB, "LVDSBLC_B");
+	if (!gma_encoder->i2c_bus) {
 		dev_printk(KERN_ERR,
 			dev->dev, "I2C bus registration failed.\n");
 		goto err_encoder_cleanup;
 	}
-	lvds_priv->i2c_bus->slave_addr = 0x2C;
-	dev_priv->lvds_i2c_bus =  lvds_priv->i2c_bus;
+	gma_encoder->i2c_bus->slave_addr = 0x2C;
+	dev_priv->lvds_i2c_bus = gma_encoder->i2c_bus;
 
 	/*
 	 * LVDS discovery:
@@ -390,7 +390,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 
 err_unlock:
 	mutex_unlock(&dev->mode_config.mutex);
-	gma_i2c_destroy(lvds_priv->i2c_bus);
+	gma_i2c_destroy(gma_encoder->i2c_bus);
 err_encoder_cleanup:
 	drm_encoder_cleanup(encoder);
 err_connector_cleanup:
-- 
2.36.1

