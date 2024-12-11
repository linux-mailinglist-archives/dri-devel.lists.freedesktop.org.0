Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C79EC5E1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 08:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC0310E3DD;
	Wed, 11 Dec 2024 07:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="O93pDc+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC64B10E3DD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733903173;
 bh=/uLwAB7pHw/XE0sJB3uJGD6UW8RKmCnSRNi38d/ySgQ=;
 h=From:To:Cc:Subject:Date:From;
 b=O93pDc+iQGKwQM0gHjPWKYiUPThmiSdP74c9HxIRlIS9JxNcWLSaBBAMVfwNi+Ba6
 3u+6qXEtzklp4kw9h3zDxfcl/1qBgEhjEUOAmWT5awzQHXpmviTyLwN2qkeSyWzxD1
 +D/zuDW58ID73HZKq+3FSrDqRbEHsAVS39z8C1KoLWX8Af2ygEkcU6woTyKTjNkR9y
 wEe6QLKKfg2WkEOxgjW1yi49/j06Ar8BQM3ff4tTJ7yf4pK829sv2sO1Qt6wTMwkmF
 EkLAR6uGQbv5xXoYD3dQkQPAGGGmqxN3kLfC/KBJZjyT05CyTNpey1l2loWe2QGO7h
 eCY3Qf/dIfshA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 49CDA17E137F;
 Wed, 11 Dec 2024 08:46:13 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH] drm/panthor: Relax our expectations in
 panthor_sched_pre_reset()
Date: Wed, 11 Dec 2024 08:46:11 +0100
Message-ID: <20241211074611.2326881-1-boris.brezillon@collabora.com>
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

Calling panthor_sched_suspend() doesn't guarantee that all groups
are in the idle lists. Only the ones that were currently scheduled
are handled in panthor_sched_suspend(), and that's fine, because
we stop all runnable groups in panthor_sched_pre_reset(), but let's
stop complaining about it.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 77b184c3fb0c..ed3b46767ed5 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2809,8 +2809,6 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
 	 * new jobs while we're resetting.
 	 */
 	for (i = 0; i < ARRAY_SIZE(sched->groups.runnable); i++) {
-		/* All groups should be in the idle lists. */
-		drm_WARN_ON(&ptdev->base, !list_empty(&sched->groups.runnable[i]));
 		list_for_each_entry_safe(group, group_tmp, &sched->groups.runnable[i], run_node)
 			panthor_group_stop(group);
 	}
-- 
2.47.0

