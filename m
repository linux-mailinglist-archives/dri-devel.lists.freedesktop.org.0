Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD9F5C02D3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA17810E9E0;
	Wed, 21 Sep 2022 15:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8959A10E9C9;
 Wed, 21 Sep 2022 15:54:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E335B830E1;
 Wed, 21 Sep 2022 15:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C07C433C1;
 Wed, 21 Sep 2022 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663775687;
 bh=7lT88kymb+yHRk7aKUfmIghEeBPzIMSI+gUmp/ehBBM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N6fT0S4psDxGGHTGvSbrio5jO5h+rHJMSTKSP++DCOnJ8uUiQYcKe5Dd9Hyg/TFyR
 bz527MMphcRp/xlSOU1PgmsOKRnkp24EmAZsyQzS9l4PJ5mdMLkPE3o5JYHk3blHaL
 8ZSeLSfkdtFm+kr36MgzXarAif7WXfD2epMia3QqVb0BJEMsNKleb0qmoIk1gjZeYi
 2nhf7rzvkmYh6JGubOQzISoXsbmPtcTybfOUeL1v/e69E+798zX8ft/d2x59Esek4L
 hOL3MZ8Dxu20E5GjOoMO6PG4xcxUEjFixzo61o6siGZYK6lfKkPbiMTpNNVnKWQqVg
 EzVLcww0boZ3w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 2/3] drm/amd/display: Limit user regamma to a
 valid value
Date: Wed, 21 Sep 2022 11:54:42 -0400
Message-Id: <20220921155444.235446-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155444.235446-1-sashal@kernel.org>
References: <20220921155444.235446-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Daniel Wheeler <daniel.wheeler@amd.com>, Yao Wang1 <Yao.Wang1@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Pavle Kotarac <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yao Wang1 <Yao.Wang1@amd.com>

[ Upstream commit 3601d620f22e37740cf73f8278eabf9f2aa19eb7 ]

[Why]
For HDR mode, we get total 512 tf_point and after switching to SDR mode
we actually get 400 tf_point and the rest of points(401~512) still use
dirty value from HDR mode. We should limit the rest of the points to max
value.

[How]
Limit the value when coordinates_x.x > 1, just like what we do in
translate_from_linear_space for other re-gamma build paths.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Pavle Kotarac <Pavle.Kotarac@amd.com>
Signed-off-by: Yao Wang1 <Yao.Wang1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/modules/color/color_gamma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
index 11ea1a0e629b..4e866317ec25 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
+++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
@@ -1206,6 +1206,7 @@ static void interpolate_user_regamma(uint32_t hw_points_num,
 	struct fixed31_32 lut2;
 	struct fixed31_32 delta_lut;
 	struct fixed31_32 delta_index;
+	const struct fixed31_32 one = dc_fixpt_from_int(1);
 
 	i = 0;
 	/* fixed_pt library has problems handling too small values */
@@ -1234,6 +1235,9 @@ static void interpolate_user_regamma(uint32_t hw_points_num,
 			} else
 				hw_x = coordinates_x[i].x;
 
+			if (dc_fixpt_le(one, hw_x))
+				hw_x = one;
+
 			norm_x = dc_fixpt_mul(norm_factor, hw_x);
 			index = dc_fixpt_floor(norm_x);
 			if (index < 0 || index > 255)
-- 
2.35.1

