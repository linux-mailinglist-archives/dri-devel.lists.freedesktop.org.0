Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8BF9A4823
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F82810E98E;
	Fri, 18 Oct 2024 20:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sVYm9zU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB2610E98A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 20:34:43 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso37458121fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 13:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729283681; x=1729888481; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8KNF3aZ80xlLK3q7tI6wiBMuQSM/G62kGRgo4sUnlVk=;
 b=sVYm9zU+CD29h9//vZW+8m4QSJwc3ots5bUUSSOlfJzUPbCdoyXnKU2LJpmeYTAwEs
 L2FYrNqFUy1S3Vj4ToC84LLh1SieVfVJYreiJa2X21zM7T8N2XPu6wde4NogPZ+QUlPk
 B5RmUQeS7xciMLaf8g5uYBg8HMQL4QMdhZIuXwMVTetM0eT8hoSi9VlsHTdLi9obl0Ce
 c8ZCpCQI3cBXkgDdUgHyMtnLZmCc8imc88n60VF5/2fGaVBVt/qIrxZO3yMOpk4iGps2
 U/wdwymSv0IyFldd5vnu98OXC0N7WymQrwH05oRc7SwANFM0/RZwtQa9USneB2bG2vxx
 MBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729283681; x=1729888481;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KNF3aZ80xlLK3q7tI6wiBMuQSM/G62kGRgo4sUnlVk=;
 b=Ucn+BwPsCfmRr1lFtyQH/6NHDP4CACS+Py6utxSpbo7a4Sj1PsdTRn7UfMfct2lDmp
 u/2BlNTSXA25DXP5QiUC12Pt7+1KywYTq0j2DMqB0c9pZ4LkmcxqIx0XEKxs0KmHIDgz
 eTe8yjLgFrhaOC+pV6TmMNX+fNaAZ2DSA2uP3JFPHMziygwzdgFaERMz/5ck8cyrEVTh
 GpvIWYFHT5oUh/G0jC7VzYxdCXz2E0ehMqafaDZjgf3KLB2X1ebuT+vGOF1yiFMgMHSg
 1ptmBYxAYpCNoVNq/IaLG//Ku9j3leuEtOsYpHcj7yC4IRr1SDKuEgkTL71iFz12bsYL
 yKyQ==
X-Gm-Message-State: AOJu0YxnDy8CoiBnhF7Cv0uP7jmD/4qXybsOiMaoiaXb5x41nim84yRi
 kHsHNewL224ZsBczfa5kpfcYlu8VFfM/pMFKLUg3YFOYBJ9KaNeqP6ZX8vX401M=
X-Google-Smtp-Source: AGHT+IGB98MZ4b+WRaD4A9VvwnCwxRN8d8/Fl30hE0Oq/p3vkPf3ZXCtCy1fbIicLKx9CCVIxFGzog==
X-Received: by 2002:a05:6512:e98:b0:539:93b2:1380 with SMTP id
 2adb3069b0e04-53a154d80a7mr3793237e87.48.1729283681263; 
 Fri, 18 Oct 2024 13:34:41 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0e09sm314047e87.146.2024.10.18.13.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 13:34:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 23:34:24 +0300
Subject: [PATCH 6/6] drm/bridge: dw-hdmi-qp: replace mode_valid with
 tmds_char_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-hdmi-mode-valid-v1-6-6e49ae4801f7@linaro.org>
References: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
In-Reply-To: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
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
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=62YpkgWLFOCHVyXEfwzdT8WXezDQplIIX6XUhdEmdrA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEsZX9lakH8ExWkyFJBh3Vc/U3dgf2jd+BXIqJ
 6Bk7kv5Vj+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLGVwAKCRCLPIo+Aiko
 1S68B/0X7Ry1mckj6d7MJuKYGTrRuZOVLxsRWDxeWeqwBQoQpAxzeojZvPJev6Oxh31fNJfDHlv
 viIPEJeCikJpCIWZRjx18K0IkZgFjHF+4lPgja+L45P7s9www21/P9l8yxpZxaeY8tfp9Feeva1
 w8zMRXKb2SIsoV5auELsD4HbL/zMAREVeDlAM+MAs/gM5SsfNbu0xS82tMU2PvLaWr23nj+XDiN
 M4NgU0NZh7rhHdbrRlo9A18C9fmxpbOkQCz/+cPA/upYzQy4eY6ZKOT9ZTAWLc6fVO78/I18bp1
 5I4arn059C+4n+6SO3O3HL370p623RGL7qCqpFj6x7vdg7A9
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 181c5164b231..c686671e4850 100644
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

