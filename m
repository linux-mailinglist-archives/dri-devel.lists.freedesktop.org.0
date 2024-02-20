Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEF185C82E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1772410E5A3;
	Tue, 20 Feb 2024 21:18:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqYGnEbo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1D810E58D;
 Tue, 20 Feb 2024 21:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463927; x=1739999927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U4nbRTXbTuOgVHR/Vr9aBKqjw286qdX4862B3TKjuCg=;
 b=XqYGnEboOrLYvDzuYItPaI+u3N6/JcbSciFN2bj6gDNI+tHqwMxJH7o7
 fh0/twjgd8iXpkySUg8F+nVE+HBowO6/ePFBaZQI0WDMVhfw2sXim154R
 APhd8NKX1eM6TDAlZVutlV9DBT8fgzol7qFM4jxANUaNTuMgJXVD5d+qp
 4TKVeD03ieIZUdnaKt65S1wR7IyKHzr57oQ0gVRfhGMvkj/Dk0Z/62qTW
 BL5N8g613Mdszbs3g0zwBusWz/zRh5qcApz4Mb9so1Md5EzyVvT3k8yLY
 45UWJfBY53IgNqYerxUwZIf8XVzRXDKW8zDkWpr2Gxo/PQJdICtopsx8b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738677"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738677"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061644"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:45 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v2 18/21] drm/i915/dp: Call intel_dp_sync_state() always for
 DDI DP encoders
Date: Tue, 20 Feb 2024 23:18:38 +0200
Message-Id: <20240220211841.448846-19-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
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

A follow-up change will need to resume DP tunnels during system resume,
so call intel_dp_sync_state() always for DDI encoders, so this function
can resume the tunnels for all DP connectors.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index ed7301808604d..c587a8efeafcf 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4151,7 +4151,7 @@ static void intel_ddi_sync_state(struct intel_encoder *encoder,
 		intel_tc_port_sanitize_mode(enc_to_dig_port(encoder),
 					    crtc_state);
 
-	if (crtc_state && intel_crtc_has_dp_encoder(crtc_state))
+	if (intel_encoder_is_dp(encoder))
 		intel_dp_sync_state(encoder, crtc_state);
 }
 
-- 
2.39.2

