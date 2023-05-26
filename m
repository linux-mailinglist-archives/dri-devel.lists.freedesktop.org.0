Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98EA711E41
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 05:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D31910E797;
	Fri, 26 May 2023 03:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656C210E790
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:06:10 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-76c64ddee11so9265739f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685070369; x=1687662369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8gw0CRtIoRWw5+nsdaAXlUMcoZo2DLr2IRepPmh2VeQ=;
 b=NtRKOR/Me1Z5FnrSxi9vVagn5h3wQ3ZwbKKrljr40C7z4CF+3YPD+NQq1HUvwXknEW
 4TKzqYVfx9OvCf3ePAcvMWcQEHUodJQp4v+eZj40MwBqU2TwqvWWp1MgOy+TOH3+cgqH
 Y17fkWmNzB3WLZ1UEfc5CvZfajlHavZjoUEe7WukX7UEqKYOQy7OpJq+up486fGO5PDx
 J66OGfGqbBqj/S6YA6riqo1pMJIs+IGD8vmBcc54uzYQvSc8zf+0XlGP9q598L5t4kgB
 aX0UEYB34hNqmgsll1qnKMfMnx6lJzIvMasIjrwqnzxwSlXsNrAuQVLjmr/HsRTX89KA
 XjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685070369; x=1687662369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8gw0CRtIoRWw5+nsdaAXlUMcoZo2DLr2IRepPmh2VeQ=;
 b=JB8bE8MpVd2udEnFMqxjjDx3/ZHDK7/wVXsCcRD+ZAHbANAX//arGjcMpiivXdEkuI
 ufHe50bBTr18WJG2gLjeyxde8VlkcnHpd6ctEjSnT/f3iGOS/qOmUEDiBsscHRFazQO0
 GdM2IhgsUO1X6V2mW7GsIQcGzCQvRcMgEtQZqZPOINSnjd7XIL9Anz30mdJfzaZVNM4C
 P/uf7QODcTf7x511Bv9WQ/gW46nT8agGnWuUtY5dm300hWpbMPsNs5DRPbo0duHA8acj
 8/+HhauODUy/RFkIns2L+9AvId5TXkA8yCZZV84qygXiRJDSVTLz6e+WPK6VZwFy/osQ
 TVmg==
X-Gm-Message-State: AC+VfDxONxaS1TWrvF21XmgccAMmJ/RFfD6giCQ2VmV5kFEp7AJdu4q7
 rk9fZwznqm+vfzyTjEDPhYjSg9M7k7Q=
X-Google-Smtp-Source: ACHHUZ6GkELdVgPi053XuuJ2+kQeNR6sc1xeRmEfacaJ7/znjChK/RBvWLTh4C2qQYai5DtGyl+vqg==
X-Received: by 2002:a6b:f212:0:b0:76c:2759:5cbe with SMTP id
 q18-20020a6bf212000000b0076c27595cbemr117920ioh.4.1685070369117; 
 Thu, 25 May 2023 20:06:09 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:3dd9:3f6c:9922:6420])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5e8502000000b007702f55116fsm363189ioj.38.2023.05.25.20.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 20:06:08 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V8 1/7] drm: bridge: samsung-dsim: fix blanking packet size
 calculation
Date: Thu, 25 May 2023 22:05:53 -0500
Message-Id: <20230526030559.326566-2-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526030559.326566-1-aford173@gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Adam Ford <aford173@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas Stach <l.stach@pengutronix.de>

Scale the blanking packet sizes to match the ratio between HS clock
and DPI interface clock. The controller seems to do internal scaling
to the number of active lanes, so we don't take those into account.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0f3f6846beea..a2d1eaf0ed1c 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -881,17 +881,29 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
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

