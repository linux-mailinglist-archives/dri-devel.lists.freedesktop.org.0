Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF58FCB93
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48F210E773;
	Wed,  5 Jun 2024 12:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cegeb1HP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694DC10E66E;
 Wed,  5 Jun 2024 12:03:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AD543CE1764;
 Wed,  5 Jun 2024 12:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B7AC32786;
 Wed,  5 Jun 2024 12:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717588983;
 bh=zKphogx/8wYxjzGfOYOpMTs9aysgexbDswaF4oPT8KU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cegeb1HPeeJXgdaBxlkr8llciIflxHKuyz5agMRtVDKyRnLe5lKd4bIK7wbIKu+jw
 B14BI37p6+mVzC2T/JMMtl5y/uD5rTXxfWpuF0Auq8Um0H+NFlNsKg5y32HQfy4fh0
 y32cwXn4JnqFpB+jeHJ+Ek3ZJlPAruGBDA44KChZYVxxCK2miKx3szV575vdu3WR8C
 tZlilqaFTeuOn3L5eTeSS7FypyLISwg5oF3O/IkvsNqC/YvYlb/YteQcA4YsnlWFKT
 6ddEv6c4hbbDMWTjE6JcHmqb47GsvvcuFY41MVMIW321xc0A4AZpHq+5+aDYMG4Evr
 +51VgoaI1EhMQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Feifei Xu <feifei.xu@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.9 21/23] Revert "drm/amdkfd: fix gfx_target_version
 for certain 11.0.3 devices"
Date: Wed,  5 Jun 2024 08:02:04 -0400
Message-ID: <20240605120220.2966127-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120220.2966127-1-sashal@kernel.org>
References: <20240605120220.2966127-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.3
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
index 719d6d365e150..ff01610fbce3b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -408,15 +408,8 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *adev, bool vf)
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

