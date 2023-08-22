Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42531783F5A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D072210E318;
	Tue, 22 Aug 2023 11:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEB510E316;
 Tue, 22 Aug 2023 11:36:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0162B630FE;
 Tue, 22 Aug 2023 11:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2B1C433CC;
 Tue, 22 Aug 2023 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692704217;
 bh=HQ5QJJSN08885TpSRXm2hpmGX0bb7s0BUTyJfKB4e4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aZDfW2o8DD10haGwV8Wa0KtdqTK9HRuzF1F2cP5YCyQZLnjGE2zxdvSDbkVXiL5HO
 yytBSkOZw3nQW0vlDtFlZ51G+NeqhqVKmqeoZa9D15UkLqGOGJikum8DSvn2w929Iu
 aBAx4FU7lJPT9S1aZ7iYk+thSWrSYzfhaVZLJTLZ85cDIP27sKvgEMhjtmofoqQeQ/
 8+RwJoueg2LiLegKec41EIreqiP6ZLZMAz62CzFkkYM01u62EJuP//Ra6DwJwvH242
 eNZHw7vvUqJDOpsZaSxEMd+7iFQHul07XMHft48nsJtJY7g7yHsIllPZKdIaS0N9wE
 OtzjXTuy5D7tA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 10/10] drm/amdkfd: disable IOMMUv2 support for
 Raven
Date: Tue, 22 Aug 2023 07:36:28 -0400
Message-Id: <20230822113628.3551393-10-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822113628.3551393-1-sashal@kernel.org>
References: <20230822113628.3551393-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.46
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
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 091ae5473f96ced844af6ba39b94757359b12348 ]

Use the dGPU path instead.  There were a lot of platform
issues with IOMMU in general on these chips due to windows
not enabling IOMMU at the time.  The dGPU path has been
used for a long time with newer APUs and works fine.  This
also paves the way to simplify the driver significantly.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Tested-by: Mike Lothian <mike@fireburn.co.uk>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 4cc5debdd119b..af18378e58d9f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -185,11 +185,6 @@ static void kfd_device_info_init(struct kfd_dev *kfd,
 
 		kfd_device_info_set_event_interrupt_class(kfd);
 
-		/* Raven */
-		if (gc_version == IP_VERSION(9, 1, 0) ||
-		    gc_version == IP_VERSION(9, 2, 2))
-			kfd->device_info.needs_iommu_device = true;
-
 		if (gc_version < IP_VERSION(11, 0, 0)) {
 			/* Navi2x+, Navi1x+ */
 			if (gc_version == IP_VERSION(10, 3, 6))
@@ -287,7 +282,6 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *adev, bool vf)
 			gfx_target_version = 90000;
 			f2g = &gfx_v9_kfd2kgd;
 			break;
-#ifdef KFD_SUPPORT_IOMMU_V2
 		/* Raven */
 		case IP_VERSION(9, 1, 0):
 		case IP_VERSION(9, 2, 2):
@@ -295,7 +289,6 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *adev, bool vf)
 			if (!vf)
 				f2g = &gfx_v9_kfd2kgd;
 			break;
-#endif
 		/* Vega12 */
 		case IP_VERSION(9, 2, 1):
 			gfx_target_version = 90004;
-- 
2.40.1

