Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08586B20380
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E2510E3F2;
	Mon, 11 Aug 2025 09:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYu9/02T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764A010E3EB;
 Mon, 11 Aug 2025 09:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754904525; x=1786440525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dttlg+vgcxiB2RBGfwux8lXZdUR9YBGtB6WAMZ1/WfI=;
 b=XYu9/02T5oxQrm0S/I+OsaAGQ4Rzu/pbr9LT9zCR+bDzUTkeUixPJLu1
 uXjkvjR15GPyoTdPLS5tHas0QeWkj0XMG1slv+G35oIHAGuT9FEY5Wfk7
 RzCzfXmUFSZr3KuhElmscZvBFykNPruPX9ekkZVLIoYlzUMJWWY09XdZB
 QdgFlOPty+AuNNtPWuW3jlTVF9Rv7YuQJw7mNbdx1LvqEjKB+uaEt+dUO
 35zKNr2LXkxA0N9ZQROVUUYjx28fz5SNrTdccsjjXpCbABb/GJ2t0iklm
 UDSMl4A7BjnL6BoTWaFnyCnKxrh9cA7Os60LFgHuLx+AWv1/srcR8JzFT w==;
X-CSE-ConnectionGUID: iB5mC0BwST2rjBjMnapXVw==
X-CSE-MsgGUID: 1RJQfldMRc2umGHDPIBl2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57218125"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57218125"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 02:28:44 -0700
X-CSE-ConnectionGUID: BDq5bjwtSguuy60OrkqfTQ==
X-CSE-MsgGUID: lmOp1g74QUunVyQmQQWBSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165860505"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 02:28:35 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 jani.nikula@intel.com, dmitry.baryshkov@oss.qualcomm.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 robin.clark@oss.qualcomm.com, abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, laurent.pinchart+renesas@ideasonboard.com,
 mcanal@igalia.com, dave.stevenson@raspberrypi.com,
 tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [RFC PATCH 7/8] drm/rcar_du: Adapt vkms writeback to new
 drm_writeback_connector
Date: Mon, 11 Aug 2025 14:57:06 +0530
Message-Id: <20250811092707.3986802-8-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811092707.3986802-1-suraj.kandpal@intel.com>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that drm_writeback_connector is embedded with the drm_connector
adapt the rcar-du writeback functionality to this changes. This
includes changing the drm_writeback_connector to be changed to drm_connector
within the rcar_du_crtc.
Some other changes are done which are a result of the all the above
changes mentioned.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 ++--
 .../drm/renesas/rcar-du/rcar_du_writeback.c   | 22 +++++++++++--------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
index d0f38a8b3561..457c803d75bc 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h
@@ -72,11 +72,11 @@ struct rcar_du_crtc {
 	const char *const *sources;
 	unsigned int sources_count;
 
-	struct drm_writeback_connector writeback;
+	struct drm_connector connector;
 };
 
 #define to_rcar_crtc(c)		container_of(c, struct rcar_du_crtc, crtc)
-#define wb_to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, writeback)
+#define connector_to_rcar_crtc(c)	container_of(c, struct rcar_du_crtc, connector)
 
 /**
  * struct rcar_du_crtc_state - Driver-specific CRTC state
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 9986a10e8114..95e6810612c2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -47,10 +47,12 @@ static int rcar_du_wb_conn_get_modes(struct drm_connector *connector)
 				    dev->mode_config.max_height);
 }
 
-static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
+static int rcar_du_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 				  struct drm_writeback_job *job)
 {
-	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
+	struct drm_connector *connector =
+		container_of(wb_connector, struct drm_connector, writeback);
+	struct rcar_du_crtc *rcrtc = connector_to_rcar_crtc(connector);
 	struct rcar_du_wb_job *rjob;
 	int ret;
 
@@ -72,10 +74,12 @@ static int rcar_du_wb_prepare_job(struct drm_writeback_connector *connector,
 	return 0;
 }
 
-static void rcar_du_wb_cleanup_job(struct drm_writeback_connector *connector,
+static void rcar_du_wb_cleanup_job(struct drm_writeback_connector *wb_connector,
 				   struct drm_writeback_job *job)
 {
-	struct rcar_du_crtc *rcrtc = wb_to_rcar_crtc(connector);
+	struct drm_connector *connector =
+		container_of(wb_connector, struct drm_connector, writeback);
+	struct rcar_du_crtc *rcrtc = connector_to_rcar_crtc(connector);
 	struct rcar_du_wb_job *rjob = job->priv;
 
 	if (!job->fb)
@@ -199,7 +203,7 @@ static const u32 writeback_formats[] = {
 int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 			   struct rcar_du_crtc *rcrtc)
 {
-	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
+	struct drm_writeback_connector *wb_conn = &rcrtc->connector.writeback;
 
 	struct drm_encoder *encoder;
 
@@ -212,7 +216,7 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 
 	encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
 
-	drm_connector_helper_add(&wb_conn->base,
+	drm_connector_helper_add(&rcrtc->connector,
 				 &rcar_du_wb_conn_helper_funcs);
 
 	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
@@ -231,7 +235,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
 	struct drm_framebuffer *fb;
 	unsigned int i;
 
-	state = rcrtc->writeback.base.state;
+	state = rcrtc->connector.state;
 	if (!state || !state->writeback_job)
 		return;
 
@@ -246,10 +250,10 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
 		cfg->mem[i] = sg_dma_address(rjob->sg_tables[i].sgl)
 			    + fb->offsets[i];
 
-	drm_writeback_queue_job(&rcrtc->writeback, state);
+	drm_writeback_queue_job(&rcrtc->connector.writeback, state);
 }
 
 void rcar_du_writeback_complete(struct rcar_du_crtc *rcrtc)
 {
-	drm_writeback_signal_completion(&rcrtc->writeback, 0);
+	drm_writeback_signal_completion(&rcrtc->connector.writeback, 0);
 }
-- 
2.34.1

