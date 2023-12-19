Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F4818D49
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5F510E4F9;
	Tue, 19 Dec 2023 17:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205B810E1D0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:15 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d13e4f7abso29704745e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005273; x=1703610073; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=15Kg5P/kPo3OprJxF+EVJ+2okgIdyNf3FbH+CrQD8yI=;
 b=G6uTYXpCPcYX+pO8iYLH/OFbZPNJEt+DRgqmMVYTcVJX7NICbWRk5ZEOMpGORTbJrD
 qSfNpLULatGfvu4rVK6K4jRJ4TUzm3C8fPIY4Bf+jCveztgte841XhiJaovAbWy1oaw6
 1R8c+fFfqojW/tNuCocGYd4iRRgHPkLmQ/LF/mybgLVdj19OM2OsnWI3JgJMDE82OL+W
 tE/6XBiABO2X56Vjj2rRXG+7HWPxOcZbJq1AWGeWMUpPRvqCqLryZwF6rEB/b8BjSw6a
 WfwO+voIfp2Ddevm0vYfMt4OBTWhPcjvUkk13SvfyTkNxKg+pDGGXJn4DKokbEIqsiF8
 O4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005273; x=1703610073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=15Kg5P/kPo3OprJxF+EVJ+2okgIdyNf3FbH+CrQD8yI=;
 b=uq5UjfYmiSxeyxnJSh7NmDSKCo1/7Jwlxzq6K/bVT8+dLhaGvIuX/2Q3LHtvcKH5P2
 fGdxoYIC94OGO/LlBMOFFQly+DD+47bExVJyt4YkLz/4nggzDnUraykfPKpCaGYavdm4
 sPi/Rl6xks+J1yLzNMFvwCOJxgMm/3qkpTOJM9blYmcSuDDQ5nIRfBqPWDq+7FNoecED
 ENqBJIsH20YJWk0PWfKZcMeLm/i/zNygpBsU4V6fHT4IijhsukEm97dmf3iOQ5fIe5zi
 PwTluwxAW4MEPHrezvQOc2jShuNXtAtQe4KvE9owZzv/qNg27Fk03mdko3KVSaqn+Cbq
 ecGw==
X-Gm-Message-State: AOJu0YzmYFr3eIca8LxCFJxOwI2cIXa/nV69NrzO3YkBKKwUfSRK5C0M
 Z4Jwvv+Kte/8HEDivnmA3g==
X-Google-Smtp-Source: AGHT+IGqScOQaAnjGHqWFCShb5yiDE0Yh5BBJo/U5oIdxgSiH15NWOTLCcGXNGOGRQDcRHbogYVnVg==
X-Received: by 2002:a05:600c:4595:b0:40d:129f:d59c with SMTP id
 r21-20020a05600c459500b0040d129fd59cmr3033478wmo.79.1703005273480; 
 Tue, 19 Dec 2023 09:01:13 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:13 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 07/29] drm/rockchip: inno_hdmi: Get rid of mode_set
Date: Tue, 19 Dec 2023 18:00:37 +0100
Message-ID: <20231219170100.188800-8-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219170100.188800-1-knaerzche@gmail.com>
References: <20231219170100.188800-1-knaerzche@gmail.com>
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

From: Maxime Ripard <mripard@kernel.org>

We're not doing anything special in atomic_mode_set so we can simply
merge it into atomic_enable.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - imported patch

changes in v3:
 - added my SoB

 drivers/gpu/drm/rockchip/inno_hdmi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 48c4f010b260..299770e481b7 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -490,21 +490,22 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	return 0;
 }
 
-static void inno_hdmi_encoder_mode_set(struct drm_encoder *encoder,
-				       struct drm_crtc_state *crtc_state,
-				       struct drm_connector_state *conn_state)
-{
-	struct drm_display_mode *adj_mode = &crtc_state->adjusted_mode;
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
-
-	inno_hdmi_setup(hdmi, adj_mode);
-}
-
 static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
 				     struct drm_atomic_state *state)
 {
 	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+
+	conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
 
+	inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
@@ -533,7 +534,6 @@ static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
 	.atomic_check	= inno_hdmi_encoder_atomic_check,
 	.atomic_enable	= inno_hdmi_encoder_enable,
 	.atomic_disable	= inno_hdmi_encoder_disable,
-	.atomic_mode_set	= inno_hdmi_encoder_mode_set,
 };
 
 static enum drm_connector_status
-- 
2.43.0

