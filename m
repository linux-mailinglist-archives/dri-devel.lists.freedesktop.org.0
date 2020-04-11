Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC56E1A54EC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6CB6E334;
	Sat, 11 Apr 2020 23:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E33B6E35F;
 Sat, 11 Apr 2020 23:08:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BF7D20CC7;
 Sat, 11 Apr 2020 23:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646503;
 bh=JKifc22C2UL+b3jQWkj/4fHSC1WFMr8V0XiS/e49728=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RPo7XBXCnfp3chPAAm2FAGwv/8i2UBXbNOskFbzDbjL+WPUF7AYxBYVrbOj9MU5zU
 Oe5Wb3g20PMH3/NmkyhVomdSSc8kuDOpADoRbYZVjKLdQgrcUcVMXjqHwTY+qENhJs
 x/B4C7V0J0oSBuWu4OZe6NOwAAJ8ryj8MSSsGXYk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 063/121] drm/amd/display: dc_get_vmid_use_vector()
 crashes when get called
Date: Sat, 11 Apr 2020 19:06:08 -0400
Message-Id: <20200411230706.23855-63-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230706.23855-1-sashal@kernel.org>
References: <20200411230706.23855-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 Peikang Zhang <peikang.zhang@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Peikang Zhang <peikang.zhang@amd.com>

[ Upstream commit 68bbca15e7062f4ae16531e29893f78d0b4840b6 ]

[Why]
int i can go out of boundary which will cause crash

[How]
Fixed the maximum value of i to avoid i going out of boundary

Signed-off-by: Peikang Zhang <peikang.zhang@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c b/drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c
index a96d8de9380e6..f2b39ec35c898 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_vm_helper.c
@@ -62,7 +62,7 @@ int dc_get_vmid_use_vector(struct dc *dc)
 	int i;
 	int in_use = 0;
 
-	for (i = 0; i < dc->vm_helper->num_vmid; i++)
+	for (i = 0; i < MAX_HUBP; i++)
 		in_use |= dc->vm_helper->hubp_vmid_usage[i].vmid_usage[0]
 			| dc->vm_helper->hubp_vmid_usage[i].vmid_usage[1];
 	return in_use;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
