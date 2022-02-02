Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1194A6CC6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECAB10E336;
	Wed,  2 Feb 2022 08:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26B610F9E9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1643789888; x=1675325888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GwW1AHWp4yInCJeFGSw5ytM4s1rzTas8PEVpMvVFWZE=;
 b=Qv9zC3ofC1MKhwmqKxv6/1bXWrN/qG5q4CZ6CNUmF/ZgdOfXdQfJL8zr
 GjBFaDKS//O5cQFOT1VqWsp4SiwQ/B2uucsuwgMsArLccYJ7NCsnT5KDY
 NrzZLUKheLDfdvc9rI+pAJwkcV2z7ddy8GDOqqSuU0+Ia+pgqJcV7PvaA
 csw6tBk5deDbA5PnW9wqs2bl3dUlNvm7WVquiFSrsCpy7j2GnSidTd4tY
 OJlMQuBHqAPLhhftnE2UErH8leVaRdmbeRxZNE48BJRnILsI0BPYUng9q
 jf/3sy8z2MgRg9bLi3ocUN7asE5okWsFK3VHojmBXcy4I99+e3XTyojMf A==;
X-IronPort-AV: E=Sophos;i="5.88,336,1635199200"; d="scan'208";a="21844619"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 02 Feb 2022 09:18:04 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 02 Feb 2022 09:18:04 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 02 Feb 2022 09:18:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1643789884; x=1675325884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GwW1AHWp4yInCJeFGSw5ytM4s1rzTas8PEVpMvVFWZE=;
 b=DfDwK33op8JtL6wyh+1gO8wZMDiWPk1fxYYujbsucFr6WRxAEYIT5jfz
 Bk9v4kiXQ123+VlGouHgh2Xil3ng7smA5S1UsZO0d2jDgVYZ8sZKMT8VN
 4ZhUa6rE3JUoEL8tFUoxiNoeLRim3axZPKdx6HHgNUrC37px+hcwmOhfg
 yYtttO+Gi64oMRH8As3C9Nw2p69HG3MgPTvGIpqMVBqjNS+8a+xX19o9l
 DaqbTPfXy7cOwdwTFvFC6S9zLCz4nwcGhFmDZ1B7wX59aCj+lE04wSWb8
 zfPL/aiInE/1A4bhLbB/ZGVC0CyNVSD8jbh+TBqO0O22zIYwChWnr/tA4 w==;
X-IronPort-AV: E=Sophos;i="5.88,336,1635199200"; d="scan'208";a="21844618"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 02 Feb 2022 09:18:04 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 66AA8280075;
 Wed,  2 Feb 2022 09:18:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/2] drm: mxsfb: Use dev_err_probe() helper
Date: Wed,  2 Feb 2022 09:17:54 +0100
Message-Id: <20220202081755.145716-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220202081755.145716-1-alexander.stein@ew.tq-group.com>
References: <20220202081755.145716-1-alexander.stein@ew.tq-group.com>
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
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the dev_err_probe() helper, instead of open-coding the same
operation. This also adds a nice hint in
/sys/kernel/debug/devices_deferred.

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 375f26d4a417..c4da358f2154 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -258,8 +258,7 @@ static int mxsfb_load(struct drm_device *drm,
 
 	ret = mxsfb_attach_bridge(mxsfb);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
+		dev_err_probe(drm->dev, ret, "Cannot connect bridge\n");
 		goto err_vblank;
 	}
 
-- 
2.25.1

