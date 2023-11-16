Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 035EE7EE330
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 15:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E5010E605;
	Thu, 16 Nov 2023 14:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2A410E5E7;
 Thu, 16 Nov 2023 14:09:32 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso1312065a12.1; 
 Thu, 16 Nov 2023 06:09:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700143771; x=1700748571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o5kzymm4w15fT9h/X6FV1rQ8roz2ERsjL4xXI9ZSR/o=;
 b=WD93WGyRVEFrfh7cARDSCqj0Krh01HCHwhyfXJacy+KlejdeFsEz5WZhuLWCktAl7F
 1/R3FIMJUwNieJE89OxH4R3T4G1XzYOR+NAMWNQnfHxYTNzD7RmUqayu/wprVuvH0YZT
 9EGHJ15sBReqkwoiyBEy2C8I7rp2EEWcO3oxx9dw85Huz6/z8oEsKKmefyI2G+WsYhZ+
 8+DCEFRdt3sEIbQOYtXxVArkb8dJ7dc1URhdW8u3Uq4NdJp21GHC/x8P21cxRMQ0fSQM
 upXl9IGTIYHcx478QShD6J9As/mefcPsxmokICu4OxZxogqivSxYVMndheo5+0WsUZRO
 5m7g==
X-Gm-Message-State: AOJu0Yyc4v9FQLCDt7zmsoVU4CtOdcsZ+vNqeE1cF+12iwm0Hts1RLOe
 +2nxsPE3W07XQlCukHeWG18=
X-Google-Smtp-Source: AGHT+IGRWoFnBFUiWPYA9FbvARFcOKys4+ta9wagYCFe7EhBbKQSmcyNKTgtPPdyw/t26xJZFnLa7A==
X-Received: by 2002:a17:906:f190:b0:9c7:59d1:b2c2 with SMTP id
 gs16-20020a170906f19000b009c759d1b2c2mr12339402ejb.27.1700143770734; 
 Thu, 16 Nov 2023 06:09:30 -0800 (PST)
Received: from ramallet.home (cst-prg-38-127.cust.vodafone.cz. [46.135.38.127])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906190b00b0098d2d219649sm8603682eje.174.2023.11.16.06.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 06:09:30 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/etnaviv: Expose a few more chipspecs to userspace
Date: Thu, 16 Nov 2023 15:09:09 +0100
Message-ID: <20231116140910.1613508-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Nov 2023 14:45:14 +0000
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
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These ones will be needed to make use fo the NN and TP units in the NPUs
based on Vivante IP.

Also fix the number of NN cores in the VIPNano-qi.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 20 ++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 12 ++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 22 +++++++++++++++++++++-
 include/uapi/drm/etnaviv_drm.h         |  5 +++++
 4 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 5f96e7b1a9ec..9a18b5431975 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -164,6 +164,26 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
 		*value = gpu->identity.eco_id;
 		break;
 
+	case ETNAVIV_PARAM_GPU_NN_CORE_COUNT:
+		*value = gpu->identity.nn_core_count;
+		break;
+
+	case ETNAVIV_PARAM_GPU_NN_MAD_PER_CORE:
+		*value = gpu->identity.nn_mad_per_core;
+		break;
+
+	case ETNAVIV_PARAM_GPU_TP_CORE_COUNT:
+		*value = gpu->identity.tp_core_count;
+		break;
+
+	case ETNAVIV_PARAM_GPU_ON_CHIP_SRAM_SIZE:
+		*value = gpu->identity.on_chip_sram_size;
+		break;
+
+	case ETNAVIV_PARAM_GPU_AXI_SRAM_SIZE:
+		*value = gpu->identity.axi_sram_size;
+		break;
+
 	default:
 		DBG("%s: invalid param: %u", dev_name(gpu->dev), param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index c8f3ad2031ce..83ef3c06da5d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -53,6 +53,18 @@ struct etnaviv_chip_identity {
 	/* Number of Neural Network cores. */
 	u32 nn_core_count;
 
+	/* Number of MAD units per Neural Network core. */
+	u32 nn_mad_per_core;
+
+	/* Number of Tensor Processing cores. */
+	u32 tp_core_count;
+
+	/* Size in bytes of the SRAM inside the NPU. */
+	u32 on_chip_sram_size;
+
+	/* Size in bytes of the SRAM across the AXI bus. */
+	u32 axi_sram_size;
+
 	/* Size of the vertex cache. */
 	u32 vertex_cache_size;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 0cb5aacaf384..93f15cce6d22 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -17,6 +17,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 128,
 		.shader_core_count = 1,
 		.nn_core_count = 0,
+		.nn_mad_per_core = 0,
+		.tp_core_count = 0,
+		.on_chip_sram_size = 0,
+		.axi_sram_size = 0,
 		.vertex_cache_size = 8,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -49,6 +53,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 512,
 		.shader_core_count = 2,
 		.nn_core_count = 0,
+		.nn_mad_per_core = 0,
+		.tp_core_count = 0,
+		.on_chip_sram_size = 0,
+		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -81,6 +89,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 512,
 		.shader_core_count = 2,
 		.nn_core_count = 0,
+		.nn_mad_per_core = 0,
+		.tp_core_count = 0,
+		.on_chip_sram_size = 0,
+		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -113,6 +125,10 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.thread_count = 1024,
 		.shader_core_count = 4,
 		.nn_core_count = 0,
+		.nn_mad_per_core = 0,
+		.tp_core_count = 0,
+		.on_chip_sram_size = 0,
+		.axi_sram_size = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 2,
@@ -144,7 +160,11 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 256,
 		.shader_core_count = 1,
-		.nn_core_count = 1,
+		.nn_core_count = 8,
+		.nn_mad_per_core = 64,
+		.tp_core_count = 4,
+		.on_chip_sram_size = 524288,
+		.axi_sram_size = 1048576,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
index af024d90453d..d87410a8443a 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -77,6 +77,11 @@ struct drm_etnaviv_timespec {
 #define ETNAVIV_PARAM_GPU_PRODUCT_ID                0x1c
 #define ETNAVIV_PARAM_GPU_CUSTOMER_ID               0x1d
 #define ETNAVIV_PARAM_GPU_ECO_ID                    0x1e
+#define ETNAVIV_PARAM_GPU_NN_CORE_COUNT             0x1f
+#define ETNAVIV_PARAM_GPU_NN_MAD_PER_CORE           0x20
+#define ETNAVIV_PARAM_GPU_TP_CORE_COUNT             0x21
+#define ETNAVIV_PARAM_GPU_ON_CHIP_SRAM_SIZE         0x22
+#define ETNAVIV_PARAM_GPU_AXI_SRAM_SIZE             0x23
 
 #define ETNA_MAX_PIPES 4
 
-- 
2.41.0

