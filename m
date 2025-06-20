Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4032CAE10A6
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 03:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B5110E1CD;
	Fri, 20 Jun 2025 01:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="QZf+648r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CD010E1CD
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 01:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1750382336;
 bh=Hk4LQge5dZN0PKJMnUNEwLr8KrYB0N4+j6gEFlg+Ep0=;
 h=From:To:Subject:Date:Message-Id;
 b=QZf+648r+B12kU7Qn0lk1cICFTyTn5JFY44WK/KDRIXwO5vQUKKUmtsYGGHTI8XPk
 sCtx1BzGPvEQwaYK9Vjve8YhyM7PznibOS6vXQmRYd/3DYfVuLKq/waI8fq5dwBayw
 8Tovga4SAylB+zEOggYEfPC4+q+vENmWwthAxiJg=
X-QQ-mid: esmtpgz12t1750382187t7a3389cc
X-QQ-Originating-IP: sQXtZrTrRWkPHpCLRXEKYqYrB1xzMxgT06FWXQbhkTQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 20 Jun 2025 09:16:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7161152192131492949
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH RESEND] drm/bridge-connector: Fix bridge in
 drm_connector_hdmi_audio_init()
Date: Fri, 20 Jun 2025 09:16:16 +0800
Message-Id: <20250620011616.118-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MNbA5mkmBXEJ+oiabOQH/V5BQ0gN7VC4M5BfnywqB7rFvvU9EzFIFzjv
 ifBUC8nDdtz9VJIkLFy0IkuX8zwdlTPfL+LrD0BzVfP8zdsWsVqq3C83bIfHudPkB036UmT
 rAPVAh1oQKiAk7Y9HKDuCqrsoPdcntox6dykoofx2m1HH+TJdIFqvgXUFeNVo9BSJliVREP
 PErLT1zH3Fssw8KaKIEAmcAUXYz1AifHPjnScxzUf/xjrnd/lvFZZHERPM7S/LF3JC9hZZJ
 xfc/fIdGw/jt1/OJjb0VKKKmLtNKJwk3m1NkA2i+/k3vrX1BRL5ojApzzUhZJINIbcz35rn
 vJ6naiVjEmDadGWjyMbJKxwtB/Lr0selEzocEJ9JHOvBJ7bbn6SNHoW3Afcr3CvQyxyumpo
 Ey/X4D6U5H/lTXp1CwQahQyQAACWes4xdZZE8tsa67bOYVImPWFDwf7qn1RfzXY1v9HOwfy
 Iu1fXCDkhhdKGQ6P421cvVc6tpM06kVgo1/WMqX8Ok8Zs93Y7Fkjpy6ylZbawsx+l1+XJkA
 mzrpBkOxgIHTO/grXHvJCRqLQ+MyxuNT6fCbqAzRG7797ySzb7y3yFaJoqJxT/YeVHleS5p
 O3kP7V2zxlyppZa4xZOlN25iFuv8LQsXF63Xxjmwg0fEIpIo8iUKsSRMjlGkEbOTX+xbBrf
 A2oVdckvf7I3M4QmkMojQ8/q3gt6+pFf3T9E5gM7UtfrOHkIriLzQfhdpVZtHv+MiMWjqFY
 W+3JZ8bAXPCZ3uu0q7Vl8j40pY3crpXaWUdTwWKhGYPljLA0T+mzYNYNt1nb3z1VA62P18y
 p3G/I/m+eTm2tL2LOMZU8G0KkLZ4SkLAvNDNrtyqrI7RDwMv0pNn1xC4DVZmUeH65duLX8z
 u+30rERZRkSDNHNLCOeMobp/+/vjC2f5lQQz6rZbxjpn+GgfLxyDcF7SZN/baYLbdzKnvdM
 wmT1fCGImBTXdsQK5/om9k2ow
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The bridge used in drm_connector_hdmi_audio_init() does not correctly
point to the required audio bridge, which lead to incorrect audio
configuration input.

Fixes: 231adeda9f67 ("drm/bridge-connector: hook DisplayPort audio support")
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 7d2e499ea5de..262e93e07a28 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -708,11 +708,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (bridge_connector->bridge_hdmi_audio ||
 	    bridge_connector->bridge_dp_audio) {
 		struct device *dev;
+		struct drm_bridge *bridge;
 
 		if (bridge_connector->bridge_hdmi_audio)
-			dev = bridge_connector->bridge_hdmi_audio->hdmi_audio_dev;
+			bridge = bridge_connector->bridge_hdmi_audio;
 		else
-			dev = bridge_connector->bridge_dp_audio->hdmi_audio_dev;
+			bridge = bridge_connector->bridge_dp_audio;
+
+		dev = bridge->hdmi_audio_dev;
 
 		ret = drm_connector_hdmi_audio_init(connector, dev,
 						    &drm_bridge_connector_hdmi_audio_funcs,
-- 
2.49.0


