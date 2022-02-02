Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B766B4A6D2D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A8610FAC8;
	Wed,  2 Feb 2022 08:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9101210FAC1;
 Wed,  2 Feb 2022 08:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643791583; x=1675327583;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=oyaDZPlkWIb9cqs6WIQnOC9hhK1tj0C2B3259Gg41eA=;
 b=TsNNddTHMna3cREZn1gaHODZBMYvWTV6KV74oO8/vud+uA68rc1S0dmm
 Ffnc0XqeJnXYEcWx6UfXnGk7H90eWR8cvOOfQ6Bg5w4hi2rLWltr2ffK+
 aT4xrQweJIkmg100wJ0f7hTSB2jOFmsN0t6SliKFJzqXwuLkRoFoI4v5W
 88RJ8WsJmLtGPOgnjMiLSwZYVDMBGeuKNDS5O9j7gExoOdzmQn+C9kouc
 WwgaQ3n2Di9pAX/HH0Bl7SECoZg3LawdeCR999eplEwWUQvtqiVjVGuiR
 UU645p6Jwpt5R6L1H1jNIFI9IH/OXdIOVBBeP6vFRCjtf6Formty7l04g g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="245469282"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="245469282"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 00:46:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="497675038"
Received: from srr4-3-linux-116-skandpal.iind.intel.com ([10.190.238.57])
 by orsmga002.jf.intel.com with ESMTP; 02 Feb 2022 00:46:20 -0800
From: Kandpal Suraj <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/vkms: change vkms driver to use
 drm_writeback_connector.base pointer
Date: Wed,  2 Feb 2022 14:24:26 +0530
Message-Id: <20220202085429.22261-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202085429.22261-1-suraj.kandpal@intel.com>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
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
Cc: Kandpal Suraj <suraj.kandpal@intel.com>, carsten.haitzler@arm.com,
 jani.nikula@intel.com, quic_abhinavk@quicinc.com,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changing vkms driver to accomadate the change of
drm_writeback_connector.base to a pointer the reason for which is
explained in the Patch(drm: add writeback pointers to drm_connector).

Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 8694227f555f..374431471f49 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -114,7 +114,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_writeback_connector *wb_conn = &output->wb_connector;
-	struct drm_connector_state *conn_state = wb_conn->base.state;
+	struct drm_connector_state *conn_state = wb_conn->base->state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
 
 	if (!conn_state)
@@ -139,9 +139,12 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 {
 	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
+	struct vkms_output *output = &vkmsdev->output;
 
-	vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
-	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
+	wb->base = &output->connector;
+	wb->encoder = &output->encoder;
+	output->wb_connector.encoder->possible_crtcs = 1;
+	drm_connector_helper_add(wb->base, &vkms_wb_conn_helper_funcs);
 
 	return drm_writeback_connector_init(&vkmsdev->drm, wb,
 					    &vkms_wb_connector_funcs,
-- 
2.17.1

