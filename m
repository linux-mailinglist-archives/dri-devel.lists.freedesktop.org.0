Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BA99B87A6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 01:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF8210E184;
	Fri,  1 Nov 2024 00:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="slE8PLw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0EB10E184
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 00:25:26 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53c779ef19cso1814755e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730420724; x=1731025524; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Hv2lxmvcj3iHqVSo1vO+GpyATUEKN5RREgLh1lW/pKI=;
 b=slE8PLw2SkQ2GjF/qeeyA/mx58i7Bk8l+lCk7WsbkDNircYd5e3zixmEbGQe+MixrJ
 rUHRKbELEMzk2wit3kSRhbKqRjTAJEouZM1Akit0GIEJj0t5dm0GudiuyoHHX7Hkjh49
 EhcUx1zhKS33aS5qsw4My3Ws+HlvmZnk4tzSgB4C7WJXUpzvthJzRjPzqDEQRkQTkfQb
 bmRp2UyWbo3iM2ZT7Zd1FdQLLwXmwSYtFhjRQK+I3JAJJN2n8UKlglTjFjZOQwFQaEMN
 gh21WtJFRUHUm3wlhwIDR/hMZsoCFqFiuc0zJIMiAIFlwyUii3a0zSART14dkCANeO9q
 NB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730420724; x=1731025524;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hv2lxmvcj3iHqVSo1vO+GpyATUEKN5RREgLh1lW/pKI=;
 b=py6BDhnB0Rft9RqCKVBpFpORqGJRH2wcD+bexVBTG5v0vXDx0s0jI6Wdu61MU5+cZt
 lZ21uvo1bkhjVrGSOn81ivIIg5EYYYuWRDGwOVw0hbJ0dNlGCwFMS3MLpLE0z356HGsb
 rQXsjVRsoUmS7+3y/8z6GjQJkDUbJRNksYVAfjrOKpN8Lop6v906RtslRnSkaUuaAKd0
 L3/0BY+XCzoUec/3Kd+UGxZY1KeuZQdk0yIMz950ggIT8YQPaifPCNQB02kvwU+QkulU
 2ie3mgTzAhO52OyewLLsP+flQ24bq31iH93GEnk3sP5xqKXE9596K2Xsd7iSKmfwni7T
 d3UA==
X-Gm-Message-State: AOJu0YzqT8ok0aDcvSpQfnhYL2AJ68+2i1g5ZaoJaRCetdCrepGG9rlj
 2lBGh8HCFxtHmI8NfYIUVwNYHw20V5UySQDxwPBObov2Ld/D98SMwQ2HjV1ZzAs=
X-Google-Smtp-Source: AGHT+IEAG9yn1GIhE2YrHT9rrcbTzRT2YsspXsGtFKg4MG2x8/7FF58dsirEGqVuW26T1ugiJs7GKw==
X-Received: by 2002:a05:6512:1106:b0:539:8b49:8939 with SMTP id
 2adb3069b0e04-53c79e913efmr2851992e87.41.1730420723969; 
 Thu, 31 Oct 2024 17:25:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 17:25:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:09 +0200
Subject: [PATCH v2 6/6] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-6-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2043;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rnWWDnvK/2UdwmliNMd8qjy7ZbPEcXVWLie22T2NTNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/iyyoKxhJ9ymVIF5jZKxhY4Q/llakDKMFQT
 BEjedUrIaeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4gAKCRCLPIo+Aiko
 1URAB/0Q+lN9KyT42dXskzxxSyFiafqSlV1SV+VcON3MjaaEaECIjnFoHbPKEDxvle6Xicl7vHs
 h46RF3lrs7ptPTroESb/pvPY/Jj5EK9/dqatVhqiLYq2adABTz85k64UaLF9WIvj1pF54o1lMJJ
 0R4OFGKZEAjC02s31dNE4fIMUbhsnc8JNoP15YRKxjq6AvslRKkkh+qCN5QhotWa9AUe6/FuS3d
 S7bNUR5mrFzDH3QH2n196BQPAJqsuELq2I2VbXoJuXeBSoQHuH5Dlli1/25UfCBLmbABtstMdis
 ux9EbzgijZfuFg2ndroerRXzSm8rHmu9np1KtZBbhZYdo8ju
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Replace .mode_valid() callback with .hdmi_tmds_char_rate_valid(). It is
more generic and is used in other mode validation paths. The rate
validation for .mode_valid() will be performed by the
drm_bridge_connector code.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 181c5164b23192f0b557624d73c6223032b90ec6..c686671e4850a1af75b82995185ffc3cbb22a447 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -442,16 +442,14 @@ dw_hdmi_qp_bridge_edid_read(struct drm_bridge *bridge,
 }
 
 static enum drm_mode_status
-dw_hdmi_qp_bridge_mode_valid(struct drm_bridge *bridge,
-			     const struct drm_display_info *info,
-			     const struct drm_display_mode *mode)
+dw_hdmi_qp_bridge_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				       const struct drm_display_mode *mode,
+				       unsigned long long rate)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
-	unsigned long long rate;
 
-	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
 	if (rate > HDMI14_MAX_TMDSCLK) {
-		dev_dbg(hdmi->dev, "Unsupported mode clock: %d\n", mode->clock);
+		dev_dbg(hdmi->dev, "Unsupported TMDS char rate: %lld\n", rate);
 		return MODE_CLOCK_HIGH;
 	}
 
@@ -510,7 +508,7 @@ static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
 	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
 	.detect = dw_hdmi_qp_bridge_detect,
 	.edid_read = dw_hdmi_qp_bridge_edid_read,
-	.mode_valid = dw_hdmi_qp_bridge_mode_valid,
+	.hdmi_tmds_char_rate_valid = dw_hdmi_qp_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = dw_hdmi_qp_bridge_clear_infoframe,
 	.hdmi_write_infoframe = dw_hdmi_qp_bridge_write_infoframe,
 };

-- 
2.39.5

