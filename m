Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4D4D3351C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 16:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C6310E8CC;
	Fri, 16 Jan 2026 15:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aze6vHI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D0010E8CC;
 Fri, 16 Jan 2026 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oeP28Y4KzgA1p0L6THm6wnu4OqImpDj1lqT5rwIQGg0=; b=aze6vHI53Xjuiw60HTOla41okq
 7uKLZsue6xx3W9YL9PIdaAhb+D+WDwFpysz/elXPVAHUmyAph+66KUsMPgUb345iQKbT01Z1YaM0Z
 P0kFyL4NDG8PrmsU/QAMSRGiH0SqhlkUT0vQ0SXWXPl1Z8fz4ftjMHy/NnaT4IqlEnodSWzOz5abF
 j5sSM+ZQa6+7GDmcoJqaNzxUsWkMsVGodAyeGZJDDZJEXGtwOjD29923yKsLeRmqZT0p3sYAQkQLP
 AbXXLfK2lwVuzh5bNxOS7toMpu6J9QhaOUS0k8jmDvLXSSnVOjRmEsQn19/dZy34BKm+si4E/byr+
 quK4CCNA==;
Received: from [189.89.57.42] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vgm6C-006DwB-QV; Fri, 16 Jan 2026 16:50:57 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH] drm/amd/display: remove assert around dpp_base replacement
Date: Fri, 16 Jan 2026 12:50:49 -0300
Message-ID: <20260116155052.88433-1-mwen@igalia.com>
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

There is nothing wrong if in_shaper_func type is DISTRIBUTED POINTS.
Remove the assert placed for a TODO to avoid misinterpretations.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index 3cd44c6602b3..4dfd22bc00c4 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -507,7 +507,6 @@ bool dcn32_set_mcm_luts(
 		lut_params = &plane_state->in_shaper_func.pwl;
 	else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
 		// TODO: dpp_base replace
-		ASSERT(false);
 		cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
 				&dpp_base->shaper_params, true);
 		lut_params = &dpp_base->shaper_params;
-- 
2.51.0

