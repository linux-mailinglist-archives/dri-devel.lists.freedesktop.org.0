Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C2AEE018
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 16:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C217210E448;
	Mon, 30 Jun 2025 14:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 98AA210E448
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 14:07:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B89A1D34;
 Mon, 30 Jun 2025 07:06:58 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.28.116])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8040D3F66E;
 Mon, 30 Jun 2025 07:07:12 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Karunika Choo <karunika.choo@arm.com>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: Wait for _READY register when powering on
Date: Mon, 30 Jun 2025 15:07:02 +0100
Message-ID: <20250630140704.432409-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
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

panthor_gpu_block_power_on() takes a register offset (rdy_reg) for the
purpose of waiting for the power transition to complete. However, a
copy/paste error converting to use the new 64 register functions
switched it to using the pwrtrans_reg register instead. Fix the function
to use the correct register.

Fixes: 4d230aa209ed ("drm/panthor: Add 64-bit and poll register accessors")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 534735518824..cb7a335e07d7 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -297,8 +297,9 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 
 	gpu_write64(ptdev, pwron_reg, mask);
 
-	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
-					      !(mask & val), 100, timeout_us);
+	ret = gpu_read64_relaxed_poll_timeout(ptdev, rdy_reg, val,
+					      (mask & val) == val,
+					      100, timeout_us);
 	if (ret) {
 		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
 			blk_name, mask);
-- 
2.39.5

