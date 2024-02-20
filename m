Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F785C830
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4F810E58E;
	Tue, 20 Feb 2024 21:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fiXvUaNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1288810E591;
 Tue, 20 Feb 2024 21:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463930; x=1739999930;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=InX4w5F0vyNOunYHJW6iHF73iPNgv8OQ108kQ0Si/Bc=;
 b=fiXvUaNAkw/M+sCWa07XS/fk6r/WzMh4S4Jlv/LJmcYOf8/Bdu9QAhs6
 LSs67Yp2MgjEVl6ZIvqeLB0bgyC/6MDraULbcIX1g4pTwC0h91fslUP8H
 gD4KtYDvmemY9dXYd1piIqMJ2TxUy8pqvzjdsLoZLK6A11DwvIiMIlTu+
 OJYx6oAW+IT5o2xZR8flA/Hga74vGpcTzXBr07aFds8kh0mqX7TlKafW5
 /23O6XNBYKkjjmPZshMEvu5S5y76k+zcaZmtkeSq85R6CCY4IkMGEsg4h
 LTATEoTwijjsPvCAfLw1dNf06IvblZm6cwMUkLFq6CGGWAjtnAAjI7hfg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738681"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738681"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061651"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:48 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 20/21] drm/i915/dp: Read DPRX for all long HPD pulses
Date: Tue, 20 Feb 2024 23:18:40 +0200
Message-Id: <20240220211841.448846-21-imre.deak@intel.com>
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

The TBT DP tunnel BW request logic in the Thunderbolt Connection Manager
depends on the GFX driver reading out the sink's DPRX capabilities in
response to a long HPD pulse. Since in i915 this read-out can be blocked
by another connector's/encoder's hotplug event handling (which is
serialized by drm_mode_config::connection_mutex), do a dummy DPRX read-out
in the encoder's HPD pulse handler (which is not blocked by other
encoders).

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 35ef17439038a..f7f8bd5742ad4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6162,6 +6162,7 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
 	struct intel_dp *intel_dp = &dig_port->dp;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
 	if (dig_port->base.type == INTEL_OUTPUT_EDP &&
 	    (long_hpd || !intel_pps_have_panel_power_or_vdd(intel_dp))) {
@@ -6184,6 +6185,17 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
 		    dig_port->base.base.name,
 		    long_hpd ? "long" : "short");
 
+	/*
+	 * TBT DP tunnels require the GFX driver to read out the DPRX caps in
+	 * response to long HPD pulses. The DP hotplug handler does that,
+	 * however the hotplug handler may be blocked by another
+	 * connector's/encoder's hotplug handler. Since the TBT CM may not
+	 * complete the DP tunnel BW request for the latter connector/encoder
+	 * waiting for this encoder's DPRX read, perform a dummy read here.
+	 */
+	if (long_hpd)
+		intel_dp_read_dprx_caps(intel_dp, dpcd);
+
 	if (long_hpd) {
 		intel_dp->reset_link_params = true;
 		return IRQ_NONE;
-- 
2.39.2

