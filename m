Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51992D53E0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 07:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977A26E874;
	Thu, 10 Dec 2020 06:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336776E3E5;
 Thu, 10 Dec 2020 06:40:26 +0000 (UTC)
IronPort-SDR: hJ2VHWxAnSSfjdyfZfqEYeM/v2xfWWOKrwFL5nn0uiMmThwPI/YyzUxc5Pat4C5a6y9O09V3nk
 lAlxwFmvMC0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="174322165"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="174322165"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 22:40:25 -0800
IronPort-SDR: hZE3pBaFe/7e4FDB32YrVUoZ1MZp8BtzPcocjYO6zgEkSoIOlY4IIafc3sCzm138OyYCpKoM2M
 MsuH8Lzr6EPA==
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="318854330"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 22:40:22 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 02/18] drm/i915/hdcp: Get conn while content_type changed
Date: Thu, 10 Dec 2020 11:56:24 +0530
Message-Id: <20201210062640.11783-3-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210062640.11783-1-anshuman.gupta@intel.com>
References: <20201210062640.11783-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, Karthik B S <karthik.b.s@intel.com>,
 uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get DRM connector reference count while scheduling a prop work
to avoid any possible destroy of DRM connector when it is in
DRM_CONNECTOR_REGISTERED state.

Fixes: a6597faa2d59 ("drm/i915: Protect workers against disappearing connectors")
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index eee8263405b9..b9d8825e2bb1 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2210,6 +2210,7 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 	if (content_protection_type_changed) {
 		mutex_lock(&hdcp->mutex);
 		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		drm_connector_get(&connector->base);
 		schedule_work(&hdcp->prop_work);
 		mutex_unlock(&hdcp->mutex);
 	}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
