Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B8393740
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 22:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F3C6F4C2;
	Thu, 27 May 2021 20:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757266F4C2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 20:38:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [IPv6:2600:8800:8c09:5500::19dc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D52271F43DF4;
 Thu, 27 May 2021 21:38:25 +0100 (BST)
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/panfrost: Add permon acquire/release helpers
Date: Thu, 27 May 2021 16:38:03 -0400
Message-Id: <20210527203804.12914-4-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
References: <20210527203804.12914-1-alyssa.rosenzweig@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, steven.price@arm.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Wrap the underlying CYCLE_COUNT_START/STOP commands in a safe interface
that ensures the commands are only issued where required by guarding
behind an atomic counter. In particular, we need to be careful about
races between multiple in-flight jobs, where only some require cycle
counts.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  3 +++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 20 ++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  3 +++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 597cf1459..8a89aa274 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -117,6 +117,9 @@ struct panfrost_device {
 	struct shrinker shrinker;
 
 	struct panfrost_devfreq pfdevfreq;
+
+	/* Number of active jobs requiring performance monitoring */
+	atomic_t permon_pending;
 };
 
 struct panfrost_mmu {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 2aae636f1..acacceb15 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -399,3 +399,23 @@ u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev)
 
 	return 0;
 }
+
+void panfrost_acquire_permon(struct panfrost_device *pfdev)
+{
+	/* If another in-flight job enabled permon, we don't have to */
+	if (atomic_inc_return(&pfdev->permon_pending) > 1)
+		return;
+
+	/* Otherwise, we're the first user */
+	gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_START);
+}
+
+void panfrost_release_permon(struct panfrost_device *pfdev)
+{
+	/* If another in-flight job needs permon, keep it active */
+	if (atomic_dec_return(&pfdev->permon_pending) > 0)
+		return;
+
+	/* Otherwise, we're the last user */
+	gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_STOP);
+}
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index 468c51e7e..01a91af09 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -18,4 +18,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev);
 
 void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev);
 
+void panfrost_acquire_permon(struct panfrost_device *pfdev);
+void panfrost_release_permon(struct panfrost_device *pfdev);
+
 #endif
-- 
2.30.2

