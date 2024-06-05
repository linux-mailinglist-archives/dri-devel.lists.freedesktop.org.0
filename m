Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18FA8FCBA3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9913D10E78D;
	Wed,  5 Jun 2024 12:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bxSef32A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7180710E78D;
 Wed,  5 Jun 2024 12:03:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E77CB61879;
 Wed,  5 Jun 2024 12:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A77C32781;
 Wed,  5 Jun 2024 12:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717589033;
 bh=huM3Hia/E8C/3CGVJFNUtJsHYsCR6y3z74t2rsw1sPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bxSef32AZ8FligZkolP9iURMo5sTk4PMJaN4QHVQUMwKp1yaT0aoGApIuyzDT0/5N
 eLgXV//WzlKnY9orInUmPd5xAt3h6mvQkSu2XAHHKS5Pj+J968u6+o9Fl6k6r7J/XF
 6Tpxjj4bhq8Ezha3gs55OyqG9vMuWZaPrkTBKxhLsBDH7l9KgBUOKJ9G4lWfWKlacs
 8ig/78ocJmsj3oegqOACr7Z9mqejLFPFjyAaJj9iAQSW6YsdIrCQgJZBuADGYjtT6l
 41mBBAUZwDwcCNygK92LotA314NDuDRR4Dkwuax1WSMsNJRg+wqgiPdfOnluyQ6FfI
 lSrpwp+zRepYA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Feifei Xu <feifei.xu@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.8 17/18] Revert "drm/amdkfd: fix gfx_target_version
 for certain 11.0.3 devices"
Date: Wed,  5 Jun 2024 08:03:07 -0400
Message-ID: <20240605120319.2966627-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120319.2966627-1-sashal@kernel.org>
References: <20240605120319.2966627-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.12
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

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit dd2b75fd9a79bf418e088656822af06fc253dbe3 ]

This reverts commit 28ebbb4981cb1fad12e0b1227dbecc88810b1ee8.

Revert this commit as apparently the LLVM code to take advantage of
this never landed.

Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: Feifei Xu <feifei.xu@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index fcf6558d019e5..7d39982bf74e2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -405,15 +405,8 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *adev, bool vf)
 			f2g = &gfx_v11_kfd2kgd;
 			break;
 		case IP_VERSION(11, 0, 3):
-			if ((adev->pdev->device == 0x7460 &&
-			     adev->pdev->revision == 0x00) ||
-			    (adev->pdev->device == 0x7461 &&
-			     adev->pdev->revision == 0x00))
-				/* Note: Compiler version is 11.0.5 while HW version is 11.0.3 */
-				gfx_target_version = 110005;
-			else
-				/* Note: Compiler version is 11.0.1 while HW version is 11.0.3 */
-				gfx_target_version = 110001;
+			/* Note: Compiler version is 11.0.1 while HW version is 11.0.3 */
+			gfx_target_version = 110001;
 			f2g = &gfx_v11_kfd2kgd;
 			break;
 		case IP_VERSION(11, 5, 0):
-- 
2.43.0

