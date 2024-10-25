Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9369B03DA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9747C10E1B9;
	Fri, 25 Oct 2024 13:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FpdoE6Mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D7A10E1B9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729862468;
 bh=Eq9lG7wbg8q88eGrtEUNjZokVgnzjo7om3fT7yKeto8=;
 h=From:To:Cc:Subject:Date:From;
 b=FpdoE6MhVHYTtMPgvITxGCUGeOFrtdL4yhp0CajMN3i01g20tG2JHoRLIF1U3Fz+R
 Lg8b3dTANrF8v9wqf1so4aNI49zxuGDhW8eri3QA6fxQ4196B4vnkLDQZRrpm2GJBQ
 Jr2azwL4j94b9x54vVwu7TBxhwdLFdZtYNpNTZFNfN0byUMZcRthigjWSufDCPtJnL
 zZaecYIp8YnEwHObwQFAJHmQK4F7KsvGTCeVHoT2Cz/kU+/fK6wBh73TjmjM2BPIN2
 fFTYcqdLkbJfI27hFuhgATZppwSGbbvFpRx9jnlsJXEW05dyTNEphQrS2QRd8Zn+jm
 lVRswxEnPmbKQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 738AC17E35F2;
 Fri, 25 Oct 2024 15:21:08 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Christopher Healy <healych@amazon.com>,
 kernel@collabora.com
Subject: [PATCH] drm/panthor: Fail job creation when the group is dead
Date: Fri, 25 Oct 2024 15:21:05 +0200
Message-ID: <20241025132105.2348441-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.2
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

Userspace can use GROUP_SUBMIT errors as a trigger to check the group
state and recreate the group if it became unusable. Make sure we
report an error when the group became unusable.

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 423743ad8842..9f02554a20db 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3678,6 +3678,11 @@ panthor_job_create(struct panthor_file *pfile,
 		goto err_put_job;
 	}
 
+	if (!group_can_run(job->group)) {
+		ret = -EINVAL;
+		goto err_put_job;
+	}
+
 	if (job->queue_idx >= job->group->queue_count ||
 	    !job->group->queues[job->queue_idx]) {
 		ret = -EINVAL;
-- 
2.46.2

