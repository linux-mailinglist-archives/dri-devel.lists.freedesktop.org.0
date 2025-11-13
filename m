Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A47C56EA4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 11:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1DE10E5F7;
	Thu, 13 Nov 2025 10:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="i+WlKwkW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E245A10E348
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763030405;
 bh=d0BISNUkV7s4Q6xJJ8EHmMfz1I6X69ZYJfK2Ac2Oqbs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i+WlKwkWY9yYrniYB+7zvRV/UVwZ3+wnSpGrzkbfTtS+MP7ZzAeLgtZvXIq+FUPTO
 p7kqwzx+PHndp+ARZCF+wRIbeHAsx5L3QdhIEF0uDdcuQkTIxsP6Jh9FEUWw3AaJn6
 3dLTVl7fqOw6mcHV4IttZvvd4fJ/9hMwVGce81lFlX0TAyKAvfAaklzx5p2Qm9Jh/Y
 JgQig2L1ktfC4EJFoCoBhxVi5sHt6zuvvmf1uEJ63VUMWqdrIjMQE/rRg4I6h4WEyu
 KyfCk2zaTnwiJEGM6Jg0qQXzftWOxgMPG+B+4aUUY6bxOYYN4kB/TeAJsJcGFKJNbi
 0AouJHdZ3IgPQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4326017E0364;
 Thu, 13 Nov 2025 11:40:05 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
Subject: [PATCH v2 6/6] drm/panthor: Relax a check in panthor_sched_pre_reset()
Date: Thu, 13 Nov 2025 11:39:53 +0100
Message-ID: <20251113103953.1519935-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113103953.1519935-1-boris.brezillon@collabora.com>
References: <20251113103953.1519935-1-boris.brezillon@collabora.com>
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

Groups are only moved out of the runnable lists when
panthor_group_stop() is called or when they run out of jobs.
What should not happen though is having one group added to one of
the runnable list after reset.in_progress has been set to true, but
that's not something we can easily check, so let's just drop the
WARN_ON() in panthor_sched_pre_reset().

v2:
- Adjust explanation in commit message

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e74ca071159d..d121b794bd79 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2836,8 +2836,6 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
 	 * new jobs while we're resetting.
 	 */
 	for (i = 0; i < ARRAY_SIZE(sched->groups.runnable); i++) {
-		/* All groups should be in the idle lists. */
-		drm_WARN_ON(&ptdev->base, !list_empty(&sched->groups.runnable[i]));
 		list_for_each_entry_safe(group, group_tmp, &sched->groups.runnable[i], run_node)
 			panthor_group_stop(group);
 	}
-- 
2.51.1

