Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA5719574E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 13:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA2C6E095;
	Fri, 27 Mar 2020 12:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525066E095;
 Fri, 27 Mar 2020 12:42:39 +0000 (UTC)
IronPort-SDR: vxNz8DmvLlWmuZBdKDQmq4XjGJmvMQaPCabU7t/7Y+ZS0VWVGU4aglxseZX8H2GZSkAmyWr1vM
 xRK+lgqSovUA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 05:42:38 -0700
IronPort-SDR: z9sg43L/lQl7f/GI0rKQBfAXDRV0LRpnhoSvnrYdREJ1dotR5jmzRsqpTMonSxbxhSf3Z5c+ln
 zbPSNK1IViBg==
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; d="scan'208";a="421091081"
Received: from defretin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.231])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 05:42:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 1/7] drm/dsc: use rc_model_size from DSC config for PPS
Date: Fri, 27 Mar 2020 14:42:23 +0200
Message-Id: <20200327124229.26461-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Manasi Navare <manasi.d.navare@intel.com>,
 Harry Wentland <hwentlan@amd.com>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PPS is supposed to reflect the DSC config instead of hard coding the
rc_model_size. Make it so.

Currently all users of drm_dsc_pps_payload_pack() hard code the size to
8192 also in the DSC config, so this change should have no impact, other
than allowing the drivers to use other sizes as needed.

Cc: Alex Deucher <alexdeucher@gmail.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_dsc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dsc.c b/drivers/gpu/drm/drm_dsc.c
index 4a475d9696ff..09afbc01ea94 100644
--- a/drivers/gpu/drm/drm_dsc.c
+++ b/drivers/gpu/drm/drm_dsc.c
@@ -186,8 +186,7 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
 	pps_payload->flatness_max_qp = dsc_cfg->flatness_max_qp;
 
 	/* PPS 38, 39 */
-	pps_payload->rc_model_size =
-		cpu_to_be16(DSC_RC_MODEL_SIZE_CONST);
+	pps_payload->rc_model_size = cpu_to_be16(dsc_cfg->rc_model_size);
 
 	/* PPS 40 */
 	pps_payload->rc_edge_factor = DSC_RC_EDGE_FACTOR_CONST;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
