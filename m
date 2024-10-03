Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265AD98EE34
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804A310E815;
	Thu,  3 Oct 2024 11:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V4q0ZjYF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AC110E820;
 Thu,  3 Oct 2024 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727955206; x=1759491206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VVMqQcBdcou5qUEVhJvQfq/RY710EKN0rEC7SgU3fEs=;
 b=V4q0ZjYF7Hgd99ZvlpDOH0SjfLTUsnHt2ZcpgZeJZE2+yq8LvjxsGZWo
 uxY+r243wr76uQTSuKphvefiu6Lhvi1biNaKbc8ftZxZ02Sde0SZwVR+0
 giStBi5NqHOfCCUdOKjuhxpTsSfUuDMwRsi3j5BfPYNIBHIjC1dewHnHF
 AWN1hQnvayfC8yO4pcZaGWfNL41UNqBNqnRJ5KJFnhmre7mNjTUnqabH3
 9jpJrwe0gSfaMz0kDnlNkQx0cT+e/1NjNs6FEQINh+hZwTWQUupGQokBw
 umKIYUdSdVNwuQx/BWnEyfqR46tSpkMbD2SDhD20pGK+jYGPkpNcMseOD A==;
X-CSE-ConnectionGUID: sPnx60oaToasSih9Hb84NA==
X-CSE-MsgGUID: OxOMEJr1T0Sk1AcWszsmtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38503011"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="38503011"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:33:26 -0700
X-CSE-ConnectionGUID: QezMuPH3Th2JXqQXnJH8Zw==
X-CSE-MsgGUID: HcT+6jStSYy4FwjamWFGPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74426551"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:33:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:33:23 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/8] drm/client: s/new_crtc/crtc/
Date: Thu,  3 Oct 2024 14:33:02 +0300
Message-ID: <20241003113304.11700-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Rename the 'new_crtc' variable to just 'crtc' in
drm_client_firmware_config(). We don't call any of the other
stuff in here new or old so this feels out of place.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 3e49448370c4..b82bb3119cb2 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -638,7 +638,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	for (i = 0; i < count; i++) {
 		struct drm_connector *connector;
 		struct drm_encoder *encoder;
-		struct drm_crtc *new_crtc;
+		struct drm_crtc *crtc;
 		const char *mode_type;
 
 		connector = connectors[i];
@@ -680,7 +680,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 
 		num_connectors_enabled++;
 
-		new_crtc = connector->state->crtc;
+		crtc = connector->state->crtc;
 
 		/*
 		 * Make sure we're not trying to drive multiple connectors
@@ -688,7 +688,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 * match the BIOS.
 		 */
 		for (j = 0; j < count; j++) {
-			if (crtcs[j] == new_crtc) {
+			if (crtcs[j] == crtc) {
 				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] fallback: cloned configuration\n",
 					    connector->base.id, connector->name);
 				goto bail;
@@ -711,7 +711,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		/* last resort: use current mode */
 		if (!mode_valid(&modes[i])) {
 			mode_type = "current";
-			drm_mode_copy(&modes[i], &new_crtc->state->mode);
+			drm_mode_copy(&modes[i], &crtc->state->mode);
 		}
 
 		/*
@@ -723,11 +723,11 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			mode_type = "non tiled";
 			drm_mode_copy(&modes[i], drm_connector_fallback_non_tiled_mode(connector));
 		}
-		crtcs[i] = new_crtc;
+		crtcs[i] = crtc;
 
 		drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
 			    connector->base.id, connector->name,
-			    new_crtc->base.id, new_crtc->name,
+			    crtc->base.id, crtc->name,
 			    mode_type, modes[i].name);
 
 		fallback = false;
-- 
2.45.2

