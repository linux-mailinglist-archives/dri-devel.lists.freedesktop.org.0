Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CA4BB28CB
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8C210E777;
	Thu,  2 Oct 2025 05:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PB3En4Ti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B103D10E1A3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 14:01:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so66019585e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759327276; x=1759932076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r88bVkU6R3YFAsO3wz4+pTX+MHJI0oI//rtTqu0aO6E=;
 b=PB3En4TiViFK3GzAXTcC3909KjynmfX82bV2u8QRP9BJQwjXz5Y+umDtLpi5+52bc3
 VzAKCOJXVsbVpfSj0gVZ6IVil9sao8nAa30vexZWWqroh8dKW/9PzLnJMeqxLlUJ4iDz
 gfL2wFipAfaPmJvg7OHTKBFKxtQhhbASSnIv7bZISCMM1CF1wHp6KzeDhsL1D5EJtvsC
 KPby9NGXpX9m+QSvyJQkJaxp9n2DbJgoTQ4Fdczl7e1iGqKdcJlGhCz2zfXpOR3iMokM
 DYrxkWgq4BW9NksP/JmMEHKf/JxlT/9AxYiD+V4piI5NWxTsYP3VvWCdtqJisH9O8EFM
 fV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759327276; x=1759932076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r88bVkU6R3YFAsO3wz4+pTX+MHJI0oI//rtTqu0aO6E=;
 b=MZ7vJ98GJ7kN9cacbSgJJeVRRDnjEa01KY5Pb1U3FyJLIaBJKElYqdBhJip5sB72rh
 1UGRFSV2QgDpbKdSGEdHx5O2IgllK3DSxmS5KQ04jyVFQnwI+HrNyPiJafM9VIHQTsYO
 acJZoFjYAu6phlIS8oP3vwbCb0r+PFQL6apUbQQ2ST6KT5Oo5av76jkbeEO5/uc5Ey2U
 fRuqfjZam399aCT5SoPKXOJ7UbDVFoWU7BppPpbpWf3XFT3WmJqZf2dHdBu70gc9LdNW
 gMyGuPkqF09S2pRpBYuxhOf0veWibwcE+3w9+IXibNcbvePjvu2zTIuctPGKsN6fJCT2
 ubJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTwsanizjghCjFKL5CGLisDv62CJWkTyYNp88g0AlRrBicdbWjVbgY00yd6T+Gn6t/OrkSj0UKP+g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfsLrTeY+89FYBPacg2FLjhzQUbH2eeb3tslz0MiNhn101S9Rl
 nQdKmuqx7EYviXGF/cbBRu3o9glGyLNNT95+KCmzF/FG+hUbRH7aNaWJ
X-Gm-Gg: ASbGncvdLqtBp8AppStybS4C/xV8E1B49uA0o/ZACGDCh2upikIU/ExjMSI7v7O4lc0
 ghZF+jr15GgDNQD5RDlHY7ytREZL9SHs1VFgkU4DSj8oA+CBxj+cwi7/TumIx8LRCAfqR0GEdYx
 KVPhkGE/mV1Mv95eBL6M0G+xjhJI1opoi1jN8xEiEzpSXFgIiM50XF6KBHTqH+GUUBgOb5g8iuk
 AewyqZ5Z7rgmi8FnNZBWH53HcPSdsXPlZC4tyRPhSycHd+rkYgS00nBGHTtoApAG+3tANhc+a9S
 +k/MQqXSFdu1NVT95ryOETK1yHpzFqMfgjI3nqRshOjVKIg/l4+7iuuEkVBp59S678z8pLV308n
 c2e4GOC1DlW/02ELyXvBVWu22W3+u9DB7gsItkdfgyq+tNIWFnQQ6rerFfsyN/ii2nymXsyuxEA
 bkJhxi8HmgYO3D/pAgX/I8LOPq++Yp/aiJpessBYK2aBhlZbfndJ5WsA==
X-Google-Smtp-Source: AGHT+IF6jIPdEU9MFXPhCPUkqzhyaWrP5uY2bhk5OwNgz8t2vPUiheyA7QIaNPR9raR1Aa2Qrunkyg==
X-Received: by 2002:a05:600c:4e4a:b0:45b:9a46:69e9 with SMTP id
 5b1f17b1804b1-46e612de19dmr34857695e9.31.1759327274375; 
 Wed, 01 Oct 2025 07:01:14 -0700 (PDT)
Received: from LAPTOP-AMJDAUEJ.soton.ac.uk
 (globalprotect-nat-extbord.soton.ac.uk. [152.78.0.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89065b5sm27029828f8f.17.2025.10.01.07.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 07:01:14 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>
Cc: Junjie Cao <caojunjie650@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Date: Wed,  1 Oct 2025 21:59:13 +0800
Message-ID: <20251001135914.13754-3-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001135914.13754-1-caojunjie650@gmail.com>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Oct 2025 05:43:06 +0000
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

From: Jun Nie <jun.nie@linaro.org>

Some panels support multiple slice to be sent in a single DSC packet. And
this feature is a must for specific panels, such as JDI LPM026M648C. Add a
dsc_slice_per_pkt member into struct mipi_dsi_device and support the
feature in msm mdss driver.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
 include/drm/drm_mipi_dsi.h         |  2 ++
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e0de545d4077..773ce8520698 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -166,6 +166,7 @@ struct msm_dsi_host {
 
 	struct drm_display_mode *mode;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 
 	/* connected device info */
 	unsigned int channel;
@@ -910,17 +911,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = dsc->slice_count;
 
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
@@ -1069,12 +1063,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
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
@@ -1683,8 +1673,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
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
 
 	ret = dsi_dev_attach(msm_host->pdev);
 	if (ret)
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380c8d..2ddec7931bd0 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -180,6 +180,7 @@ struct mipi_dsi_device_info {
  * be set to the real limits of the hardware, zero is only accepted for
  * legacy drivers
  * @dsc: panel/bridge DSC pps payload to be sent
+ * @dsc_slice_per_pkt: number of DSC slices to be sent as in a single packet
  */
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
@@ -194,6 +195,7 @@ struct mipi_dsi_device {
 	unsigned long hs_rate;
 	unsigned long lp_rate;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 };
 
 /**
-- 
2.48.1

