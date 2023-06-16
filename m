Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFBF732C58
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 11:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF8F10E5A0;
	Fri, 16 Jun 2023 09:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E9610E587
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 09:41:58 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b4274f7640so21170571fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686908516; x=1689500516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZOdAkBA8FOVnbZoSsi+PF1F3scMmt2Df8O/OAnmM4VU=;
 b=UI/zlnBm/dscnXLIZ+pOpEko9tSEf14nSYHZg+p470KerrBvtZ+uPX1PW9TsMOEZ+E
 K2TDU0duDskkspbS2cSvcjoMgPsVXacVzZMSPoZwNwlLnW/xMkkcl+nSXcLqCnpkndH0
 f9CbEX/ZxmR+tei1rTUZK/XwkCoMqgB3sNpKYHdKMaOnruCPCsrxqQU9THnMc01DuEAr
 uPo2u8O9zOhJUtyANL4fxtLy2ggzTUKUAKxiEaR7zd470TDsAK4/4srybLAFLy+8jgQN
 XAiZ6Nx/Vl9ZQHnXDKJoGBra4/evWgW48DmLBwnNyHONT1FzA2/oxkR5ztlQV4paxDl3
 CO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686908516; x=1689500516;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZOdAkBA8FOVnbZoSsi+PF1F3scMmt2Df8O/OAnmM4VU=;
 b=C5yoIQh6CrsSEHdmhdUhkXaVbHMwDf6v+lgMv3UZKsdjC7JM/JXxP+tbbVjdrS51Ln
 sIpMgkWMrRrngGMR+0MuD9BfFGG2K+FBUhNZeXCAqrQeMPTIfodhsijXzJtNWN9g3EQn
 y+X+xEzJc3/Zuh3V4jY3y/FJODBI07NzXqVeUOtqO03aHuc+adqK41qD1oKsGuvtRgZc
 wYKbQttLI8Ul28VWJ3WpY9S9GAvkzhH8Y0yU631gkqiygHJoEAOdz8mE3S2wKzA10fwV
 9IWRDpNYSLfPBFmTWl3uItf9gqueQr8TB9p9rkguJGK/8x4e1btYXG9TtoAyO+3wpRls
 k+zg==
X-Gm-Message-State: AC+VfDyfX9McXkFnvopdzOUopxoxZdxi49XTpe2sAN6eaZSTUMnwqPED
 L7hwGV+GHggBOMDaG/ZBqoPVGg==
X-Google-Smtp-Source: ACHHUZ47GquGnTYuMlPm2AJHqLpY6Q+MU1t9IezNRjf3b38AdAZhLfoHzbT48HcYyKs7T25DBmNqgQ==
X-Received: by 2002:a2e:9f55:0:b0:2b1:f90b:f51a with SMTP id
 v21-20020a2e9f55000000b002b1f90bf51amr443499ljk.5.1686908515946; 
 Fri, 16 Jun 2023 02:41:55 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a2e9e08000000b00295a96a0f6csm3441184ljk.102.2023.06.16.02.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 02:41:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dsi: Document DSC related pclk_rate and hdisplay
 calculations
Date: Fri, 16 Jun 2023 12:41:52 +0300
Message-Id: <20230616094152.495723-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide actual documentation for the pclk and hdisplay calculations in
the case of DSC compression being used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 3f6dfb4f9d5a..72c377c9c7be 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -528,6 +528,21 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
+/*
+ * Adjust the pclk rate by calculating a new hdisplay proportional to
+ * the compression ratio such that:
+ *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
+ *
+ * Porches do not need to be adjusted:
+ * - For the VIDEO mode they are not compressed by DSC and are passed as is.
+ * - For the CMD mode the are no actual porches. Instead they represent the
+ *   overhead to the image data transfer. As such, they are calculated for the
+ *   final mode parameters (after the compression) and are not to be adjusted
+ *   too.
+ *
+ *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
+ *  refresh rate and data overhead as a starting point of the calculations.
+ */
 static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
 		const struct drm_dsc_config *dsc)
 {
@@ -926,8 +941,24 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (ret)
 			return;
 
-		/* Divide the display by 3 but keep back/font porch and
-		 * pulse width same
+		/*
+		 * DPU sends 3 bytes per pclk cycle to DSI. If compression is
+		 * not used, a single pixel is transferred at each pulse, no
+		 * matter what bpp or pixel format is used. In case of DSC
+		 * compression this results (due to data alignment
+		 * requirements) in a transfer of 3 compressed pixel per pclk
+		 * cycle.
+		 *
+		 * If widebus is enabled, bus width is extended to 6 bytes.
+		 * This way the DPU can transfer 6 compressed pixels with bpp
+		 * less or equal to 8 or 3 compressed pyxels in case bpp is
+		 * greater than 8.
+		 *
+		 * The back/font porch and pulse width are kept intact.  They
+		 * represent timing parameters rather than actual data
+		 * transfer.
+		 *
+		 * XXX: widebus is not supported by the driver (yet).
 		 */
 		h_total -= hdisplay;
 		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
-- 
2.39.2

