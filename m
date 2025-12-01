Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D796CC96BC2
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 11:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3353210E391;
	Mon,  1 Dec 2025 10:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cztmh2b1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B77310E390;
 Mon,  1 Dec 2025 10:51:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8E4E060163;
 Mon,  1 Dec 2025 10:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A2FC4CEF1;
 Mon,  1 Dec 2025 10:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764586262;
 bh=weqR/k6bdbRE4AndEp4LhhGi2UzLYefCKJre4wdO4eM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cztmh2b1+F4gfiasJbMsWE/qSkS82JpFMlm/0WEWAQq4MkG0cQ5prUks+WOxnrC+I
 EnkNe36MccmTR7x1s738D9S1JOP/mYuReRRAR4Lh1nqZdbhUUOupxxY/0+TjxbiqzU
 vPUSzr9Kxop6wOaxnR08AutarKfwoYuqMm37sLUxuoPy4bjbM7UnOTqqpItCtPnpUd
 tIUm/S9EOpvMIVoVdbNIlwRP8H0vypQ8MJx1eIijrxjGXnc5KpM60zT3NBE7WG5rgX
 yMUp16KlA+vQHzzy2Gz57WZLYDVj5ZxYl7B3DTLLRevpjF4hU9rORH199i2rKYGBKT
 0xLO9jmc9Tn9w==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 6/8] drm/ttm: Use dma_fence_check_and_signal()
Date: Mon,  1 Dec 2025 11:50:10 +0100
Message-ID: <20251201105011.19386-8-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251201105011.19386-2-phasta@kernel.org>
References: <20251201105011.19386-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The return code of dma_fence_signal() is not useful and shall be removed
from the kernel. To do so, the few users who rely on the return code
must be ported.

Use dma_fence_check_and_signal() and mapp its boolean return code to
dma_fence_signal()'s former value for already-signaled fences.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 1bcc67977f48..eaf2e91f8e97 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -692,7 +692,7 @@ static int threaded_fence_signal(void *arg)
 
 	msleep(20);
 
-	return dma_fence_signal(fence);
+	return dma_fence_check_and_signal(fence) ? -EINVAL : 0;
 }
 
 static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
-- 
2.49.0

