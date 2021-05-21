Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1FA38C6DC
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEC36E4F9;
	Fri, 21 May 2021 12:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E9D6E4F8;
 Fri, 21 May 2021 12:50:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5BEC613DD;
 Fri, 21 May 2021 12:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621601403;
 bh=Eo+Q/n/ObHKYPA8KdmfJSeka049NRwoo0j4Nc78qMAM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S7mAlvhails2QDce0UEUE5pSdbFrXQgTe0wQ0BT0JeYpvxalnkvc8GPXDKOsaeT+c
 0LVAWUShmJWd7gu9H8fu/MFT3MQZEy8ko9/7KJ6CvS++2KJjvTfUydORnDBvc66Jak
 x+MaNuFzcT9p8NEp43E8t/Kdm1/l1cf134Knd64YT9ObRwZYSVfYi0LPuYY04qqrip
 qUsu9UpI21WpbglGBbYtldFWOGxOz1cskzFaQRJQLBMeuBl9voyIIB/rg4cFt+xzLE
 kmLgonDfx5cuWuC6xFxoF1B/rx7FzctL99/jwHCKxiukKicTFD30XtDJwoz1cIRokt
 XkqCKqEj+W+mQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH 01/13] drm/dsc: Add dsc pps header init function
Date: Fri, 21 May 2021 18:19:30 +0530
Message-Id: <20210521124946.3617862-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
References: <20210521124946.3617862-1-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We required a helper to create and set the dsc_dce_header, so add the
dsc_dce_header and API drm_dsc_dsi_pps_header_init

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/drm_dsc.c | 11 +++++++++++
 include/drm/drm_dsc.h     | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/drm_dsc.c b/drivers/gpu/drm/drm_dsc.c
index ff602f7ec65b..0c1b745090e2 100644
--- a/drivers/gpu/drm/drm_dsc.c
+++ b/drivers/gpu/drm/drm_dsc.c
@@ -49,6 +49,17 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header)
 }
 EXPORT_SYMBOL(drm_dsc_dp_pps_header_init);
 
+void drm_dsc_dsi_pps_header_init(struct dsc_dce_header *dsc_header)
+{
+	memset(dsc_header, 0, sizeof(*dsc_header));
+
+	dsc_header->bp0 = 0x0A;
+	dsc_header->bp1 = 1;
+	dsc_header->bp4 = 10;
+	dsc_header->bp6 = 128;
+}
+EXPORT_SYMBOL(drm_dsc_dsi_pps_header_init);
+
 /**
  * drm_dsc_dp_rc_buffer_size - get rc buffer size in bytes
  * @rc_buffer_block_size: block size code, according to DPCD offset 62h
diff --git a/include/drm/drm_dsc.h b/include/drm/drm_dsc.h
index bbe120f461e5..5a3bbeb3e12f 100644
--- a/include/drm/drm_dsc.h
+++ b/include/drm/drm_dsc.h
@@ -602,8 +602,24 @@ struct drm_dsc_pps_infoframe {
 	struct drm_dsc_picture_parameter_set pps_payload;
 } __packed;
 
+struct dsc_dce_header {
+	u8 bp0;
+	u8 bp1;
+	u8 bp2;
+	u8 bp3;
+	u8 bp4;
+	u8 bp5;
+	u8 bp6;
+} __packed;
+
+struct drm_dsi_dsc_infoframe {
+	struct dsc_dce_header dsc_header;
+	struct drm_dsc_picture_parameter_set pps_payload;
+} __packed;
+
 void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
 int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
+void drm_dsc_dsi_pps_header_init(struct dsc_dce_header *dsc_header);
 void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
 				const struct drm_dsc_config *dsc_cfg);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
-- 
2.26.3

