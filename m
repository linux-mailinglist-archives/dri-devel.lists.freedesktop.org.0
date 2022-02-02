Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6F84A6CC7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0559B10F9E7;
	Wed,  2 Feb 2022 08:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AF910F9E9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1643789888; x=1675325888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=upUdRNc2H9LGx6pOVpcm0rc5dRiRMZ/3v9/QOVk8QmY=;
 b=pGhPnHINyLNH7dUevVlErbipW7MdsXelL9pfc61QZ6XAmvMsEyhOf+Vd
 FT/SMMFnH9HAlJaNR3D2bjqqVEJmqSkhsZAZK3PKjJZMdSiLZnDvuEXt2
 mjGN5nr/L1T6ARCbLLYnBQIHkYniFv8GBVAKiVY8GOYzQJUp7XBLjKaaW
 mP8yYFeJF9S9KwjFe71hlmT6mbD4B80Xai9wMqLNO7G027Au4ko+GHTNB
 6e4fWYphKyz8k19s1lLdXdJBfOoXi8UE7zq+ZGUe8iX+KZpYmDM8uTPzW
 +fGlZmDDqAHY7NI4T2p0oIPXReiz8dloiil/EUjZjhHbKrabyvnNPrwdO Q==;
X-IronPort-AV: E=Sophos;i="5.88,336,1635199200"; d="scan'208";a="21844621"
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
 bh=upUdRNc2H9LGx6pOVpcm0rc5dRiRMZ/3v9/QOVk8QmY=;
 b=hAPzMN8iZFz7B2++PM1hvSL2T7NxC9DQQUVX3Q46Vh2kkBhdK4EmymEt
 AbNMtdp4DZNilvi+woZZY6ubPzultbmx9AH4vmluCnFs4D/6oAI8XslaQ
 x5nEf0qoIoCm75XHKrRyni/m93wM1+pmJ77AeLkRRzNPWDD3i+fGOi/0v
 CayNVmmZKmeo8sq59wZqIzo3I7o53t8hbDuT8SeJU58IolSgYZUUcVIuU
 jyfyzkYjpw4QJyf49UiK7rtrmrE3I3sMcLJByajSP9LUenmdJMhl0rsE7
 BLdHHD1H/wk27yLmVs98I2UEqC3ZNT+7FYVA1zKx/A2pD6seCPYJS/evw g==;
X-IronPort-AV: E=Sophos;i="5.88,336,1635199200"; d="scan'208";a="21844620"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 02 Feb 2022 09:18:04 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9A03E280065;
 Wed,  2 Feb 2022 09:18:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/2] drm: mxsfb: Fix NULL pointer dereference
Date: Wed,  2 Feb 2022 09:17:55 +0100
Message-Id: <20220202081755.145716-3-alexander.stein@ew.tq-group.com>
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

mxsfb should not never dereference the NULL pointer which
drm_atomic_get_new_bridge_state is allowed to return.
Assume a fixed format instead.

Fixes: commit b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if present")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 0655582ae8ed..4cfb6c001679 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -361,7 +361,11 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 		bridge_state =
 			drm_atomic_get_new_bridge_state(state,
 							mxsfb->bridge);
-		bus_format = bridge_state->input_bus_cfg.format;
+		if (!bridge_state)
+			bus_format = MEDIA_BUS_FMT_FIXED;
+		else
+			bus_format = bridge_state->input_bus_cfg.format;
+
 		if (bus_format == MEDIA_BUS_FMT_FIXED) {
 			dev_warn_once(drm->dev,
 				      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
-- 
2.25.1

