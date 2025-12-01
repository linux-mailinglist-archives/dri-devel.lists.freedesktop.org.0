Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F3C96BA7
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 11:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63FC10E38B;
	Mon,  1 Dec 2025 10:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="slheEfRM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA87110E380;
 Mon,  1 Dec 2025 10:50:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 53EEF6014C;
 Mon,  1 Dec 2025 10:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E21C113D0;
 Mon,  1 Dec 2025 10:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764586245;
 bh=soLLIRsbuDfyantBFZTK0Fok4YmEK6Tih/8wUoUvq3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=slheEfRM4qq4CBY706N9NiDZkoNhrtLL3LdJB3q+32lOQZN31j+ES1wWKUKQIZjMh
 O/K1ln97Il8byeLhs+vJ+hNeGh6fn9oPvvd+S8fwyvw1XN41fLNHuEy8Rw2ptq5BIy
 3EP5XlafFZUMbvVtGmZATm5tmVw9usBYsLFdXP57HcVGaC59EFEXlGib28hruszN2f
 bGtjaF1xcCRi2nbyCN/n2hbmgPmfg5MDMZDWQ2K/20rA6Ba5BDbPGwUALNDDytAtLm
 TbZbgiE5EP3tXtQq0LD5DTG3MQ0JjqN3QTts2r4CQDiUAaFaKdHWhnPGSynEO05c9i
 YaHjWO07eZnFA==
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
Subject: [PATCH v2 3/8] amd/amdkfd: Use dma_fence_check_and_signal()
Date: Mon,  1 Dec 2025 11:50:07 +0100
Message-ID: <20251201105011.19386-5-phasta@kernel.org>
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

amdkfd is one of the few users which relies on the return code of
dma_fence_signal(), which, so far, informs the caller whether the fence
had already been signaled.

As there are barely any users, dma_fence signaling functions shall get
the return value void. To do so, the few users must be ported to a
function which preserves the old behavior.

Replace the call to dma_fence_signal() with one to
dma_fence_check_and_signal().

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index ddfe30c13e9d..4dc46ac6a65e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1983,10 +1983,10 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
 	return -EINVAL;
 }
 
-static int signal_eviction_fence(struct kfd_process *p)
+static bool signal_eviction_fence(struct kfd_process *p)
 {
 	struct dma_fence *ef;
-	int ret;
+	bool ret;
 
 	rcu_read_lock();
 	ef = dma_fence_get_rcu_safe(&p->ef);
@@ -1994,7 +1994,7 @@ static int signal_eviction_fence(struct kfd_process *p)
 	if (!ef)
 		return -EINVAL;
 
-	ret = dma_fence_signal(ef);
+	ret = dma_fence_check_and_signal(ef);
 	dma_fence_put(ef);
 
 	return ret;
-- 
2.49.0

