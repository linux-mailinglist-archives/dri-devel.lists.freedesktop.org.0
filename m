Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C51BDBDE6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 02:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D25810E24D;
	Wed, 15 Oct 2025 00:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="EwQyILKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3048310E6B8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:10:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760487028; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VHR5iANkZAWS53m4ibaDZFcPuP6ZdoVINHKChbt2uBOs8fnj/jGUrovrO4COgcWFZ/tOfHPSiYQ48MiqMxjt9FwH6XGHbNYLwF8IGHjTOqGTYIXvdV1HgLN1TRLxNYYnMGyLolTj9Z6vLvngHHRetewDFCACY4qCyvK+tt/9LBA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760487028;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=D2k5GCAL/zxlMdl9GxDH4WOymNyRBCt7CL7k1HtDTog=; 
 b=VUiLP8BeJ4mvx+zvmWqaOtQrKuPfA5KYIPlMlTwGOw8FokneIWXhXCXksBT7eDvstnog1A69j01pxnTgGS/VPF+2EwY62vZEC/KIudOfUS5I4lOilPQj+Ay8vMgQmvwiGVnMegi57LBN4zi2GI1Q8kz9yHCYBeFbXR6mMKZUaR0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760487027; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=D2k5GCAL/zxlMdl9GxDH4WOymNyRBCt7CL7k1HtDTog=;
 b=EwQyILKUZ8Una08uCxIMtBcySKcMSsETyHifyYdzOEi726RlPdrilOT7G78Y+YGn
 hTghLXRhE3rYX6aIQ9QL5ZgdcIoz5/C6NBb8GyMaxg6J6Mx+ZbtA7ll3+mKndk/Ypui
 6Xhu3fIXxVWPDx4Eqn+iF0DoYKr/Od/DOXKZqQc0=
Received: by mx.zohomail.com with SMTPS id 1760487025340523.3866017891327;
 Tue, 14 Oct 2025 17:10:25 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v6 04/12] drm/panfrost: Handle error when allocating AS number
Date: Wed, 15 Oct 2025 01:09:10 +0100
Message-ID: <20251015000930.356073-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015000930.356073-1-adrian.larumbe@collabora.com>
References: <20251015000930.356073-1-adrian.larumbe@collabora.com>
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

If we reach the beginning of the LRU AS list, then return an error.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c     | 6 +++++-
 drivers/gpu/drm/panfrost/panfrost_mmu.c     | 5 +++--
 drivers/gpu/drm/panfrost/panfrost_mmu.h     | 2 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 8 ++++++--
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 0722f297d142..d53e9db945ad 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -217,7 +217,11 @@ static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
 		goto err_hwsubmit;
 	}
 
-	cfg = panfrost_mmu_as_get(pfdev, job->mmu);
+	ret = panfrost_mmu_as_get(pfdev, job->mmu);
+	if (ret < 0)
+		goto err_hwsubmit;
+
+	cfg = ret;
 
 	panfrost_devfreq_record_busy(&pfdev->pfdevfreq);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 1d696eeea2fa..cf272b167feb 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -258,7 +258,7 @@ static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
 	}
 }
 
-u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
+int panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 {
 	int as;
 
@@ -300,7 +300,8 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 			if (!atomic_read(&lru_mmu->as_count))
 				break;
 		}
-		WARN_ON(&lru_mmu->list == &pfdev->as_lru_list);
+		if (WARN_ON(&lru_mmu->list == &pfdev->as_lru_list))
+			return -EBUSY;
 
 		list_del_init(&lru_mmu->list);
 		as = lru_mmu->as;
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/panfrost/panfrost_mmu.h
index 022a9a74a114..e6e6966a0cca 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
@@ -16,7 +16,7 @@ void panfrost_mmu_fini(struct panfrost_device *pfdev);
 void panfrost_mmu_reset(struct panfrost_device *pfdev);
 void panfrost_mmu_suspend_irq(struct panfrost_device *pfdev);
 
-u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);
+int panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);
 void panfrost_mmu_as_put(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);
 
 struct panfrost_mmu *panfrost_mmu_ctx_get(struct panfrost_mmu *mmu);
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 718eb44b40f8..7020c0192e18 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -130,9 +130,11 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 		goto err_vunmap;
 	}
 
-	perfcnt->user = user;
+	ret = panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
+	if (ret < 0)
+		goto err_vunmap;
 
-	as = panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
+	as = ret;
 	cfg = GPU_PERFCNT_CFG_AS(as) |
 	      GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_MANUAL);
 
@@ -164,6 +166,8 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	/* The BO ref is retained by the mapping. */
 	drm_gem_object_put(&bo->base);
 
+	perfcnt->user = user;
+
 	return 0;
 
 err_vunmap:
-- 
2.51.0

