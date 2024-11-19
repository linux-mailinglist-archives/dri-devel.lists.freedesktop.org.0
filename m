Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BE29D2F90
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 21:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC77B10E363;
	Tue, 19 Nov 2024 20:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="P57nhXr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0992710E363;
 Tue, 19 Nov 2024 20:36:56 +0000 (UTC)
Received: from localhost.localdomain ([90.11.132.44])
 by smtp.orange.fr with ESMTPA
 id DUxytSUZHgiuVDUxyt3ul2; Tue, 19 Nov 2024 21:36:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1732048615;
 bh=ZhEWScZ9cqnOnTV9yj0gNXc3fVhx21n0ePBE8U68IHM=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=P57nhXr38pLvajtcxUwpyqtxVAZnB3p7P873TOjBwuUwX2eTr9aw0DTGzJulbMwms
 B6RqDI5XSi8xi+YjRLToHCFNSusSJ3RooJBgwq1RInVrUuNMHriQ66D5yuJIMTAN07
 MIlTtWSqUA48jR1Rak662jtiUSWbGDWp1jsAM7ZwjkZkH/jj78KeBv3l2+1RBHobx5
 z7O1tT6WOIZJ4q94OdrRbuomYk2ceHa55IOK0lKC3UfnZ9iKdBotJV5NRVB9HJjXf9
 ooLVsD4qqPhS+/LJnj8t1JJfVl7Uuawy0kpdIL6nwyB0qMC70RqhY/4aqljtCkiZPi
 ukkbxXnUm+mLg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 19 Nov 2024 21:36:55 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Le Ma <Le.Ma@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Fix an error handling path in
 amdgpu_device_xgmi_reset_func()
Date: Tue, 19 Nov 2024 21:36:43 +0100
Message-ID: <59760ee9c40003b50eac7fd08f20a6c3e3acf5d0.1732048587.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
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

In case of error after a amdgpu_gfx_rlc_enter_safe_mode() call, it is not
balanced by a corresponding amdgpu_gfx_rlc_exit_safe_mode() call.

Add the missing call.

Fixes: c6a6e2db9945 ("drm/amdgpu: Redo XGMI reset synchronization.")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This patch is completely speculative, review with care!

It is only based on naming where an _enter() function if not followed by an
_exit() in some paths but is in other paths.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 0171d240fcb0..facb35249da0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3933,11 +3933,11 @@ static void amdgpu_device_xgmi_reset_func(struct work_struct *__work)
 
 		task_barrier_enter(&hive->tb);
 		adev->asic_reset_res = amdgpu_device_baco_enter(adev_to_drm(adev));
+		task_barrier_exit(&hive->tb);
 
 		if (adev->asic_reset_res)
 			goto fail;
 
-		task_barrier_exit(&hive->tb);
 		adev->asic_reset_res = amdgpu_device_baco_exit(adev_to_drm(adev));
 
 		if (adev->asic_reset_res)
-- 
2.47.0

