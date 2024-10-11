Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE299AEFA
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 00:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B064910EB30;
	Fri, 11 Oct 2024 22:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="jV6OSLAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3EC10EB30
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 22:59:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728687565; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=L/DkJbT2fEVZh3m/Sthe5Wrto6eOepPoX/wkMqTiaWKDduRVbcdCEU9cSMsoC5sEYOWTYP+DiX41NpBCLQVdQPUCfnXIOs6jLsc46vo/lhrTgudPOdtUbCTBjMyXoJLzuoXmBnD+e0OZm0zvhSdHcJ9RBrbZe5pLdpJpHcYs2Q8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728687565;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yrZlf5QwOEdnfLB/WKbk+uAHUVygWYrAIalCbzVETTc=; 
 b=iH781o8qFyT4VbCsq6j3Jbelou3dRrlftsRuhlvPGt3ichCx7zgbO60YLKkxwWwZ7jNn2hCnzH20na+UJB90TiIEBcG4HNgtAw497nteVmVAKj+YyN6AhRCRFIEGpJsEhNvs6Ui3ls4INofeXei9wsY3SKMAoE6vsTnmV5U+HLY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728687565; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=yrZlf5QwOEdnfLB/WKbk+uAHUVygWYrAIalCbzVETTc=;
 b=jV6OSLACowetuJB2r5KCPPMT6tAJDig4MlQM+zeCXflCDO3edBgv0AwKc30wRzN9
 B3JZjbNV/0jJFSxPuvskTUBdm4IuR94GiNou9NL6hRr2S76J//pb6fSLpIm4mFdnc1P
 z3+pjTwuhKJU9+uXgIVjbdO1/ZyPBvWzvL5/eTe4=
Received: by mx.zohomail.com with SMTPS id 1728687563354474.83172060251206;
 Fri, 11 Oct 2024 15:59:23 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/panthor: Rreset device and load FW after failed PM
 suspend
Date: Fri, 11 Oct 2024 23:57:01 +0100
Message-ID: <20241011225906.3789965-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011225906.3789965-1-adrian.larumbe@collabora.com>
References: <20241011225906.3789965-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On rk3588 SoCs, during a runtime PM suspend, the transition to the
lowest voltage/frequency pair might sometimes fail for reasons not yet
understood. In that case, even a slow FW reset will fail, leaving the
device's PM runtime status as unusuable.

When that happens, successive attempts to resume the device upon running
a job will always fail.

Fix it by forcing a synchronous device reset, which will lead to a
successful FW reload, and also reset the device's PM runtime error
status before resuming it.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 10 ++++++++++
 drivers/gpu/drm/panthor/panthor_device.h |  2 ++
 drivers/gpu/drm/panthor/panthor_sched.c  |  7 +++++++
 3 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 5430557bd0b8..ec6fed5e996b 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -105,6 +105,16 @@ static void panthor_device_reset_cleanup(struct drm_device *ddev, void *data)
 	destroy_workqueue(ptdev->reset.wq);
 }
 
+int panthor_device_reset_sync(struct panthor_device *ptdev)
+{
+	panthor_fw_pre_reset(ptdev, false);
+	panthor_mmu_pre_reset(ptdev);
+	panthor_gpu_soft_reset(ptdev);
+	panthor_gpu_l2_power_on(ptdev);
+	panthor_mmu_post_reset(ptdev);
+	return panthor_fw_post_reset(ptdev);
+}
+
 static void panthor_device_reset_work(struct work_struct *work)
 {
 	struct panthor_device *ptdev = container_of(work, struct panthor_device, reset.work);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 0e68f5a70d20..05a5a7233378 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -217,6 +217,8 @@ struct panthor_file {
 int panthor_device_init(struct panthor_device *ptdev);
 void panthor_device_unplug(struct panthor_device *ptdev);
 
+int panthor_device_reset_sync(struct panthor_device *ptdev);
+
 /**
  * panthor_device_schedule_reset() - Schedules a reset operation
  */
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index c7b350fc3eba..9a854c8c5718 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3101,6 +3101,13 @@ queue_run_job(struct drm_sched_job *sched_job)
 		return dma_fence_get(job->done_fence);
 	}
 
+	if (ptdev->base.dev->power.runtime_error) {
+		ret = panthor_device_reset_sync(ptdev);
+		if (drm_WARN_ON(&ptdev->base, ret))
+			return ERR_PTR(ret);
+		drm_WARN_ON(&ptdev->base, pm_runtime_set_active(ptdev->base.dev));
+	}
+
 	ret = pm_runtime_resume_and_get(ptdev->base.dev);
 	if (drm_WARN_ON(&ptdev->base, ret))
 		return ERR_PTR(ret);
-- 
2.46.2

