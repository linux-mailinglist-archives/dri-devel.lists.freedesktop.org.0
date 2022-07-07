Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382B056983D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 04:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B06510F78A;
	Thu,  7 Jul 2022 02:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id A856B10F78A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 02:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=+3p10
 C0HusD/dCt1yiDLoyszOMBI+0onvKujFtchS58=; b=W9X4zBu3Cwzfky3n/sQnC
 I0077NyZNP4b6T2pn9g11DW4JOTDq/vCQYnNqcT5gwuhjGN0mRKpVr/2Dj5qKCSi
 oWBJYLn+90mroITjWbBeA78H98iYI14gJF/+y4wizsmQ2c97Kl3O7dXE6P1/mOr9
 SmnRziyxmb7u1X5gsghJWA=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp8 (Coremail) with SMTP id NORpCgDXNZqvRcZiaayfHQ--.23276S2;
 Thu, 07 Jul 2022 10:32:16 +0800 (CST)
From: Liang He <windhl@126.com>
To: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, dri-devel@lists.freedesktop.org,
 windhl@126.com
Subject: [PATCH] drm/imx/dcss: Add missing of_node_put() in fail path
Date: Thu,  7 Jul 2022 10:32:14 +0800
Message-Id: <20220707023214.307451-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgDXNZqvRcZiaayfHQ--.23276S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4UCFy7try5WFy5XF1xGrg_yoW3KFc_Ga
 48Zr9rXr4kCF4ktry3Aw43Wryqkr1F9r4xZF1IyayFqr42vwn8XwsFqryqq34Uua1UJF9x
 Cws3u3W5ArZrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRp6wGPUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7RA3F1pEAWkCoQAAsI
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

In dcss_dev_create(), we should call of_node_put() in fail path for
of_graph_get_port_by_id() which will increase the refcount.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index c849533ca83e..a99141538621 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -207,6 +207,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 
 	ret = dcss_submodules_init(dcss);
 	if (ret) {
+		of_node_put(dcss->of_port);
 		dev_err(dev, "submodules initialization failed\n");
 		goto clks_err;
 	}
-- 
2.25.1

