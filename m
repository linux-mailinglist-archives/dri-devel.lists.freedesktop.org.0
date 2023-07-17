Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8C0755F3B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7214010E0E6;
	Mon, 17 Jul 2023 09:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1113010E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1689586196; x=1721122196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mbTIq0q0H+4nfEkdMX25g24fXCZBlIBkQ4OKUxNrdU0=;
 b=YOHE8siHY+XyakXXQq6q9cTF3/olpEc/Wj2283r07yECNAk+8ayY+doN
 ZbGDShZSSvH46Ro6CtW1pEOvBrGBEUnomvSAA91dGetlAX0uQ/AGqFSCZ
 bS766MsiIWkfId5zM885rRMST4bwisk5V5y1XQRcvresZc+LYbT4nKM2u
 UFaFHdj+MFzWVCwulLYLt/0TocBRV9xN5uZW9COH5/U2WBPMJHKFaXkyS
 nRigzzMz8/sJcXHsFHzRJGiapBfYuQT3UG69wBxnofPicheHCy/hh3g5m
 feB2jo8lZIrIbCuGoDX2h6ZUs96rjurwntaaZBQpCfFc5mB0CSQFvC/hZ Q==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684792800"; d="scan'208";a="31959409"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Jul 2023 11:29:53 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 82D80280078;
 Mon, 17 Jul 2023 11:29:52 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/1] drm/imx/dcss: Use dev_err_probe
Date: Mon, 17 Jul 2023 11:29:50 +0200
Message-Id: <20230717092950.448823-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This helps identifying problems with downstream pipeline devices, like
HDMI/DP output.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/imx/dcss/dcss-drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 4f2291610139..c68b0d93ae9e 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -66,6 +66,7 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
 	mdrv->kms = dcss_kms_attach(mdrv->dcss);
 	if (IS_ERR(mdrv->kms)) {
 		err = PTR_ERR(mdrv->kms);
+		dev_err_probe(dev, err, "Failed to initialize KMS\n");
 		goto dcss_shutoff;
 	}
 
-- 
2.34.1

