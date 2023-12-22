Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE6C81CDD8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:43:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FF310E861;
	Fri, 22 Dec 2023 17:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7A110E852
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:42 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-336788cb261so1662324f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266960; x=1703871760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=34BUg2B4LjsKRfrLMHkMQRe61oTuxBkBwcQpvuibjEM=;
 b=LEDsTEPcg/sXqYb0x5DkLIaunK1wItNNSLQUmoi9kH61WUT3KPJwJSKUyd8QJ24K8f
 lNWP8VMEAZAbvk+elT8mnavxbkLg4+keqBhYtnhEbdYEJZwvZ1RIkVmwDEMatS3ptZ7V
 LYG0vYOC1ciATSY2VaiVeUp2MF7zSeg1anE06ms8wY8pSXqp/7jQV2go0PDJVaWZY/7X
 CztZSi0lU+mPdGSIwN7tZw9nBGDF0l9QyWe+3jGtFf7MxEJOsl2la+IlCtYKMg/zxXRW
 WZLG4uIqLjKwIiKi1fqt9Fo++8lWTX+wfeZEHwKT88otf2Qu+T22bUcN9UQFVAJML1V3
 2NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266960; x=1703871760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=34BUg2B4LjsKRfrLMHkMQRe61oTuxBkBwcQpvuibjEM=;
 b=Ak9/P+4OipG8QsL/l2HdnhtwoIiHK9WbHDmhecbSueqONeqvWO5idk/BdsuonKMP+s
 V3+SyHB3NnEChpGulHsMD1hEZk/htz3BVQ9D5/kNhq4SGeHVlx6mzm8MkrCDkAH+KHbj
 ZVzkP1dRCmYwslRiDt1NlRXVpGeylsQ1AIJESP7ZxfkIISq9/b/VFUEpSN+gqn01h4ep
 3XklqMJc96AbZpBsZUzzLMoh0LqFJCG5Agb7ids4SqA+ZhLwEpfWui1Cwg9qLo1F/EJ8
 BCScqGNLo1trCt1FLO7ASF4MtCNYEW4vGeLyVwAVeW5qNJ8JHYkywt6YBMKKL2b9a9mh
 fMvQ==
X-Gm-Message-State: AOJu0YycvA40A1x9m0UA/ylOBTmOmyRntPffSuhz42VDkcDI5ezZdVF/
 Sl6CqmycRA8RgyoeK5+W2A==
X-Google-Smtp-Source: AGHT+IEHhKrxlJJC6hecqKp88hOj5Ill1eBn0UyrmY0K3DyD2qK8+a7I0eGYkTkRAt5FV0hLxk4sUA==
X-Received: by 2002:adf:e7c7:0:b0:336:619f:4647 with SMTP id
 e7-20020adfe7c7000000b00336619f4647mr905229wrn.108.1703266960737; 
 Fri, 22 Dec 2023 09:42:40 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:40 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 26/29] drm/rockchip: inno_hdmi: Drop custom fill_modes hook
Date: Fri, 22 Dec 2023 18:42:17 +0100
Message-ID: <20231222174220.55249-27-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we have proper pixelclock-based mode validation we can drop the
custom fill_modes hook.
CRTC size validation for the display controller has been added with
Commit 8e140cb60270 ("drm/rockchip: vop: limit maximum resolution to
hardware capabilities")

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
changes in v2:
 - no changes

changes in v3:
 - collect RB

changes in v4:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index a074451a0c49..d7453c36d37a 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -630,13 +630,6 @@ inno_hdmi_connector_mode_valid(struct drm_connector *connector,
 	return  inno_hdmi_display_mode_valid(hdmi, mode);
 }
 
-static int
-inno_hdmi_probe_single_connector_modes(struct drm_connector *connector,
-				       uint32_t maxX, uint32_t maxY)
-{
-	return drm_helper_probe_single_connector_modes(connector, 1920, 1080);
-}
-
 static void inno_hdmi_connector_destroy(struct drm_connector *connector)
 {
 	drm_connector_unregister(connector);
@@ -695,7 +688,7 @@ inno_hdmi_connector_duplicate_state(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
-	.fill_modes = inno_hdmi_probe_single_connector_modes,
+	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = inno_hdmi_connector_detect,
 	.destroy = inno_hdmi_connector_destroy,
 	.reset = inno_hdmi_connector_reset,
-- 
2.43.0

