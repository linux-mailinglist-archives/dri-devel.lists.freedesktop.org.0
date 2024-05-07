Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE53D8BF011
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 00:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63062112708;
	Tue,  7 May 2024 22:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tg5CH+9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DADC112700;
 Tue,  7 May 2024 22:58:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8CFF361A08;
 Tue,  7 May 2024 22:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC18C4AF67;
 Tue,  7 May 2024 22:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715122708;
 bh=mpjbINDW+2/d3FdYR5rsR9d7Larq23IABHZvwgNlCbk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tg5CH+9utiASQl7G9wkgELfEEGYFcbzQiGydxi0L8Gp8f/VFlP5S/jRejv/S8Tub/
 pcIVjOG3Y4og1YbwED5PSM+Cn4D4FlKK3Uc4HmDLkz9UrTaW1Wz3YFeQ5EJBs/1z2z
 xKDGzS3lTS8/vNeLinvdVnl3siUtYmO69L8ZtxAySS7mjHooAiADPrQry9lA0YTlAw
 aNFi0EawUdVW9HGBJSHo4yYQ2cq/WFoPKq431vlJ/7HPt9i4il7TQqlbwPgAkzZkQh
 Mvd8Phkk8OYOx+WsL2/dq6L6oYZjrAAzFBrrXN2TuPPxgkQmm/8E2PLn1n2bkk3LSc
 gNVcTMU7uawkA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Derek Foreman <derek.foreman@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>, Sasha Levin <sashal@kernel.org>,
 airlied@gmail.com, daniel@ffwll.ch, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 19/23] drm/etnaviv: fix tx clock gating on some
 GC7000 variants
Date: Tue,  7 May 2024 18:56:45 -0400
Message-ID: <20240507225725.390306-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507225725.390306-1-sashal@kernel.org>
References: <20240507225725.390306-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.9
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

From: Derek Foreman <derek.foreman@collabora.com>

[ Upstream commit d7a5c9de99b3a9a43dce49f2084eb69b5f6a9752 ]

commit 4bce244272513 ("drm/etnaviv: disable tx clock gating for GC7000
rev6203") accidentally applied the fix for i.MX8MN errata ERR050226 to
GC2000 instead of GC7000, failing to disable tx clock gating for GC7000
rev 0x6023 as intended.

Additional clean-up further propagated this issue, partially breaking
the clock gating fixes added for GC7000 rev 6202 in commit 432f51e7deeda
("drm/etnaviv: add clock gating workaround for GC7000 r6202").

Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 9b8445d2a128f..89cb6799b547f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -632,8 +632,8 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
 	/* Disable TX clock gating on affected core revisions. */
 	if (etnaviv_is_model_rev(gpu, GC4000, 0x5222) ||
 	    etnaviv_is_model_rev(gpu, GC2000, 0x5108) ||
-	    etnaviv_is_model_rev(gpu, GC2000, 0x6202) ||
-	    etnaviv_is_model_rev(gpu, GC2000, 0x6203))
+	    etnaviv_is_model_rev(gpu, GC7000, 0x6202) ||
+	    etnaviv_is_model_rev(gpu, GC7000, 0x6203))
 		pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_TX;
 
 	/* Disable SE and RA clock gating on affected core revisions. */
-- 
2.43.0

