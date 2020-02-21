Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F916A1DE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36188973E;
	Mon, 24 Feb 2020 09:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Fri, 21 Feb 2020 16:58:41 UTC
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06756F4D4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 16:58:41 +0000 (UTC)
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id bc1b53dd
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Fri, 21 Feb 2020 08:52:02 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id EE6F748C57;
 Fri, 21 Feb 2020 16:51:53 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Torsten Duwe <duwe@lst.de>, Maxime Ripard <maxime@cerno.tech>,
 Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] drm/bridge: analogix-anx6345: fix set of link bandwidth
Date: Sat, 22 Feb 2020 00:51:27 +0800
Message-Id: <20200221165127.813325-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1582303919;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding;
 bh=YNbFrFHVB1l3mDgNrrl772T+WtA//BPVhMlOVwCxv2w=;
 b=CGpuMZckC4RiokZ8E/hXX2HzrZi04PYP127dKuQ0zyygfRpucOHsUVCrFfVVxuUPjKMhGE
 i+mn3cNlswA+wrkBj8iP1MGIySNiv10k9D/bXsv6YLywh16R+Agx4TDPjG1Pj1wp38zvmv
 YUBojk1AXs8ACNVGMe6E6ZydjLRFrsw=
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current code tries to store the link rate (in bps, which is a big
number) in a u8, which surely overflow. Then it's converted back to
bandwidth code (which is thus 0) and written to the chip.

The code sometimes works because the chip will automatically fallback to
the lowest possible DP link rate (1.62Gbps) when get the invalid value.
However, on the eDP panel of Olimex TERES-I, which wants 2.7Gbps link,
it failed.

As we had already read the link bandwidth as bandwidth code in earlier
code (to check whether it is supported), use it when setting bandwidth,
instead of converting it to link rate and then converting back.

Fixes: e1cff82c1097 ("drm/bridge: fix anx6345 compilation for v5.5")
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index 56f55c53abfd..2dfa2fd2a23b 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -210,8 +210,7 @@ static int anx6345_dp_link_training(struct anx6345 *anx6345)
 	if (err)
 		return err;
 
-	dpcd[0] = drm_dp_max_link_rate(anx6345->dpcd);
-	dpcd[0] = drm_dp_link_rate_to_bw_code(dpcd[0]);
+	dpcd[0] = dp_bw;
 	err = regmap_write(anx6345->map[I2C_IDX_DPTX],
 			   SP_DP_MAIN_LINK_BW_SET_REG, dpcd[0]);
 	if (err)
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
