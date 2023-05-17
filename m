Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B9A7067EF
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 14:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F0C10E416;
	Wed, 17 May 2023 12:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2FC10E416
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 12:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1684326074; x=1715862074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SUFh3N3WI6LJHs4Tb4cavLoyJwWTG/jZH6Px9P+g+Vs=;
 b=c2pb2y0OzDOFyT4XCldqTpNc4sOeHK7+B63xgj/8MkevMlJ2LeafkFsw
 hZwQ60I8CECdiyCn4hj9BgJEAYHZTWV59pFYOyyvovfIzvmEOIGbthWK5
 wwrQYICEqP7u1tljMyN1sTZTzJW1bVwC9TyBlVh43lkvXod8HzknagoKf
 Ltaqf0+LSvQ4QkbFOpmKSQyuWFtlp1TWmeqhhVX4lFNq9bEnUoi/HaJVa
 N9uAMqi5VfGt+dQP/ejSi5Pgy3y2i7fD6eEeyo1pnJ85DkxnBSyhtiFXI
 krysU2U2N/ydyyGWoaYnYfp2pDvOc/4Y/9JTCFHs8WVU/0PBxRCgOVwpA Q==;
X-IronPort-AV: E=Sophos;i="5.99,282,1677538800"; d="scan'208";a="30961808"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 17 May 2023 14:21:11 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 17 May 2023 14:21:11 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 17 May 2023 14:21:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1684326071; x=1715862071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SUFh3N3WI6LJHs4Tb4cavLoyJwWTG/jZH6Px9P+g+Vs=;
 b=mbEChUPBvJ+j8k4ESYb0qayC156/hW/S+ezBXLTUttRkVKKue1q5TXLn
 NgjUuLEEXbztBfIZvCMLRWlpK3a/mDDPql0AskscsjPRZC0pYFKaVSEob
 oMOfgzQsMX/CH/ndFzlLmWzOO1KjNYFN/JmGjQFNnNBvoFM3BSBhRTPiY
 8g3aEYFYIWXQ4mNHFWbuPBG8KiO5RGcJhb8NJk2ktlqG/gwlLbwP9Twqo
 fMT38xB6nIW6A/eZm/clAXUHIMvZ1NJJjtS1kpxas/areGVQfGM9s5Tn/
 jgZfZ1phwH0yFjCrN/GGEMYQFtMPuUuVmos7C5qoQkT+kjGtsqeERc9A+ g==;
X-IronPort-AV: E=Sophos;i="5.99,282,1677538800"; d="scan'208";a="30961807"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 May 2023 14:21:11 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 00C1A28008A;
 Wed, 17 May 2023 14:21:10 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm/bridge: tc358767: Switch to devm MIPI-DSI helpers
Date: Wed, 17 May 2023 14:21:06 +0200
Message-Id: <20230517122107.1766673-1-alexander.stein@ew.tq-group.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI device registering and attaching needs to be undone upon
deregistration. This fixes module unload/load.

Fixes: bbfd3190b656 ("drm/bridge: tc358767: Add DSI-to-DPI mode support")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Just for the record the (reduced) call trace:
sysfs: cannot create duplicate filename '/devices/platform/soc@0/32c00000.bus/32e60000.dsi/32e60000.dsi.0'
CPU: 2 PID: 445 Comm: modprobe Not tainted 6.4.0-rc2-next-20230517+ #1682 5d8500234c8d4f852cf1af088c7787a58761a89a
Hardware name: TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MPxL (DT)
Call trace:
 dump_backtrace+0x94/0x110
 show_stack+0x14/0x1c
 dump_stack_lvl+0x44/0x58
 dump_stack+0x14/0x1c
 sysfs_warn_dup+0x60/0x78
 sysfs_create_dir_ns+0xdc/0xf4
 create_dir+0x28/0x108
 kobject_add_internal+0x88/0x204
 kobject_add+0x90/0x104
 device_add+0xf8/0x4fc
 mipi_dsi_device_register_full.part.0+0xc4/0x148
 mipi_dsi_device_register_full+0x1c/0x58
 tc_mipi_dsi_host_attach+0xa0/0x140 [tc358767 28feaae6fd7f7414a09273d9032c2a0e1f2a8870]
 tc_probe+0x364/0x528 [tc358767 28feaae6fd7f7414a09273d9032c2a0e1f2a8870]
 i2c_device_probe+0x100/0x2d8

 drivers/gpu/drm/bridge/tc358767.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 37731aaa45f4..82f9fe14e5f9 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2108,7 +2108,7 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
 	if (dsi_lanes < 0)
 		return dsi_lanes;
 
-	dsi = mipi_dsi_device_register_full(host, &info);
+	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
 	if (IS_ERR(dsi))
 		return dev_err_probe(dev, PTR_ERR(dsi),
 				     "failed to create dsi device\n");
@@ -2119,7 +2119,7 @@ static int tc_mipi_dsi_host_attach(struct tc_data *tc)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	ret = mipi_dsi_attach(dsi);
+	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
 		dev_err(dev, "failed to attach dsi to host: %d\n", ret);
 		return ret;
-- 
2.34.1

