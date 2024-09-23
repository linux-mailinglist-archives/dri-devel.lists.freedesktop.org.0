Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B724983FC8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A1110E248;
	Tue, 24 Sep 2024 07:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=steffen.cc header.i=@steffen.cc header.b="D7kmXpfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 530 seconds by postgrey-1.36 at gabe;
 Mon, 23 Sep 2024 07:57:17 UTC
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6F110E177
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 07:57:17 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4XBw8l6zfSz9smr;
 Mon, 23 Sep 2024 09:48:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steffen.cc; s=MBO0001; 
 t=1727077704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bdfSuHfCrlx1wGjfrH9+twPjEUAgZch4w9adGVm82oY=;
 b=D7kmXpfSvAQJkUPYM8fyZbQJa8g6pOf/z5DXlJjNLbi2ebZWbDwaW2WOeRCcoBi3ykoTUo
 iG4k2PHk/OC8h0lqV1fth93Nx024PjWBuUvxi1fPhNSiB92TQ6054jRsEbFBnZam6gFRIU
 NDmJS2yiOefOqtjSDrKq3D/1vWto4Qe1sduRZAIcdMExaCeN5D8rtYhQub4P5Gp5aRgtR8
 N1ssqgbpVsIMO1yrcidpV9R82vjqdADEcMqFCKVZQcpKdAxeL2EQf+JaSDxCkXVXFi+RzQ
 F10CPZHTmJGrXigu5aIi8tx7ppQNhWvZsdTkgOa6Vj1TNtax145KcTvSw7+Adg==
From: lists@steffen.cc
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Steffen Dirkwinkel <lists@steffen.cc>,
 Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: xlnx: zynqmp_dpsub: also call drm_helper_hpd_irq_event
Date: Mon, 23 Sep 2024 09:48:03 +0200
Message-ID: <20240923074803.10306-1-lists@steffen.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4XBw8l6zfSz9smr
X-Mailman-Approved-At: Tue, 24 Sep 2024 07:59:31 +0000
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

From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>

With hpd going through the bridge as of commit eb2d64bfcc17
("drm: xlnx: zynqmp_dpsub: Report HPD through the bridge")
we don't get hotplug events in userspace on zynqmp hardware.
Also sending hotplug events with drm_helper_hpd_irq_event works.

Fixes: eb2d64bfcc17 ("drm: xlnx: zynqmp_dpsub: Report HPD through the bridge")
Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 1846c4971fd8..cb823540a412 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -17,6 +17,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
 
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -1614,6 +1615,9 @@ static void zynqmp_dp_hpd_work_func(struct work_struct *work)
 					    hpd_work.work);
 	enum drm_connector_status status;
 
+	if (dp->bridge.dev)
+		drm_helper_hpd_irq_event(dp->bridge.dev);
+
 	status = zynqmp_dp_bridge_detect(&dp->bridge);
 	drm_bridge_hpd_notify(&dp->bridge, status);
 }
-- 
2.46.1

