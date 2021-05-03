Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC84371AA0
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E436E9A2;
	Mon,  3 May 2021 16:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4E66E9A2;
 Mon,  3 May 2021 16:40:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E744616EC;
 Mon,  3 May 2021 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620060013;
 bh=k6iANoMTLPnPloJAeQYtfa5ypFFqgGwkDw4/6S1NuD0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qgKvCuDU69cxMVYsQYDH7CIOFycI5XqLYhncXSxYL578Krv5Gx1/+LdxDeO18W5Ar
 Bqdp0Uox8mEwOXfziMhBOisKHKECHMSgttnnUVNAACcGcDZ7gUbusKlVgZkNSWubwd
 zqWbQReE16jWwezpWP7vHR+nnZpsu6wpUzvsu2iP7+0gzc9mrcPvL8rP3Sw7EfdSUy
 4/osWtsmt2u55oPxw1wXLRRkyarWA/SEscOn9jbThv/deTb1u691AAJtviQaLLpBwg
 fwUkvzqCU11+Zw/gcDDRsPFnWORpmMxbrOEJSK1J4q5yhMYebjlv27W3hhDWlS8BVr
 ZKLLEDlYEJueQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 21/57] drm/amdkfd: Fix UBSAN shift-out-of-bounds
 warning
Date: Mon,  3 May 2021 12:39:05 -0400
Message-Id: <20210503163941.2853291-21-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163941.2853291-1-sashal@kernel.org>
References: <20210503163941.2853291-1-sashal@kernel.org>
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
index e9a278440079..ab69898c9cb7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1011,6 +1011,9 @@ static int set_sched_resources(struct device_queue_manager *dqm)
 
 static int initialize_cpsch(struct device_queue_manager *dqm)
 {
+	uint64_t num_sdma_queues;
+	uint64_t num_xgmi_sdma_queues;
+
 	pr_debug("num of pipes: %d\n", get_pipes_per_mec(dqm));
 
 	mutex_init(&dqm->lock_hidden);
@@ -1019,8 +1022,18 @@ static int initialize_cpsch(struct device_queue_manager *dqm)
 	dqm->sdma_queue_count = 0;
 	dqm->xgmi_sdma_queue_count = 0;
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
