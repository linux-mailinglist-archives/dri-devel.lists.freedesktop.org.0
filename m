Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801AE89199C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 13:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1E41126D0;
	Fri, 29 Mar 2024 12:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z5mZdzsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBA41126E7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 12:44:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 896FCCE2F9A;
 Fri, 29 Mar 2024 12:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C8FC433C7;
 Fri, 29 Mar 2024 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711716220;
 bh=uVcTjXED8/Jzk0oHqHrJCMbpNGjUw4igMCiReFmmYv8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z5mZdzsmH1xIPAU8HLvtt8GBSZe2gZB+PzsJMh20LfTRS9SIQc7lb+gJaxjt50PAZ
 +zBl5jKx2Mc4mNIZPkhSvVDQgkuTv4etjSyISLhUZRRwyN4dkz1z1iBqYbxnp/2uVZ
 fOau5FIphQ8kuJ9/FoVGJ7wyQfu0D5bOi69t3s9e8rXX7969ACLzkoBMOV5Jx15Zcb
 mfEVBV8h7uvplttcizTRtud5Gp1Fin82R4WDj7lFf0Mofu3zvk3HoPcEi0MVaC5KGr
 JcySZ2qmYsDktO74Cx0gcWX30lTwNHUlpKHd3IaRl648LOxftVs5B4cyJo6/usXG8j
 K/Cih+pNyaUeQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Sasha Levin <sashal@kernel.org>, ray.huang@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 05/75] drm/ttm: return ENOSPC from
 ttm_bo_mem_space v3
Date: Fri, 29 Mar 2024 08:41:46 -0400
Message-ID: <20240329124330.3089520-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329124330.3089520-1-sashal@kernel.org>
References: <20240329124330.3089520-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.23
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

From: Christian König <christian.koenig@amd.com>

[ Upstream commit 28e5126718c7b306b8c29d2ae8f48417e9303aa1 ]

Only convert it to ENOMEM in ttm_bo_validate.

This allows ttm_bo_validate to distinguish between an out of memory
situation and just out of space in a placement domain.

v2: improve commit message
v3: fix kerneldoc typos

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240112125158.2748-3-christian.koenig@amd.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e58b7e2498166..b3e5185835c37 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -764,7 +764,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
  * This function may sleep while waiting for space to become available.
  * Returns:
  * -EBUSY: No space available (only if no_wait == 1).
- * -ENOMEM: Could not allocate memory for the buffer object, either due to
+ * -ENOSPC: Could not allocate space for the buffer object, either due to
  * fragmentation or concurrent allocators.
  * -ERESTARTSYS: An interruptible sleep was interrupted by a signal.
  */
@@ -824,7 +824,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 			goto error;
 	}
 
-	ret = -ENOMEM;
+	ret = -ENOSPC;
 	if (!type_found) {
 		pr_err(TTM_PFX "No compatible memory type found\n");
 		ret = -EINVAL;
@@ -910,6 +910,9 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		return -EINVAL;
 
 	ret = ttm_bo_move_buffer(bo, placement, ctx);
+	/* For backward compatibility with userspace */
+	if (ret == -ENOSPC)
+		return -ENOMEM;
 	if (ret)
 		return ret;
 
-- 
2.43.0

