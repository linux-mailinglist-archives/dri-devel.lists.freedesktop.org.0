Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D80C495D35
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 11:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8427B10E9C1;
	Fri, 21 Jan 2022 10:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Fri, 21 Jan 2022 10:04:04 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1C310E9C9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 10:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1642759444; x=1674295444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2DqpC0yy0TkbIYYMKomD9QegPjZZRZ98zSXyYRDPoXg=;
 b=VKuS3OvTcK6F4WeW14QRcAGXOIszx10qL/Yb2AaGKZ17jm8ZkMtbsPL1
 qXjPuQGhMcXOgZFwZKmx87OFmqUPZNXN5cSYLds+KOKHxmZ7+UKbi5V0X
 jBwE4raKSyK0rK30zJ3fOKsZny3uUBhe2PX4JwTMmcLBfyBC4pJ7W1vHt
 gls2Qpw8cJ4UpyspZp4ItF6qcHtKJ0tVAR+nv0IWF070Pqct439VQdqYL
 Y5+cmoZ0gJiYxjNcjF9Oh/4Scs9SSB/yf9hRfVHjRdwCknQ6QYyqGeSwQ
 ExnkKi+9xhctBKN1aYBSQDtELY0k5x502ng7buULZ1JyQ2TB2Neqvjbfw A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635199200"; d="scan'208";a="21635078"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 21 Jan 2022 10:56:51 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 21 Jan 2022 10:56:51 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 21 Jan 2022 10:56:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1642759011; x=1674295011;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2DqpC0yy0TkbIYYMKomD9QegPjZZRZ98zSXyYRDPoXg=;
 b=NWbUEQuF60WWozQe5zWG2F24dpkrm9nHxSZhBMqak7f9iPTmSCX8DlL/
 FcI7LoO/CH8ndS8nyQmHJiXuIycCaoC1q0kYEC9iK5NzFUnrdZLKXKQsh
 nDgdpeF485j/qT6qYrXmYNTFl4QFP3jB7dD3EsWTZdyH+5z88SGNAwDr/
 51w2uKI04Y1Cp1iK7CGdL8nSLvZitwZdE03PI7P4gG5sB/E3DDlRWNf1J
 m9ey3Yte6lscvqG0vBd1EmUZJFgzLyp//MDg71q34uNsmLxhnAoiBa+tF
 ID37u8ksvC3jFweFLqVsDyyjSGx70U8hhdkDSmrhKw5D5n9vxkMsyRhRg A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635199200"; d="scan'208";a="21635077"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Jan 2022 10:56:51 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BF9AD280065;
 Fri, 21 Jan 2022 10:56:50 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/1] drm: mxsfb: Use dev_err_probe() helper
Date: Fri, 21 Jan 2022 10:56:44 +0100
Message-Id: <20220121095644.329256-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
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

Use the dev_err_probe() helper, instead of open-coding the same
operation. This also adds a nice hint in
/sys/kernel/debug/devices_deferred.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Based on next-20220120

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 86d78634a979..bc0d766d217b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -258,8 +258,7 @@ static int mxsfb_load(struct drm_device *drm,
 
 	ret = mxsfb_attach_bridge(mxsfb);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
+		dev_err_probe(drm->dev, ret, "Cannot connect bridge\n");
 		goto err_vblank;
 	}
 
-- 
2.25.1

