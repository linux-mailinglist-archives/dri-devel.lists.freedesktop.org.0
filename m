Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1FA66DBDF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 12:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0930E10E190;
	Tue, 17 Jan 2023 11:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E0D10E16A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 11:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1673953686; x=1705489686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2hIaPllRjbcCpxzx+2PEZ2OUnrlceR6+TL3T2xzTYcg=;
 b=ei01HZASKv8at8dTJ0jOHGAuuWosClP19dYknpgTdYfEA9hbT9fIGz5q
 Bo6d7hFWKH1f0thCFPkZxhS97xHEGqR4+oQS1LaZpitrlVbyTBJ/Lt8Dr
 bcwWi1PiDOFV/YzGRRHoaWtnorWixms2HgYWQnDHJ3wqN+Fod0feks7RK
 bjDzmLyalo03RU+xSlLBBlNzuKtBi7hjND1htYjopyhnq4MpdZqEUb5I+
 DMQa/ddZ4tel/Ig1nPAIT4b0lUFwbeUEMNcgMTx+5QhTSuigP7AawPaoD
 jbKVBXEPdop00BbkTj9wmq33/duKDgjsyWAFznntz8lpRy5ulONcFXHh0 A==;
X-IronPort-AV: E=Sophos;i="5.97,222,1669071600"; d="scan'208";a="28473967"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 17 Jan 2023 12:08:04 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 17 Jan 2023 12:08:04 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 17 Jan 2023 12:08:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1673953684; x=1705489684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2hIaPllRjbcCpxzx+2PEZ2OUnrlceR6+TL3T2xzTYcg=;
 b=dB4lX78kUVYgwMuJsXHagFAehjuWPbsRXJBeBPKLe23C4D6u2M887Xve
 AlKBx9tCfS098eNu42/3y/gmroAt43aMfGiNOdBo831uDRrRhpYLUavTF
 j+M9NIghW3HxuMr0yhj7Oc2X+SWZS/AxDfeBf2r0I9Tql3HaHhK5temLO
 nW1w2ePInEkLKcjuo4vIFc+X+gFc7CJVuq49TuPgMTf1xDu9IwCo7+zfe
 gHKd6B8bYNkjqi37/t3HvWhnBuK7NdfO2QIUHWcyvdjOtPaPwKnMWspF1
 /stN+AnF4XDKkAxyFv8vc1Fviw/XH13SmL5498YbU50tvTuJYNJXp37/g g==;
X-IronPort-AV: E=Sophos;i="5.97,222,1669071600"; d="scan'208";a="28473966"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Jan 2023 12:08:04 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A17E2280056;
 Tue, 17 Jan 2023 12:08:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm: fsl-dcu: Use dev_err_probe
Date: Tue, 17 Jan 2023 12:08:00 +0100
Message-Id: <20230117110801.2069761-1-alexander.stein@ew.tq-group.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fsl_dcu_drm_modeset_init can return -EPROBE_DEFER, so use dev_err_probe
to remove an invalid error message and add it to deferral description.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 8579c7629f5e..418887654bac 100644
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

