Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CF22D2B18
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D116E97E;
	Tue,  8 Dec 2020 12:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCD96E974;
 Tue,  8 Dec 2020 12:34:09 +0000 (UTC)
IronPort-SDR: KQdhzAk6eA5ay7q8H4BGr5WC3PVuguqQDNusqsbiJ9VpZLFqixFme+ey/JT7KVu8pc+6cc/t2a
 wRzNiOMcL1BA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="258588772"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="258588772"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:09 -0800
IronPort-SDR: E07vYUGudZpUi/fg2yshEoxGrYYryWoYeexs0NfPNfIH3Xf+fYdBnUOuvBklAbD/G5i+2g0u7h
 hT5r+teBLlYQ==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="407603777"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/dsc: use rc_model_size from DSC config for PPS
Date: Tue,  8 Dec 2020 14:33:50 +0200
Message-Id: <c3246aff585efcd728ee3dc96f52db5e46f6a162.1607429866.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1607429866.git.jani.nikula@intel.com>
References: <cover.1607429866.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Harry Wentland <hwentlan@amd.com>
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
Reviewed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
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
