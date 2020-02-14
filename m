Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87F515DE53
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4CF6FA24;
	Fri, 14 Feb 2020 16:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FF66FA1F;
 Fri, 14 Feb 2020 16:04:19 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88A6C24676;
 Fri, 14 Feb 2020 16:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696259;
 bh=Dalcud8G3DF/3fo1QodJmuZ93FL/HOW+boXVE+ef1Cw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D9l6nhgg46NNiY4lYsHxlUloYVV0RoEjH4AxXNBDLUkCCjrGii+jdYntlX65hheoF
 gdl3MBgowNMeNP8K26loXDe8tY+AOyqjlTALbLnMZW/JCLR3prBG8DGD+nZWrdIL6k
 lq2YXfv6Etxz63OBDwd2/bJujjwYwYeGopQho1bc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 113/459] drm/amdkfd: Fix a bug in SDMA RLC queue
 counting under HWS mode
Date: Fri, 14 Feb 2020 10:56:03 -0500
Message-Id: <20200214160149.11681-113-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Yong Zhao <Yong.Zhao@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yong Zhao <Yong.Zhao@amd.com>

[ Upstream commit f38abc15d157b7b31fa7f651dc8bf92858c963f8 ]

The sdma_queue_count increment should be done before
execute_queues_cpsch(), which calls pm_calc_rlib_size() where
sdma_queue_count is used to calculate whether over_subscription is
triggered.

With the previous code, when a SDMA queue is created,
compute_queue_count in pm_calc_rlib_size() is one more than the
actual compute queue number, because the queue_count has been
incremented while sdma_queue_count has not. This patch fixes that.

Signed-off-by: Yong Zhao <Yong.Zhao@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index f335f73919d15..a2ed9c257cb0d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1181,16 +1181,18 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 
 	list_add(&q->list, &qpd->queues_list);
 	qpd->queue_count++;
+
+	if (q->properties.type == KFD_QUEUE_TYPE_SDMA)
+		dqm->sdma_queue_count++;
+	else if (q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI)
+		dqm->xgmi_sdma_queue_count++;
+
 	if (q->properties.is_active) {
 		dqm->queue_count++;
 		retval = execute_queues_cpsch(dqm,
 				KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
 	}
 
-	if (q->properties.type == KFD_QUEUE_TYPE_SDMA)
-		dqm->sdma_queue_count++;
-	else if (q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI)
-		dqm->xgmi_sdma_queue_count++;
 	/*
 	 * Unconditionally increment this counter, regardless of the queue's
 	 * type or whether the queue is active.
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
