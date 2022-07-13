Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BD9572F4D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 09:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052FD14A671;
	Wed, 13 Jul 2022 07:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE26414A5AA;
 Wed, 13 Jul 2022 06:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657693469; x=1689229469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GpgJm2w11HDT9HLV7pwaUKNml2YdL/gwGxII+D3gRSU=;
 b=f0ydcKZWOZxHlBZ3FT+zNFOBr07ge1/mux13uFQ3HVy+Yn/gMAJvg4hx
 VyeRrIsdR61Oa7z/ILXDMM8mF05ipbJwiDXpPV05kdJgbiCrtV9jE0t3T
 bmx0gg7GMIOJQwYWi8En1xhjJEE8lAVs8M1XjTA5L8H8GwUjLPAw+hRCY g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Jul 2022 23:24:28 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 23:24:28 -0700
Received: from hu-ddhamara-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Jul 2022 23:24:26 -0700
From: <quic_ddhamara@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/msm/a6xx: Fix null pointer access in
 a6xx_get_indexed_registers
Date: Wed, 13 Jul 2022 11:53:55 +0530
Message-ID: <20220713062355.6846-2-quic_ddhamara@quicinc.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220713062355.6846-1-quic_ddhamara@quicinc.com>
References: <20220713062355.6846-1-quic_ddhamara@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Mailman-Approved-At: Wed, 13 Jul 2022 07:35:31 +0000
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
Cc: quic_akhilpo@quicinc.com, linux-arm-msm@vger.kernel.org,
 ddhamara <ddhamara@quicinc.com>, dri-devel@lists.freedesktop.org,
 robclark@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Akhil P Oommen <quic_akhilpo@quicinc.com>

Fix a null pointer access when memory allocation fails in
a6xx_get_indexed_registers().

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: ddhamara <ddhamara@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 55f443328d8e..507074f6222c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -952,6 +952,12 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
 	a6xx_get_indexed_regs(gpu, a6xx_state, &a6xx_cp_mempool_indexed,
 		&a6xx_state->indexed_regs[i]);
 
+	if (!a6xx_state->indexed_regs[i].data) {
+		gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, mempool_size);
+		a6xx_state->nr_indexed_regs = count - 1;
+		return;
+	}
+
 	/*
 	 * Offset 0x2000 in the mempool is the size - copy the saved size over
 	 * so the data is consistent
-- 
2.37.0

