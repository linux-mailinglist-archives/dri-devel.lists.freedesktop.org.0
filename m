Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6941E6C556D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 20:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFFE10E108;
	Wed, 22 Mar 2023 19:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CA410E16C;
 Wed, 22 Mar 2023 19:58:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65C9962276;
 Wed, 22 Mar 2023 19:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF78DC4339C;
 Wed, 22 Mar 2023 19:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515111;
 bh=2sqtOj+1ALMyYEPN/XCPWThb1VdY14/vc//Wws1RtxA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ad5Kpn8XmMNmxeQMCZ7Epl8iLEBw23WEMiafpGKN6/lz/ImUkX3IY3MyMRoIU43Hc
 pPqBwuGwJCUax8rncXE+uhMRcoEh6Jfq87PJq7UKOXqmUwhfhPY8DLB+ZTx6m81Pzz
 ZHTrPrMqYu1mctTGEShFM6kzcdzC2iEemPF29hfU0vVk8BxbguDIaik6+e4/awP/dB
 Z83FfKcq4J5HNUq5ah8Op9hZAKKIY7abdk40Ay32RMH3fteMT1IYRxhcq4jztCTMbd
 nmD4fTGEBlNmmEeeLfqeLqTrcPdUHFjqnzXVfwcJExXbJguh87hLBs4W0CGnj+i8cu
 cPV/S1Ewnzw7g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 25/45] drm/amdkfd: fix a potential double free in
 pqm_create_queue
Date: Wed, 22 Mar 2023 15:56:19 -0400
Message-Id: <20230322195639.1995821-25-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chia-I Wu <olvaffe@gmail.com>

[ Upstream commit b2ca5c5d416b4e72d1e9d0293fc720e2d525fd42 ]

Set *q to NULL on errors, otherwise pqm_create_queue would free it
again.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 5137476ec18e6..4236539d9f932 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -218,8 +218,8 @@ static int init_user_queue(struct process_queue_manager *pqm,
 	return 0;
 
 cleanup:
-	if (dev->shared_resources.enable_mes)
-		uninit_queue(*q);
+	uninit_queue(*q);
+	*q = NULL;
 	return retval;
 }
 
-- 
2.39.2

