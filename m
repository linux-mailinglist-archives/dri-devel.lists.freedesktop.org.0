Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B3B6DD411
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 09:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE1D10E29D;
	Tue, 11 Apr 2023 07:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3C910E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 08:52:10 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94a34d33accso110456766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 01:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681116729; x=1683708729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qCvx4T7aanPiUqpFl/M0cMKkdvIDQFWcCiUFxZeM/NU=;
 b=Y/dl73ECeQJmxGjfNGFXGoj+tH3jDlPFyNtkQbgPt8AGF/iCm+V3lt8qgzwpYsWWQl
 wBHBNEH6FPMOWum5niMWUFshrjNYbyWkAfFqnqBwNR6SU0IOERdQPagVi6odqzeOjOQU
 whQYjImi9JeZaGl8e3AFT197+L4iOOkPhsyq+7sVrAorYzbmmXXGG9n9MbXBgSHeoYyq
 z82tM8UGSbFqUermTYc8JIH/T1BBIg7mlSpio1NEcsquv6gZzA+L/vHSkKf1IbS//v+h
 DZgXthrfsyELJywaonFiGARS6cuv/z8C3d5DMbN1qUQajV8vb0goOsA9kHN4xSFsDMGC
 SoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681116729; x=1683708729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qCvx4T7aanPiUqpFl/M0cMKkdvIDQFWcCiUFxZeM/NU=;
 b=KTDwc+D/4EBAlUXF+PSy5J9e88TAoOubKnWL/dp5mkq/i+b3UPAbt7uapS9lNsUv/T
 IiFw52/GRz+eWaALCcZk+hUdTmLnRm5pazYOFqUbs25A3LIEksowKr+ol9X7i8FpY5WJ
 6Ar3Unmr/qAYvaO4SsegNK7bcn6/4ZfiS6CX8S7tc8yKRFlaArTBd01PfbxbimoEAHQe
 MDxLMKKdG2tBkRfYMTly0MPieBGqjWpoGY0Ns76XMNGoxIDUbi588Luf4R3oILP7IZC3
 sDwUz1fSfwuLY2HqWoZD4BviVNCwyXRgsxmkqOH7L3SS3KQxLwPWDO7AeO1Jmbv007sE
 Rcyg==
X-Gm-Message-State: AAQBX9f3ITbtNl6Ah92r979O2b9vcAf/Zx0XPVyzNDaZhX6MFILPFBVy
 SyrgfJ6cnd52qxsQ2gFB0sE=
X-Google-Smtp-Source: AKy350b+eqHkqWt2X3cAZ+ksESIZiHh0LCjG8NmoiClTQLYlCGhrNn9z1ont5uVVtrkNnozW62+qaA==
X-Received: by 2002:a05:6402:138e:b0:504:8c4a:d1e with SMTP id
 b14-20020a056402138e00b005048c4a0d1emr5611231edv.8.1681116728661; 
 Mon, 10 Apr 2023 01:52:08 -0700 (PDT)
Received: from localhost.localdomain ([154.72.161.184])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a50954d000000b004fc649481basm4709962eda.58.2023.04.10.01.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 01:52:08 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: maxime@cerno.tech
Subject: [PATCH 2/2] drm: sun4i: tie DSI PHY Poweron/off to crtc enable/disable
Date: Mon, 10 Apr 2023 09:47:50 +0100
Message-Id: <20230410084750.164016-3-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230410084750.164016-1-fusibrandon13@gmail.com>
References: <20230410084750.164016-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Apr 2023 07:23:39 +0000
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
Cc: krzysztof.kozlowski+dt@linaro.org, dri-devel@lists.freedesktop.org,
 andrzej.hajda@intel.com, sam@ravnborg.org, marex@denx.de, rfoss@kernel.org,
 dave.stevenson@raspberrypi.com, jernej.skrabec@gmail.com, wens@csie.org,
 jagan@amarulasolutions.com, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, tzimmermann@suse.de, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>, samuel@sholland.org,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Poweron/off the DSI PHY when the crtc is enabled/disabled. This allows the modeset
helpers to manage the DSI sink while preserving the old drm_panel_<prepare,enable>
and drm_panel_<disable,unprepare> sequences.

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 523a6d787..6f50dc66a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -190,7 +190,7 @@ void sun4i_tcon_set_status(struct sun4i_tcon *tcon,
 			   const struct drm_encoder *encoder,
 			   bool enabled)
 {
-	bool is_lvds = false;
+	bool is_lvds = false, is_dsi = false;
 	int channel;
 
 	switch (encoder->encoder_type) {
@@ -198,6 +198,8 @@ void sun4i_tcon_set_status(struct sun4i_tcon *tcon,
 		is_lvds = true;
 		fallthrough;
 	case DRM_MODE_ENCODER_DSI:
+		is_dsi = true;
+		fallthrough;
 	case DRM_MODE_ENCODER_NONE:
 		channel = 0;
 		break;
@@ -221,6 +223,12 @@ void sun4i_tcon_set_status(struct sun4i_tcon *tcon,
 		sun4i_tcon_lvds_set_status(tcon, encoder, true);
 
 	sun4i_tcon_channel_set_status(tcon, channel, enabled);
+
+	if (is_dsi) {
+		/* turn DSI phy on or off */
+		(enabled) ? sun6i_dsi_phy_power_on(encoder)
+				  : sun6i_dsi_phy_power_off(encoder);
+	}
 }
 
 void sun4i_tcon_enable_vblank(struct sun4i_tcon *tcon, bool enable)
-- 
2.30.2

