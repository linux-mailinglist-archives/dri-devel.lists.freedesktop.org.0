Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B87246BE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB4C10E143;
	Tue,  6 Jun 2023 14:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330AA10E143
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1686062917; x=1717598917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O5O88F8k9M+uTlDdyFYRya69vCehBmNpxhQSvU+qoxs=;
 b=Kbzfg3UQdNZO7pB1fkLyCvX2P5zfArWmyrtwqHF4+4lq2DnFlvAY6uYq
 cHNx3py5lCmgbU9TvNhHI4s9pxO4qxUQO7g9wuZqjzKThhaNfFLl47ZKK
 wS8+WDvBeKiWv2fGp+muok97xzCfuJ7YrRG3n+aNGRPpj6BZccfXg8OhY
 +NaXeIfwjPCd9vUtA1+MRz9A1ikhHshxP6EmMFA2+h6CxjXCTCPf763Kp
 NOR6z0cRfDzfOU8L1lZNHJiejP4XkH9Msj3Ew8MH1+oVQXdG+Yakp3meW
 7B0Z/jbtQkUTlZW1l/ExxsmA/rD3ykrs/+7JV2lciZVzfA3QURlrfm9GP w==;
X-IronPort-AV: E=Sophos;i="6.00,221,1681164000"; d="scan'208";a="31307809"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 06 Jun 2023 16:48:34 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 06 Jun 2023 16:48:34 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 06 Jun 2023 16:48:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1686062914; x=1717598914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O5O88F8k9M+uTlDdyFYRya69vCehBmNpxhQSvU+qoxs=;
 b=f/P+P1D3MvMjQ6A/BwCBwfCtzs4JEQqHDFdxfQ7jiup96FAJSKdEHa1+
 vAJNZSL8VuoCgKcYwaGnjNhhfCGX6y+wXT0BA4yUbA+9o5ynWq81wId6j
 xSZqjxSEhWHKs82mQdvBqcjP/Nw8VlNAXKL++MaUAkn0uJRhOMVNHV4Fu
 h+LyXjl+75+TeKqQRFP0zPBQMApSgOKYIvo2NtcPZF2y/QibNHy3gRrGn
 MTsd9B9rSSXjed0sV175OZ97YioUM4Dd8fSyKv1iJzk2I+K6kGNWjPb2x
 pdlHcdBaX0nsqQXq93wurbqO2JtT9ijjgefdJ4f7rN/cErJgNQw34w8sh A==;
X-IronPort-AV: E=Sophos;i="6.00,221,1681164000"; d="scan'208";a="31307808"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 06 Jun 2023 16:48:34 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 46CB6280090;
 Tue,  6 Jun 2023 16:48:34 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm/bridge: Silence error messages upon probe deferral
Date: Tue,  6 Jun 2023 16:48:33 +0200
Message-Id: <20230606144833.776646-1-alexander.stein@ew.tq-group.com>
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

When -EPROBE_DEFER is returned do not raise an error, but silently return
this error instead. Fixes error like this:
[drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
[drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
dev_err_probe() would be the best, but I am not sure if this function is
always used within a driver's probe() call.

 drivers/gpu/drm/drm_bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c3d69af02e79d..07773d6441a1f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -350,6 +350,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->encoder = NULL;
 	list_del(&bridge->chain_node);
 
+	if (ret != -EPROBE_DEFER) {
 #ifdef CONFIG_OF
 	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
 		  bridge->of_node, encoder->name, ret);
@@ -357,6 +358,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
 		  encoder->name, ret);
 #endif
+	}
 
 	return ret;
 }
-- 
2.34.1

