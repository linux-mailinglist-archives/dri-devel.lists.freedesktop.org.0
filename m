Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DB726FC0F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DAE6EC51;
	Fri, 18 Sep 2020 12:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1263 seconds by postgrey-1.36 at gabe;
 Fri, 18 Sep 2020 12:07:45 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44F66EC51
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:07:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08IBapG6026037; Fri, 18 Sep 2020 13:46:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Yty8bNk5BZ6QpkJD9qLB6NIpkLKJoSR9prLWJoW10U4=;
 b=LuvK0lpVTZ4TJpPKv4c3oCx9pNNOfW9SJCdgw0v3nTYhxDtKu782CBDOKG3MK4k9EMVI
 HiCzLs9vz0kGUODaL994RvTtbUV6hUGqLk5hFBgqIwOvjNUpOjrUlBet0r7S4iRDfv6J
 i2zNKl6wqzLxrIEbxbYPhKs4e6fD19ZZ1ELg4C74nKgq6fvHLBYcxwD5n2zPjUypKoIo
 7SotLBjsGRLWLW8lxDXnayezAGer0vPJ4Ov4H7KuSCluiCu8IONhnfsH33qyuOoJHrAY
 EN/PoMZtFVNox5ybavL4HXBVshoBRBAfCkhiU59wmgUxoLrS9lv68jyFfE9o9SaHUSeC zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33k67a0re1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 13:46:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F1B810002A;
 Fri, 18 Sep 2020 13:46:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 259392B4D32;
 Fri, 18 Sep 2020 13:46:36 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 18 Sep 2020 13:46:35 +0200
From: Yannick Fertre <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Antonio Borneo <antonio.borneo@st.com>, "Vincent
 Abriou" <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: dsi: Avoid printing errors for -EPROBE_DEFER
Date: Fri, 18 Sep 2020 13:46:24 +0200
Message-ID: <20200918114624.10759-1-yannick.fertre@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't print error when probe deferred error is returned.

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 2e1f2664495d..164f79ef6269 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -419,7 +419,8 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
 	if (IS_ERR(dsi->dsi)) {
 		ret = PTR_ERR(dsi->dsi);
-		DRM_ERROR("Failed to initialize mipi dsi host: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			DRM_ERROR("Failed to initialize mipi dsi host: %d\n", ret);
 		goto err_dsi_probe;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
