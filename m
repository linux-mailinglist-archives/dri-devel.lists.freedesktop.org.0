Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D860963840
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 04:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C57C10E0D4;
	Thu, 29 Aug 2024 02:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="TaJuXdaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-110.freemail.mail.aliyun.com
 (out30-110.freemail.mail.aliyun.com [115.124.30.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E809510E0D4;
 Thu, 29 Aug 2024 02:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1724899025; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=wMQwFo6g6tszV+9ZlBCy+iOoyHhp9U9JGEfN9QAnmGc=;
 b=TaJuXdaUK42yasj6dKZLG17lKKq/LDz/XDNvrHEOI9twnHzXTjiDM0sJ4ZZBNQyx1/Uyj69151ddvnkcUdenr05mqO7fjK3wCuaiM2NZ5YglTj1vQZPf464FfdoEYfkbvMTpffzyT1tWJz7eKxiRfN//glm/9PZEyAHSDQQa9F0=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WDrLx0U_1724899015) by smtp.aliyun-inc.com;
 Thu, 29 Aug 2024 10:37:05 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/amd/display: Remove the redundant else if branch in
 the function amdgpu_dm_init()
Date: Thu, 29 Aug 2024 10:36:54 +0800
Message-Id: <20240829023654.20884-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
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

The assignment of the else and if else branches is the same, so we
remove it and add comments here to make the code easier to understand.

./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1871:6-8: WARNING: possible condition with no effect (if == else).

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9829
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e14c0c060e1b..71624917c475 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1868,9 +1868,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 		init_data.flags.disable_ips = DMUB_IPS_DISABLE_DYNAMIC;
 	else if (amdgpu_dc_debug_mask & DC_DISABLE_IPS2_DYNAMIC)
 		init_data.flags.disable_ips = DMUB_IPS_RCG_IN_ACTIVE_IPS2_IN_OFF;
-	else if (amdgpu_dc_debug_mask & DC_FORCE_IPS_ENABLE)
-		init_data.flags.disable_ips = DMUB_IPS_ENABLE;
-	else
+	else /* The branch cover "else if (amdgpu_dc_debug_mask & DC_FORCE_IPS_ENABLE)" */
 		init_data.flags.disable_ips = DMUB_IPS_ENABLE;
 
 	init_data.flags.disable_ips_in_vpb = 0;
-- 
2.32.0.3.g01195cf9f

