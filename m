Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5692580BDB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A704A10F2FA;
	Tue, 26 Jul 2022 06:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF92210EFFD;
 Tue, 26 Jul 2022 04:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658810766; x=1690346766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+JixpvyYfaWRndCLMC/gsQfJIe6k7h9hL0j0x6Kv8eI=;
 b=qjnmTq+bVjwYk6aF7zrr0AtsN3EH7zP8qTnM4X8Fw5G0AqJJmd6b8awc
 yY1OKyVbX9KTMg2LIwZ8XIetjvMRMk35xZsXKkd9CKCP529Vx4iGUp0aQ
 BolClmEzC42zN7dPeuhiv24NVb+n45u2cgwGCuZss1x01kTBV5OCyPIPW s=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 25 Jul 2022 21:46:06 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 21:46:05 -0700
Received: from hu-ddhamara-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 25 Jul 2022 21:46:03 -0700
From: <quic_ddhamara@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 1/1] drm/msm/a6xx: Fix null pointer access in
 a6xx_get_indexed_registers
Date: Tue, 26 Jul 2022 10:14:46 +0530
Message-ID: <20220726044446.21102-2-quic_ddhamara@quicinc.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220726044446.21102-1-quic_ddhamara@quicinc.com>
References: <20220726044446.21102-1-quic_ddhamara@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Mailman-Approved-At: Tue, 26 Jul 2022 06:47:09 +0000
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
 Devi prasad Dhamarasingi <quic_ddhamara@quicinc.com>,
 dri-devel@lists.freedesktop.org, robclark@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Akhil P Oommen <quic_akhilpo@quicinc.com>

Fix a null pointer access when memory allocation fails in
a6xx_get_indexed_registers().

Change-Id: I33e13745cd8e5841d2f377f48a199af98be2ed02
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Devi prasad Dhamarasingi <quic_ddhamara@quicinc.com>
---

Changes in v2:
- Corrected the signoff name and email id.

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

