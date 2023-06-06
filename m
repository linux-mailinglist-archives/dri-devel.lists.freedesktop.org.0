Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B9723B4D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 10:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C8910E05A;
	Tue,  6 Jun 2023 08:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7BD10E05A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 08:22:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3568Lkvb038628;
 Tue, 6 Jun 2023 03:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1686039706;
 bh=VS8pLGzavRPRDee8Dc/PrcNO4RR5LuY8WkKTJA8aedc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=XeTz71y5kP0VQhFCE1iLlXoiAy5vHj9j3ttBTiMzN8IWqOLl+OWKPpqAvFsVPrXKY
 /IDtDHTdlCJ5Xp3uTMirgEjOjMSEBhbdONH9/t+2trOZlrO9L41Z8zbLZg+moZrRXD
 6Hb+qqzyLJQEJkf/y8uPHVtPjWS28fpd//HWGtIw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3568LkLq012391
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 6 Jun 2023 03:21:46 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 03:21:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 03:21:46 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3568LjUa090167;
 Tue, 6 Jun 2023 03:21:45 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v7 2/8] drm/bridge: tfp410: Set input_bus_flags in atomic_check
Date: Tue, 6 Jun 2023 13:51:36 +0530
Message-ID: <20230606082142.23760-3-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606082142.23760-1-a-bhatia1@ti.com>
References: <20230606082142.23760-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nikhil Devshatwar <nikhil.nd@ti.com>

input_bus_flags are specified in drm_bridge_timings (legacy) as well
as drm_bridge_state->input_bus_cfg.flags

The flags from the timings will be deprecated. Bridges are supposed
to validate and set the bridge state flags from atomic_check.

Implement atomic_check hook for the same.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---

Notes:
    changes from v4:
    * fix a warning Reported-by: kernel test robot <lkp@intel.com>

    changes from v5:
    * Move the return statement here from patch 4 (where it was added
      by mistake).

    changes from v6:
    * Add new line before return statement.
    * Add Neil Armstrong's R-b tag.

 drivers/gpu/drm/bridge/ti-tfp410.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 7dacc7e03eee..edf4d30f4f2a 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -228,6 +228,22 @@ static u32 *tfp410_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static int tfp410_atomic_check(struct drm_bridge *bridge,
+			       struct drm_bridge_state *bridge_state,
+			       struct drm_crtc_state *crtc_state,
+			       struct drm_connector_state *conn_state)
+{
+	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
+
+	/*
+	 * There might be flags negotiation supported in future.
+	 * Set the bus flags in atomic_check statically for now.
+	 */
+	bridge_state->input_bus_cfg.flags = dvi->timings.input_bus_flags;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs tfp410_bridge_funcs = {
 	.attach		= tfp410_attach,
 	.detach		= tfp410_detach,
@@ -238,6 +254,7 @@ static const struct drm_bridge_funcs tfp410_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_input_bus_fmts = tfp410_get_input_bus_fmts,
+	.atomic_check = tfp410_atomic_check,
 };
 
 static const struct drm_bridge_timings tfp410_default_timings = {
-- 
2.40.1

