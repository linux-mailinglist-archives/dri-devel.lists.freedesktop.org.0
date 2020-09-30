Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B9427F40C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 23:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D486E82C;
	Wed, 30 Sep 2020 21:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB716E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 21:16:19 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id d9so2181059pfd.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 14:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2U/fjg//jswj3Yudi2Db1uBr5ff+2io2dnuoLW/qR0A=;
 b=qA0BKeGOCvBF9bL80rgHz360wFyWQUEkiHm4zDy+G1Vi2O18MzTYl4/04CVlt8FHMb
 7mOK9eG8CD5gzFIeVmFNyVVZGTZpx0EIsMHkCHoJNO782DwRYy1Vm12N7Dy47k9CTnHM
 pTCaeZhi4OF0dOqujGlBpf+cf4xCQnevxhOztZC2hXzlVLX1cN+ZQqdMXFtXlsVKmD2O
 1IiwohPL5VpKhw6nGriSvKODwJ+g7dCmaHjOWXhCiTx+7w9CWmLoRVk7mHXL4bnQ2LtC
 QM3oKuE3lfL84CDD+Mv+vWcDMce0nLwUsNUQBEC7aE3rVBZhNf0HcmavkdkvKzipiAQY
 LX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2U/fjg//jswj3Yudi2Db1uBr5ff+2io2dnuoLW/qR0A=;
 b=Rz+3aSEW2gm0pbfPPsN1u3AJN77ZmXfh9h+DFutFBML0Wmu8c9VZub+XzdDN0F861Z
 2BDewMXQ0KnaXaLx2acz838HKN2/lzeWAIFNVlu4HeyZx2SuPMa161f7slDGZ1OLV9pH
 VmlDsMA0yANj0HnumdF7lmuaW5JH7GnuzZSfp9NU3IJr3drCt7i2YLL/NSd7jax66Avf
 EbSsPunLH0ikKF51zSYmQexv75QaSXp6p0ouqlTO4vGcRXxN9NRPgRYK/LlZ3jCbeHT9
 3CdjnGbvrAriv9C1i+uzMv5t9myPCuSJWYveYvZppokKcNvm7La/ePA1l6POuL7he5bR
 YJaw==
X-Gm-Message-State: AOAM533ZrjKE05wFJla3nEJGbuWylGZxW/lVnnUTv7whor8IkDCmPTWI
 gXH2Dnv2KENOjzvw7j8oyjsclFWSZrs=
X-Google-Smtp-Source: ABdhPJwTRuxYSLgbeUmLAYi4ke/Rev9ysHOLICTOKEacpnjGaRU4LkJop3kZqCMXI2Gd88aZDrdvSw==
X-Received: by 2002:a17:902:d888:b029:d0:cb2d:f274 with SMTP id
 b8-20020a170902d888b02900d0cb2df274mr3965422plz.13.1601500578174; 
 Wed, 30 Sep 2020 14:16:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id n2sm3609064pfe.208.2020.09.30.14.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 14:16:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm: Expose CRTC's kworker task id
Date: Wed, 30 Sep 2020 14:17:22 -0700
Message-Id: <20200930211723.3028059-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930211723.3028059-1-robdclark@gmail.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, timmurray@google.com,
 Tejun Heo <tj@kernel.org>, Qais Yousef <qais.yousef@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This will allow userspace to control the scheduling policy and priority.
In particular if the userspace half of the display pipeline is SCHED_FIFO
then it will want to use the same scheduling policy and an appropriate
priority to ensure that it is not preempting commit_work.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_crtc.c        |  3 +++
 drivers/gpu/drm/drm_mode_config.c | 14 ++++++++++++++
 drivers/gpu/drm/drm_mode_object.c |  4 ++++
 include/drm/drm_mode_config.h     |  9 +++++++++
 include/drm/drm_property.h        |  9 +++++++++
 5 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 4f7c0bfce0a3..1828853542dc 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -334,6 +334,9 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
 			crtc->worker = NULL;
 			return ret;
 		}
+
+		drm_object_attach_property(&crtc->base,
+					   config->kwork_tid_property, 0);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index f1affc1bb679..b11a1fc8ed0d 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -215,6 +215,13 @@ static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
 	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
 };
 
+static int get_kwork_tid(struct drm_mode_object *obj, uint64_t *val)
+{
+	struct drm_crtc *crtc = obj_to_crtc(obj);
+	*val = task_pid_vnr(crtc->worker->task);
+	return 0;
+}
+
 static int drm_mode_create_standard_properties(struct drm_device *dev)
 {
 	struct drm_property *prop;
@@ -371,6 +378,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.modifiers_property = prop;
 
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC,
+			"KWORK_TID", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	prop->get_value = get_kwork_tid;
+	dev->mode_config.kwork_tid_property = prop;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index db05f386a709..1a4df65baf0f 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -285,6 +285,7 @@ int drm_object_property_set_value(struct drm_mode_object *obj,
 
 	WARN_ON(drm_drv_uses_atomic_modeset(property->dev) &&
 		!(property->flags & DRM_MODE_PROP_IMMUTABLE));
+	WARN_ON(property->get_value);
 
 	for (i = 0; i < obj->properties->count; i++) {
 		if (obj->properties->properties[i] == property) {
@@ -303,6 +304,9 @@ static int __drm_object_property_get_value(struct drm_mode_object *obj,
 {
 	int i;
 
+	if (property->get_value)
+		return property->get_value(obj, val);
+
 	/* read-only properties bypass atomic mechanism and still store
 	 * their value in obj->properties->values[].. mostly to avoid
 	 * having to deal w/ EDID and similar props in atomic paths:
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index c2d3d71d133c..7244df926a6d 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -926,6 +926,15 @@ struct drm_mode_config {
 	 */
 	struct drm_property *modifiers_property;
 
+	/**
+	 * @kwork_tid_property: CRTC property to expose the task-id of the per-
+	 * CRTC kthread-worker, used for non-block atomic commit.  This is exposed
+	 * to userspace, to allow userspace to control the scheduling policy and
+	 * priority, as this is a decision that depends on how userspace structures
+	 * it's rendering pipeline.
+	 */
+	struct drm_property *kwork_tid_property;
+
 	/* cursor size */
 	uint32_t cursor_width, cursor_height;
 
diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
index 4a0a80d658c7..6843be6aa3ec 100644
--- a/include/drm/drm_property.h
+++ b/include/drm/drm_property.h
@@ -188,6 +188,15 @@ struct drm_property {
 	 * enum and bitmask values.
 	 */
 	struct list_head enum_list;
+
+	/**
+	 * @get_value: accessor to get current value for "virtual" properties
+	 *
+	 * For properties with dynamic values, where it is for whatever reason
+	 * not feasible to keep updated with drm_object_property_set_value(),
+	 * this callback can be used to retrieve the current value on demand.
+	 */
+	int (*get_value)(struct drm_mode_object *obj, uint64_t *val);
 };
 
 /**
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
