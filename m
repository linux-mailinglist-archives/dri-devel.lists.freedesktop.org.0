Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1974BC4AF6
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5293C10E7E4;
	Wed,  8 Oct 2025 12:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Avh0R3ZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F95910E7E4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:04:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9EC956120A;
 Wed,  8 Oct 2025 12:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30F4C4CEF4;
 Wed,  8 Oct 2025 12:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925056;
 bh=5dKks1K3ZK9dx+Z+U9/WnU7AGFVH+KHxNtepnGehzdA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Avh0R3ZCz8Vdxg68V+wXq2imn73RWMhZvTPGNWIXdt+5CiBR/g1kiOEsOLi7R4qvw
 AOmUtjDfyv32wC8Q8dGirHzytJN7JpDJq2+Nmj5gIl7TFrfdYIAsy8AEUF8Pe3SkAj
 NtpWwN3VGD8n3ty148tovdEYe/EbgDercmPIWLkLFcOKQKILtNwrrQE9SR53daKJRd
 gBL/cD5ZsARd4GvZB6Au58JyuVlV/8jB1EBcGHDsa5o2YBFOlF96Gv+epLWqYIISzj
 FQIftcD2WKFd2MSQv+L5ntuVA5hPmdgObfjdMHYLMu3tGerdeuXV+xIvuYHw7psOEZ
 aCA08h+WIihzQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:03:59 +0200
Subject: [PATCH 01/16] drm/atomic: Add dev pointer to drm_private_obj
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-1-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5dKks1K3ZK9dx+Z+U9/WnU7AGFVH+KHxNtepnGehzdA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgo2D1v7a3qt6pOZRVeDlOpF0z8/XWe9fSgz2ZnjxW
 +72pKmXOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEOHYzNkxt2vGS+Y/Xya05
 bz5zHfzzfdn1lPzP4ms6vTsOzBGaanLe8cP9XsV3axqilxX0lD3Tu8rYcGbG7KIUWdEnfAp7Z96
 8vH5N/B355tNvjGt3F1y8OnHWw93WVlwtAumFPXqCRxassqvSBgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

All the objects that need to implement some callbacks in KMS have a
pointer in there structure to the main drm_device.

However, it's not the case for drm_private_objs, which makes it harder
than it needs to be to implement some of its callbacks. Let's add that
pointer.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 1 +
 include/drm/drm_atomic.h     | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ed5359a71f7e2cd8fa52b993e62ee65f8fed4537..39cb1479ac4d58cd71cf41d27d0d2a8a58ef5791 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -790,10 +790,11 @@ drm_atomic_private_obj_init(struct drm_device *dev,
 {
 	memset(obj, 0, sizeof(*obj));
 
 	drm_modeset_lock_init(&obj->lock);
 
+	obj->dev = dev;
 	obj->state = state;
 	obj->funcs = funcs;
 	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
 
 	state->obj = obj;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 38636a593c9d98cadda85ccd67326cb152f0dd27..dac70f685361d8d29844acd1b0cc2f04f43a9499 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -282,10 +282,15 @@ struct drm_private_state_funcs {
  * commit to complete as the first step of
  * &drm_mode_config_helper_funcs.atomic_commit_tail, similar to
  * drm_atomic_helper_wait_for_dependencies().
  */
 struct drm_private_obj {
+	/**
+	 * @dev: parent DRM device
+	 */
+	struct drm_device *dev;
+
 	/**
 	 * @head: List entry used to attach a private object to a &drm_device
 	 * (queued to &drm_mode_config.privobj_list).
 	 */
 	struct list_head head;

-- 
2.51.0

