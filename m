Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B25395A01E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BBE10E641;
	Wed, 21 Aug 2024 14:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="g7fbJgZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5114610E641
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 14:39:12 +0000 (UTC)
Delivered-To: boris.brezillon@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724251147; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Yc548ba4zXhcw5MBiI0iTUo9ZNCEbRu6GBR9tUdbHznCJ4TyojLsQ/U2agHmwgNNOgGCdbvTy1FobCd8TFdNwoy1SzIuDN2wck9THnC9vPSu+qrO5hLlB17NbafBtUUHoC8MnNOJvFSUQyRKiVxBnsP9l1LAnzOu1AwVZmETJQs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724251147;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rD+SnsdX/sylSEfyI7jJsNyloIr864MAV90HZjGumtc=; 
 b=Ok5tte4zP+dwfRhL3I1EezALTFHwwvTtHNDNCm8cZTmEc4A39zlToaOqsJOuQrb+Qd+BDmckqc7/yYR0OmswfGxtRVaZvNGaYIinFx3/pdXgXWPfrgMRzj4FGRuIqDE5kmyf1n77xkt6sw9Lxd3DE+M2Osc3QP6zrOzieMovXIs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724251147; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=rD+SnsdX/sylSEfyI7jJsNyloIr864MAV90HZjGumtc=;
 b=g7fbJgZY38NS7+YnGK84Wy2pSSRiPDXQwww3Dkhh0mfXwNeAiAqvga/VdtdjVbOT
 2RIZ/mZRUC1MO5gg6cpKFlH9ZKJnbdGb+7w+j2U9119Oqp68BGdJ8ONhmhdrDCb5JH0
 /mkAY3p89nLIH7uYFNywzHYnJf0T79gLJWk0qykU=
Received: by mx.zohomail.com with SMTPS id 1724251143459799.7046544123294;
 Wed, 21 Aug 2024 07:39:03 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
To: liviu.dudau@arm.com, steven.price@arm.com, carsten.haitzler@arm.com,
 boris.brezillon@collabora.com, robh@kernel.org,
 faith.ekstrand@collabora.com
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 RESEND 1/5] drm: panthor: expose some fw information
 through the query ioctl
Date: Wed, 21 Aug 2024 11:37:27 -0300
Message-ID: <20240821143826.3720-2-daniel.almeida@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821143826.3720-1-daniel.almeida@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <20240821143826.3720-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

This is of interest to userspace, and similar in nature to the GPU
and CSIF information we already return in the query ioctl.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  3 +++
 drivers/gpu/drm/panthor/panthor_drv.c    |  8 ++++++++
 drivers/gpu/drm/panthor/panthor_sched.c  |  5 +++++
 include/uapi/drm/panthor_drm.h           | 19 +++++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index e388c0472ba7..224c53dcfe6d 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -100,6 +100,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;
 
+	/** @fw_info: Firmware info for the global interface */
+	struct drm_panthor_fw_info fw_info;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index b8a84f26b3ef..fb30e119d9bf 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -164,6 +164,7 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 	_Generic(_obj_name, \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_gpu_info, tiler_present), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_csif_info, pad), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_fw_info, instr_features), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
@@ -765,6 +766,10 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 			args->size = sizeof(ptdev->csif_info);
 			return 0;
 
+		case DRM_PANTHOR_DEV_QUERY_FW_INFO:
+			args->size = sizeof(ptdev->fw_info);
+			return 0;
+
 		default:
 			return -EINVAL;
 		}
@@ -777,6 +782,9 @@ static int panthor_ioctl_dev_query(struct drm_device *ddev, void *data, struct d
 	case DRM_PANTHOR_DEV_QUERY_CSIF_INFO:
 		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->csif_info);
 
+	case DRM_PANTHOR_DEV_QUERY_FW_INFO:
+		return PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->fw_info);
+
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 79ffcbc41d78..e0ecc8bcfaae 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3495,6 +3495,11 @@ int panthor_sched_init(struct panthor_device *ptdev)
 	ptdev->csif_info.cs_slot_count = sched->cs_slot_count;
 	ptdev->csif_info.scoreboard_slot_count = sched->sb_slot_count;
 
+	ptdev->fw_info.version = glb_iface->control->version;
+	ptdev->fw_info.features = glb_iface->control->features;
+	ptdev->fw_info.group_num = glb_iface->control->group_num;
+	ptdev->fw_info.instr_features = glb_iface->control->instr_features;
+
 	sched->last_tick = 0;
 	sched->resched_target = U64_MAX;
 	sched->tick_period = msecs_to_jiffies(10);
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index aaed8e12ad0b..e235cf452460 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -260,6 +260,9 @@ enum drm_panthor_dev_query_type {
 
 	/** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface information. */
 	DRM_PANTHOR_DEV_QUERY_CSIF_INFO,
+
+	/** @DRM_PANTHOR_DEV_QUERY_FW_INFO: Query firmware information */
+	DRM_PANTHOR_DEV_QUERY_FW_INFO,
 };
 
 /**
@@ -377,6 +380,22 @@ struct drm_panthor_csif_info {
 	__u32 pad;
 };
 
+/** struct drm_panthor_fw_info - FW information
+ *
+ * Structure grouping all queryable information relating to the global FW interface.
+ */
+
+struct drm_panthor_fw_info {
+	/** @version: Global interface version */
+	__u32 version;
+	/** @features: Global interface features */
+	__u32 features;
+	/** @group_num: Number of CSG interfaces */
+	__u32 group_num;
+	/** @instr_features: Instrumentation features */
+	__u32 instr_features;
+};
+
 /**
  * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
  */
-- 
2.45.2

