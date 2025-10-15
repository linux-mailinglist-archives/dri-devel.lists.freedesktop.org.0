Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40AABDE250
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 13:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B542710E28E;
	Wed, 15 Oct 2025 11:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q4EYkMC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78F010E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760526044;
 bh=nR5iobbIytd1Bw/kd9hXU3bcwc9RRIOhCKypYsm2C/8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q4EYkMC5tTCXsaI2kXX7CwdBeluwjwJuatan1O2X9jMQ3emCOLUM94zMP9f6Jmlh7
 3ci2QC9kmgW+81+Dx0sTWlVrCv5A/yrSJ05LBaAcpr34dtdQbrQHQ5YDf11SElj0IU
 PB+54aaS0MsjWXCFpVQ8AKtj80VmmkhkWClr1W9hEz9mRgg3iLS6KCNOxl9iT4DZPG
 w/d0GgxXGU1fNkQzrqLloivT0zdBmy5Ij17OdniAG4bpi8q5gDwtXNT1TosCCVGsgY
 tnuuJYUIcbCkDRdJXxICBoMS0AxEh6btpMuI1hjExlkdTh4WxYG6P/pT4YJ6bufkxJ
 0C0SfTgdMOigQ==
Received: from reinforced.mynet (unknown
 [IPv6:2a01:4b00:be1d:c600:6089:8bab:34a0:d4c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BB8E17E1400;
 Wed, 15 Oct 2025 13:00:44 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: [PATCH 03/13] drm/rockchip: Return error code for errors
Date: Wed, 15 Oct 2025 12:00:32 +0100
Message-ID: <20251015110042.41273-4-daniels@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015110042.41273-1-daniels@collabora.com>
References: <20251015110042.41273-1-daniels@collabora.com>
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

Instead of silently disabling small planes, refuse to create them at
all.

Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index f04fb5da1295..659b2565dee4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1035,8 +1035,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		drm_dbg_kms(vop2->drm, "Invalid size: %dx%d->%dx%d, min size is 4x4\n",
 			    drm_rect_width(src) >> 16, drm_rect_height(src) >> 16,
 			    drm_rect_width(dest), drm_rect_height(dest));
-		pstate->visible = false;
-		return 0;
+		return -EINVAL;
 	}
 
 	if (drm_rect_width(src) >> 16 > vop2_data->max_input.width ||
-- 
2.51.0

