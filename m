Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687F991BDDA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 13:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8BB10E1FF;
	Fri, 28 Jun 2024 11:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="RIT4l7IP";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gTVdm0V3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505A010E1FF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719575504; x=1751111504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zXsDEfI+56W4CdNsq4pp7jEDdTxswzTKdPEJQvvqFjU=;
 b=RIT4l7IPDu/KjUP/HUkBwsafKFs13pM2J5ONZwpwuR1NZHw211eHcwwM
 zfITCjTO+uHPtm+F+xjiVlTM1Kq6HsINl/RFWVEhHRlLJi6GtgpH3mQXB
 f7YNBsyDSdD3WV87eAS5Op3ouvVxDbBpJBnPNAVBr+rs5Qr1fHI/W/YDv
 RXED8Lo4HmlM6LCo4gOaFenT+MYTn3o94/7GBMnJmGA+4blvVvPTmTyCD
 B1O22w12B76wqyOqneNa2WHLfXzFZzImQyw1WTjVCMJUabiFq3R5aZj1k
 8ZpPGk7mnkPo58/6SRTIk7LoxpHuj8J7TnnTmim/AK2+x/aHCTfGdKvj0 w==;
X-CSE-ConnectionGUID: sIVXm1BWQfuls89IhhFYPg==
X-CSE-MsgGUID: ajoAWP82R6m8FkZ6Or6jxA==
X-IronPort-AV: E=Sophos;i="6.09,169,1716242400"; d="scan'208";a="37646426"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 28 Jun 2024 13:51:42 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CDD701648EB; Fri, 28 Jun 2024 13:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719575498; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=zXsDEfI+56W4CdNsq4pp7jEDdTxswzTKdPEJQvvqFjU=;
 b=gTVdm0V3MMm55DKIEvLOuPJItPqAPuPApw/PwVEIlClaQIWNQcNt8H9M9KLKzxnHLkedZP
 fArYuLOM0Qrog7YrCD2SbtRT4wuNeAhsled+ZovSxrAhmM0faljBj8A5IS6cghKt05okdA
 yYEQpdQie/nPiywHQzQGs8b1RJ0NTM2khGGbSTQq7BwoqTL/aJS+3T73d0loKGvYP/66Al
 2AYEqzyVmF9jJazVJgYN5boAhvVhe1w24pGxoIpWjpHQYRywFsmTDBBxQRCm0rC4sdSwJq
 wxUZ3orzyoO8nlRiPWCBTdG+cboE980oEYVK+UVydnHKhiiIaCZ2XUZh3q5gWQ==
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
Subject: [PATCH v4 1/1] drm/bridge: Silence error messages upon probe deferral
Date: Fri, 28 Jun 2024 13:51:30 +0200
Message-Id: <20240628115131.2903251-1-alexander.stein@ew.tq-group.com>
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
Changes in v4:
* Rebased to next-20240628

 drivers/gpu/drm/drm_bridge.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d44f055dbe3e7..3e72dfd941577 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -353,8 +353,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->encoder = NULL;
 	list_del(&bridge->chain_node);
 
-	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
-		  bridge->of_node, encoder->name, ret);
+	if (ret != -EPROBE_DEFER)
+		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
+			  bridge->of_node, encoder->name, ret);
 
 	return ret;
 }
-- 
2.34.1

