Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29502902EA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 12:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981A289EFF;
	Fri, 16 Oct 2020 10:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC57489F3C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:39:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09GAddjq065435;
 Fri, 16 Oct 2020 05:39:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602844779;
 bh=TUEbuOqqpVMSnDBZZhbpTTRfQHK42fT2YDC0aO3R2Q0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Im0R24EDxypHuKKlW6fg4b6Ig0WRGhOfhY9mZRfQeOILXqxosYinm0tAglMtkffO6
 JondV4NB7R+JyTdlclrvZKt5qomjGBT/3b8vxYMWuogHtUxgT3mM8QpwRwjxsjyYxs
 AgbQ3z1WoIAiuwQzHuQkkpNR/u+Xbw/HDLXn0AFE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09GAddhS112615
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 16 Oct 2020 05:39:39 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 16
 Oct 2020 05:39:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 16 Oct 2020 05:39:39 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09GAdT1S110152; 
 Fri, 16 Oct 2020 05:39:37 -0500
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH 3/5] drm: bridge: Propagate the bus flags from bridge->timings
Date: Fri, 16 Oct 2020 16:09:15 +0530
Message-ID: <20201016103917.26838-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201016103917.26838-1-nikhil.nd@ti.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
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
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the next bridge does not specify any bus flags, use the
bridge->timings->input_bus_flags as fallback when propagating
bus flags from next bridge to current bridge.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 drivers/gpu/drm/drm_bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64f0effb52ac..8353723323ab 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -975,6 +975,13 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
 	 * duplicate the "dummy propagation" logic.
 	 */
 	bridge_state->input_bus_cfg.flags = output_flags;
+
+	/*
+	 * Use the bridge->timings->input_bus_flags as fallback if the next bridge
+	 * does not specify the flags
+	 */
+	if (!bridge_state->input_bus_cfg.flags)
+		bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;
 }
 
 /**
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
