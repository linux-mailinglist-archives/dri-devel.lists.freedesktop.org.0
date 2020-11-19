Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372232B9716
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 17:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D296E588;
	Thu, 19 Nov 2020 16:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10626E588
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 16:01:50 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJG1l4f097038;
 Thu, 19 Nov 2020 10:01:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605801707;
 bh=CEsT9nh8ru/oo5U3jUQuPPkclxULVMgJ+FhKgCp0i6E=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=xaHpfZFVDL1dW4MFkdXRPDjmBA3UN/657tG1OWlqgZho+BGVxvbOywoGPf/SS9yI0
 LDnhCdQNLeH7pCfUhEqy6mPSkfjC4PveJz2+dI824/hY4KRYM2ElcRiuRWe6TF2gEy
 ghDtPaHVcLxQuVsE05Do24y7ygnlL1hIebOygTIM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJG1lU2116182
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Nov 2020 10:01:47 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 19
 Nov 2020 10:01:47 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 19 Nov 2020 10:01:47 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJG1aps003251; 
 Thu, 19 Nov 2020 10:01:45 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v3 3/6] drm/bridge: mhdp8546: Add minimal format negotiation
Date: Thu, 19 Nov 2020 21:31:31 +0530
Message-ID: <20201119160134.9244-4-nikhil.nd@ti.com>
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

With new connector model, mhdp bridge will not create the connector and
SoC driver will rely on format negotiation to setup the encoder format.

Support minimal format negotiations hooks in the drm_bridge_funcs.
Complete format negotiation can be added based on EDID data.
This patch adds the minimal required support to avoid failure
after moving to new connector model.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---

Notes:
    changes from v1:
    * cosmetic fixes, commit message update

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d0c65610ebb5..2cd809eed827 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2078,6 +2078,30 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge *bridge)
 	return &cdns_mhdp_state->base;
 }
 
+static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state,
+				      u32 output_fmt,
+				      unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+	u32 default_bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
+
+	*num_input_fmts = 0;
+
+	if (output_fmt != MEDIA_BUS_FMT_FIXED)
+		return NULL;
+
+	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	*num_input_fmts = 1;
+	input_fmts[0] = default_bus_format;
+	return input_fmts;
+}
+
 static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 				  struct drm_bridge_state *bridge_state,
 				  struct drm_crtc_state *crtc_state,
@@ -2142,6 +2166,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
 	.atomic_duplicate_state = cdns_mhdp_bridge_atomic_duplicate_state,
 	.atomic_destroy_state = cdns_mhdp_bridge_atomic_destroy_state,
 	.atomic_reset = cdns_mhdp_bridge_atomic_reset,
+	.atomic_get_input_bus_fmts = cdns_mhdp_get_input_bus_fmts,
 	.detect = cdns_mhdp_bridge_detect,
 	.get_edid = cdns_mhdp_bridge_get_edid,
 	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
