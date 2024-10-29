Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6849B4DF3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 16:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285A910E684;
	Tue, 29 Oct 2024 15:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YieOf0lQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF20510E683
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730215754;
 bh=9Vzc5cjseL09Uwc9IZorIUMr2qOPWNxYj54sxB69S/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YieOf0lQggtc+9IgrUfGNFu7JJaaHVovtc0/jXpYMI5ddOLsi1L6/O3cxuSGZwZlJ
 HS01jiwXEzEJU42nRGptqPs/hDaUjVlGBs+9hlGJ62F2PwzfYB8aWzMAWWwPnLLKLr
 vScSfMVM3luiQG6tELwtOdDiFByEzvOAUKW9IHKFKgx1wkl9P3lDc/WpjIjLE7O95+
 mA8lg7jl9QReQUe7Vr6qPnzozmYYWGydWAMzwd/KWh+Hj5c6UdVO1OI03SxwWi5j52
 wCL4adQjMtUfXnsbKnq/FjUlnBSPzIy47PBMWsrugX/Bt/JYN6etY+uAhLHElwGBWl
 KnadCZeMaIO5g==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 34B3617E3661;
 Tue, 29 Oct 2024 16:29:14 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: [PATCH v3 1/3] drm/panthor: Fail job creation when the group is dead
Date: Tue, 29 Oct 2024 16:29:10 +0100
Message-ID: <20241029152912.270346-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241029152912.270346-1-boris.brezillon@collabora.com>
References: <20241029152912.270346-1-boris.brezillon@collabora.com>
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

Changes in v3:
- None

Changes in v2:
- Add R-bs

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index eb9f6635cc12..eda8fbb276b3 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3688,6 +3688,11 @@ panthor_job_create(struct panthor_file *pfile,
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

