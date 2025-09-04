Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9561B42DF1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 02:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984D110E217;
	Thu,  4 Sep 2025 00:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="eO78EBZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF2610E217
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 00:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756944679; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=F8C1d8kCu81MkUrM3BzRieDw+eUcIEYVhSdLNHW3MR0IPFl3fIVyd7ObSvOcY4hvbwsr98NYWi4j36IdfWTMCO1Wkx7lzfRw5cxKjZAELZawFet+dZHnUdoACT1+Fh8abWhGSa90A8K1YfjNyVTR9/eZ0s1LPROB+V7LgoQGMcs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756944679;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0KxPjscGfJSFzCMH+i6+CV//b0z+Pa5lWFfImRPFOEE=; 
 b=VIcw2k1B2Dd0idHd/q+xlnivZKIhVcec4IzAU9HAW1yYDMCgTFeklUUJhL9ukVndP0zWyZAB+8Q/pnWzhDQkMd4ha86FURP9ITvoMkxFxJrlS4L8J/gNTbBhn1Q9d0QIXH3u+LdYBrt09neqrCwzpzJmCU9QTpzU7nJ5FJW0bMY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756944679; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0KxPjscGfJSFzCMH+i6+CV//b0z+Pa5lWFfImRPFOEE=;
 b=eO78EBZD6GGSQDJcTjKBs17N2Z/o6hfRZbZ00zLUXxVDYuAM3HecKd8g6YfTZohN
 jYxXUbOeP2TXheNFV69jlUEKOcZcdyV0PR2Pd+4TcvPXjtFuWxi+DUBECAkNhoUi9oy
 QhwGMbuhSjvO8Z+Zjr/ICO1CeOpWkw3cRJct7xXo=
Received: by mx.zohomail.com with SMTPS id 1756944676648692.9960883585809;
 Wed, 3 Sep 2025 17:11:16 -0700 (PDT)
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
Subject: [PATCH v2 1/4] drm/panfrost: Introduce uAPI for JM context creation
Date: Thu,  4 Sep 2025 01:07:59 +0100
Message-ID: <20250904001054.147465-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904001054.147465-1-adrian.larumbe@collabora.com>
References: <20250904001054.147465-1-adrian.larumbe@collabora.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

The new uAPI lets user space query the KM driver for the available
priorities a job can be given at submit time. These are managed through
the notion of a context, for which we also provide new creation and
destruction ioctls.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 include/uapi/drm/panfrost_drm.h | 50 +++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index ed67510395bd..e8b47c9f6976 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -22,6 +22,8 @@ extern "C" {
 #define DRM_PANFROST_PERFCNT_DUMP		0x07
 #define DRM_PANFROST_MADVISE			0x08
 #define DRM_PANFROST_SET_LABEL_BO		0x09
+#define DRM_PANFROST_JM_CTX_CREATE		0x0a
+#define DRM_PANFROST_JM_CTX_DESTROY		0x0b
 
 #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
 #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
@@ -31,6 +33,8 @@ extern "C" {
 #define DRM_IOCTL_PANFROST_GET_BO_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_BO_OFFSET, struct drm_panfrost_get_bo_offset)
 #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_MADVISE, struct drm_panfrost_madvise)
 #define DRM_IOCTL_PANFROST_SET_LABEL_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SET_LABEL_BO, struct drm_panfrost_set_label_bo)
+#define DRM_IOCTL_PANFROST_JM_CTX_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_CREATE, struct drm_panfrost_jm_ctx_create)
+#define DRM_IOCTL_PANFROST_JM_CTX_DESTROY	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_DESTROY, struct drm_panfrost_jm_ctx_destroy)
 
 /*
  * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
@@ -71,6 +75,12 @@ struct drm_panfrost_submit {
 
 	/** A combination of PANFROST_JD_REQ_* */
 	__u32 requirements;
+
+	/** JM context handle. Zero if you want to use the default context. */
+	__u32 jm_ctx_handle;
+
+	/** Padding field. MBZ. */
+	__u32 pad;
 };
 
 /**
@@ -177,6 +187,7 @@ enum drm_panfrost_param {
 	DRM_PANFROST_PARAM_AFBC_FEATURES,
 	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP,
 	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY,
+	DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES,
 };
 
 struct drm_panfrost_get_param {
@@ -299,6 +310,45 @@ struct panfrost_dump_registers {
 	__u32 value;
 };
 
+enum drm_panfrost_jm_ctx_priority {
+	/**
+	 * @PANFROST_JM_CTX_PRIORITY_LOW: Low priority context.
+	 */
+	PANFROST_JM_CTX_PRIORITY_LOW = 0,
+
+	/**
+	 * @PANFROST_JM_CTX_PRIORITY_MEDIUM: Medium priority context.
+	 */
+	PANFROST_JM_CTX_PRIORITY_MEDIUM,
+
+	/**
+	 * @PANFROST_JM_CTX_PRIORITY_HIGH: High priority context.
+	 *
+	 * Requires CAP_SYS_NICE or DRM_MASTER.
+	 */
+	PANFROST_JM_CTX_PRIORITY_HIGH,
+};
+
+struct drm_panfrost_jm_ctx_create {
+	/** @handle: Handle of the created JM context */
+	__u32 handle;
+
+	/** @priority: Context priority (see enum drm_panfrost_jm_ctx_priority). */
+	__u32 priority;
+};
+
+struct drm_panfrost_jm_ctx_destroy {
+	/**
+	 * @handle: Handle of the JM context to destroy.
+	 *
+	 * Must be a valid context handle returned by DRM_IOCTL_PANTHOR_JM_CTX_CREATE.
+	 */
+	__u32 handle;
+
+	/** @pad: Padding field, MBZ. */
+	__u32 pad;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.50.0

