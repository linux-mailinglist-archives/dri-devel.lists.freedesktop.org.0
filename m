Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0CDB16873
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 23:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDFB10E6ED;
	Wed, 30 Jul 2025 21:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=nicusor.huhulea@siemens.com header.b="OQnyxUHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 602 seconds by postgrey-1.36 at gabe;
 Wed, 30 Jul 2025 16:23:18 UTC
Received: from mta-64-225.siemens.flowmailer.net
 (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5725C10E6B3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 16:23:18 +0000 (UTC)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id
 202507301613159c209677bbc0080fdf
 for <dri-devel@lists.freedesktop.org>;
 Wed, 30 Jul 2025 18:13:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=nicusor.huhulea@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=YFPzJYoDv3cX+8o/GvSkSkoQ51LHu7AECjzM4Hsiq/U=;
 b=OQnyxUHD5CsAuL9spD+tylm+gUMS42osIg5+Pz8wfGHWjkYP3maOoQjmUpfjRO7BEMe6XI
 n+0RNaAGAvvn+PgdgU6NGC9zs6VnMjXQT/M4wBBHHWrDoosgfSArgqwu9xUOnok6qCa2+Wdy
 33WMdR11z4kiDcMbb3w6b0GmUMjojVuJL/yVvPlQKudonxYSknWC+33q2A0hYbUUISPgUksw
 DhAbgeQLKWz4WLnVeOgrHgrRMVrbWSiNoS5t45uSN5CFtuX/luPAfM5Z5ShoF+MFkteMAWq/
 e2IjBnekR2aNq1Fyab2hgXllDLVC8abdxIIyTOvWwfEOqoB4uiGexfmg==;
From: Nicusor Huhulea <nicusor.huhulea@siemens.com>
To: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: cip-dev@lists.cip-project.org, imre.deak@intel.com,
 jouni.hogander@intel.com, neil.armstrong@linaro.org,
 jani.nikula@linux.intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, laurentiu.palcu@oss.nxp.com,
 cedric.hombourger@siemens.com, shrikant.bobade@siemens.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Nicusor Huhulea <nicusor.huhulea@siemens.com>
Subject: [PATCH 4/5] drm/probe-helper: enable and disable HPD on connectors
Date: Wed, 30 Jul 2025 19:11:05 +0300
Message-Id: <20250730161106.80725-5-nicusor.huhulea@siemens.com>
In-Reply-To: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
References: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1331196:519-21489:flowmailer
X-Mailman-Approved-At: Wed, 30 Jul 2025 21:46:19 +0000
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

commit c8268795c9a9cc7be50f78d4502fad83a2a4f8df upstream

This is not a direct cherry-pick of the upstream commit.
Only the helper functions required as dependencies for
"drm/i915: Fix HPD polling, reenabling the output poll work as needed"
were extracted from the original commit. The rest of the code was not
applied, as the codebase has diverged significantly from upstream.

This partial adaptation ensures that the required drm_connector_helper_funcs
are available for the dependent fix, while minimizing changes to the existing code.

Introduce two drm_connector_helper_funcs: enable_hpd() and disable_hpd().
They are called by drm_kms_helper_poll_enable() and
drm_kms_helper_poll_disable() (and thus drm_kms_helper_poll_init() and
drm_kms_helper_poll_fini()) respectively.

This allows DRM drivers to rely on drm_kms_helper_poll for enabling and
disabling HPD detection rather than doing that manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20221102180705.459294-3-dmitry.baryshkov@linaro.org
Signed-off-by: Nicusor Huhulea <nicusor.huhulea@siemens.com>
---
 include/drm/drm_modeset_helper_vtables.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 6f19cf5c210e..54f4848a655a 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1144,6 +1144,28 @@ struct drm_connector_helper_funcs {
 	 */
 	void (*cleanup_writeback_job)(struct drm_writeback_connector *connector,
 				      struct drm_writeback_job *job);
+
+	/**
+	 * @enable_hpd:
+	 *
+	 * Enable hot-plug detection for the connector.
+	 *
+	 * This operation is optional.
+	 *
+	 * This callback is used by the drm_kms_helper_poll_enable() helpers.
+	 */
+	void (*enable_hpd)(struct drm_connector *connector);
+
+	/**
+	 * @disable_hpd:
+	 *
+	 * Disable hot-plug detection for the connector.
+	 *
+	 * This operation is optional.
+	 *
+	 * This callback is used by the drm_kms_helper_poll_disable() helpers.
+	 */
+	void (*disable_hpd)(struct drm_connector *connector);
 };
 
 /**
-- 
2.39.2

