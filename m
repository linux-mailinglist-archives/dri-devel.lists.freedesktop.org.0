Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924097AC6F9
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 09:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2875D10E0E4;
	Sun, 24 Sep 2023 07:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7653810E0E4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 07:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=vzoqFEDBb/oPjpyDhl
 sEgz/I1xFL9W3Dl6eVQKyXhs8=; b=ZKORiu3lQtZcEqCB1MPdS/fhlHDvW2CwqZ
 SyB7/WbYzDvKmXw0rOPo6FXsp8df0T9fyC6BLmDTbtB2spdvQe6qjBN1VcEQiBG9
 kaTGMPvSb8MT0LGxcTf+gYVtBCRwvOGoVjSbQEGwmmpwZG74/MXDE4n6IscwOLFe
 q1YjerW2k=
Received: from localhost.localdomain (unknown [223.104.131.178])
 by zwqz-smtp-mta-g0-0 (Coremail) with SMTP id _____wAHYrOG5Q9l7PnOCw--.61115S2;
 Sun, 24 Sep 2023 15:30:16 +0800 (CST)
From: liuhaoran <liuhaoran14@163.com>
To: p.zabel@pengutronix.de
Subject: [PATCH] drm/imx: Add error handling in dw_hdmi_imx_probe()
Date: Sun, 24 Sep 2023 15:30:01 +0800
Message-Id: <20230924073001.16681-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wAHYrOG5Q9l7PnOCw--.61115S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr17WFWxZFy7CFykJw4rGrg_yoW3XrcEk3
 W8Xr97WF47AF1DWF13Ar4fZrZFk3WFvrsYqF1a9a4ftrWDA34UWrWq9ryDXrn7ZF1xGFn8
 Ww4Igw43CF1DGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjna93UUUUU==
X-Originating-IP: [223.104.131.178]
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiGAv0glv2oA0jyAAAsO
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
Cc: liuhaoran <liuhaoran14@163.com>, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds error-handling for the of_match_node()
inside the dw_hdmi_imx_probe().

Signed-off-by: liuhaoran <liuhaoran14@163.com>
---
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
index a2277a0d6d06..3b25f018b2a6 100644
--- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
@@ -224,6 +224,9 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
 	struct imx_hdmi *hdmi;
 	int ret;
 
+	if (!match)
+		return -ENODEV;
+
 	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
 		return -ENOMEM;
-- 
2.17.1

