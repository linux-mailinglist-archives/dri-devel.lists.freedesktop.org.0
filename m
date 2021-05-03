Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59F5371A70
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA406E98A;
	Mon,  3 May 2021 16:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4ED6E986;
 Mon,  3 May 2021 16:39:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B9B761876;
 Mon,  3 May 2021 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059959;
 bh=9DPveqMov/n1cxMWsJb513aDejn/IKzSpNcX7r7YSn4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ks0ajlRVSJdfU7qDTZlmpyivAkpfhTGHYZLE168BDou5W+PLjWOLOsMwk4jSrBABU
 DKoVdAcgJ7crd4DRk0VxHGqBnK6rG51yKeK+MLO2TiO6pBHAOpL15PRvU7/81OYOPV
 2/jHJMmY1Y0rtrALDw0NRnYzRVyiLUzxFyWlHuLrAhB1sdLG4o1tL2aCmC9DEENECR
 CeVDIwfYcZOy1ewblb43jYmbl851Go6s4I1nllS0k+S9SDS8DNW4aTjTIMD5s4hhCg
 H7rCuhoEm9t4BzLGkRmWNayQOpSwj0mC3QMUofjtcOVlpdEbEaLZgfca+QdKX+79np
 /34NKzVQCNEqA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 033/100] drm/amdkfd: Fix UBSAN
 shift-out-of-bounds warning
Date: Mon,  3 May 2021 12:37:22 -0400
Message-Id: <20210503163829.2852775-33-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163829.2852775-1-sashal@kernel.org>
References: <20210503163829.2852775-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Anson Jacob <Anson.Jacob@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anson Jacob <Anson.Jacob@amd.com>

[ Upstream commit 50e2fc36e72d4ad672032ebf646cecb48656efe0 ]

If get_num_sdma_queues or get_num_xgmi_sdma_queues is 0, we end up
doing a shift operation where the number of bits shifted equals
number of bits in the operand. This behaviour is undefined.

Set num_sdma_queues or num_xgmi_sdma_queues to ULLONG_MAX, if the
count is >= number of bits in the operand.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1472

Reported-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Anson Jacob <Anson.Jacob@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Tested-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/amdkfd/kfd_device_queue_manager.c   | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 8e5cfb1f8a51..6ea8a4b6efde 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1128,6 +1128,9 @@ static int set_sched_resources(struct device_queue_manager *dqm)
 
 static int initialize_cpsch(struct device_queue_manager *dqm)
 {
+	uint64_t num_sdma_queues;
+	uint64_t num_xgmi_sdma_queues;
+
 	pr_debug("num of pipes: %d\n", get_pipes_per_mec(dqm));
 
 	mutex_init(&dqm->lock_hidden);
@@ -1136,8 +1139,18 @@ static int initialize_cpsch(struct device_queue_manager *dqm)
 	dqm->active_cp_queue_count = 0;
 	dqm->gws_queue_count = 0;
 	dqm->active_runlist = false;
-	dqm->sdma_bitmap = ~0ULL >> (64 - get_num_sdma_queues(dqm));
-	dqm->xgmi_sdma_bitmap = ~0ULL >> (64 - get_num_xgmi_sdma_queues(dqm));
+
+	num_sdma_queues = get_num_sdma_queues(dqm);
+	if (num_sdma_queues >= BITS_PER_TYPE(dqm->sdma_bitmap))
+		dqm->sdma_bitmap = ULLONG_MAX;
+	else
+		dqm->sdma_bitmap = (BIT_ULL(num_sdma_queues) - 1);
+
+	num_xgmi_sdma_queues = get_num_xgmi_sdma_queues(dqm);
+	if (num_xgmi_sdma_queues >= BITS_PER_TYPE(dqm->xgmi_sdma_bitmap))
+		dqm->xgmi_sdma_bitmap = ULLONG_MAX;
+	else
+		dqm->xgmi_sdma_bitmap = (BIT_ULL(num_xgmi_sdma_queues) - 1);
 
 	INIT_WORK(&dqm->hw_exception_work, kfd_process_hw_exception);
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
