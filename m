Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12F9529ACB
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 09:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAD910E8BB;
	Tue, 17 May 2022 07:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D0B10E704;
 Tue, 17 May 2022 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652772581; x=1684308581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=47wqMRcnDaGWvswNaOsXUw9o4XU7V0zxTrd58y+tsU8=;
 b=j2ZFa6upQj7aQ/k0N2kFX7gAsB58RNBsX2sgFdq7n00qhITs5mfhTu6W
 eBoyS5YlZtNEn8mwcGEYplZZdw5C/pTylNVbF/5GD8kow0lhGUcKU0I/k
 6RTzpGfyjHCuTm0Nwk85L5duiHGL1YtTsE4FZomgZ4+KQuCq9bGaAiIIo
 MYQH8W0HCeQphV/DvLdeE4Jc7TN/IW9P95zMdRxNuccjpULWUtW0YRNce
 q6am2/eIvlSA7YwdXEYDNQLgeQp9KSEoOE7LhW5zao6ypLndbpr8XZkWW
 6STfCJv35Va9IHka6GnTzXKmY3k6peUFCKIVe9JDd5fL14PaUlIFcc/Rb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="271039319"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="271039319"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:29:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; d="scan'208";a="544777206"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 00:29:38 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 manasi.d.navare@intel.com
Subject: [RFC V3 2/2] drm/i915/vrr: Set drm crtc vrr_enabled property
Date: Tue, 17 May 2022 12:56:36 +0530
Message-Id: <20220517072636.3516381-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
References: <20220517072636.3516381-1-bhanuprakash.modem@intel.com>
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function sets the vrr_enabled property for crtc based
on the platform support and the request from userspace.

V2: Check for platform support before updating the prop.
V3: Don't attach vrr_enabled prop, as it is alreay attached.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 396f2f994fa0..7263b35550de 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -160,6 +160,10 @@ void intel_vrr_enable(struct intel_encoder *encoder,
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 trans_vrr_ctl;
 
+	if (HAS_VRR(dev_priv))
+		drm_mode_crtc_set_vrr_enabled_property(crtc_state->uapi.crtc,
+						       crtc_state->vrr.enable);
+
 	if (!crtc_state->vrr.enable)
 		return;
 
@@ -211,6 +215,10 @@ void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
 	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
 
+	if (HAS_VRR(dev_priv))
+		drm_mode_crtc_set_vrr_enabled_property(old_crtc_state->uapi.crtc,
+						       false);
+
 	if (!old_crtc_state->vrr.enable)
 		return;
 
-- 
2.35.1

