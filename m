Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AD0469773
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 14:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1B37AB68;
	Mon,  6 Dec 2021 13:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9587AB68
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 13:47:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B6DD5o8016714;
 Mon, 6 Dec 2021 14:47:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-type; s=selector1;
 bh=f3nDQtMXpQcllE0coLEE7OqOqZngGgJMRjJO5GIHeeM=;
 b=DkVa1qcVP6Y6MswBfa4yHJJ+YA+rdPBS6Asy4cs1LRIHMxXFAo3+RS4a66ynTVYPv2xc
 kJNFqfVNpksh6tCw6EKPjYs94wiPFgmmjyEEx73ouGBELVZpci0MJn0dt1IVkJzNfWe2
 g0DL0BS3PTaokfsWnWiHaF5XxOwCp1zwWsTMLoEkyA5K2wlnlrG7Bt6u4PGE/hiyM1br
 S+CPNTq0c8/HlywDJvsIVV7jQNqHRbNFqX5njq8eWvT8H2BPqjlBHUJAnmx884Jhshnc
 aFUyFKYN/sTbMnuChz3pp2WSCnK/8zq2+ED80y7e8+a1KuqVXPBIo7F9yL8izfl0g3T5 cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cseqrhsx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 14:47:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEC2210002A;
 Mon,  6 Dec 2021 14:47:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5DDA2C38A4;
 Mon,  6 Dec 2021 14:47:51 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 14:47:51
 +0100
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: remove conflicting framebuffers
Date: Mon, 6 Dec 2021 14:47:35 +0100
Message-ID: <20211206134735.13537-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_04,2021-12-06_02,2021-12-02_01
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

In case of using simplefb or another conflicting framebuffer,
call drm_aperture_remove_framebuffers() to remove memory allocated.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 222869b232ae..9f441aadf2d5 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -14,6 +14,7 @@
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
@@ -183,6 +184,10 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
 
 	DRM_DEBUG("%s\n", __func__);
 
+	ret = drm_aperture_remove_framebuffers(false, &drv_driver);
+	if (ret)
+		return ret;
+
 	dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
 
 	ddev = drm_dev_alloc(&drv_driver, dev);
-- 
2.17.1

