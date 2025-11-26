Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF1BC89F90
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 14:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5175B10E5E9;
	Wed, 26 Nov 2025 13:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TwtlcmIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B638610E5EB;
 Wed, 26 Nov 2025 13:20:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9C6BD44346;
 Wed, 26 Nov 2025 13:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89199C116B1;
 Wed, 26 Nov 2025 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764163227;
 bh=UWZRmAEzkRqq5oGLP1a96kp5nn+UOgdKzQBXsbq4Mcc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TwtlcmIlc7KO7bkTPkzH6jVSl0c0R12kc6TX9T7fQ2Z88iPp6WbrfIkqrHVAY8oyV
 sTD4ZtmpevXeOQ8otE8u/HMIAOCWUNURuiB8yFzWBH+4THH8FAGv6kXCTfUpp1Rfyj
 3A/rYMsX0hPycQYG/bp+iKnWpoRPl5Djqyv0/6nj76SU4aGAPZHcOK8QiZv8ez9kJR
 d0KFSmR0lj6gdUB2bU/9mwbdzzfYfNOZFrK+GhnugiPGBOmbHkEG5+KO7HCSxYj7ii
 d1VDQ2ToDs0voceBmjaEJLdXGjuv3FR3ffa+lZW1Hez+8c7Z2WhjDyVnuGi0oS1VLD
 Ui6T8oE/fHQVg==
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
Subject: [PATCH 4/6] dma-buf: Don't misuse dma_fence_signal()
Date: Wed, 26 Nov 2025 14:19:13 +0100
Message-ID: <20251126131914.149445-6-phasta@kernel.org>
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

The return code of dma_fence_signal() is not really useful as there is
nothing reasonable to do if a fence was already signaled. That return
code shall be removed from the kernel.

Moreover, dma_fence_signal() should not be used to check whether fences
are signaled. That's what dma_fence_is_signaled() and
dma_fence_test_signaled_flag() exist for.

Replace the non-canonical usage of dma_fence_signal().

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/st-dma-fence.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index 27a36045410b..9fc93859f36f 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -126,17 +126,14 @@ static int test_signaling(void *arg)
 		goto err_free;
 	}
 
-	if (dma_fence_signal(f)) {
-		pr_err("Fence reported being already signaled\n");
-		goto err_free;
-	}
+	dma_fence_signal(f);
 
 	if (!dma_fence_is_signaled(f)) {
 		pr_err("Fence not reporting signaled\n");
 		goto err_free;
 	}
 
-	if (!dma_fence_signal(f)) {
+	if (!dma_fence_test_signaled_flag(f)) {
 		pr_err("Fence reported not being already signaled\n");
 		goto err_free;
 	}
-- 
2.49.0

