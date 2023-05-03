Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F6B6F5703
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 13:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5534410E262;
	Wed,  3 May 2023 11:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B1210E292
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 11:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683112504; x=1714648504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MtY2s3yh1IVnpkcGyb3twXc6KSMhTK5mUaZU6OAmzlI=;
 b=eK4iILRpwUBrMbu2kD/3aW4YXgDqX89VAhCudcVW+rCv7shoCuoslgpS
 IG1bhlrxolvQ6PgEP/pSRWEcvYhGRDS2EtRGmICleqq5rhyLrCpmVzcyD
 Advd/mz2o5EBhFyGWejY1UAhkxub0vVCdwJjlYzMmFG2AwvDE5ZUcQJS/
 Hv8gUkiJK8D+3PygZJpRcm80z0PLTEJyhw5R9tr66Z71Tlfo5m9eFNRDW
 aS+cgz+4oeBsgXvGSnmizBHVs3qUo6wI2YtMEULjqkGMta0I8ceBsio9Q
 9v1hk3QH5uxIyukXjOSaJUK15wtaiqe4DzdknqZmmOVY+bpWbG5By5Uau Q==;
X-IronPort-AV: E=Sophos;i="5.99,247,1677538800"; d="scan'208";a="30691588"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 03 May 2023 13:15:00 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 03 May 2023 13:15:00 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 03 May 2023 13:15:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1683112500; x=1714648500;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MtY2s3yh1IVnpkcGyb3twXc6KSMhTK5mUaZU6OAmzlI=;
 b=GD8jmJ3ggkMO1901Aypfe+0A+yKMjNf8+Zrb+MNajDhm41mM8NCr6TDR
 nYBPCdwOx6hIulP2jg00UxM3DgAKhatI+HKc8MtaJpltSdtVDv7/+cRzw
 l+udX7MBrbZROPplokekAm6wbDyrBgMy/8zKTtSjVIenj/CxOjjHWibYX
 kODZNllwW9Rd0quDK8LwqCbBQmx+mVbgYK+ywWKzOcsExnniB150R08Am
 joCe8RPdOm2yfou5B7mvLCZjnLQCIphtFpyNx/Uoc3IiJKuTSqefCYi0N
 tXh7k0004opficrl8KmiP6rrBctbuQLOou/r3nFDTyjSA/+ALKDPbgok6 w==;
X-IronPort-AV: E=Sophos;i="5.99,247,1677538800"; d="scan'208";a="30691587"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 03 May 2023 13:15:00 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 49B2E280056;
 Wed,  3 May 2023 13:14:59 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 1/1] drm/imx/ipuv-v3: Fix front porch adjustment upon hactive
 aligning
Date: Wed,  3 May 2023 13:14:56 +0200
Message-Id: <20230503111456.1748511-1-alexander.stein@ew.tq-group.com>
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

When hactive is not aligned to 8 pixels, it is aligned accordingly and
hfront porch needs to be reduced the same amount. Unfortunately the front
porch is set to the difference rather than reducing it. There are some
Samsung TVs which can't cope with a front porch of instead of 70.

Fixes: 94dfec48fca7 ("drm/imx: Add 8 pixel alignment fix")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
AFAICS ipu_di_adjust_videomode() checks that front porch is big enough to
reduce the alignment difference.

 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
index 1d306f7be9fd..341e9125bf2c 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
@@ -311,7 +311,7 @@ static void ipu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 			 sig_cfg.mode.hactive, new_hactive);
 
 		dev_info(ipu_crtc->dev, "hfront_porch: %u\n", sig_cfg.mode.hfront_porch);
-		sig_cfg.mode.hfront_porch = new_hactive - sig_cfg.mode.hactive;
+		sig_cfg.mode.hfront_porch -= new_hactive - sig_cfg.mode.hactive;
 		dev_info(ipu_crtc->dev, "hfront_porch: %u\n", sig_cfg.mode.hfront_porch);
 		sig_cfg.mode.hactive = new_hactive;
 	}
-- 
2.34.1

