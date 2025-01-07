Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84D8A04228
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DC110EAC7;
	Tue,  7 Jan 2025 14:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFf8maRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747CA10E708
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736259767; x=1767795767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iyR050BA/SGkKlwz6I9825V1/9w0d/jviKByeI5h/Co=;
 b=iFf8maRA53RMifBOmJyb5jaRU+4MwGuNDRWgGvGhISWd+flgHQFTnQED
 wXVLoDz04gJGSA0Ssvwl1atkGPbr5ej53Va+ME0VUk5zLI9J4cNyTZSY/
 z2jifPPaQtM+h9vCY454eHcyGIIHDDzcEuGmZFFkwrsU0DAlWf1l2jN8k
 dMqG/DwrnQgit5OiF/v0x+8wVT9bmfqZu3HUQmqNqpnUQHubnwNhZfhx5
 kPEHMWBoez1bGGBF+ubG1Yejn34guBWDOEAwb81ItB1sxAxgeaG9zgLBI
 DEvY3pqudN5EOJHF711GsihLvbj5yo7tn3ABpCXcpAqMFVecPcnYXSk0m w==;
X-CSE-ConnectionGUID: o2fxbFcwTzKLE5VrTgT7+g==
X-CSE-MsgGUID: 93GDaB6BTse8NJ815VKTDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36324462"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36324462"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:47 -0800
X-CSE-ConnectionGUID: l3yAfN9aR5KO6+29SehQkw==
X-CSE-MsgGUID: ecNEC/zYRwWVU022vhYZ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103635483"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:46 -0800
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 10/14] accel/ivpu: Fix locking order in ivpu_cmdq_destroy_ioctl
Date: Tue,  7 Jan 2025 18:32:33 +0100
Message-ID: <20250107173238.381120-11-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Fix deadlock caused by inversed locking order in ivpu_job_submit()
and ivpu_cmdq_destroy_ioctl(). Both functions operate locking
file_priv->lock and submitted_jobs_lock.

Unlock file_priv->lock in ivpu_cmdq_destroy_ioctl() before calling
ivpu_cmdq_abort_all_jobs() function which locks submitted_jobs_lock.
That way locking order is maintained:
 1) global submitted_jobs_lock first
 2) per context file_priv->lock second

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 37ea92eb4b25..c694822a14bf 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -883,7 +883,7 @@ int ivpu_cmdq_destroy_ioctl(struct drm_device *dev, void *data, struct drm_file
 	struct drm_ivpu_cmdq_destroy *args = data;
 	struct ivpu_cmdq *cmdq;
 	u32 cmdq_id;
-	int ret = 0;
+	int ret;
 
 	if (!ivpu_is_capable(vdev, DRM_IVPU_CAP_MANAGE_CMDQ))
 		return -ENODEV;
@@ -893,13 +893,16 @@ int ivpu_cmdq_destroy_ioctl(struct drm_device *dev, void *data, struct drm_file
 	cmdq = xa_load(&file_priv->cmdq_xa, args->cmdq_id);
 	if (!cmdq || cmdq->is_legacy) {
 		ret = -ENOENT;
-		goto unlock;
+		goto err_unlock;
 	}
 
 	cmdq_id = cmdq->id;
 	ivpu_cmdq_destroy(file_priv, cmdq);
+	mutex_unlock(&file_priv->lock);
 	ivpu_cmdq_abort_all_jobs(vdev, file_priv->ctx.id, cmdq_id);
-unlock:
+	return 0;
+
+err_unlock:
 	mutex_unlock(&file_priv->lock);
 	return ret;
 }
-- 
2.43.0

