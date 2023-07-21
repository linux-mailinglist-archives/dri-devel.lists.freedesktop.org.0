Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2934B75C1BB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 10:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C77610E632;
	Fri, 21 Jul 2023 08:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AF510E632
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1689928401; x=1721464401;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9bZTQfFErD83ZpeUe8f6tUjcWK8u+2HNM0QEJ6Cyo2s=;
 b=LpwguBTAWKOjNwnYG27VHqlnx5ZPbc8zw12789NNPJo9noS1yB1c8QjQ
 xGmHpknYGDVW4nwEpHFbW1cF/QLVKbxj+MY76+hqkq2heHDfmHRvB0f6C
 55TbxX1CCJRf5TUtO/4EpV8CJDFp9gKMlUAEkkq9BjoekZnF9widRPUcB
 GxG1xC1EEwn9cexnWCBN37r8+Ayv7gM1fqtCDIY4Pe5EAs/h/+EaCc5vo
 BJwYxF0kRic4q2DvkYw6a3oPNRZ9oxfiLhxkmkVUJFZJ6/jSTY/fIG7nA
 u5t2irfb8lj61KCJFoBmU1kwBMgTQY0ydjgOrTl3ifxdrd9onMIagqqK/ Q==;
X-IronPort-AV: E=Sophos;i="6.01,220,1684792800"; d="scan'208";a="32048649"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Jul 2023 10:33:19 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 267F0280078;
 Fri, 21 Jul 2023 10:33:19 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Schiffer <matthias.schiffer@tq-group.com>
Subject: [RESEND 1/2] drm: fsl-dcu: Use dev_err_probe
Date: Fri, 21 Jul 2023 10:33:13 +0200
Message-Id: <20230721083314.1190614-1-alexander.stein@ew.tq-group.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fsl_dcu_drm_modeset_init can return -EPROBE_DEFER, so use dev_err_probe
to remove an invalid error message and add it to deferral description.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index a395f93449f3..90cbd18f096d 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -103,10 +103,8 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 	int ret;
 
 	ret = fsl_dcu_drm_modeset_init(fsl_dev);
-	if (ret < 0) {
-		dev_err(dev->dev, "failed to initialize mode setting\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev->dev, ret, "failed to initialize mode setting\n");
 
 	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 	if (ret < 0) {
-- 
2.34.1

