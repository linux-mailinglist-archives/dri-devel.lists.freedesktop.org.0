Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9413E58FFF0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7B0B44C2;
	Thu, 11 Aug 2022 15:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9633A2E1F;
 Thu, 11 Aug 2022 15:36:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7390FB82157;
 Thu, 11 Aug 2022 15:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F19DC433B5;
 Thu, 11 Aug 2022 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232174;
 bh=3WO1X/r96fVsa2TO+JzUldSo6EvsERimnvGpjqkZ4pc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nuO4RWeN8Z6N8ieq5f8QWfzCrdoZHUb5nbW9p50BWnSyPO1dMhee1Uddvh4XA8kua
 r/rdUD+Ih4AP4ut46ecTE3uOh5gbAHHbRda/+HKZ5IsSX7U5A8mmjKrcIyA7PrM0IE
 PKLO4mWyC03tXvy5EARJ8DWb3lp4cB7F405XUV5jHKad9ZjAguorilqU86YwlMHZFu
 LWNUqDwMnz4nUqhpXMWb7/xGEYrOzGsigIFsCWLh1OCNfwbOkjMxLGh7gzDl/Vf5fW
 k8dRcCTH7HNEMSwmu1BOu1e/SNul8/DVFX21NpUtPSvo/EOSLLKSpFrJCFXndeO9fP
 gmH46MqmZubEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 064/105] drm/amdgpu: Fix one list corruption when
 create queue fails
Date: Thu, 11 Aug 2022 11:27:48 -0400
Message-Id: <20220811152851.1520029-64-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 airlied@linux.ie, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: xinhui pan <xinhui.pan@amd.com>

[ Upstream commit cc3cb791f19ad0c4f951f38c98aa513b042ab329 ]

Queue would be freed when create_queue_cpsch fails
So lets do queue cleanup otherwise various list and memory issues
happen.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
Reviewed-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index e017b4240472..06417c7abca4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1666,14 +1666,13 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	if (q->properties.is_active) {
 		increment_queue_count(dqm, qpd, q);
 
-		if (!dqm->dev->shared_resources.enable_mes) {
+		if (!dqm->dev->shared_resources.enable_mes)
 			retval = execute_queues_cpsch(dqm,
-					     KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
-		} else {
+					KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+		else
 			retval = add_queue_mes(dqm, q, qpd);
-			if (retval)
-				goto cleanup_queue;
-		}
+		if (retval)
+			goto cleanup_queue;
 	}
 
 	/*
-- 
2.35.1

