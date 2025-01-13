Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4194A0B2B3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F5B10E5D9;
	Mon, 13 Jan 2025 09:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OzqWbx6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7BA10E5DE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:26:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C5DC35C5427;
 Mon, 13 Jan 2025 09:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F64EC4CED6;
 Mon, 13 Jan 2025 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736760378;
 bh=lTKRTo6DTefkGzg59vzB2bAaoBDnmY8yk4vJ1qA9K1o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OzqWbx6hiBNHJ8tdDEY+OFJmaepO0rzL1ge9TJDXqJFtjZ8YP8OeUSx8s4vhGzkz1
 m5vesovN2/YGcZKQsZk8IDJA+mrcaS1hsKvPaJG8C+TUUkUfoDkX4WRZvdvjqptzX7
 v2+1wTJavbj4xzFyFVgychzvQdWjNWcULle4/kyQybGtSxZJqQotuOXr7JiLrmq8V8
 T8XSyechRGTzby2gDsniqJxoA84UWR2TYMznUzAisOJ5QTPkwBrVy6IuHNpXt9QUcr
 G/pkJvrcQjD8gn4q3aNZ4vEeFt+jPJ/XOYk6eOJ7KnPRq39vIr3A4v1jqHxBljBTU/
 2u/lGv3bzfhQA==
From: Maxime Ripard <mripard@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, cgroups@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 2/4] cgroup/dmem: Fix parameters documentation
Date: Mon, 13 Jan 2025 10:26:06 +0100
Message-ID: <20250113092608.1349287-2-mripard@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113092608.1349287-1-mripard@kernel.org>
References: <20250113092608.1349287-1-mripard@kernel.org>
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

During the dmem cgroup development, the parameters to the
dmem_cgroup_state_evict_valuable() and dmem_cgroup_try_charge() were
changed, but the documentation wasn't adjusted accordingly.

This results in a documentation build warning. Adjust the documentation
to reflect what the final functions parameters are.

Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20250113160334.1f09f881@canb.auug.org.au/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 kernel/cgroup/dmem.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
index 52736ef0ccf2..ecea58abed6a 100644
--- a/kernel/cgroup/dmem.c
+++ b/kernel/cgroup/dmem.c
@@ -278,12 +278,10 @@ dmem_cgroup_calculate_protection(struct dmem_cgroup_pool_state *limit_pool,
 	rcu_read_unlock();
 }
 
 /**
  * dmem_cgroup_state_evict_valuable() - Check if we should evict from test_pool
- * @dev: &dmem_cgroup_region
- * @index: The index number of the region being tested.
  * @limit_pool: The pool for which we hit limits
  * @test_pool: The pool for which to test
  * @ignore_low: Whether we have to respect low watermarks.
  * @ret_hit_low: Pointer to whether it makes sense to consider low watermark.
  *
@@ -609,17 +607,16 @@ void dmem_cgroup_uncharge(struct dmem_cgroup_pool_state *pool, u64 size)
 }
 EXPORT_SYMBOL_GPL(dmem_cgroup_uncharge);
 
 /**
  * dmem_cgroup_try_charge() - Try charging a new allocation to a region.
- * @dev: Device to charge
+ * @region: dmem region to charge
  * @size: Size (in bytes) to charge.
  * @ret_pool: On succesfull allocation, the pool that is charged.
  * @ret_limit_pool: On a failed allocation, the limiting pool.
  *
- * This function charges the current pool for @dev with region at @index for a
- * size of @size bytes.
+ * This function charges the @region region for a size of @size bytes.
  *
  * If the function succeeds, @ret_pool is set, which must be passed to
  * dmem_cgroup_uncharge() when undoing the allocation.
  *
  * When this function fails with -EAGAIN and @ret_limit_pool is non-null, it
-- 
2.47.1

