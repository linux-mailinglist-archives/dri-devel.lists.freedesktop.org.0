Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA5C9707DF
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 15:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7109110E276;
	Sun,  8 Sep 2024 13:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="QNl/oDXn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A54B10E275
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725802880; bh=Kv653550ZAaYWcH77Mo8Hgi73sCYCuyVNLs67561gpQ=;
 b=QNl/oDXnAwNwSHHdqHGR8JO1xciDmBX6yQ9MBTe6qH0jkw3ofkRnJP1pD9UUfjgfH/m2F9h8y
 0tPBk61A77f+eLzx10e/02nXz0iRX73MNOsbfupMtVU8N7ETsu7Mi1hWia7i6dR9uhijZiDc4lP
 eFL5lhShLodbR6VgfWWpBw+z5tIulBlbt/4lu/fko5QwG/I66hI/sZCxKCJS6dtOGeFeRRGdkuK
 7Vy9YQ4JPk1Oe9a+s70ZGh+a45v9b0bero93nmqR7F60Yxbue3JEb/490tzRiP2378R5W2R/Kg5
 K8KY5aWidCPGZAEN1phWb7qkyRaXrPYkXGyo7t7RHO5Q==
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Christopher Obbard <chris.obbard@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] drm: bridge: dw_hdmi: Only notify connected status
 on HPD interrupt
Date: Sun,  8 Sep 2024 13:28:04 +0000
Message-ID: <20240908132823.3308029-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240908132823.3308029-1-jonas@kwiboo.se>
References: <20240908132823.3308029-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66dda6873c9877b459587918
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

drm_helper_hpd_irq_event() and drm_bridge_hpd_notify() may incorrectly
be called with a connected status when HPD is high and RX sense is
changed. This typically happen when the HDMI cable is unplugged, shortly
before the HPD is changed to low.

Fix this by only notify connected status on the HPD interrupt when HPD
is going high, not on the RX sense interrupt when RX sense is changed.

Fixes: da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event on link change")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 9e7f86a0bf5c..055fc9848df4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3123,7 +3123,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 			mutex_unlock(&hdmi->cec_notifier_mutex);
 		}
 
-		if (phy_stat & HDMI_PHY_HPD)
+		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
+		    (phy_stat & HDMI_PHY_HPD))
 			status = connector_status_connected;
 
 		if (!(phy_stat & (HDMI_PHY_HPD | HDMI_PHY_RX_SENSE)))
-- 
2.46.0

