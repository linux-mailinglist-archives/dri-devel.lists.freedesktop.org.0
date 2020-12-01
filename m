Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA862CA273
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 13:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4B36E52A;
	Tue,  1 Dec 2020 12:19:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2F06E52A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:19:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CIwNt082266;
 Tue, 1 Dec 2020 06:18:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606825138;
 bh=LE+pARLOaqjaxcnvMVLJsbBKEBltX8hYJihQUJd3QnA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=MdOAKjOR0wcghPf3XkbmbLLae/8E6sTqFT7hKZ2nxMoe6fSL03gUkEYDnIIDS/R+P
 m6dSCoe2PTUJakl7OeTnkplcL0jNB2HdY2xLl9gM358OquFXxnYVbWUrwvQM57qBbD
 xQNx4pFsxvQY3w45KWh9pF67s3rYF0mcGlNHygNE=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1CIw7j111096
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Dec 2020 06:18:58 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 06:18:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 06:18:57 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1CIn3N118162; 
 Tue, 1 Dec 2020 06:18:55 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: [PATCH v4 2/7] drm/bridge: tfp410: Set input_bus_flags in atomic_check
Date: Tue, 1 Dec 2020 17:48:25 +0530
Message-ID: <20201201121830.29704-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201121830.29704-1-nikhil.nd@ti.com>
References: <20201201121830.29704-1-nikhil.nd@ti.com>
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
Cc: Sekhar Nori <nsekhar@ti.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

input_bus_flags are specified in drm_bridge_timings (legacy) as well
as drm_bridge_state->input_bus_cfg.flags

The flags from the timings will be deprecated. Bridges are supposed
to validate and set the bridge state flags from atomic_check.

Implement atomic_check hook for the same.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 3def9acba86b..4c536df003c8 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -233,6 +233,20 @@ static u32 *tfp410_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+int tfp410_atomic_check(struct drm_bridge *bridge,
+		    struct drm_bridge_state *bridge_state,
+		    struct drm_crtc_state *crtc_state,
+		    struct drm_connector_state *conn_state)
+{
+	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
+
+	/*
+	 * There might be flags negotiation supported in future
+	 * Set the bus flags in atomic_check statically for now
+	 */
+	bridge_state->input_bus_cfg.flags = dvi->timings.input_bus_flags;
+}
+
 static const struct drm_bridge_funcs tfp410_bridge_funcs = {
 	.attach		= tfp410_attach,
 	.detach		= tfp410_detach,
@@ -243,6 +257,7 @@ static const struct drm_bridge_funcs tfp410_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_get_input_bus_fmts = tfp410_get_input_bus_fmts,
+	.atomic_check = tfp410_atomic_check,
 };
 
 static const struct drm_bridge_timings tfp410_default_timings = {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
