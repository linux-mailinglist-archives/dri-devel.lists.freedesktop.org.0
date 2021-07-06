Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C7E3BCF25
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01DC6E457;
	Tue,  6 Jul 2021 11:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1286E455;
 Tue,  6 Jul 2021 11:27:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9270E61D99;
 Tue,  6 Jul 2021 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570875;
 bh=vXYDH9K+6se0soj7y+zLJcB1T3Flabi/5hQ0OnzmT0Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gC9YJYJxt4mmfr++LX6HQMfTwjT/5P0m1rSJyUaHl6uLuAaWCoDatmqPyhhXk06NU
 lsBnRkosvTe1PcVR0CfLhfMqgV2lEsbHrpqsUNltJXHy+fx77D8tbHYwE0mMiy4Uaw
 eHMyAqzRRi7I/XWxbcySEC9EJqpg/JdUbVKYnqpH53RmavV5a1FJ4wGr8xxR1ikBVp
 BT+1D/c4abCb5DS28yBvkKyiZ0seHesJ2YpxaQoR2L/bkroRd8bYlYe2L+cMGhZl25
 22Ijp/Qv6KNX0uXW+G/2iPbY+aoqeaT/MpAAn4W5PBbirEZOzWM6+i5B5IHU5osFWn
 J/VYHqUNlkCgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 04/45] drm/amd/amdgpu/sriov disable all ip hw
 status by default
Date: Tue,  6 Jul 2021 07:27:08 -0400
Message-Id: <20210706112749.2065541-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112749.2065541-1-sashal@kernel.org>
References: <20210706112749.2065541-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jack Zhang <Jack.Zhang1@amd.com>,
 dri-devel@lists.freedesktop.org, Emily Deng <Emily.Deng@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jack Zhang <Jack.Zhang1@amd.com>

[ Upstream commit 95ea3dbc4e9548d35ab6fbf67675cef8c293e2f5 ]

Disable all ip's hw status to false before any hw_init.
Only set it to true until its hw_init is executed.

The old 5.9 branch has this change but somehow the 5.11 kernrel does
not have this fix.

Without this change, sriov tdr have gfx IB test fail.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
Review-by: Emily Deng <Emily.Deng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index bc746a6e0ecc..076b22c44122 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1823,7 +1823,7 @@ static int amdgpu_sriov_reinit_early(struct amdgpu_device *adev)
 		AMD_IP_BLOCK_TYPE_IH,
 	};
 
-	for (i = 0; i < ARRAY_SIZE(ip_order); i++) {
+	for (i = 0; i < adev->num_ip_blocks; i++) {
 		int j;
 		struct amdgpu_ip_block *block;
 
-- 
2.30.2

