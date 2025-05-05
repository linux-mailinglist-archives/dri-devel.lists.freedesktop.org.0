Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A239AA9FC8
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766B210E4A0;
	Mon,  5 May 2025 22:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A71IClI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C982E10E4A0;
 Mon,  5 May 2025 22:27:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 73440629C0;
 Mon,  5 May 2025 22:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A24C4CEED;
 Mon,  5 May 2025 22:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484047;
 bh=sxQ2MLzHhB6df/tTg4DZmAMx/JS+RzR7fiNkcK9woXo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A71IClI+81P4X1DkvaAh0dvmG5fCFrfn6kYJJnU/wojdh73CyScuGERoEbEa9j/Kj
 y4/0wTlvEom6bwa8MWFQSUeSsmYlAi54mNLuCVF5ImCP3/gIUXhTkWuOgd40bfore+
 GDVEmrhz2AhFT2ObbHzkkB83ya0yh5+DRBq1ndLPv2PeULJlslT7zYeqh7izbhJTXY
 LRA+10r8wy1KBMfakFaZyi46O6heVtxntGl31XfHiHO2IWqFSrP8rcFnTQeHqmz8pY
 sU6ZT18ZBfYfPW+g3jWJub3YNxShvxgdzjMPuq7jaeTR3w3noMivcTdPYvFh9EEfuG
 eR/2aYbo2Pang==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Samson Tam <Samson.Tam@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, zaeem.mohamed@amd.com,
 aurabindo.pillai@amd.com, jun.lei@amd.com, ivlipski@amd.com,
 alex.hung@amd.com, relja.vojvodic@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 326/642] drm/amd/display: Fix mismatch type
 comparison in custom_float
Date: Mon,  5 May 2025 18:09:02 -0400
Message-Id: <20250505221419.2672473-326-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Samson Tam <Samson.Tam@amd.com>

[ Upstream commit 86f06bcbb54e93f3c7b5e22ae37e72882b74c4b0 ]

[Why & How]
Passing uint into uchar function param.  Pass uint instead

Signed-off-by: Samson Tam <Samson.Tam@amd.com>
Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c | 2 +-
 drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
index 131f1e3949d33..52d97918a3bd2 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.c
@@ -346,7 +346,7 @@ struct spl_fixed31_32 spl_fixpt_exp(struct spl_fixed31_32 arg)
 		if (m > 0)
 			return spl_fixpt_shl(
 				spl_fixed31_32_exp_from_taylor_series(r),
-				(unsigned char)m);
+				(unsigned int)m);
 		else
 			return spl_fixpt_div_int(
 				spl_fixed31_32_exp_from_taylor_series(r),
diff --git a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
index ed2647f9a0999..9f349ffe91485 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
+++ b/drivers/gpu/drm/amd/display/dc/spl/spl_fixpt31_32.h
@@ -189,7 +189,7 @@ static inline struct spl_fixed31_32 spl_fixpt_clamp(
  * @brief
  * result = arg << shift
  */
-static inline struct spl_fixed31_32 spl_fixpt_shl(struct spl_fixed31_32 arg, unsigned char shift)
+static inline struct spl_fixed31_32 spl_fixpt_shl(struct spl_fixed31_32 arg, unsigned int shift)
 {
 	SPL_ASSERT(((arg.value >= 0) && (arg.value <= LLONG_MAX >> shift)) ||
 		((arg.value < 0) && (arg.value >= ~(LLONG_MAX >> shift))));
@@ -203,7 +203,7 @@ static inline struct spl_fixed31_32 spl_fixpt_shl(struct spl_fixed31_32 arg, uns
  * @brief
  * result = arg >> shift
  */
-static inline struct spl_fixed31_32 spl_fixpt_shr(struct spl_fixed31_32 arg, unsigned char shift)
+static inline struct spl_fixed31_32 spl_fixpt_shr(struct spl_fixed31_32 arg, unsigned int shift)
 {
 	bool negative = arg.value < 0;
 
-- 
2.39.5

