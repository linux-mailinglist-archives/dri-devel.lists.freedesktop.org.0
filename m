Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8B9DBD34
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 22:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACFC10ED62;
	Thu, 28 Nov 2024 21:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="KMbNT9Au";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C2210ED62
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 21:12:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732828366; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HG41YBfhRINc8HLm+FUETI/VPXlnra1ojIcjBskQW3mL0pir95PyEDWl2aJCrCiZvmoN9AGwY3yaFoDkj+dpzowFPjyc6PNvBXTJiHl3gKZ3PEYSmFL8KpRq1v0tGRZMCrAH+vIbsKKJVXadfRAGf0vm3B1kl8ZiyWObtXksXug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732828366;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4KMeDqmO6/kMqWAURl+BuWqqDuQXnOAKVcXkzDnRlbQ=; 
 b=EoKfNHUuLE+qKj+LLLeKUqlmkdxwt0k1Pw6TBVeVBsDARE6xJuLc7LK3q0x7tiUK2Brr3ji2udDzKg/IDHQ8s9bhQfGi5p2C/IYHSwo8NQw990qCdB3mhNEQD2CIEMZLdYqh1nTKMvFwBH2c4Mpy1NDVCZJOmr0EEGGqUZF8NqI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732828366; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=4KMeDqmO6/kMqWAURl+BuWqqDuQXnOAKVcXkzDnRlbQ=;
 b=KMbNT9AuRvt7iwGH9LliiiOVNzebKw0yCw5ReyxGamwV4HsqDwGLh195+zmzXjV/
 uCx4WY2t4cXCRBHctYFDTVmvvmt5K9+ejplVzatrTixi2XWr/YDKjToeL25uHBLyybx
 cb31nWrGUNuTQ2Wwf9nKJPotgwJfCC2/STrmbQMc=
Received: by mx.zohomail.com with SMTPS id 1732828366344785.3465141422423;
 Thu, 28 Nov 2024 13:12:46 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] drm/panfrost: Handle error when allocating AS number
Date: Thu, 28 Nov 2024 21:06:19 +0000
Message-ID: <20241128211223.1805830-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
References: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
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

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c     | 6 +++++-
 drivers/gpu/drm/panfrost/panfrost_mmu.c     | 5 +++--
 drivers/gpu/drm/panfrost/panfrost_mmu.h     | 2 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 9 ++++++++-
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 3f4f0682d69d..fba1a376f593 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -214,7 +214,11 @@ static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
 		goto err_hwsubmit;
 	}
 
-	cfg = panfrost_mmu_as_get(pfdev, job->mmu);
+	ret = panfrost_mmu_as_get(pfdev, job->mmu);
+	if (ret < 0)
+		goto err_hwsubmit;
+
+	cfg = (u32)ret;
 
 	job_write(pfdev, JS_HEAD_NEXT_LO(js), lower_32_bits(jc_head));
 	job_write(pfdev, JS_HEAD_NEXT_HI(js), upper_32_bits(jc_head));
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 2189e42d2bfa..03ac527b35e7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -155,7 +155,7 @@ static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
 	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
 }
 
-u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
+int panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 {
 	int as;
 
@@ -197,7 +197,8 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
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
index f30817bcf8ba..2145f9707dde 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -130,7 +130,12 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 
 	perfcnt->user = user;
 
-	as = panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
+	ret = panfrost_mmu_as_get(pfdev, perfcnt->mapping->mmu);
+	if (ret)
+		goto err_unsetuser;
+
+	as = (u32)ret;
+
 	cfg = GPU_PERFCNT_CFG_AS(as) |
 	      GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_MANUAL);
 
@@ -164,6 +169,8 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 
 	return 0;
 
+err_unsetuser:
+	perfcnt->user = NULL;
 err_vunmap:
 	drm_gem_vunmap_unlocked(&bo->base, &map);
 err_put_mapping:
-- 
2.47.0

