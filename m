Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F45F566934
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B7510E295;
	Tue,  5 Jul 2022 11:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1A910E00B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 02:52:40 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id m14so7405866plg.5
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 19:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KoE/Nl7CA68voHNLmRyXiLiHPFnMwUitmY6p2+8OjAM=;
 b=ME6L4Ur68fTru7929aD2k6RPdLKaJEFrAcHqqjHocKoH9iJobzUocCY8YxK64z5jid
 xxinLsGajnw1g+D0HaIisFuOACzPvfoUUoDmvllUJUjHijA+drCHJu0qCOxXvmPo7Eaz
 wWTy9Y9qTXdeSZkMrCuaK3vU/0ZJg1AuuT8X8sXXymi52N65BEfQSJay/x4BXtKu0L0c
 efPGx/kWQ1zFjL7KgPFZzf8e+JJIdm0Q71u0rFiOWDskIagBoXpatQlAHHZWx0rIubEr
 QSVB6yryAmSTeR1uVVMNNvA/RlKGbx50ZoqJFyhaDXG4gb6jNI5y4929G5TpbENavZdb
 K8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KoE/Nl7CA68voHNLmRyXiLiHPFnMwUitmY6p2+8OjAM=;
 b=i4a7vjB783GeAFztyeaP/rEyaawk5Cxu/dj9OUM0dyek1RUfLRFD+HNQlasaEF3ZnE
 a/iAPT2N7kSXcIVipMvbM/6EAVPXKTATnTinPJXmbJw5/UR6yGNvb+Lph9igKjNKr02p
 DysR6q7Rq+YKjGOkQkhcHiP9oKpliItv544zLr6GX6nWFSwTsBa0MNyvtNRQRNovRFeb
 Ei8FTRLyfRP+mitKMMqEnp0FObXx7wp0fAaI4X3WBDCnUqA1oVFXY19iCPPvWhOUqQpt
 UZEW0sPayb2mCOZoF0DnL/rsZn6amV/fASrjGEvLft7CPDPzAAGwGFMmRxgxFp1UGaC8
 ZYxw==
X-Gm-Message-State: AJIora9e4n4L8F9SD59qo7Nh3O4zLXy58fiOglA/lotWCHdyDI7EUVdp
 nLtJoOPZpcPKHX+taKurKFONbj7+gxgF3uH2
X-Google-Smtp-Source: AGRyM1teqaW2blXchXZwLy8aBx9cHEM0uu5yx9xOZVRKxK+PDV0HQ+8fi6KboYsUL02Yg2h3b7Re+w==
X-Received: by 2002:a17:90b:4ac7:b0:1ed:20a2:f547 with SMTP id
 mh7-20020a17090b4ac700b001ed20a2f547mr33629569pjb.19.1656903159678; 
 Sun, 03 Jul 2022 19:52:39 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a634e4b000000b004118fd18476sm8730813pgl.60.2022.07.03.19.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 19:52:39 -0700 (PDT)
From: Takanari Hayama <taki@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] media: vsp1: add blend mode support
Date: Mon,  4 Jul 2022 11:52:30 +0900
Message-Id: <20220704025231.3911138-3-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704025231.3911138-1-taki@igel.co.jp>
References: <20220704025231.3911138-1-taki@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Jul 2022 07:31:09 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To support DRM blend mode in R-Car DU driver, we must add blend mode
support in VSP1. Although VSP1 hardware is capable to support all blend
mode defined in DRM, the current R-Car DU driver implicitly supports
DRM_MODE_BLEND_COVERAGE only.

We add a new property to vsp1_du_atomic_config, so that R-Car DU driver
can pass the desired blend mode.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 drivers/media/platform/renesas/vsp1/vsp1_drm.c | 11 +++++++++++
 include/media/vsp1.h                           | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 9ec3ac835987..ed0cf552fce2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -861,6 +861,17 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
 	vsp1->drm->inputs[rpf_index].compose = cfg->dst;
 	vsp1->drm->inputs[rpf_index].zpos = cfg->zpos;
 
+	switch (cfg->blend_mode) {
+	case VSP1_DU_BLEND_MODE_PREMULTI:
+		rpf->format.flags = V4L2_PIX_FMT_FLAG_PREMUL_ALPHA;
+		break;
+	case VSP1_DU_BLEND_MODE_PIXEL_NONE:
+		rpf->pixel_alpha = false;
+		fallthrough;
+	case VSP1_DU_BLEND_MODE_COVERAGE:
+		rpf->format.flags = 0;
+	}
+
 	drm_pipe->pipe.inputs[rpf_index] = rpf;
 
 	return 0;
diff --git a/include/media/vsp1.h b/include/media/vsp1.h
index cc1b0d42ce95..1ba7459b7a06 100644
--- a/include/media/vsp1.h
+++ b/include/media/vsp1.h
@@ -42,6 +42,18 @@ struct vsp1_du_lif_config {
 int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 		      const struct vsp1_du_lif_config *cfg);
 
+/**
+ * enum vsp1_du_blend_mode - Pixel blend mode
+ * @VSP1_DU_BLEND_MODE_PREMULTI: Pixel alpha is pre-mutiplied
+ * @VSP1_DU_BLEND_MODE_COVERAGE: Pixel alpha is not pre-mutiplied
+ * @VSP1_DU_BLEND_MODE_PIXEL_NONE: Ignores the pixel alpha
+ */
+enum vsp1_du_blend_mode {
+	VSP1_DU_BLEND_MODE_PREMULTI,
+	VSP1_DU_BLEND_MODE_COVERAGE,
+	VSP1_DU_BLEND_MODE_PIXEL_NONE,
+};
+
 /**
  * struct vsp1_du_atomic_config - VSP atomic configuration parameters
  * @pixelformat: plane pixel format (V4L2 4CC)
@@ -51,6 +63,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
  * @dst: destination rectangle on the display (integer coordinates)
  * @alpha: alpha value (0: fully transparent, 255: fully opaque)
  * @zpos: Z position of the plane (from 0 to number of planes minus 1)
+ * @blend_mode: Pixel blend mode of the plane
  */
 struct vsp1_du_atomic_config {
 	u32 pixelformat;
@@ -60,6 +73,7 @@ struct vsp1_du_atomic_config {
 	struct v4l2_rect dst;
 	unsigned int alpha;
 	unsigned int zpos;
+	enum vsp1_du_blend_mode blend_mode;
 };
 
 /**
-- 
2.25.1

