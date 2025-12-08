Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFBDCAE6D4
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 00:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E7610E43E;
	Mon,  8 Dec 2025 23:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Cd4lqB6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A110710E43E;
 Mon,  8 Dec 2025 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B+CJ31XDdIU164N0066UZqUdI1AFp5gOK1kxtWxRc5k=; b=Cd4lqB6SlLR6u422ui7qNgOMRN
 4hSLyGAG2ctQGdAU3DTD8ZKMZUCYMv+e1EtsqXihsi6GrXUvNmpShWjxZv538HJk0sCZ4P3KAxiJp
 LxvrdstBKcWWkJsGDuXDmGhJFEzlvsTi0hKl+g3mw/D7kkLCdXZJCxj8akqJTRhe4MrSh8gQSe9Kp
 iAaCKocKYJkwFI23pjAbRakUHv9PRWNCxF5H1ju6jjSEK2Libr9YttAbZRjV1f3VulcLO0fu8NY/h
 mmf7KuRoFFxFpbrjoy8J17qBFX8kdW25l51P2C+TpsekU1Zofv1rohKr1xoygpsqsdhBfmI3ZNZoK
 Wq980Tew==;
Received: from [186.208.73.250] (helo=django)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vSky2-00AGsY-JH; Tue, 09 Dec 2025 00:48:35 +0100
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com
Cc: kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/2] drm/amd/display: fix wrong color value mapping on
 DCN32 shaper LUT
Date: Mon,  8 Dec 2025 22:44:14 -0100
Message-ID: <20251208234741.293037-2-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251208234741.293037-1-mwen@igalia.com>
References: <20251208234741.293037-1-mwen@igalia.com>
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

We've seen some shimmer points on DCN32 when using the steamOS color
pipeline for HDR on gaming. Looks like black values being wrongly mapped
to red/blue/green values. Fiz that by using the exact number of
hw_points computed in the LUT segmentation. Probably the whole logic
that adds +1 to the latest points should be revisited.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
index 0690c346f2c5..ba20575be214 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
@@ -225,7 +225,7 @@ bool cm3_helper_translate_curve_to_hw_format(
 
 	// DCN3+ have 257 pts in lieu of no separate slope registers
 	// Prior HW had 256 base+slope pairs
-	lut_params->hw_points_num = hw_points + 1;
+	lut_params->hw_points_num = hw_points;
 
 	k = 0;
 	for (i = 1; i < MAX_REGIONS_NUMBER; i++) {
-- 
2.51.0

