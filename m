Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA962A208B
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F306EB49;
	Sun,  1 Nov 2020 17:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923036EB4D
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 17:38:31 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 57FC71F44AA6;
 Sun,  1 Nov 2020 17:38:20 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] drm/panfrost: Remove unused variables in panfrost_job_close()
Date: Sun,  1 Nov 2020 18:38:17 +0100
Message-Id: <20201101173817.831769-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit a17d609e3e21 ("drm/panfrost: Don't corrupt the queue mutex on
open/close") left unused variables behind, thus generating a warning
at compilation time. Remove those variables.

Fixes: a17d609e3e21 ("drm/panfrost: Don't corrupt the queue mutex on open/close")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
My bad, I didn't notice this warning when rebasing Steven's patch on
top of drm-misc-next :-/
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 14c11293791e..d58e5fe12cab 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -634,8 +634,6 @@ int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
 
 void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
 {
-	struct panfrost_device *pfdev = panfrost_priv->pfdev;
-	struct panfrost_job_slot *js = pfdev->js;
 	int i;
 
 	for (i = 0; i < NUM_JOB_SLOTS; i++)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
