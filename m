Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBCC735ECF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 23:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD87010E0CE;
	Mon, 19 Jun 2023 21:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD9710E08A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 21:06:50 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f85966b0f2so4499251e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 14:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687208808; x=1689800808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OkVUeJo8DF/DMTbUaoGZepsmdm4n19YNQ9t4FuVsxcw=;
 b=zOaAVIgkuq0/6D3JXP7gEsmI63RvuSrt/zepsT3o68GPDhzIG1McOEShS0fLGNLzTt
 6pZF9l+KkRtwOxH42j1TSZEgsF+5sciGwhYhmRK7Jm1fAXXHZj6S5XEuGOAGh7p0xOln
 sIIDrj9Che3BwomoRiK+nQhUdrfdobPT/tLn1N0/m/vugdqU/YKORnwRVTijpHCzemyq
 h1gWMVxJL2Oi2eBLvU4iE0bpZL25vYU5DHSaGBULk0D/EinUvlzgcASUJ0GzpvxIQOuG
 /I0vEvfVaEz0BAQbTElPghEDGicin3j+E6loy1a6YQsKxvhl3eNBhNY1qFp4m9BdahTg
 Mdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687208808; x=1689800808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OkVUeJo8DF/DMTbUaoGZepsmdm4n19YNQ9t4FuVsxcw=;
 b=gUMlqz3zAGWWkR9EBQpGWj8lgFgcsgQK1WwzCkWzpQ47HTTP8iGRLt7InIVQpNbNZY
 NMnMlVuEjOvsOCVa3BzjSSUdvGYyrYeY3R7yJ57mjrKBnH/5QVUO9j0qt0/59ShPpGO3
 32FljsVvB/YVtnRDhSJOZlBpSO52xGN81gQjOTSia5A2l8NiqM7xYQb+NSkM7skFeh3P
 +GEYlGcQa73NNR0EAlMBrEAXM1y2odmYAKCqo7dCOZmCIkWHGL0t2CSpR1ICdeU2aohE
 aoJi86W4yPGBwXFGvEZlnb/rd5gfQZ9kTR3NR545CZwpbrJPNqIE2E5ByLMyL/2c/AuS
 au6A==
X-Gm-Message-State: AC+VfDxQToEZGDrmLla99Xd0dfvZSH0SKqHT3dB9vGJwKWZwTy7X+EJm
 ntoAPpHBX4DnSPvavyN5J06lsQ==
X-Google-Smtp-Source: ACHHUZ4SmBnw+CU2EjLU4rEOSyCgwOagG4ydP5o2/Vnk9RVFV6Xhu/FQbT00rWxCSDdG797Z0/T0FA==
X-Received: by 2002:a19:4f43:0:b0:4f8:6aa4:17ec with SMTP id
 a3-20020a194f43000000b004f86aa417ecmr2824624lfk.43.1687208808238; 
 Mon, 19 Jun 2023 14:06:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d17-20020ac25ed1000000b004f86c6573ebsm76072lfq.168.2023.06.19.14.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 14:06:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2] drm/msm/dsi: Document DSC related pclk_rate and hdisplay
 calculations
Date: Tue, 20 Jun 2023 00:06:47 +0300
Message-Id: <20230619210647.867630-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide actual documentation for the pclk and hdisplay calculations in
the case of DSC compression being used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
- Added a pointer from dsi_timing_setup() docs to
  dsi_adjust_pclk_for_compression() (Marijn)
- Fixed two typo (Marijn)

---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 40 ++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 3f6dfb4f9d5a..a8a31c3dd168 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -528,6 +528,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
+/**
+ * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
+ * @mode: the selected mode for the DSI output
+ * @dsc: DRM DSC configuration for this DSI output
+ *
+ * Adjust the pclk rate by calculating a new hdisplay proportional to
+ * the compression ratio such that:
+ *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
+ *
+ * Porches do not need to be adjusted:
+ * - For the VIDEO mode they are not compressed by DSC and are passed as is.
+ * - For the CMD mode there are no actual porches. Instead these fields
+ *   currently represent the overhead to the image data transfer. As such, they
+ *   are calculated for the final mode parameters (after the compression) and
+ *   are not to be adjusted too.
+ *
+ *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
+ *  refresh rate and data overhead as a starting point of the calculations.
+ */
 static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
 		const struct drm_dsc_config *dsc)
 {
@@ -926,8 +945,25 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
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
+		 * less or equal to 8 or 3 compressed pixels in case bpp is
+		 * greater than 8.
+		 *
+		 * The back/font porch and pulse width are kept intact.  They
+		 * represent timing parameters rather than actual data
+		 * transfer. See the documentation of
+		 * dsi_adjust_pclk_for_compression().
+		 *
+		 * XXX: widebus is not supported by the driver (yet).
 		 */
 		h_total -= hdisplay;
 		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
-- 
2.39.2

