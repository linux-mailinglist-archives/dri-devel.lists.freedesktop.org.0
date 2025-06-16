Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42A4ADABEF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5B810E303;
	Mon, 16 Jun 2025 09:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="8WpuCS/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D2A10E303
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:29:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G5bVRv010526;
 Mon, 16 Jun 2025 10:57:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 j9gCtZXn8FCUpQCQz+XhhMFUE2JWeUNDp3ENgTfCvvI=; b=8WpuCS/Cd0CRXgFF
 tc4Z5nD2wMCzQa1jwQBrt/ngnDr7lQW0hvxGU8lW+x7DOH4oavFMAq2LON8YiBwv
 kFx1OgFpFf26d4Ujf4Zj6FMfVQXlfOOtGhytaQL08Ius3hs6rhJpi6IPoxgrAFDt
 UgEHGMQ8EiTDNEMbFL6/Ss/dw7m5HeAcQgtkQkB6QhAVN220aW5m3kEpncplIFzw
 f7SYPa62woJbfRWC8EKv3pIu7zJb43+x7/UxKQoPQcDuQbjvWuE+39eseIDgpnSo
 SPsWHHJoFzytm/YxV1iqWKZwirAef2RmDq6Q6ABhzTI49UV9nVyDY2B/yb+p9rRe
 1LxQKw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 478x79qk3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 10:57:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA5DE40073;
 Mon, 16 Jun 2025 10:56:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 100F95D5B26;
 Mon, 16 Jun 2025 10:54:44 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 10:54:43 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 10:53:55 +0200
Subject: [PATCH 2/3] i2c: stm32f7: unmap DMA mapped buffer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250616-i2c-upstream-v1-2-42d3d5374e65@foss.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
In-Reply-To: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>,
 Wolfram Sang <wsa@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 <linux-i2c@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
 <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
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

Fix an issue where the mapped DMA buffer was not unmapped.

Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 973a3a8c6d4a..a05cac5ee9db 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1622,6 +1622,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 		if (i2c_dev->use_dma) {
 			stm32f7_i2c_disable_dma_req(i2c_dev);
 			dmaengine_terminate_async(dma->chan_using);
+			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
+					 dma->dma_data_dir);
 		}
 		f7_msg->result = -ENXIO;
 	}
@@ -1642,6 +1644,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 				dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
 				stm32f7_i2c_disable_dma_req(i2c_dev);
 				dmaengine_terminate_async(dma->chan_using);
+				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
+						 dma->dma_data_dir);
 				f7_msg->result = -ETIMEDOUT;
 			}
 		}

-- 
2.43.0

