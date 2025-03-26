Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3DFA7147A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847E010E104;
	Wed, 26 Mar 2025 10:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="ZrmSPME3";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="dbgKxfsT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B03910E104
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1742983899; x=1774519899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gcPX+MhjshuhvQyvdiQ0n7EixqOoTHSCclQvp5UsEFA=;
 b=ZrmSPME3DoHwxmok7PI+UCrIfdLC0QOhhsVRHh0HOAay93amPMREpzdy
 Wuf6fa/kg+J/HdAHdMVhrM3keSatGej8S1kPFEdGh7qHBGIir2dhm/CSD
 sJKt9fnVCKB8okQSsH81GtA/6ARjNyj62T3Sn7R7xumFiTAxGIoRpy3st
 dPi88GbS89e48dEsy39+jqOiEtLLLQWyaac8/3KRRKtgU9plbQVSYXxXD
 Eo/ZGTBeEEd9/AiyoK1WT42SvODay1oWisN0Tt+NKf81o86wZzUF7F/g3
 3hCP/gP3lG1YOX3g4TvT+Dx32Nntk58tUs1qYQD9SrlzUzU+gygx75lsW w==;
X-CSE-ConnectionGUID: vhz97e2HTFquRzcrZIGHDw==
X-CSE-MsgGUID: peAVOKBtQWmqrIvCUMu0ZQ==
X-IronPort-AV: E=Sophos;i="6.14,277,1736809200"; d="scan'208";a="43167020"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 26 Mar 2025 11:11:33 +0100
X-CheckPoint: {67E3D2D4-3A-2417938-F0170C2B}
X-MAIL-CPID: 6A3CDC2D590C636681E70A4B03ACA4A3_2
X-Control-Analysis: str=0001.0A006396.67E3D2CC.0093, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DAD48166EFA; Wed, 26 Mar 2025 11:11:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1742983888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gcPX+MhjshuhvQyvdiQ0n7EixqOoTHSCclQvp5UsEFA=;
 b=dbgKxfsTjezsKLfDY5Gzv+v2w5Q0ipknSkPV7sC5ZDaz0s6BxuAIhLb3smJVHAwM6thDPw
 ApQVdxLPk2fttq26zUP4KY8+dCrzz1FB7tsoL94nXklcD335CeO9HWcrMbZRhCX8JTapVY
 qTn2LKM/+E0uQrpqWxxr0zbUmlAWjyycq7LecR9PWradZhgRJAVzzlZIhq5Wac7EVYkFY4
 wMICdbFJNFPqNi+UAroGqxf6rZgT7tGhCMymGicVHd5fKOAlrqQih0ikEQoC+JFP1jWUgf
 HR2gJ8GvN4cap47f2nHmDHWuoZMSlhdzgnVPPRt67bG0VkEVHabXuHCL9jobJw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/bridge: sii902x: Set bridge type
Date: Wed, 26 Mar 2025 11:11:23 +0100
Message-ID: <20250326101124.4031874-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
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

This is a RGB to HDMI bridge, so set the bridge type accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 914a2609a685f..ab70df3b60eb8 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1138,6 +1138,7 @@ static int sii902x_init(struct sii902x *sii902x)
 	sii902x->bridge.of_node = dev->of_node;
 	sii902x->bridge.timings = &default_sii902x_timings;
 	sii902x->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
+	sii902x->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 
 	if (sii902x->i2c->irq > 0)
 		sii902x->bridge.ops |= DRM_BRIDGE_OP_HPD;
-- 
2.43.0

