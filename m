Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CBEC914CA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 09:49:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C839310E836;
	Fri, 28 Nov 2025 08:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="D0vdq3wf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D46710E836
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764319736;
 bh=VV2futg7JlyownwaSPavWMOBq/+M1jPn93CCvMlb/9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D0vdq3wfAdHP985ut9EuyOV3qU9uFZYYLBl3krfpUyOXqzGKwhh49l+NMU12BJQ0G
 0QS+uC39dGhRk47UJ4xxQYKwgAArz9XTn81iIj9J05+Yuu19eCI1pnud/DPUz12EPT
 S2QUylyW1IoSluXBMBMUi7tBfA0Mhotul8H6MhmC5gDI5k0cInVUSVTf+hytV76bU6
 5TgihFCTJea9idXp2LgnjfLL5jbBKXGFVVxWv7KU8Z/xHsYD3p3/OqbM18GvFC748l
 sW3f6S8e8OU/fu2kqbvW2i4rFh62JeJXJMYwUg7QyXmpkThQ4ITGydwxZGRjtQQc6H
 dlaorpr0uvqdQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CCDD17E13D5;
 Fri, 28 Nov 2025 09:48:56 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com
Subject: [PATCH v4 6/6] drm/panthor: Relax a check in panthor_sched_pre_reset()
Date: Fri, 28 Nov 2025 09:48:40 +0100
Message-ID: <20251128084841.3804658-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251128084841.3804658-1-boris.brezillon@collabora.com>
References: <20251128084841.3804658-1-boris.brezillon@collabora.com>
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

v3:
- Collect R-b

v4:
- No changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index b834123a6560..1beddc175722 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2937,8 +2937,6 @@ void panthor_sched_pre_reset(struct panthor_device *ptdev)
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

