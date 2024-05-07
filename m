Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E81A8BF031
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 01:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB38112FB4;
	Tue,  7 May 2024 23:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gKONpd7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE69A112FB4;
 Tue,  7 May 2024 23:00:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4952DCE1748;
 Tue,  7 May 2024 23:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB7EC3277B;
 Tue,  7 May 2024 23:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715122808;
 bh=+RiuBApR4VmUwmiO5W+rxSWu8QrEJw7Lo7Dza+YXVn4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gKONpd7bHI/iI8g1LHSghbCRhNqmDe7yAn14A0EJNn9H3stAh+6kHndWymKePHAlz
 QZwhC3sgNy1LtQIgJMWShOdCWbRkTIxuW9eHI7eaXyRAhJ4nQqJrYvuUz8N7O8saEZ
 hp1BJe7dwpb8WZGfYCMiyy+Na4NDQWKaKp/sprYCvYitVC5kzDn80kqnX24jqHagPP
 H0AgPT1GIFOo0MP8NnTcAkzUQzqYFhBrIpC7CTkUdnW9zwPelfUfidjRCSgBDGTEwU
 DYEn7nhHNrhE8fvtFq8LauRQCxY8PhC5Sb1WFubtcqgxH+QrnC6hzTcKAqLUA7Sdq8
 5fCgaRJNHqxeQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Derek Foreman <derek.foreman@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>, Sasha Levin <sashal@kernel.org>,
 airlied@gmail.com, daniel@ffwll.ch, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 17/19] drm/etnaviv: fix tx clock gating on some
 GC7000 variants
Date: Tue,  7 May 2024 18:58:39 -0400
Message-ID: <20240507225910.390914-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507225910.390914-1-sashal@kernel.org>
References: <20240507225910.390914-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.30
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
index 9276756e1397d..371e1f2733f6f 100644
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

