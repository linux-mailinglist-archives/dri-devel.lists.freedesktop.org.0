Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318368D06AB
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 17:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F3710FB8E;
	Mon, 27 May 2024 15:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P8oHOD+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8113D10EC1F;
 Mon, 27 May 2024 15:52:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA9E961A77;
 Mon, 27 May 2024 15:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51318C4AF09;
 Mon, 27 May 2024 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716825135;
 bh=w3cDm44p+/3gFORFyqiEPB8zQtnbKhxFtPfevHoWq1U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P8oHOD+aBvz81B890q1lztYM+7YI4WilCxlmwpDwp9gdiFqXT8H/FiZEfr05Frrxc
 IWKJTgoDS0Hy7a7n6datgXPktgKrIfQwG103JO5qUE2LFa9Gr3Ht4eZbcUBMffjx6E
 UX9OZ1lvy3a6urD+zzVGV5RZ9wGnbSmOgxdhPqFEZY1U0BhIRLtvurxUTmEgKsf/wo
 tWctBkkgMTXL2bmoo3ecwzmLIwG1KTbwDPwPa1re7WbLwtX+TepSoN0eGvmTOD+ipm
 G0Bwa+DrKDMH+XtIKVbbcGTY/6aKq6uV2Dy8mQafZjHMzG2xA8sWw3FF53PeCEA6nZ
 +Xbm3Zo/L8tIA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Erico Nunes <nunes.erico@gmail.com>, Qiang Yu <yuq825@gmail.com>,
 Sasha Levin <sashal@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.9 11/23] drm/lima: include pp bcast irq in timeout
 handler check
Date: Mon, 27 May 2024 11:50:12 -0400
Message-ID: <20240527155123.3863983-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155123.3863983-1-sashal@kernel.org>
References: <20240527155123.3863983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.2
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

From: Erico Nunes <nunes.erico@gmail.com>

[ Upstream commit d8100caf40a35904d27ce446fb2088b54277997a ]

In commit 53cb55b20208 ("drm/lima: handle spurious timeouts due to high
irq latency") a check was added to detect an unexpectedly high interrupt
latency timeout.
With further investigation it was noted that on Mali-450 the pp bcast
irq may also be a trigger of race conditions against the timeout
handler, so add it to this check too.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Qiang Yu <yuq825@gmail.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240405152951.1531555-3-nunes.erico@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/lima/lima_sched.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 00b19adfc8881..66841503a6183 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -422,6 +422,8 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
 	 */
 	for (i = 0; i < pipe->num_processor; i++)
 		synchronize_irq(pipe->processor[i]->irq);
+	if (pipe->bcast_processor)
+		synchronize_irq(pipe->bcast_processor->irq);
 
 	if (dma_fence_is_signaled(task->fence)) {
 		DRM_WARN("%s unexpectedly high interrupt latency\n", lima_ip_name(ip));
-- 
2.43.0

