Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDD8BD92B9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8633610E5C5;
	Tue, 14 Oct 2025 12:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pg3+6i5U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EFA10E5C5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:00:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 06E2643A55;
 Tue, 14 Oct 2025 12:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822F8C4CEE7;
 Tue, 14 Oct 2025 12:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443216;
 bh=MYOkvmykGl5wEJJTMYPBXc7NhTV2IevIzj0dYErWgLM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Pg3+6i5UbROC8ZxWdQXN/a7iAcyH+NuVG4Bwu4e+tDT4niK6rrZ3+KIiF4XR4PFd8
 1RkfLiRnq8QAa045x03nx898i4+C8+8lQKfomXNPjp41Q17UgfP6D7HlysdZkmk7FU
 BkKlqQdAclcLJTu0vBdUcucdUL3wlLWFSDwvnCD2Qa6Vm5xqj0I8Qbm8ssmFOHdcJi
 VfZsylqF9+OfNgqThpzaHrMulE8a5XNh9RxWt3U88UheWToDew05UZgiC0uJ3+DbDQ
 V5O+W0ZREyqS+xo3xKxlmpPxDd0+VtyoZUlE0+qRaElLM4juhJfgLA8Xyut6GP5Fiv
 xTWaRdKADg/Bw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:45 +0200
Subject: [PATCH v2 01/16] drm/atomic: Add dev pointer to drm_private_obj
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-1-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MYOkvmykGl5wEJJTMYPBXc7NhTV2IevIzj0dYErWgLM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrJ0VnJPWu7695v7xoOHc/89mx7wU4LzVweK8Y/uT3
 98fN89a3zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmMv0GY8OZLvfupgXTOE6n
 Hgp0lpjaKfBIS3TFqf0cynuNoxT3nVEr121krw3bv25zb81jjx/sBYy14ss7n3o/X9Hj9sxUv7H
 F2jzoxvdyPqdNOaweEd6XctyETGU38N+vjpO+NPPhx1q+l3kA
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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

