Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99427EB5BE
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 18:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95BE10E4A0;
	Tue, 14 Nov 2023 17:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF2710E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 17:44:08 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-77bb668d941so357918285a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 09:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1699983847; x=1700588647; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jOopcK9K4HsHFD0FhRzafDXESddDDjm1WV41GtBAoVg=;
 b=OKmiNTMH9xZO+V7FfcLK57KK6LttXSpdfhwXvUQPpkv1XCXjBvQqDOwESGaKxLvtcO
 VBnORJT2j3PJLclN2uZLDtYNK38csEz0AC60apEonQJh934rryhZMfDxa1eZIwK/NPkI
 CfpPETHOO+TOICRSe81IcnifEBa11crt/zIp9kdgrMSlZGp5k9QFPy5RE8jtGtVWKhBp
 /ZKjzg+Ffgpi2zjW+hzc5xwMu3RErcIX0WqNC0j2UduWzuENiqbSuimT5xQykdzh/BtB
 CGCjdE0B7WqGahp6Y3EbZdwkSON8vKU0ZmXJG5hhG8DPMO4COJ9502TlzeOPBYC45G3L
 dPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699983847; x=1700588647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jOopcK9K4HsHFD0FhRzafDXESddDDjm1WV41GtBAoVg=;
 b=YZuIeXcCbbvCtIDsxkqzOk+R3ElJ90gf9++3iNWdWcTUhHsRisxYrTvmt6KZNG1/b7
 oYf0FqJx0026B9UsBxuJ1uJOiEML9tZU0HTTEh0ySMCrvl2PahmzSDsEMbQo/6JMjclc
 k3M+0yqUkVYBLTDjaC410mFTSmVS9DLh5cId/AR4kd7PoM+2zzGKufL3pML0qwTu+Fzp
 hdlPyjj7vpP/4Xp8knFMna9AbrcSzU/HZXZatHHxcK5/dIsNCPVWbEhjE5T1iEtEo7Ec
 YhHIeGWwLa6j256Qa7IeV/OW+szndU7G0TFipy1A6+ns9Qy9sICz/F7CTRBjoFO3sZhb
 y5GQ==
X-Gm-Message-State: AOJu0Yyiw9TYymgIwvT3bWjnlLzXl6Xa9RNBu37ivxBERTDOsNT5tsbB
 Bkm1sNg/JSxvKw8gPKy09ao14g==
X-Google-Smtp-Source: AGHT+IEoUWi2pDWF6jdLsDdB9bo4yCiuTcH+dJCQhosEkkKLGNi7bZ3RwGK2wPPoN9/9Te+GQZRRKg==
X-Received: by 2002:a05:620a:4453:b0:77b:d90e:dd91 with SMTP id
 w19-20020a05620a445300b0077bd90edd91mr3857377qkp.46.1699983847240; 
 Tue, 14 Nov 2023 09:44:07 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 bi8-20020a05620a318800b007671cfe8a18sm2833350qkb.13.2023.11.14.09.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 09:44:07 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Date: Tue, 14 Nov 2023 12:42:15 -0500
Message-Id: <20231114174218.19765-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114174218.19765-1-jonathan@marek.ca>
References: <20231114174218.19765-1-jonathan@marek.ca>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a dsc_slice_per_pkt field to mipi_dsi_device struct and the necessary
changes to msm driver to support this field.

Note that the removed "pkt_per_line = slice_per_intf * slice_per_pkt"
comment is incorrect.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
 include/drm/drm_mipi_dsi.h         |  1 +
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 2ea2fc105fbf..7284346ab787 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -161,6 +161,7 @@ struct msm_dsi_host {
 
 	struct drm_display_mode *mode;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 
 	/* connected device info */
 	unsigned int channel;
@@ -855,17 +856,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
-	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
+	bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
 
 	eol_byte_num = total_bytes_per_intf % 3;
-
-	/*
-	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
-	 *
-	 * Since the current driver only supports slice_per_pkt = 1,
-	 * pkt_per_line will be equal to slice per intf for now.
-	 */
-	pkt_per_line = slice_per_intf;
+	pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -1002,12 +996,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		else
 			/*
 			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
-			 * Currently, the driver only supports default value of slice_per_pkt = 1
-			 *
-			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
-			 *       and adjust DSC math to account for slice_per_pkt.
 			 */
-			wc = msm_host->dsc->slice_chunk_size + 1;
+			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
@@ -1634,8 +1624,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
-	if (dsi->dsc)
+	if (dsi->dsc) {
 		msm_host->dsc = dsi->dsc;
+		msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt;
+		/* for backwards compatibility, assume 1 if not set */
+		if (!msm_host->dsc_slice_per_pkt)
+			msm_host->dsc_slice_per_pkt = 1;
+	}
 
 	/* Some gpios defined in panel DT need to be controlled by host */
 	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c9df0407980c..3e32fa52d94b 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -193,6 +193,7 @@ struct mipi_dsi_device {
 	unsigned long hs_rate;
 	unsigned long lp_rate;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 };
 
 #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
-- 
2.26.1

