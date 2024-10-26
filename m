Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFFF9B148F
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 06:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEA410E3F2;
	Sat, 26 Oct 2024 04:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="OT+xR7VR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4722C10E3F2
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 04:11:10 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7CDB588DEE;
 Sat, 26 Oct 2024 06:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729915869;
 bh=fOQygmD8Z0UZSPIldx6mYzT/ZtsOZmiDhdAKC1J1T30=;
 h=From:To:Cc:Subject:Date:From;
 b=OT+xR7VR4YKJR1VekB1yDC6vdve/WDQh0ZI5IdOnX/hN16wQ0cfoOyiBEBm34VIO/
 KUxCRaRzzl7m1oPLUPJEyM2SXFfDmBp0paiYo+xOFfUsrzGH72jWwnNKKSJoeNIiXw
 H7D/MwsSOfTptA+ti3N7/6d1PYppsFfyM/Vcch9Ogxat8i6bkEqMjZavGFNy8yGVfI
 oMIExfUPhuNSmEzUX5rOKx+DeKou3i/p34/PehPu1vuNr3qidOmxFHIjAgptF4EXl2
 hqHVlTocRtNkCwcTAWzAiDUh/zCJLiHMQhDTH2u27nOgvLQGFEeQGVyJqkjDeN0VD8
 C/P6OXfbfXsVQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/bridge: tc358767: Fix use of unadjusted mode in the driver
Date: Sat, 26 Oct 2024 06:10:42 +0200
Message-ID: <20241026041057.247640-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

The driver configures mostly Pixel PLL from the clock cached in
local copy of the mode. Make sure the driver uses adjusted mode
which contains the updated Pixel PLL settings negotiated in
tc_dpi_atomic_check()/tc_edp_atomic_check().

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/tc358767.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 7968183510e63..0d523322fdd8e 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1764,7 +1764,7 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 
-	drm_mode_copy(&tc->mode, mode);
+	drm_mode_copy(&tc->mode, adj);
 }
 
 static const struct drm_edid *tc_edid_read(struct drm_bridge *bridge,
-- 
2.45.2

