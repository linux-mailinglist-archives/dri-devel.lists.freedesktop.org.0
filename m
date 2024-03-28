Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3FD8904F4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 17:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880861124C9;
	Thu, 28 Mar 2024 16:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mUKTdK2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B691124C9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 16:22:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 99DB36177C;
 Thu, 28 Mar 2024 16:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C57EC433F1;
 Thu, 28 Mar 2024 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711642933;
 bh=VKD/aahDATM8UOiVLpFFzn2TIW2RyDzP9wAEO+uc3dY=;
 h=From:Date:Subject:To:Cc:From;
 b=mUKTdK2np0LbDzpyZOqBzFazGM48bmg/ApUTGAnPKgBUjaX3LAOuDbQwAKrPmPKBh
 3ldZNqp9y//oNX7iKvPwUAQq4JklJc9MaynKD5/77+ZfbDs3s5cAaaPX6p3LgxSW0+
 08Q8v468ESuPW1EvqJoYmNTWO8S5QN+rgubCSYXh595/cL6uDBO59i1z9j/idNurl9
 mUEFFMm4LmdYWe9NW8J/7oBIJykO3k1o8tU6+3A00kDYAdHn4kT8CGbnfdKeezQ0kJ
 P/aBurYJ7t5dsa32PrtmfJtOpTKYFO2SfInBResqAQw+VDMSo84ZjslOVztfbs9pHD
 lZszgtmohzCOw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 28 Mar 2024 09:22:07 -0700
Subject: [PATCH] drm/panthor: Fix clang -Wunused-but-set-variable in
 tick_ctx_apply()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-panthor-drop-csg_mod_mask-v1-1-5a80be3df581@kernel.org>
X-B4-Tracking: v=1; b=H4sIAC6ZBWYC/x3MQQqDMBBA0avIrDsQo6jtVYpIYkYdxCTMlFIQ7
 97g8i3+P0FJmBRe1QlCX1ZOsaB+VDBvLq6EHIrBGtuaxg6YXfxsSTBIyjjrOh0pTIfTHX3rPTV
 1H7qngdJnoYV/9/s9XtcfbxexM2sAAAA=
To: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, ndesaulniers@google.com, morbo@google.com, 
 justinstitt@google.com, heiko@sntech.de, dri-devel@lists.freedesktop.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=nathan@kernel.org;
 h=from:subject:message-id; bh=VKD/aahDATM8UOiVLpFFzn2TIW2RyDzP9wAEO+uc3dY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGmsM00CJydrp+fG353ceXzLRF/uuV8fyT5xXvPi97ctV
 zNfbZpp31HKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmEtXF8M/u3G393XOecv5L
 fz7zdMXsxauMir4nLXycweTDzXVCW34/I8OaqNPyx2t8LTYUSFie+/9w5v2ZZqUJVXO2Nnv+PFa
 +6z8zAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Clang warns (or errors with CONFIG_WERROR):

  drivers/gpu/drm/panthor/panthor_sched.c:2048:6: error: variable 'csg_mod_mask' set but not used [-Werror,-Wunused-but-set-variable]
   2048 |         u32 csg_mod_mask = 0, free_csg_slots = 0;
        |             ^
  1 error generated.

The variable is an artifact left over from refactoring that occurred
during the development of the initial series for this driver. Remove it
to resolve the warning.

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 5f7803b6fc48..e5a710f190d2 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2045,7 +2045,7 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 	struct panthor_device *ptdev = sched->ptdev;
 	struct panthor_csg_slot *csg_slot;
 	int prio, new_csg_prio = MAX_CSG_PRIO, i;
-	u32 csg_mod_mask = 0, free_csg_slots = 0;
+	u32 free_csg_slots = 0;
 	struct panthor_csg_slots_upd_ctx upd_ctx;
 	int ret;
 
@@ -2139,7 +2139,6 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 
 			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
 			csg_slot = &sched->csg_slots[csg_id];
-			csg_mod_mask |= BIT(csg_id);
 			group_bind_locked(group, csg_id);
 			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
 			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,

---
base-commit: d180649238f04183950d9c8a7d8a2c2f1788a89c
change-id: 20240328-panthor-drop-csg_mod_mask-b4bbe317d690

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

