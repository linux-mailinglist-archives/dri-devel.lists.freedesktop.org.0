Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC0AC87A16
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 01:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F9910E4C1;
	Wed, 26 Nov 2025 00:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ftKO0q7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B9E10E4C1;
 Wed, 26 Nov 2025 00:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oTxD4oohwRUI1m2gOFUx59RXPNzB9R1BCnOmLa/5n6c=; b=ftKO0q7xOlHfdPpCoq9uWN8AvQ
 QBjppuaEhqDieaVTB3xZueS4KzDJcubqvH1/DM5VTPTB2n9YvOdleMbOIHZr075nBFmvtZ/DsvHxh
 nHLcv56SnE2GuOuSP2V4pFrZFTnsJwrmeCO6TbaVImTC1qgzjSabY2BkjDuWnAzq7ZmXOIYryOA0o
 4K5fpQTIipv6Ad+KHSepjmu/qQMxR25ZGVmey6jbBxuQrlRLH0pqHv5fjMtQZMKlH0KB9YVj+BV3Z
 lPvOYq8rPpeGU1rzmrMVaPrBpIVCWhrPGH5SnhR6zeHcL5+sx4AgokYg2tX0pdFsbXwhlGU29KJZn
 NtWnLwtA==;
Received: from [186.208.73.94] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vO3pN-005Pk8-LS; Wed, 26 Nov 2025 01:56:14 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH] drm/amd/display: use DCN10 CM helper for plane shaper func
 translation in DCN32
Date: Tue, 25 Nov 2025 21:45:21 -0300
Message-ID: <20251126005608.37513-1-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
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

The usage of DCN30 CM helper creates some unexpected shimmer points on
PQ shaper TF in the steamOS HDR color pipeline. Fix it by using the same
DCN10 color mgmt helper of previous hw versions to translate plane
shaper func to hw format in DCN32 hw family.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---

Hi,

Commit a953cd8cac6b ("drm/amd/display: Fix MPCC 1DLUT programming")
mentions some visible artifacts when using DCN10 CM helper on DCN32
shaper and blend LUTs. On the other hand, using DCN30 CM helper creates
some shimmer points on steamOS HDR pipeline. We didn't noticed any
visible artifacts so far, but I'd like to know more about what kind of
artifacts were visible at the time this helper for shaper func was
switched in the afore-mentioned commit for further investigation.

Thanks in advance,

Melissa


 drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index bf19ba65d09a..a28560caa1c0 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -501,9 +501,9 @@ bool dcn32_set_mcm_luts(
 		lut_params = &plane_state->in_shaper_func.pwl;
 	else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
 		// TODO: dpp_base replace
-		ASSERT(false);
-		cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
-				&dpp_base->shaper_params, true);
+		cm_helper_translate_curve_to_hw_format(plane_state->ctx,
+						       &plane_state->in_shaper_func,
+						       &dpp_base->shaper_params, true);
 		lut_params = &dpp_base->shaper_params;
 	}
 
-- 
2.51.0

