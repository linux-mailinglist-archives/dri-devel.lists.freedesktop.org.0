Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 361256F463F
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 16:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BD610E595;
	Tue,  2 May 2023 14:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53E110E58D;
 Tue,  2 May 2023 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683038390; x=1714574390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nyxfMibiYNqWLraqnbeUXS/hUz6TDj1CET5IEus4gqQ=;
 b=BmQThrzTE79FBNzV/CGSYz1lEVfDk0OT0Gu4p1F7fK/6Yfwab5s59H1f
 OckUmTDZrlTM0elgeXl1bGhCSvLKofZdxCGcxMhESyWiomTE8QoWK3TMY
 lc0YBwdYh9tljmd9yFAj/AKJvBHdKz144cHLWt7h8HcKIHabDG0tSQVWk
 +0FOIhdI2SRM1/yu3X+RxFp8f/J+8MqAoHRN0u8hbZYDfWsbUVHMJDxmG
 mjaUEsc5qP1YNuXeycvo3Sa8VANanmCpXCm9xLaBokIedUKeEYWzYeOG8
 Vdv1WtHow+UQ0fjUcJ2ZmSJfVGMALBPNC44fGXqcNJ88pQ2mkPzkp0xCP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="351396993"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="351396993"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 07:39:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="698991880"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="698991880"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 02 May 2023 07:39:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 May 2023 17:39:44 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/11] drm/i915: Drop some redundant eDP checks
Date: Tue,  2 May 2023 17:39:05 +0300
Message-Id: <20230502143906.2401-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

There's no need to check for both eDP and fixed_mode when
deciding whether to do the pfit calculations or not.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9ac199444155..6bc7ff0c4320 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1044,7 +1044,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
 		return MODE_H_ILLEGAL;
 
 	fixed_mode = intel_panel_fixed_mode(connector, mode);
-	if (intel_dp_is_edp(intel_dp) && fixed_mode) {
+	if (fixed_mode) {
 		status = intel_panel_mode_valid(connector, mode);
 		if (status != MODE_OK)
 			return status;
@@ -2175,7 +2175,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 		intel_audio_compute_config(encoder, pipe_config, conn_state);
 
 	fixed_mode = intel_panel_fixed_mode(connector, adjusted_mode);
-	if (intel_dp_is_edp(intel_dp) && fixed_mode) {
+	if (fixed_mode) {
 		ret = intel_panel_compute_config(connector, adjusted_mode);
 		if (ret)
 			return ret;
-- 
2.39.2

