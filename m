Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEBA7025FA
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 09:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0103C10E15C;
	Mon, 15 May 2023 07:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB6910E15A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 07:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1684135302; x=1715671302;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M6VMANjjtOb3fSFKZxV/mbWcifazyrEVC8AZCALd/DY=;
 b=HTKKS3FbTYTh1beV/dYdDxhwcnvhJeGJSegHY4FJXvEcC8vTwIlAzeos
 9LZa04bya32i5s5D84jKzEvmH9K6SlhsKGEQHph116uDWWvxoDxXFRb41
 JotS+5JDBGWfVGL0OQd3DIAVYmRbf9uopqqQ3B/W9S1SGSGZ6sAWNkWEj
 sFqZgMiTFn/4bK2HhlgvsrpsZNHLaNZrVQGGHpvOxygeLL7L9fB8Iu+0U
 gPBX2SXfOCNh9ccf0EAHE2RffC5vw9GQrQ01XMmeOPU9NqENORcDpnrgX
 eQaA4hPZGRiGNxF6X6s7xgdywxT7+pMRHWL+m/2AJ4THqpR4p2DRmgO6A Q==;
X-IronPort-AV: E=Sophos;i="5.99,275,1677538800"; d="scan'208";a="30898473"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 15 May 2023 09:21:39 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 15 May 2023 09:21:39 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 15 May 2023 09:21:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1684135299; x=1715671299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M6VMANjjtOb3fSFKZxV/mbWcifazyrEVC8AZCALd/DY=;
 b=nZloOe+T7RwCM85eSQFIpipcoFnMf1qzvMd9Z6xRDtuBbxr133Qwoigh
 3RJROT/xhNb8sbIIXS+NsZGxouq5UI4683nRd92aXTECpnbt/qzGp9Mmz
 EeFCigLizQFjVqQIMptkiCC6TD+Rouo+SfRnWNnvB9sfN3jUdMzbQ+JWj
 SjYWC4eY4rFdp4qnwfbE0JP5p+k8DxN22BB59iyD7tQ4yXbRfYX0/5UWn
 N/MyRg4FpB4owxp2SRdUXpY9SqKcfvkjszgQndL5SFvSjMJxPJHs1ZrJl
 6J0o6WNEoFI3jFOj2JwbM5jAZ7oX2PUUYtdEgmnalqxEJ+06kf6h5tiHP w==;
X-IronPort-AV: E=Sophos;i="5.99,275,1677538800"; d="scan'208";a="30898472"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 15 May 2023 09:21:39 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 68AF9280056;
 Mon, 15 May 2023 09:21:39 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2 1/1] drm/imx/ipuv-v3: Fix front porch adjustment upon
 hactive aligning
Date: Mon, 15 May 2023 09:21:37 +0200
Message-Id: <20230515072137.116211-1-alexander.stein@ew.tq-group.com>
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
Changes in v2:
* Rebased to next-2030515

 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
index 5f26090b0c98..89585b31b985 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
@@ -310,7 +310,7 @@ static void ipu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		dev_warn(ipu_crtc->dev, "8-pixel align hactive %d -> %d\n",
 			 sig_cfg.mode.hactive, new_hactive);
 
-		sig_cfg.mode.hfront_porch = new_hactive - sig_cfg.mode.hactive;
+		sig_cfg.mode.hfront_porch -= new_hactive - sig_cfg.mode.hactive;
 		sig_cfg.mode.hactive = new_hactive;
 	}
 
-- 
2.34.1

