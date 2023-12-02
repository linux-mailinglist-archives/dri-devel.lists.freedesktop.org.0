Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF0C801FD8
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 00:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B96810E1A7;
	Sat,  2 Dec 2023 23:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7866F10E0E3
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 23:59:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bc22c836bso4651785e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 15:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701561588; x=1702166388; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qOFkH9JHKvDEOwXO8Ocnw7zlrT506EsHCCBwsXp0OUA=;
 b=C/vTJ4TRzIOgE/n94GK5lDV+OBqFumP9zMsAKuCW7fPI6AS20vxeEyWA4eKT0wB508
 H9AJi+2Jzir7iUnxIOXAFOKx72aTV/lEebCFilukGaKpC4HirWTFCK0xERM6LVQDYOCY
 7sSrpyBrWhYHsr6pDKzAO5Qm5whHoY32b+rgbRllOFyjj63/IlgFiqA0Gna3es44ZlE/
 icqyMbwW+iHMyHBA8X2vouAQVtJa4YkcE3THku3hHuYRO+v6osqnlQfgrocNkZ/YQZMw
 dL96b90xe/zAjXkj7osZaAO9CTBFUxgUypSLDnLNOiuiauCR1uZUuXYN9xqYE8IGObTH
 gSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701561588; x=1702166388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qOFkH9JHKvDEOwXO8Ocnw7zlrT506EsHCCBwsXp0OUA=;
 b=dJdaq/a7jMOdcsLnANFtY1lBV0jpY3Sog/+WiZTrkU42B3FqjZ2ahIt/mmB1tv6Od9
 nk2pF1m5lxVinN0h8NKHbrrXs1P6NUF6fTdgYUsDOS9YC60tr3hYdN+Q9ZzNbh9Bmiv1
 25BSWMP7fsrJpe+IubFnS8aawM/eaVh8LZpuwP30EqEeZSP8aMCao64L5Y+OZG5beZkr
 U+20Zb4vss4Yb3+PYZGkAYmYX3q8bOMtIekgmuK1Okb5qDBedfRlT/TD9TAmuSfPOmPM
 IRceILxDV5Pm/JW9xJQnlUwiXaINTF2bNSjJOAn81bsslMpuVloPrYv2GLPTyAUViek0
 WpuQ==
X-Gm-Message-State: AOJu0YxqDKtTe7gNYU6TbYLrIw6extHiaTEYzQROpe+E8kDtCGCanvVS
 w3XVK2rynuV9MEEEUh39jdIEYg==
X-Google-Smtp-Source: AGHT+IEeEMWVs+CZQO9ifZtjh6+pVAh4iCB3eYpmSmK31Hwe1eJd7iRyjyqS+VKEYez95taP/tgIDQ==
X-Received: by 2002:a19:6913:0:b0:50b:c138:f42a with SMTP id
 e19-20020a196913000000b0050bc138f42amr1683725lfc.68.1701561588469; 
 Sat, 02 Dec 2023 15:59:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i21-20020ac25235000000b0050bf0f7f095sm72339lfl.99.2023.12.02.15.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 15:59:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3] drm/msm/dsi: Document DSC related pclk_rate and hdisplay
 calculations
Date: Sun,  3 Dec 2023 02:59:47 +0300
Message-Id: <20231202235947.1284568-1-dmitry.baryshkov@linaro.org>
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

Changes since v2:
- Followed suggestion by Abhinav and Marijn to improve documentatry
  comments.

Changes since v1:
- Converted dsi_adjust_pclk_for_compression() into kerneldoc (Marijn)
- Added a pointer from dsi_timing_setup() docs to
  dsi_adjust_pclk_for_compression() (Marijn)
- Fixed two typo (Marijn)

---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 33 ++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index deeecdfd6c4e..d60ad796527c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -529,6 +529,25 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
+/**
+ * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
+ * @mode: The selected mode for the DSI output
+ * @dsc: DRM DSC configuration for this DSI output
+ *
+ * Adjust the pclk rate by calculating a new hdisplay proportional to
+ * the compression ratio such that:
+ *     new_hdisplay = old_hdisplay * compressed_bpp / uncompressed_bpp
+ *
+ * Porches do not need to be adjusted:
+ * - For VIDEO mode they are not compressed by DSC and are passed as is.
+ * - For CMD mode there are no actual porches. Instead these fields
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
@@ -951,8 +970,18 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		if (ret)
 			return;
 
-		/* Divide the display by 3 but keep back/font porch and
-		 * pulse width same
+		/*
+		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
+		 * enabled, bus width is extended to 6 bytes.
+		 *
+		 * Calculate the number of pclks needed to transmit one line of
+		 * the compressed data.
+
+		 * The back/font porch and pulse width are kept intact. For
+		 * VIDEO mode they represent timing parameters rather than
+		 * actual data transfer, see the documentation for
+		 * dsi_adjust_pclk_for_compression(). For CMD mode they are
+		 * unused anyway.
 		 */
 		h_total -= hdisplay;
 		if (wide_bus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
-- 
2.39.2

