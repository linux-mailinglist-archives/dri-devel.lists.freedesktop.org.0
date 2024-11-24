Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179369D70F1
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AEA10E510;
	Sun, 24 Nov 2024 13:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZUA4eoFu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD5C10E50C;
 Sun, 24 Nov 2024 13:41:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 26AB85C4C12;
 Sun, 24 Nov 2024 13:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A14C4CED1;
 Sun, 24 Nov 2024 13:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455712;
 bh=oIyQxwGdwqUC/hQTDeVTkBG8rrVwIeGSvXaC+IUhS30=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZUA4eoFuHhScm2heAW2ALSE8l9JqlQfQE+FDu9cZFn20TybfrbV6AV4MkTdqz26wK
 3WwjLS8FBqhcRR+D2c8IITzzdkEW3dshR254tEabzGnCRCoVl8RRYxX18Uk38JCIdu
 n8+SpPE4Y1oY90+AZOirXEos0xoGk+rYv+hC14lZwK6jyCAlBOu9UDlDmGqejZOxu5
 FF6yBxVSfaMDEL9gsaWY9cQ+K2MOA9dTS1fHmOVE9XOA1GfHLpPYnrnhOf7fbrNA5a
 Y8qmxufnLpPD/X+I80V4r5bsHNcijevLRNqV92Jd8DilWHkSZFwsrCtoNl5BZhml1f
 PRfnPSTXcyjyw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Sasha Levin <sashal@kernel.org>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch,
 hamza.mahfooz@amd.com, alex.hung@amd.com, chiahsuan.chung@amd.com,
 sunil.khatri@amd.com, aurabindo.pillai@amd.com, mwen@igalia.com,
 Wayne.Lin@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 20/87] drm/amd/display: disable SG displays on
 cyan skillfish
Date: Sun, 24 Nov 2024 08:37:58 -0500
Message-ID: <20241124134102.3344326-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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

[ Upstream commit 66369db7fdd7d58d78673bf83d2b87ea623efb63 ]

These parts were mainly for compute workloads, but they have
a display that was available for the console.  These chips
should support SG display, but I don't know that the support
was ever validated on Linux so disable it by default. It can
still be enabled by setting sg_display=1 for those that
want to play with it.  These systems also generally had large
carve outs so SG display was less of a factor.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3356
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 339bdfb7af2f8..90df415ece0bf 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1871,7 +1871,11 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 		else
 			init_data.flags.gpu_vm_support = (amdgpu_sg_display != 0);
 	} else {
-		init_data.flags.gpu_vm_support = (amdgpu_sg_display != 0) && (adev->flags & AMD_IS_APU);
+		if (amdgpu_ip_version(adev, DCE_HWIP, 0) == IP_VERSION(2, 0, 3))
+			init_data.flags.gpu_vm_support = (amdgpu_sg_display == 1);
+		else
+			init_data.flags.gpu_vm_support =
+				(amdgpu_sg_display != 0) && (adev->flags & AMD_IS_APU);
 	}
 
 	adev->mode_info.gpu_vm_support = init_data.flags.gpu_vm_support;
-- 
2.43.0

