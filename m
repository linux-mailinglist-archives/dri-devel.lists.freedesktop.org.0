Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE49BDE268
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 13:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6CB10E778;
	Wed, 15 Oct 2025 11:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ckwBPtuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A05510E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760526044;
 bh=umnj1S/CbkTjtGTeSNIiEyPKjNw+mbm9qMFK+XgArkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ckwBPtuuVEqkZAOibahvumGh3RqNtMVsnbfJVyhM5pR0mRWpCdf0gsZVtAgCFFL0R
 xq8PWDmZnHTibAd5yxEE6w0Rg5DmsQEQBZb+YH736Qjl/BwctR9GxZazPZFEdO7F9S
 Or8FHV/HphLnC9rV/L5qtVo+nNf4qw4m+0EN/igPpcFvblpPJilAHwaD+VnD1VI8TX
 c/II5l2qiu2BQOLIhS8GqN0xx3+T+D5bh1lhMlZHWHKXyInJRA7I7w2wp0r52m/sG3
 hsGLk+Gqi3tVZxPLQiMaPwZTZEoE5mBhwfbu5Gsc7DUWThr5qDrTzUAuwumZ10tut6
 W4V+OeUmZb1Sw==
Received: from reinforced.mynet (unknown
 [IPv6:2a01:4b00:be1d:c600:6089:8bab:34a0:d4c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AFAD317E1340;
 Wed, 15 Oct 2025 13:00:43 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: [PATCH 02/13] drm/rockchip: Declare framebuffer width/height bounds
Date: Wed, 15 Oct 2025 12:00:31 +0100
Message-ID: <20251015110042.41273-3-daniels@collabora.com>
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

The VOP2 has limitations on its input and output sizes. The clipped
display region must be at least 4px in each dimension for both
framebuffer source and plane destination, and the clipped source region
must be no greater than a per-version limit.

It is never valid for VOP2 to have a framebuffer which is less than four
pixels in either dimension, so declare that as our min width/height,
enforced by AddFB failing if the user tries. It can theoretically be
valid to have a single large framebuffer of which only certain clipped
regions are shown, but this is a very uncommon case. Declaring to
userspace that the framebuffer's maximum width and height is the maximum
source clip helps it make better decisions as to which mode to use,
instead of trying unsupported sizes and having to fall back.

Signed-off-by: Daniel Stone <daniels@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 4ba5444fde4f..f04fb5da1295 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2647,6 +2647,12 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	if (IS_ERR(vop2->map))
 		return PTR_ERR(vop2->map);
 
+	/* Set the bounds for framebuffer creation */
+	drm->mode_config.min_width = 4;
+	drm->mode_config.min_height = 4;
+	drm->mode_config.max_width = vop2_data->max_input.width;
+	drm->mode_config.max_height = vop2_data->max_input.height;
+
 	ret = vop2_win_init(vop2);
 	if (ret)
 		return ret;
-- 
2.51.0

