Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C10B81194B1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0AA6E980;
	Tue, 10 Dec 2019 21:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626156E96E;
 Tue, 10 Dec 2019 21:17:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7213C20836;
 Tue, 10 Dec 2019 21:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012097;
 bh=6fwUb6MigjWRWv6QEWMWqEYkJGBehiZ+r1aewxVkB0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2N260DjkA1ZYPqHnoDUUR+Hj26Vw5NsSE1Dv4DY8ubBLz52tpLXN4cVBeeduJvQIb
 q4XYPdY/OXs7YKn3/2frDQFqVycMOt1SC4YE5iFpAZ8DSLf2BH5gWGEKHO4FkD2yRU
 9KnHrXV1PhewCXpL/xoX4fF/TalSjzyq9LqU5GU4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 073/350] drm/amdkfd: Fix MQD size calculation
Date: Tue, 10 Dec 2019 16:02:58 -0500
Message-Id: <20191210210735.9077-34-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Kim <Jonathan.Kim@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oak Zeng <Oak.Zeng@amd.com>

[ Upstream commit 40a9592a26608e16f7545a068ea4165e1869f629 ]

On device initialization, a chunk of GTT memory is pre-allocated for
HIQ and all SDMA queues mqd. The size of this allocation was wrong.
The correct sdma engine number should be PCIe-optimized SDMA engine
number plus xgmi SDMA engine number.

Reported-by: Jonathan Kim <Jonathan.Kim@amd.com>
Signed-off-by: Jonathan Kim <Jonathan.Kim@amd.com>
Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index d985e31fcc1eb..f335f73919d15 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1676,7 +1676,8 @@ static int allocate_hiq_sdma_mqd(struct device_queue_manager *dqm)
 	struct kfd_dev *dev = dqm->dev;
 	struct kfd_mem_obj *mem_obj = &dqm->hiq_sdma_mqd;
 	uint32_t size = dqm->mqd_mgrs[KFD_MQD_TYPE_SDMA]->mqd_size *
-		dev->device_info->num_sdma_engines *
+		(dev->device_info->num_sdma_engines +
+		dev->device_info->num_xgmi_sdma_engines) *
 		dev->device_info->num_sdma_queues_per_engine +
 		dqm->mqd_mgrs[KFD_MQD_TYPE_HIQ]->mqd_size;
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
