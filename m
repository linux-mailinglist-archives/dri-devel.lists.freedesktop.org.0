Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABF6548526
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C405110E74E;
	Mon, 13 Jun 2022 12:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C19F10E5B1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:43 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id c4so8579085lfj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H0Hs6FIqWUsS7vDhYFUng4jyhlhhWA72qY81jnPeFY4=;
 b=U5TNgffjFyBsX/B+8aVty85waldZHZ6ge7JlblqCg+W/lXO4HEGTuOiwAEhJISKVK2
 OhgxtzVwwrK4y+srNIlyUvCqhw7/HtaDY49tAK0U0q6C0PaysTGb/aGd8ri5hamfBmD+
 teAYKnwWlKySnPO3k6Syfb1/3+C2jQx+NJ9cJnbx+KPhG+AqheeBjzyDnrLheDK1tEHY
 Qip4wk8tUqOdrIIJ5iidRpF01a1cThzh5W0/JRhxtA7LtcXegI7SdfLJMhziASnA1Udo
 cjkAfww0CKPM8ZrBmoscvS5KUvwl5FtYqlJmiNfTw7qVWltPvvIiiizPi4KLyd2/uhO4
 nOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H0Hs6FIqWUsS7vDhYFUng4jyhlhhWA72qY81jnPeFY4=;
 b=4SW1YTJmG/rGyijNvqAVD9Z9DIeM0ZAPOAb1+hnYR0+i0IsXRy8hRmAcumGWAjMPxF
 WYDYofzL05eXWyLExwVXl8B1lE3UN2WV26KwWNAZY3Buc07WpYORBXI3F25eYRhWiZIa
 8Y+3BdnBGTvtEvyartME/RdMXv3eLb5SJpOmMlP9/epQ6yZbiMrO2bC3wvoE6a6lReFz
 Gz3gXeLzi0SshuXrrtZqU5gRNpN++sF61s/3/cM6TkuhnLGMVeQftP16c6tJKOTm6hmn
 94tdk2BDCReNbuVukNSlBK+hwvQNPLVHc1D4cxa/proszuUsBB4LsPCkYb8O/iBxZf1S
 Qijw==
X-Gm-Message-State: AOAM530DWafqdrGXRTfWDJ9JWXU3ue6zEs2HZKClTRzMevScbeVIu8QL
 nX0/iAl8oEbOISoc9erACXGsE+gUy04=
X-Google-Smtp-Source: ABdhPJyPv6BdKxC7Sujx5u8nHl5GsLKDq+dY9BRGEJKKRNs58rcyX1p4EY7CsO/eDzij2EBt4jMYBg==
X-Received: by 2002:ac2:58d6:0:b0:479:5b9:74a with SMTP id
 u22-20020ac258d6000000b0047905b9074amr36471481lfo.551.1655123681103; 
 Mon, 13 Jun 2022 05:34:41 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:40 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/19] drm/gma500: Unify *_lvds_set_backlight()
Date: Mon, 13 Jun 2022 14:34:19 +0200
Message-Id: <20220613123436.15185-3-patrik.r.jakobsson@gmail.com>
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

These functions do the same thing so unify them into one.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 29 ++--------------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 26 ++++++++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  1 +
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 32 ++-----------------------
 4 files changed, 31 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 0c7c4a539e50..615570de82b0 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -53,31 +53,6 @@ struct cdv_intel_lvds_priv {
 	uint32_t saveBLC_PWM_CTL;
 };
 
-/*
- * Sets the backlight level.
- *
- * level backlight level, from 0 to gma_lvds_get_max_backlight().
- */
-static void cdv_intel_lvds_set_backlight(struct drm_device *dev, int level)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	u32 blc_pwm_ctl;
-
-	if (gma_power_begin(dev, false)) {
-		blc_pwm_ctl =
-			REG_READ(BLC_PWM_CTL) & ~BACKLIGHT_DUTY_CYCLE_MASK;
-		REG_WRITE(BLC_PWM_CTL,
-				(blc_pwm_ctl |
-				(level << BACKLIGHT_DUTY_CYCLE_SHIFT)));
-		gma_power_end(dev);
-	} else {
-		blc_pwm_ctl = dev_priv->regs.saveBLC_PWM_CTL &
-				~BACKLIGHT_DUTY_CYCLE_MASK;
-		dev_priv->regs.saveBLC_PWM_CTL = (blc_pwm_ctl |
-					(level << BACKLIGHT_DUTY_CYCLE_SHIFT));
-	}
-}
-
 /*
  * Sets the power state for the panel.
  */
