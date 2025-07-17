Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AE6B08FA1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9735C10E840;
	Thu, 17 Jul 2025 14:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pq5Gpzbg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1E110E835;
 Thu, 17 Jul 2025 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fDrpqR5KN0P1NURzF1rhIR2iOIXQJG/Mb5jVW8vYBmo=; b=pq5GpzbgEypEdIqdjRCEDrrl/I
 MKw5bS0MioazKuv66rg1riMU6ovqPPiB72z5MoFac/ylX13EMNFgtqeMrY/q2koJd6qq+vYkYSfCO
 CuSZHJqB2edjohgcFkQJtwIXxOeeFK9R40sbPZiprBJt+75HPlUbS3O7/pmGWMfZsG8ihRSD+B2/e
 JHwBDQUmK+BdH2iRZrbZnc6mjaiImgS+cgowrxmka1Qk0hIJ+FOVFspyXRtyQf0CrH6RV6g5CSmfb
 wkbVRYbJLHDxNZoEi8WYchI7mg003+1cJyFwL9kmPt9U978wSBrnBEvEmI/hROP6dFCMJaluqitpx
 zJ4t1wlg==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ucPk3-000BGt-HG; Thu, 17 Jul 2025 16:37:48 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH] Revert "drm/amd/display: limit clear_update_flags to dcn32
 and above"
Date: Thu, 17 Jul 2025 11:36:32 -0300
Message-ID: <20250717143738.84722-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
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

This reverts commit e1bd5e0bb4ca0d633ad698abd3658f8265009b81.

The commit causes a regression in Steam Deck (DCN 3.01), reintroducing a
functional issue reported in [1] that was fixed by calling the
clear_update_flags() from commit 7671f62c10f2a.

On Steam Deck, we use multiple hw plane color caps and up to two overlay
planes with dynamic pipe split policy. I.e. with 1 primary + 1 overlay,
the driver split planes into two (with 4 pipes), but with 1 primary + 2
overlays, we don't have enough pipe for splitting. Glitches appear in
this pipe-split transition of 1-2 overlay planes, if the driver doesn't
clear update flags.

Besides that, the issue the commit e1bd5e0bb4ca tries to address [2]
isn't functional.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3441 [1]
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4129 [2]
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index c31f7f8e409f..7c48f72e5917 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -5443,7 +5443,8 @@ bool dc_update_planes_and_stream(struct dc *dc,
 	else
 		ret = update_planes_and_stream_v2(dc, srf_updates,
 			surface_count, stream, stream_update);
-	if (ret && dc->ctx->dce_version >= DCN_VERSION_3_2)
+
+	if (ret)
 		clear_update_flags(srf_updates, surface_count, stream);
 
 	return ret;
@@ -5474,7 +5475,7 @@ void dc_commit_updates_for_stream(struct dc *dc,
 		ret = update_planes_and_stream_v1(dc, srf_updates, surface_count, stream,
 				stream_update, state);
 
-	if (ret && dc->ctx->dce_version >= DCN_VERSION_3_2)
+	if (ret)
 		clear_update_flags(srf_updates, surface_count, stream);
 }
 
-- 
2.47.2

