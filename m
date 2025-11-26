Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84832C89F9C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 14:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA15C10E5EE;
	Wed, 26 Nov 2025 13:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SlzUKnq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAF210E5EC;
 Wed, 26 Nov 2025 13:20:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 242B940BFF;
 Wed, 26 Nov 2025 13:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F58C113D0;
 Wed, 26 Nov 2025 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764163234;
 bh=lgAu6095fUG7URUtB5h9h1pWeOKehgRUT+IfEnrX0L8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SlzUKnq7+JYkCPIISBxuVSJtdfIbgnro2PHCDrhP1dJKS3DVMtUcilQacvEz/ee17
 n/rAZbBLl1tDeiGBZMIfP903XFYmcmrpBfkc8FMNkSMAS5rh0UfG9DP0he9+bjVsGh
 X8NmWUTmwUR3GL7sikPHs0vQ2bTo45s6VLia93pI3VaJ0ZubUQToiKczIjcBU3OYJH
 76rPpa7YG4R/HdNwlS3tq9eBfDQfTnu4JO+iNOIJ01Ta2z0h+YCkqh/kjqfGUp2F4F
 Hm0Zlee+s4KQs9RusVyTgY9xIZfMwbSIzZxLh5C2T1MI6nNapaHJFzmkrvgHBUK7NB
 bgrvQM/LDGb7A==
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
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 5/6] drm/ttm: Remove return check of dma_fence_signal()
Date: Wed, 26 Nov 2025 14:19:14 +0100
Message-ID: <20251126131914.149445-7-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251126131914.149445-2-phasta@kernel.org>
References: <20251126131914.149445-2-phasta@kernel.org>
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
from the kernel. To do so, all users must be removed.

Remove usage of dma_fence_signal()'s return code.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 1bcc67977f48..34957624910f 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -692,7 +692,8 @@ static int threaded_fence_signal(void *arg)
 
 	msleep(20);
 
-	return dma_fence_signal(fence);
+	dma_fence_signal(fence);
+	return 0;
 }
 
 static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
-- 
2.49.0

