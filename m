Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1E4574661
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 10:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B209A0969;
	Thu, 14 Jul 2022 08:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2AA7B91A3A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=d/ft+
 121k92WgLMShtqaPnkVxzwjV0fkaQQbXECoFJk=; b=XC39oh0oNiS98iN6bzYfu
 M4XyPRg1A/p4kyFer/U2iLf0tpQ+P5Ep1odSOmGTTR3B8VWb9gQnhhbNLSOvVJnM
 7IAW6oP43aFun/CLlZ6cUu0nWjef6njJ+ezbkkKqJGGz6AnxFFTKnfFpmwGOZUrv
 4assqF7LLztNwoNAcCAJ2A=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp3 (Coremail) with SMTP id DcmowADX6Zox0M9i_4TSEw--.5446S2;
 Thu, 14 Jul 2022 16:13:39 +0800 (CST)
From: Liang He <windhl@126.com>
To: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, dri-devel@lists.freedesktop.org,
 windhl@126.com
Subject: [PATCH v2] drm/imx/dcss: Add missing of_node_put() in fail path
Date: Thu, 14 Jul 2022 16:13:37 +0800
Message-Id: <20220714081337.374761-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowADX6Zox0M9i_4TSEw--.5446S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1xtF1DAFWUAw1xCr4kWFg_yoW8Jw18pr
 43GFyUtry5Ja1IgrZ8A3W8urW8ta1UWay8CFy7C3s3u3ykAa4jqr1ktry5t3WDJFZ7Jrya
 yFnY9FW7ZF1Yyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRgVy3UUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BM+F1pED60VdQAAs6
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

In dcss_dev_create() and dcss_dev_destroy(), we should call of_node_put()
in fail path or before the dcss's destroy as of_graph_get_port_by_id() has
increased the refcount.
 
Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: add of_node_put() in dcss_dev_destroy() advised by Laurentiu
 v1: only fix bug in dcss_dev_create().

 v1 link: https://lore.kernel.org/all/20220707023214.307451-1-windhl@126.com/


 drivers/gpu/drm/imx/dcss/dcss-dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index c849533ca83e..3f5750cc2673 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -207,6 +207,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
 
 	ret = dcss_submodules_init(dcss);
 	if (ret) {
+		of_node_put(dcss->of_port);
 		dev_err(dev, "submodules initialization failed\n");
 		goto clks_err;
 	}
@@ -237,6 +238,8 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
 		dcss_clocks_disable(dcss);
 	}
 
+	of_node_put(dcss->of_port);
+
 	pm_runtime_disable(dcss->dev);
 
 	dcss_submodules_stop(dcss);
-- 
2.25.1

