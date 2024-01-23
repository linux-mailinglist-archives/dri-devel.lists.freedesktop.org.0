Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D33F838BEF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EABC10F2FE;
	Tue, 23 Jan 2024 10:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A979810F1AA;
 Tue, 23 Jan 2024 10:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005739; x=1737541739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jFvGmC3V1panhwIGwXGi5xm79Tc6HxEYPuA/39ZJ20s=;
 b=a+Vqh7mL7Abq4/ukJu3MdIgG4ptn+li8aqF2MwFcxOXEEYMkVVZo3lz+
 3L/abcg02D4Yg2SRb5nbYmFupeaO8SKfKftfaUAbxCGTaEi6SJTftSKT1
 p/eT4crRSkZA+yfByQRzPpBKROTUxK5dI3hF3EJYaxbtfgsuFCaexndip
 JE/16YXp2CVNvDKf+1kG1m6PPyVV3+tBjCPDs3G03PLSTEOlQbp1LMHKZ
 ckCzXFkYfDMXQTMnLEN4v4JOCcxaB0lUhLHbK3jUi0FK8kGF2ZdRNxIFd
 bOvOlLuATZz0UuPTfQHfTRJSEuFtp4cIErzZOvAPqmgrqYpbBdNwVsOVx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134293"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134293"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283442"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283442"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:58 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 17/19] drm/i915/dp: Call intel_dp_sync_state() always for DDI
 DP encoders
Date: Tue, 23 Jan 2024 12:28:48 +0200
Message-Id: <20240123102850.390126-18-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123102850.390126-1-imre.deak@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A follow-up change will need to resume DP tunnels during system resume,
so call intel_dp_sync_state() always for DDI encoders, so this function
can resume the tunnels for all DP connectors.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index aa6e7da08fbce..1e26e62b82d48 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4131,7 +4131,7 @@ static void intel_ddi_sync_state(struct intel_encoder *encoder,
 		intel_tc_port_sanitize_mode(enc_to_dig_port(encoder),
 					    crtc_state);
 
-	if (crtc_state && intel_crtc_has_dp_encoder(crtc_state))
+	if (intel_encoder_is_dp(encoder))
 		intel_dp_sync_state(encoder, crtc_state);
 }
 
-- 
2.39.2

