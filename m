Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D69926048
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 14:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E45810E7D3;
	Wed,  3 Jul 2024 12:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="Q87YfAmi";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hSE1Xdbm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BF810E7D3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1720009646; x=1751545646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8jq6y7aA7RK3dKCehG+wrp8fblOjHLald6MD0wxTNHc=;
 b=Q87YfAmiqoUNOhFD/DUPCAfhLT3lRIaTl0eVUcWTfq2T7tGM/4aBOU1X
 L6GPTljqvIRzoLRvlSQ+tvKB4njamET1KKGNCCuuD6/AgppWp41avOkUH
 7LzisG9K2Ke045RX//DfhcLgf2Rt12EiuYv/Fvj2ik+CbrzL2gmckX2O2
 h5ejWKbx0K8/o7x5bQP3vgmFzMrXZ8NHRjvSsswryj0L5geZdE2qpci63
 gYUXOJ208K5Dt0+1dX/uXxivomdn5yzx9gfwLFxnTX7PMyBxq6A6/0HqI
 Z/rE1VBQwCzQolJWSbfkpooETvo/qpmEnRizFQlRLheMNi9Er48f7JodR w==;
X-CSE-ConnectionGUID: dggba+NXRHGpeBGX8BmCdw==
X-CSE-MsgGUID: 4YDp7SzqSiiu6+kXLImTLg==
X-IronPort-AV: E=Sophos;i="6.09,182,1716242400"; d="scan'208";a="37726416"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 03 Jul 2024 14:27:24 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2CFEB165C89; Wed,  3 Jul 2024 14:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1720009640; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=8jq6y7aA7RK3dKCehG+wrp8fblOjHLald6MD0wxTNHc=;
 b=hSE1XdbmneKXrssEo+FANb1s0MTPKTkv5oqLVPlNZInBXXbawo4s4SqNnJzA+yJvypaQ19
 Vb+jHRREaLBRFfid6YbAapkxKwAS8L5dJr9laEbWmj/n4t7zX6Ongda1Gga0NuCVFsjVhz
 mGFcR88QfJIWnBcp3EILNfnUsabJAUjDZT8L3H4ZD5SlppkoZScNj64Bd6sIQJjYT3dW+N
 Pxlq1LJE5y5REEp3r4M6CS2OhT5cZnI5befFk4xEXzM6rvzzENX2yNjHpuKUOST29kn2er
 d1ySPaHSvL0g7XJiCURqIY3ewKXd0xlpXNd8Db4PtO55Dn+ciS+r84RSRN1hQg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/1] drm/bridge: Silence error messages upon probe deferral
Date: Wed,  3 Jul 2024 14:27:15 +0200
Message-Id: <20240703122715.4004765-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

When -EPROBE_DEFER is returned do not raise an error, but silently return
this error instead. Fixes error like this:
[drm:drm_bridge_attach] *ERROR* failed to attach bridge
  /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
[drm:drm_bridge_attach] *ERROR* failed to attach bridge
  /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
Changes in v5:
* Added dev_err_probe() call if probe deferral occurs

 drivers/gpu/drm/drm_bridge.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d44f055dbe3e7..c6af46dd02bfa 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -353,8 +353,13 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->encoder = NULL;
 	list_del(&bridge->chain_node);
 
-	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
-		  bridge->of_node, encoder->name, ret);
+	if (ret != -EPROBE_DEFER)
+		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
+			  bridge->of_node, encoder->name, ret);
+	else
+		dev_err_probe(encoder->dev->dev, -EPROBE_DEFER,
+			      "failed to attach bridge %pOF to encoder %s\n",
+			      bridge->of_node, encoder->name);
 
 	return ret;
 }
-- 
2.34.1

