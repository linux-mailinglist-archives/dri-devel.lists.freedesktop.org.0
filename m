Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06976FED8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0616E10E6D9;
	Fri,  4 Aug 2023 10:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DD210E6D7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:48:32 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 584FF1AB3;
 Fri,  4 Aug 2023 12:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691146047;
 bh=Saj/S8br2Pn8J3bw6L6o8aOvLR2HwJ6wjYN6KAzMzkU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oujl1umhGiLwwXTZQbcxslb/R63Z5anKl0neAqDGW1DS5Gd2f+c6yewLw7lziR3Oh
 h6pAmu2zFKS0/ktx/Nr9Ql6+vWxZn8t3n53Px7QEwaUfdCYq/b+oyDnM7bhIRykHuw
 eCMcRojAZn6A9kM4+KU5RXGL48sbXCRgLMNMRDjM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Aug 2023 13:48:12 +0300
Subject: [PATCH 3/4] drm/bridge: lt8912b: Manually disable HPD only if it
 was enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-lt8912b-v1-3-c542692c6a2f@ideasonboard.com>
References: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
In-Reply-To: <20230804-lt8912b-v1-0-c542692c6a2f@ideasonboard.com>
To: Adrien Grassein <adrien.grassein@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Saj/S8br2Pn8J3bw6L6o8aOvLR2HwJ6wjYN6KAzMzkU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNd6liHCPx0ghKBP8t9JRvjgyQWiphU0oyD/m
 t9DegCFRgyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzXegAKCRD6PaqMvJYe
 9Zc7D/9FlNRiienw4V23B/lNpiOjKqmz7DNA6PdgZUnUnITvIoMehOP1f4ohGTivF9vewrvcPEy
 I0yY+lrHwzGJJM4H3PhbxlxjWtkHk3cjSfwquFrXXpCoS7eXr06zOK9yqSppAnylU5Ua6PAzegA
 LkpkfmyOFKJPvxbeL+rEM85MFIm4kbdx1TTYgS8wYI0ZDbk725VfDIMqK9t3xCL7IbN/TDpi+az
 l36QgZFRabDgyjTVC1/sij878thJr96JSXySEZtbtW/3WqPGDUXARxrkypmdEwaP8YNRuBNUrGl
 u6ya75o07hZQhkI/fIoOMCp+CavALCs4v9KiRShRh79otuwrKvnL9eXTboMBFDF0IOLHs7/spOi
 i8rD/onkTUW72a7RAmrgmW4PEwAgSsFXMxA/7BJOQDcDiph0re0aC26/VQko7EGCBlIcht8RRf+
 1nldp4Ik0lTGetaMKY3DoRLNshQ/3l1cVubAAVfyvYYozMkcAAK/THri3yuWeen/VZxfgsXdJT6
 CiXkylVveds9/wckOyaq4F1TO0zQlEGqfrP4MLbY+lo1P81YpDFTVbWSjjxPn8eTpbie8h3TsPJ
 yWhuJ0UcOxF6vL5+E04Peolih8Z7ZCtqJ6c6awI4SsXstywT1Kw10kbdvJykKHhKWe2hccWPX7D
 Kicpr2fJcnyk0nA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

lt8912b only calls drm_bridge_hpd_enable() if it creates a connector and
the next bridge has DRM_BRIDGE_OP_HPD set. However, when calling
drm_bridge_hpd_disable() it misses checking if a connector was created,
calling drm_bridge_hpd_disable() even if HPD was nenver enabled. I don't
see any issues causing by this wrong call, though.

Add the check to avoid wrongly calling drm_bridge_hpd_disable().

Fixes: 3b0a01a6a522 ("drm/bridge: lt8912b: Add hot plug detection")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 2d752e083433..9ee639e75a1c 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -587,7 +587,7 @@ static void lt8912_bridge_detach(struct drm_bridge *bridge)
 
 	lt8912_hard_power_off(lt);
 
-	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
+	if (lt->connector.dev && lt->hdmi_port->ops & DRM_BRIDGE_OP_HPD)
 		drm_bridge_hpd_disable(lt->hdmi_port);
 }
 

-- 
2.34.1

