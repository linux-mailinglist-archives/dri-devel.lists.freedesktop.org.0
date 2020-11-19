Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2D2B9714
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 17:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B916E56A;
	Thu, 19 Nov 2020 16:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE616E593
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 16:01:47 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJG1gD1003102;
 Thu, 19 Nov 2020 10:01:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605801702;
 bh=u1HyB5az2e+4f2qxnBc7bPIEkA33h3rHnh4zU3Ipf5g=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YFI1fTRIKu969Zguarksr272wpsD9YFXpSvM/4WliqoP8WljVESaLyPwOXKltrzFA
 dFMDPaw25h9n9OeAHbbVavR2fuy4W4aDI0VlFPl41A/9kDnV8LB25B+R5iyOUdRx4q
 m5NwaT0eKCEyhDJ1obxw76xVeC1dICUio4BEv8ME=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJG1ggT004120
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Nov 2020 10:01:42 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 19
 Nov 2020 10:01:42 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 19 Nov 2020 10:01:42 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJG1apq003251; 
 Thu, 19 Nov 2020 10:01:40 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 1/6] drm: bridge: Propagate the bus flags from
 bridge->timings
Date: Thu, 19 Nov 2020 21:31:29 +0530
Message-ID: <20201119160134.9244-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119160134.9244-1-nikhil.nd@ti.com>
References: <20201119160134.9244-1-nikhil.nd@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yuti Amonkar <yamonkar@cadence.com>, Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bus_flags can be specified by a bridge in the timings.
If the bridge provides it, Override the bus_flags when propagating
from next bridge.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---

Notes:
    changes from v2:
    * update comment
    changes from v1:
    * Check for timings
    * Prioritize timings flags over next bridge's flags

 drivers/gpu/drm/drm_bridge.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64f0effb52ac..13b67fc0dad3 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -975,6 +975,14 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
 	 * duplicate the "dummy propagation" logic.
 	 */
 	bridge_state->input_bus_cfg.flags = output_flags;
+
+	/*
+	 * If legacy bus flags are provided in bridge->timings, use those as
+	 * input flags instead of propagating the output flags.
+	 */
+	if (bridge->timings && bridge->timings->input_bus_flags)
+		bridge_state->input_bus_cfg.flags =
+			bridge->timings->input_bus_flags;
 }
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
