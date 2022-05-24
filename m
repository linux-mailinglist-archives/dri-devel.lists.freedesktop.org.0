Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB2B5327F8
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C1F10F4E4;
	Tue, 24 May 2022 10:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E04610F4DF;
 Tue, 24 May 2022 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388833; x=1684924833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CLMMGfqQw+LqplHZ+nvlRtkLb7Vb1hLYrmsom04awX4=;
 b=oEhUThLvCf63hjFp6bXwCJwC4V44j3MfOdJu0BmL/wg3Bd/ZCK0xxJ1x
 rTUsH5rOA4V/evtsJdB4CvAsSQhCRg/w666YFSAHt9sA9aCSKZTe/0jtc
 f8WfW2BC3FohJeWzE8IJOJHuNBW9MkKxiPFH1qHZsyumbRAMenVCh7uf/
 NNrkUlPFiYhuLRuXQuyYxdL0wXIqA9idRkAFZJTDRNMJkfMrxa4TqZG68
 8aLweMbKTtywTCgbIzWPFPxUcbDPfzYue3pVR/PA48ouHWtdj1MPcy338
 p9iZ2HM9atXTqM7tb3YpQwYuq8KVCSOrsRAiQdJnXVrrY6ogAQCco8kKK A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="261101200"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="261101200"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="548412038"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 06/13] drm/probe-helper: make .get_modes() optional,
 add default action
Date: Tue, 24 May 2022 13:39:28 +0300
Message-Id: <a38b2547f43e827a401a4123744edbb402e9f4d7.1653381821.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653381821.git.jani.nikula@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add default action when .get_modes() not set. This also defines what a
.get_modes() hook should do.

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c       | 14 +++++++++++++-
 include/drm/drm_modeset_helper_vtables.h |  4 ++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 836bcd5b4cb6..9df17f0ae225 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -360,7 +360,19 @@ static int drm_helper_probe_get_modes(struct drm_connector *connector)
 		connector->helper_private;
 	int count;
 
-	count = connector_funcs->get_modes(connector);
+	if (connector_funcs->get_modes) {
+		count = connector_funcs->get_modes(connector);
+	} else {
+		const struct drm_edid *drm_edid;
+
+		/* Note: This requires connector->ddc is set */
+		drm_edid = drm_edid_read(connector);
+
+		/* Update modes etc. from the EDID */
+		count = drm_edid_connector_update(connector, drm_edid);
+
+		drm_edid_free(drm_edid);
+	}
 
 	/*
 	 * Fallback for when DDC probe failed in drm_get_edid() and thus skipped
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index fafa70ac1337..b4402bc64e57 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -894,6 +894,10 @@ struct drm_connector_helper_funcs {
 	 * libraries always call this with the &drm_mode_config.connection_mutex
 	 * held. Because of this it's safe to inspect &drm_connector->state.
 	 *
+	 * This callback is optional. By default, it reads the EDID using
+	 * drm_edid_read() and updates the connector display info, modes, and
+	 * properties using drm_edid_connector_update().
+	 *
 	 * RETURNS:
 	 *
 	 * The number of modes added by calling drm_mode_probed_add().
-- 
2.30.2

