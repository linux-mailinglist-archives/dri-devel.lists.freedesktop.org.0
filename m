Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6765F1ACC
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 10:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDCE10E514;
	Sat,  1 Oct 2022 08:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C1310E514
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 08:08:43 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id 70so6067772pjo.4
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 01:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=exCDkdGNSGOnQuwt75tA06xXIS/Hfqspfp6d4Hi7GrE=;
 b=eou1vIfwh6IratgErERpeV/fnv/vqpLNPXVuzy8iqNkg8l1kiHpxG9SiK5Z0bL3fjR
 p3NWEIk/A2A9kvUEVpJgqMhSceL/lkMFvmnSiF/fT2gFGC5Do0k3NkRsyRW756yeOwgK
 OolA6E6qITw9q3CnOmK9CSbq/kMYeKpS9Y7Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=exCDkdGNSGOnQuwt75tA06xXIS/Hfqspfp6d4Hi7GrE=;
 b=utwbskGWwJmrtt6LARtd4jVSi6TYZKhHHmnl1RGzQeJHpQqfiwLCrA9y1UqaH6zsV5
 G+e7bzp6TWjeQhMmhVsKt5aSQALQsyObQ/h2elgzvsW1WEdQ8TqYjIDdyoyuem8rptZl
 S1wsJ50ehDeJ9/6sZg7fImpft/tSBSof+TIKhHGyQZPRIyOFq+J6yGXjNjEQ5PgDkyg/
 YQzeRN+6D+ExsZ9n8kewT7bJ/oqgNPwbZGmSvVhYmcbteuvuXEmQ/ekWkgwLPOk1QVD1
 WcZr6f2eqQfXsVONQFyzE6hcNJjVyZGyIDJa+R9QPKuQIn3VdyhIThrizCUc672JLAPD
 NMfw==
X-Gm-Message-State: ACrzQf36k0Yk3sr9WD4rKrP9RG1DQdO0EqeQGJOK3Je7qNrb93QQfsSO
 gECXAiRzhN3NYqx4TCPCgw5xGQ==
X-Google-Smtp-Source: AMsMyM7jAth4LCJ/HHdFel4Qc6FGDHJ3waYERRYzDSdbb3siuFo6Pf9ChwiEcxracob6l4JePTLbvg==
X-Received: by 2002:a17:903:2288:b0:179:eb73:b9f5 with SMTP id
 b8-20020a170903228800b00179eb73b9f5mr12795552plh.163.1664611723397; 
 Sat, 01 Oct 2022 01:08:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
 by smtp.gmail.com with ESMTPSA id
 c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 01:08:42 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v6 05/10] drm: bridge: samsung-dsim: Add atomic_check
Date: Sat,  1 Oct 2022 13:36:45 +0530
Message-Id: <20221001080650.1007043-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Look like an explicit fixing up of mode_flags is required for DSIM IP
present in i.MX8M Mini/Nano SoCs.

At least the LCDIF + DSIM needs active low sync polarities in order
to correlate the correct sync flags of the surrounding components in
the chain to make sure the whole pipeline can work properly.

On the other hand the i.MX 8M Mini Applications Processor Reference Manual,
Rev. 3, 11/2020 says.
"13.6.3.5.2 RGB interface
 Vsync, Hsync, and VDEN are active high signals."

No clear evidence about whether it can be documentation issues or
something, so added a comment FIXME for this and updated the active low
sync polarities using SAMSUNG_DSIM_TYPE_IMX8MM hw_type.

v6:
* none

v5:
* rebase based new bridge changes [mszyprow]
* remove DSIM_QUIRK_FIXUP_SYNC_POL
* add hw_type check for sync polarities change.

v4:
* none

v3:
* add DSIM_QUIRK_FIXUP_SYNC_POL to handle mode_flasg fixup

v2:
* none

v1:
* fix mode flags in atomic_check instead of mode_fixup

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0636440e4420..90506be3f2dd 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1315,6 +1315,31 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
+{
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	if (dsi->plat_data->hw_type & SAMSUNG_DSIM_TYPE_IMX8MM) {
+		/**
+		 * FIXME:
+		 * At least LCDIF + DSIM needs active low sync,
+		 * but i.MX 8M Mini Applications Processor Reference Manual,
+		 * Rev. 3, 11/2020 says
+		 *
+		 * 13.6.3.5.2 RGB interface
+		 * Vsync, Hsync, and VDEN are active high signals.
+		 */
+		adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+	}
+
+	return 0;
+}
+
 static void samsung_dsim_mode_set(struct drm_bridge *bridge,
 				  const struct drm_display_mode *mode,
 				  const struct drm_display_mode *adjusted_mode)
@@ -1353,6 +1378,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
 	.atomic_disable			= samsung_dsim_atomic_disable,
-- 
2.25.1

