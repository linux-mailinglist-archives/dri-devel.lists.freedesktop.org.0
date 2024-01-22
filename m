Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A5C8365F9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 15:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DBC10F1F3;
	Mon, 22 Jan 2024 14:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3FB10EA8B;
 Mon, 22 Jan 2024 14:57:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B2305CE2B03;
 Mon, 22 Jan 2024 14:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5964AC433C7;
 Mon, 22 Jan 2024 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705935431;
 bh=nfxEFGF3+T5BIAC6cZV5dCtwBWqySTxUjhchMOcDXfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kCkhfHTRC2kH2pXYz7KUztLa9tYufgibbhgryJFkGfltf6MD+dJ/sXxCpMvwx+1gd
 T3fIP32qlh9eL6BGF75S3kLvqTLjuuMtOY+2KbzRGETM8KRDABiuAXIPzqosZp2u/H
 IVz4jKfxUFC174F9TzVM1kse/Q+jsaemjL+G5WLP3/4+Vw8FzBP3Ff2ifvw3wV2Ald
 3wIXeYncrQT+7HFzLD+3n6pY7JdYGL1WhbY8aRKrBvzyucU9HxH32sxgpU8NY/jvnl
 Bib2Qi5K52LH7Kj201n4fGFPD9qi9uRDwBnQ0erTTMNapW2bzpro2yVgooI0WHnhc0
 LMeIDZaOU6Nfg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 18/88] drm/amd/display: Fix MST PBN/X.Y value
 calculations
Date: Mon, 22 Jan 2024 09:50:51 -0500
Message-ID: <20240122145608.990137-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122145608.990137-1-sashal@kernel.org>
References: <20240122145608.990137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.1
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
Cc: Ilya Bakoulin <ilya.bakoulin@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, jiapeng.chong@linux.alibaba.com,
 sunpeng.li@amd.com, Wenjing Liu <wenjing.liu@amd.com>, Qingqing.Zhuo@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 camille.cho@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 hamza.mahfooz@amd.com, daniel@ffwll.ch, wayne.lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com, jun.lei@amd.com,
 christian.koenig@amd.com, peichen.huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ilya Bakoulin <ilya.bakoulin@amd.com>

[ Upstream commit 94bbf802efd0a8f13147d6664af6e653637340a8 ]

Changing PBN calculation to be more in line with spec. We don't need to
inflate PBN_NATIVE value by the 1.006 margin, since that is already
taken care of in the get_pbn_per_slot function.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Ilya Bakoulin <ilya.bakoulin@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
index f8e01ca09d96..a3b3aec05d6b 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
@@ -1057,18 +1057,21 @@ static struct fixed31_32 get_pbn_from_bw_in_kbps(uint64_t kbps)
 	uint32_t denominator = 1;
 
 	/*
-	 * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
+	 * The 1.006 factor (margin 5300ppm + 300ppm ~ 0.6% as per spec) is not
+	 * required when determining PBN/time slot utilization on the link between
+	 * us and the branch, since that overhead is already accounted for in
+	 * the get_pbn_per_slot function.
+	 *
 	 * The unit of 54/64Mbytes/sec is an arbitrary unit chosen based on
 	 * common multiplier to render an integer PBN for all link rate/lane
 	 * counts combinations
 	 * calculate
-	 * peak_kbps *= (1006/1000)
 	 * peak_kbps *= (64/54)
-	 * peak_kbps *= 8    convert to bytes
+	 * peak_kbps /= (8 * 1000) convert to bytes
 	 */
 
-	numerator = 64 * PEAK_FACTOR_X1000;
-	denominator = 54 * 8 * 1000 * 1000;
+	numerator = 64;
+	denominator = 54 * 8 * 1000;
 	kbps *= numerator;
 	peak_kbps = dc_fixpt_from_fraction(kbps, denominator);
 
-- 
2.43.0

