Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59350861204
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 13:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C45310E0AC;
	Fri, 23 Feb 2024 12:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=analog.com header.i=@analog.com header.b="M+EEYPxg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92BC10E0AC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 12:56:12 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N6UoaV001095; Fri, 23 Feb 2024 07:11:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=DKIM; bh=2QBskA+1FTNM5bdUGwzUXRVUB24lrDJmujOXqJOnYSk=; b=
 M+EEYPxg0i5937fi8iSk7migzQvh80aQ0lfc/UU24yHN4UQDHOdBiOL0kqlsxy4o
 lAJ29DGRPF/yuLnJR46a5C97rXUGQX7r+gdddsC4J0rcUz3KHVsu3eYEK/5ZFhYA
 GlBevo6lxd3wB5+RMfMsYjQWmpqGf9fyUsko2upxmxsyr0a4QGYumQBmhBH+JJiF
 GTrb07ZJAepWi/6xSldOTiHlKJdi+E5j+3EPGEZKBBdjDY8RIB4IWruQx0gRx5Ik
 ACBOo+aYZbcLI+yyVinX1ZXsJkz7ujte8w2Iv7p4jBdYUtQ3E60VWo8WUELWc2/U
 Qf5aQQJ0Eu8mbq54gO+AxA==
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3wep5mh41p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 07:11:14 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 41NCB4FA033123
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 23 Feb 2024 07:11:04 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 23 Feb
 2024 07:11:03 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 23 Feb 2024 07:11:03 -0500
Received: from [127.0.0.1] ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 41NCAb2T032246;
 Fri, 23 Feb 2024 07:10:54 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Fri, 23 Feb 2024 13:14:00 +0100
Subject: [PATCH v7 2/6] dmaengine: dma-axi-dmac: Implement
 device_prep_peripheral_dma_vec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240223-iio-dmabuf-v7-2-78cfaad117b9@analog.com>
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
In-Reply-To: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
To: Vinod Koul <vkoul@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Cameron <jic23@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Cercueil <paul@crapouillou.net>
CC: Daniel Vetter <daniel@ffwll.ch>, Michael Hennerich
 <Michael.Hennerich@analog.com>,
 <linux-doc@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708690439; l=2329;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=K9NGGHhBR6ddEkphP9Mj50ld8zpMDccibebr8OJQUS8=;
 b=q9t8erGP3tm4CHk+EB1rRHp7mbwg1MVuH7sz48Wd+N5OtI1r6rURxYyBiIES61ioIkKXchAG8
 okMK7RF/KOtCdT/rHo485O39rYvGAXsPKawyC89eg57jtStj+rZfvsk
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: -4Ozu-lo5duccITIv_lpDdTFPuAtP2j-
X-Proofpoint-GUID: -4Ozu-lo5duccITIv_lpDdTFPuAtP2j-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230088
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

From: Paul Cercueil <paul@crapouillou.net>

Add implementation of the .device_prep_peripheral_dma_vec() callback.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/dma/dma-axi-dmac.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index 4e339c04fc1e..d03cbf1d28e8 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -620,6 +620,45 @@ static struct axi_dmac_sg *axi_dmac_fill_linear_sg(struct axi_dmac_chan *chan,
 	return sg;
 }
 
+static struct dma_async_tx_descriptor *
+axi_dmac_prep_peripheral_dma_vec(struct dma_chan *c, const struct dma_vec *vecs,
+				 size_t nb, enum dma_transfer_direction direction,
+				 unsigned long prep_flags, unsigned long flags)
+{
+	struct axi_dmac_chan *chan = to_axi_dmac_chan(c);
+	struct axi_dmac_desc *desc;
+	unsigned int num_sgs = 0;
+	struct axi_dmac_sg *dsg;
+	size_t i;
+
+	if (direction != chan->direction)
+		return NULL;
+
+	for (i = 0; i < nb; i++)
+		num_sgs += DIV_ROUND_UP(vecs[i].len, chan->max_length);
+
+	desc = axi_dmac_alloc_desc(chan, num_sgs);
+	if (!desc)
+		return NULL;
+
+	dsg = desc->sg;
+
+	for (i = 0; i < nb; i++) {
+		if (!axi_dmac_check_addr(chan, vecs[i].addr) ||
+		    !axi_dmac_check_len(chan, vecs[i].len)) {
+			kfree(desc);
+			return NULL;
+		}
+
+		dsg = axi_dmac_fill_linear_sg(chan, direction, vecs[i].addr, 1,
+					      vecs[i].len, dsg);
+	}
+
+	desc->cyclic = false;
+
+	return vchan_tx_prep(&chan->vchan, &desc->vdesc, prep_flags);
+}
+
 static struct dma_async_tx_descriptor *axi_dmac_prep_slave_sg(
 	struct dma_chan *c, struct scatterlist *sgl,
 	unsigned int sg_len, enum dma_transfer_direction direction,
@@ -1055,6 +1094,7 @@ static int axi_dmac_probe(struct platform_device *pdev)
 	dma_dev->device_tx_status = dma_cookie_status;
 	dma_dev->device_issue_pending = axi_dmac_issue_pending;
 	dma_dev->device_prep_slave_sg = axi_dmac_prep_slave_sg;
+	dma_dev->device_prep_peripheral_dma_vec = axi_dmac_prep_peripheral_dma_vec;
 	dma_dev->device_prep_dma_cyclic = axi_dmac_prep_dma_cyclic;
 	dma_dev->device_prep_interleaved_dma = axi_dmac_prep_interleaved;
 	dma_dev->device_terminate_all = axi_dmac_terminate_all;

-- 
2.43.2

