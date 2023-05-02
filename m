Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E66F3BAA
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 03:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E59610E05A;
	Tue,  2 May 2023 01:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F8110E0E3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 01:08:10 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-32a249b416fso26625805ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 18:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682989689; x=1685581689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CznWtXBlBAUTzPhoV/NK/Tc5LdU+0am6ActqKsQmdk=;
 b=sGjC/BfHQKk3rDUml7ijRHKM0pXWzke2GrLRzRR+xcpFrxO0uohJ0YdskPS1bMLNzh
 pB8XRGAmSu3fl1blwyYMaa9ezsTd87eBoM3uYUzcaAI2wJtFHff/uVkPfgQEJOhaLr3F
 bqfPy0oMOnM8dvJfEots5dO3NlUNuj12qD5wC5lA+RSMlHINRHgnPSTpfqfmfBQmqEP4
 gJWX08PVIv/gVoNRlQFbPJ3UcHsitAPl8v77r1ER95ZAaid2gSmwZx9iOvDs1WJNSyE1
 vkXH5lOe6dbeC/gtSnCREpT8JpCtMIGQqIX3gP6HYGNWkPG+3O51ZM3uOwYFY8MtBmoe
 kVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682989689; x=1685581689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CznWtXBlBAUTzPhoV/NK/Tc5LdU+0am6ActqKsQmdk=;
 b=GlByXFRg6gdt6a3qHvIKiiwKgtivgvTdgVFE575ZxD7RDMSyB/Gpxy+ubHG4qK2xii
 CjAHcB+a6AQu/mqOmMhc+BazUcJlZOq7hf4mJNyIiOV4y9mrFttPuoAi+9BOfb/VYPq5
 29n++lZZfiyb3STDKpGbohn2Ffje4UkFwApjkcxtVrgHhw0HX4NMJ/F4B4bsRfdPZvU6
 hw+2GpiU+nopMFWVLfzgCL3Ahf/NQoqdTqc/Z0ABnI3ysOIL2/6rzgmqWOmVl4ov+idg
 3UiWAIoiXcPZiE4eKjznOX9QapcJ/daTMsz9sC5WOofMf+fZxl5mVV7VKp8ehkbclGFV
 sMYA==
X-Gm-Message-State: AC+VfDytzVIZRlsiR+PHcAco0nwGjJZS5j5d1CSNrgsaVLr1F3V3+cmg
 HAWob3fnPF1P60oLOhRucj6G4mn4Y/wx2Q==
X-Google-Smtp-Source: ACHHUZ7+TNOY1Xm1LVgBiXB3LZ7WuMYw79Ybwll8G9Mtm4irHz1B+74JhDw4oOMwnX7KOXYi9JVMJw==
X-Received: by 2002:a92:d84a:0:b0:32c:c418:9163 with SMTP id
 h10-20020a92d84a000000b0032cc4189163mr10261202ilq.5.1682989689034; 
 Mon, 01 May 2023 18:08:09 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:8257:a536:d7fc:1919])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056638329000b0040fb5d5429fsm4836329jav.131.2023.05.01.18.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 18:08:08 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 1/7] drm: bridge: samsung-dsim: fix blanking packet size
 calculation
Date: Mon,  1 May 2023 20:07:53 -0500
Message-Id: <20230502010759.17282-2-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502010759.17282-1-aford173@gmail.com>
References: <20230502010759.17282-1-aford173@gmail.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas Stach <l.stach@pengutronix.de>

Scale the blanking packet sizes to match the ratio between HS clock
and DPI interface clock. The controller seems to do internal scaling
to the number of active lanes, so we don't take those into account.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e0a402a85787..2be3b58624c3 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -874,17 +874,29 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 	u32 reg;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
+		int byte_clk_khz = dsi->burst_clk_rate / 1000 / 8;
+		int hfp = (m->hsync_start - m->hdisplay) * byte_clk_khz / m->clock;
+		int hbp = (m->htotal - m->hsync_end) * byte_clk_khz / m->clock;
+		int hsa = (m->hsync_end - m->hsync_start) * byte_clk_khz / m->clock;
+
+		/* remove packet overhead when possible */
+		hfp = max(hfp - 6, 0);
+		hbp = max(hbp - 6, 0);
+		hsa = max(hsa - 6, 0);
+
+		dev_dbg(dsi->dev, "calculated hfp: %u, hbp: %u, hsa: %u",
+			hfp, hbp, hsa);
+
 		reg = DSIM_CMD_ALLOW(0xf)
 			| DSIM_STABLE_VFP(m->vsync_start - m->vdisplay)
 			| DSIM_MAIN_VBP(m->vtotal - m->vsync_end);
 		samsung_dsim_write(dsi, DSIM_MVPORCH_REG, reg);
 
-		reg = DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
-			| DSIM_MAIN_HBP(m->htotal - m->hsync_end);
+		reg = DSIM_MAIN_HFP(hfp) | DSIM_MAIN_HBP(hbp);
 		samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
 
 		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
-			| DSIM_MAIN_HSA(m->hsync_end - m->hsync_start);
+			| DSIM_MAIN_HSA(hsa);
 		samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
 	}
 	reg =  DSIM_MAIN_HRESOL(m->hdisplay, num_bits_resol) |
-- 
2.39.2

