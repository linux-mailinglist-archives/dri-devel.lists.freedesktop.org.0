Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D81AECFA
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 15:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10836EC8D;
	Sat, 18 Apr 2020 13:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F85F6EC8B;
 Sat, 18 Apr 2020 13:49:08 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BDEB22264;
 Sat, 18 Apr 2020 13:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587217747;
 bh=Q+1ZS5W6jXT+EKzQgp5O3Yy0jxmJ2fHRHozCR6SdLn4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RUSO2epRig3pCJhFjzgutEumObPx9PCdD4qw/p29RcRhi7aV3WhGpOrdRXwUmGsM2
 WFK6hOXwZze9d6BeCGrnP4woHBLH882wAVwnNF4G8ZP7IEgocCUxe8Px09ki0Nhz8H
 4bUuwjmdMTctGMD0OgJwRTc/slQswD4EI8usWW00=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 41/73] drm/amdkfd: kfree the wrong pointer
Date: Sat, 18 Apr 2020 09:47:43 -0400
Message-Id: <20200418134815.6519-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418134815.6519-1-sashal@kernel.org>
References: <20200418134815.6519-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jack Zhang <Jack.Zhang1@amd.com>

[ Upstream commit 3148a6a0ef3cf93570f30a477292768f7eb5d3c3 ]

Originally, it kfrees the wrong pointer for mem_obj.
It would cause memory leak under stress test.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
Acked-by: Nirmoy Das <nirmoy.das@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 2a9e401317353..0d70cb2248fe9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -1104,9 +1104,9 @@ int kfd_gtt_sa_allocate(struct kfd_dev *kfd, unsigned int size,
 	return 0;
 
 kfd_gtt_no_free_chunk:
-	pr_debug("Allocation failed with mem_obj = %p\n", mem_obj);
+	pr_debug("Allocation failed with mem_obj = %p\n", *mem_obj);
 	mutex_unlock(&kfd->gtt_sa_lock);
-	kfree(mem_obj);
+	kfree(*mem_obj);
 	return -ENOMEM;
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
