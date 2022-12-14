Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E21364CFA0
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 19:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CA610E450;
	Wed, 14 Dec 2022 18:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5706310E44F;
 Wed, 14 Dec 2022 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671043384; x=1702579384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Oct2vbuuFo2UKNoJ/dpcObwe4tH12qrZ/9TYj1MI+I=;
 b=V1Nt4/IvuZQcnHsEwyHWZT5qQTfp2VwlqG2fMHpc38b2OwPGy3ENYumw
 AR3AFT2uZPVnHtcjqhrkUStL+JFOM4cXs2DbzRYfAIbnuwH7oOXYTDIlA
 wwlSw/mfja5dmLEbtrScmp//bq1JAOXORmT3xKRwaNpARUFqlntAwfHhY
 dNbITbqdz2P+aE4ToICVuY5F+dzYSKijrpun2voRSF8+7H2VedOw+pAtt
 LoDq3jbdW8Y7oTWH0A/RXyMVhO0Feofsy4lTI8D8rwyZT1RbDkWcDhW8z
 v4PEo/M3eOuGeB0aDBWrQQPecWhmzBI6AH4fx4jnwdIk+LhnAzzfIm/CD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="320343552"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; d="scan'208";a="320343552"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 10:43:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="894424796"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; d="scan'208";a="894424796"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 10:43:02 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/display/dp_mst: Fix down message handling after a
 packet reception error
Date: Wed, 14 Dec 2022 20:42:57 +0200
Message-Id: <20221214184258.2869417-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.31.1.189.g2e36527f23
In-Reply-To: <20221214184258.2869417-1-imre.deak@intel.com>
References: <20221214184258.2869417-1-imre.deak@intel.com>
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After an error during receiving a packet for a multi-packet DP MST
sideband message, the state tracking which packets have been received
already is not reset. This prevents the reception of subsequent down
messages (due to the pending message not yet completed with an
end-of-message-transfer packet).

Fix the above by resetting the reception state after a packet error.

Cc: Lyude Paul <lyude@redhat.com>
Cc: <stable@vger.kernel.org> # v3.17+
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 90819fff2c9ba..01350510244f2 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3856,7 +3856,7 @@ static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
 	struct drm_dp_sideband_msg_rx *msg = &mgr->down_rep_recv;
 
 	if (!drm_dp_get_one_sb_msg(mgr, false, &mstb))
-		goto out;
+		goto out_clear_reply;
 
 	/* Multi-packet message transmission, don't clear the reply */
 	if (!msg->have_eomt)
-- 
2.37.1

