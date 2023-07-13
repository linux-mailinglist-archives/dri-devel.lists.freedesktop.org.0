Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6ED752C31
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 23:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E300310E78F;
	Thu, 13 Jul 2023 21:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799F310E78E;
 Thu, 13 Jul 2023 21:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bkcPn/8IkEMwm5HtzX5ohbd8o26KLnwK0sNSpD7QR84=; b=TPEOi7m6dCmKrdH3CCyj5aoAt9
 yXi5I1eqvV0R1HkWU3nv3YCqtkZ4J4yk3H0nx7In5LVOJpoRqwHd4St0rj0sGUoL0nBBDinekyrC9
 IWqUAIwyw/ASO0dN1oTRV/ZfUqLzldQIIIMhm2rYSVwFw42BQSwHph9kSPR5LTOwk5DnNi5EYkrML
 6KcwnZ4caTNNHvzcdZjMM/Dj6oex0kL7v9ZpvDuvkZGkXa6Gx8zXxQ7pe927VgDKXQbQymkKcZSl3
 8akCi+jg4bCTpeQSDCQ7Ab9KZOJfC88SkVhnMcaBaS4uM23PSXK8JGNnipQNmfS23xYOPcXTL96LF
 Bg276vQA==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qK3wJ-00EDEa-2R; Thu, 13 Jul 2023 23:33:31 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] drm/amdgpu: Log IBs and ring name at coredump
Date: Thu, 13 Jul 2023 18:32:41 -0300
Message-ID: <20230713213242.680944-6-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713213242.680944-1-andrealmeid@igalia.com>
References: <20230713213242.680944-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Log the IB addresses used by the hung job along with the stuck ring
name. Note that due to nested IBs, the one that caused the reset itself
may be in not listed address.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 31 +++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index e1cc83a89d46..cfeaf93934fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1086,6 +1086,9 @@ struct amdgpu_coredump_info {
 	struct amdgpu_task_info         reset_task_info;
 	struct timespec64               reset_time;
 	bool                            reset_vram_lost;
+	u64				*ibs;
+	u32				num_ibs;
+	char				ring_name[16];
 };
 #endif
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 07546781b8b8..431ccc3d7857 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5008,12 +5008,24 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
 				   coredump->adev->reset_dump_reg_value[i]);
 	}
 
+	if (coredump->num_ibs) {
+		drm_printf(&p, "IBs:\n");
+		for (i = 0; i < coredump->num_ibs; i++)
+			drm_printf(&p, "\t[%d] 0x%llx\n", i, coredump->ibs[i]);
+	}
+
+	if (coredump->ring_name[0] != '\0')
+		drm_printf(&p, "ring name: %s\n", coredump->ring_name);
+
 	return count - iter.remain;
 }
 
 static void amdgpu_devcoredump_free(void *data)
 {
-	kfree(data);
+	struct amdgpu_coredump_info *coredump = data;
+
+	kfree(coredump->ibs);
+	kfree(coredump);
 }
 
 static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
@@ -5021,6 +5033,8 @@ static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
 {
 	struct amdgpu_coredump_info *coredump;
 	struct drm_device *dev = adev_to_drm(adev);
+	struct amdgpu_job *job = reset_context->job;
+	int i;
 
 	coredump = kmalloc(sizeof(*coredump), GFP_NOWAIT);
 
@@ -5038,6 +5052,21 @@ static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
 
 	coredump->adev = adev;
 
+	if (job && job->num_ibs) {
+		struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
+		u32 num_ibs = job->num_ibs;
+
+		coredump->ibs = kmalloc_array(num_ibs, sizeof(coredump->ibs), GFP_NOWAIT);
+		if (coredump->ibs)
+			coredump->num_ibs = num_ibs;
+
+		for (i = 0; i < coredump->num_ibs; i++)
+			coredump->ibs[i] = job->ibs[i].gpu_addr;
+
+		if (ring)
+			strncpy(coredump->ring_name, ring->name, 16);
+	}
+
 	ktime_get_ts64(&coredump->reset_time);
 
 	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
-- 
2.41.0

