Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CEFAACF86
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 23:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7F810E083;
	Tue,  6 May 2025 21:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aDucf8Gg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B84610E083
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 21:35:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 58044A4C3CC;
 Tue,  6 May 2025 21:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B30AC4CEEF;
 Tue,  6 May 2025 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746567348;
 bh=Qe5sNRWYtiTfgDv5ouAxuNIYGGRjOlvUc6icwUgzKIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aDucf8GgI63lDRSbjqo7/kABWG/zFqg4Qw+KJzzBRHUuHiVEZaBpIbl/40Nv95RdP
 mj06GadJWXnkPkIVUalGAhlHKhBNK24l9cD1rqJjwVbTaLQ/AAdUAtbSRY7AnvFgWJ
 tM8ADTmcXQNGgOl1Qfl43nPJSY/c/EE4864WtfbRAkwE3KkZ1b6+ClJgBq24bYyXF8
 His1aDWT6OiD5mu8y26RoRMUYqH8eVoYWJTMn3JGAJcHCHphUsxHwCTct9INtNA7sn
 9Xoj7e9++0cZlsm0Oacad5+rk8+dX/Wtia/L/IcMl4iV6K3RoBKOWDQs8qK6aAZ42J
 i8M1Cmu8t/8Jg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sunil Khatri <sunil.khatri@amd.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, ray.huang@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 11/20] drm/ttm: fix the warning for hit_low and
 evict_low
Date: Tue,  6 May 2025 17:35:14 -0400
Message-Id: <20250506213523.2982756-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506213523.2982756-1-sashal@kernel.org>
References: <20250506213523.2982756-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Sunil Khatri <sunil.khatri@amd.com>

[ Upstream commit 76047483fe94414edf409dc498498abf346e22f1 ]

fix the below warning messages:
ttm/ttm_bo.c:1098: warning: Function parameter or struct member 'hit_low' not described in 'ttm_bo_swapout_walk'
ttm/ttm_bo.c:1098: warning: Function parameter or struct member 'evict_low' not described in 'ttm_bo_swapout_walk'

Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: Christian König <christian.koenig@amd.com>
Link: https://lore.kernel.org/r/20250423042442.762108-1-sunil.khatri@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ea5e498588573..72c675191a022 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1092,7 +1092,8 @@ struct ttm_bo_swapout_walk {
 	struct ttm_lru_walk walk;
 	/** @gfp_flags: The gfp flags to use for ttm_tt_swapout() */
 	gfp_t gfp_flags;
-
+	/** @hit_low: Whether we should attempt to swap BO's with low watermark threshold */
+	/** @evict_low: If we cannot swap a bo when @try_low is false (first pass) */
 	bool hit_low, evict_low;
 };
 
-- 
2.39.5

