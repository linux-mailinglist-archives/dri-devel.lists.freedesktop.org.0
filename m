Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F3F16B4BA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 00:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E566E87E;
	Mon, 24 Feb 2020 23:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167936E87E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 23:01:23 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F10CE89;
 Tue, 25 Feb 2020 00:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582585281;
 bh=ybe35MCjBdIPP3xnCXWoKaPifWrS+a1+Miveyp6DapY=;
 h=From:To:Cc:Subject:Date:From;
 b=Z/5/dJmrPwOc5IEGwohBDJ9LRLpe6/hGwquv1N5/AnZdht0rzni0QDGjpea0OdljG
 gjDYdLEAjVhThcBrT7EjEBllJpLHyu8r5YMtk2cRqo5dK8ACjiWbfO1oA3RRclTCgf
 et2qoyhY2kW5naF3Eedhqzx1FrS/MRKW/3NO/lhk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: lvds-codec: Constify the drm_bridge_funcs
 structure
Date: Tue, 25 Feb 2020 01:00:56 +0200
Message-Id: <20200224230056.2157-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_bridge_funcs structure is never modified, make it const. Making
it read-only can improve security as the structure contains function
pointers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/lvds-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index ae173d84dc8f..f7ae28ed1c14 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -50,7 +50,7 @@ static void lvds_codec_disable(struct drm_bridge *bridge)
 		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio, 1);
 }
 
-static struct drm_bridge_funcs funcs = {
+static const struct drm_bridge_funcs funcs = {
 	.attach = lvds_codec_attach,
 	.enable = lvds_codec_enable,
 	.disable = lvds_codec_disable,
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