@@ -97,10 +72,10 @@ static void cdv_intel_lvds_set_power(struct drm_device *dev,
 			pp_status = REG_READ(PP_STATUS);
 		} while ((pp_status & PP_ON) == 0);
 
-		cdv_intel_lvds_set_backlight(dev,
+		gma_lvds_set_backlight(dev,
 				dev_priv->mode_dev.backlight_duty_cycle);
 	} else {
-		cdv_intel_lvds_set_backlight(dev, 0);
+		gma_lvds_set_backlight(dev, 0);
 
 		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) &
 			  ~POWER_TARGET_ON);
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index 0b646c7c7432..5b041fab82ba 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -31,4 +31,30 @@ u32 gma_lvds_get_max_backlight(struct drm_device *dev)
 	return retval;
 }
 
+/*
+ * Sets the backlight level.
+ *
+ * level: backlight level, from 0 to gma_lvds_get_max_backlight().
+ */
+void gma_lvds_set_backlight(struct drm_device *dev, int level)
+{
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	u32 blc_pwm_ctl;
+
+	if (gma_power_begin(dev, false)) {
+		blc_pwm_ctl = REG_READ(BLC_PWM_CTL);
+		blc_pwm_ctl &= ~BACKLIGHT_DUTY_CYCLE_MASK;
+		REG_WRITE(BLC_PWM_CTL,
+				(blc_pwm_ctl |
+				(level << BACKLIGHT_DUTY_CYCLE_SHIFT)));
+		dev_priv->regs.saveBLC_PWM_CTL = (blc_pwm_ctl |
+					(level << BACKLIGHT_DUTY_CYCLE_SHIFT));
+		gma_power_end(dev);
+	} else {
+		blc_pwm_ctl = dev_priv->regs.saveBLC_PWM_CTL &
+				~BACKLIGHT_DUTY_CYCLE_MASK;
+		dev_priv->regs.saveBLC_PWM_CTL = (blc_pwm_ctl |
+					(level << BACKLIGHT_DUTY_CYCLE_SHIFT));
+	}
+}
 
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index 2a9ce8ee3fa7..f26cc69b6caa 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -8,5 +8,6 @@
 #define _GMA_LVDS_H
 
 u32 gma_lvds_get_max_backlight(struct drm_device *dev);
+void gma_lvds_set_backlight(struct drm_device *dev, int level);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 371c202a15ce..a304f840b127 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -148,33 +148,6 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-/*
- * Sets the backlight level.
- *
- * level: backlight level, from 0 to gma_lvds_get_max_backlight().
- */
-static void psb_intel_lvds_set_backlight(struct drm_device *dev, int level)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	u32 blc_pwm_ctl;
-
-	if (gma_power_begin(dev, false)) {
-		blc_pwm_ctl = REG_READ(BLC_PWM_CTL);
-		blc_pwm_ctl &= ~BACKLIGHT_DUTY_CYCLE_MASK;
-		REG_WRITE(BLC_PWM_CTL,
-				(blc_pwm_ctl |
-				(level << BACKLIGHT_DUTY_CYCLE_SHIFT)));
-		dev_priv->regs.saveBLC_PWM_CTL = (blc_pwm_ctl |
-					(level << BACKLIGHT_DUTY_CYCLE_SHIFT));
-		gma_power_end(dev);
-	} else {
-		blc_pwm_ctl = dev_priv->regs.saveBLC_PWM_CTL &
-				~BACKLIGHT_DUTY_CYCLE_MASK;
-		dev_priv->regs.saveBLC_PWM_CTL = (blc_pwm_ctl |
-					(level << BACKLIGHT_DUTY_CYCLE_SHIFT));
-	}
-}
-
 /*
  * Sets the power state for the panel.
  */
@@ -196,10 +169,9 @@ static void psb_intel_lvds_set_power(struct drm_device *dev, bool on)
 			pp_status = REG_READ(PP_STATUS);
 		} while ((pp_status & PP_ON) == 0);
 
-		psb_intel_lvds_set_backlight(dev,
-					     mode_dev->backlight_duty_cycle);
+		gma_lvds_set_backlight(dev, mode_dev->backlight_duty_cycle);
 	} else {
-		psb_intel_lvds_set_backlight(dev, 0);
+		gma_lvds_set_backlight(dev, 0);
 
 		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) &
 			  ~POWER_TARGET_ON);
-- 
2.36.1

