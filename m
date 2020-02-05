Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115D01536FA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 18:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F126F8FF;
	Wed,  5 Feb 2020 17:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3516F8FF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:48:17 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a6so3787199wrx.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 09:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DWW6x8PMrWQCkVtFdy/rcXqLn49tbC8CainmUOE/p4g=;
 b=bTXPB39gjkLKaTCfeFD6TVSYzrYo/c7wjDb3qgM47nxXOcm88szEtWPwW1+QUWmqVX
 1C9J+CzBy9YNCNKw0U8TMUenEPC9FIn9tBjT9nkVug+EIkfZ3XB7C1UEG7XrWb1fqafO
 ZU6p9oOp+MLT43Bm9r43J/iS+NxQ6FIWukDBBQCVpUzbM3Y74oyVCvvsIBNNti8oZSxs
 oq+SvsiGqza9svJw4yykMAKXB+wuPOh2PLJH4sXqLqGxdqZI6yEPaZ235zolPq0n4N4T
 8kTCmO3T4TP0hUqpwHARO+ytbXY37RwFZQHnqzfoa+BdTkqYEZKc1fRP1QnUGHIVqGfC
 3HFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DWW6x8PMrWQCkVtFdy/rcXqLn49tbC8CainmUOE/p4g=;
 b=US37ZBbNrjl2nukGV1ijT7p2ybBMtqxfylTkuUmcfc//Vw24QkMr7nWtLsaqjhszV8
 VCpePib+2J4Y1P+0ppKebhn6XKK+jM7Q7tlQJ5/rpY+7MCK9rcYQFW2G7ohYBzKZL74w
 F8asXSt9Wp5q2/BPxdAq+QKJhwx5cySmjSD6dll4QobE66g+FlAHA/U3gBCxzPKJR1xD
 zDbdBdT638mpfAytibAN8akGPcEM56M0qdC0BEmBz/CEPsbjeObqxdtWK0+KrdbW3SkR
 WwnSpoIAzxkFSgE/X4lTzP0KP27fwbEkcIJJA9Ld5ry3MvGYQfwYpdM5O5Fiz2VoSKpb
 9T1Q==
X-Gm-Message-State: APjAAAVsWbNW3lnHKxB8O67GGHUC36A5HNq3Os5NYSX34J3QO1L/JaAH
 FH4ar3K9cG9c8MItn5D2iWakcQbI
X-Google-Smtp-Source: APXvYqw7zdPpRQPUqFu/VuXHh120WvjBjgOFN6lgdJzqArkgegByP7yngq5Kup8rhcOUDB13En1XLQ==
X-Received: by 2002:adf:a354:: with SMTP id d20mr29108549wrb.257.1580924896127; 
 Wed, 05 Feb 2020 09:48:16 -0800 (PST)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id m9sm682145wrx.55.2020.02.05.09.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 09:48:15 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm: rework SET_MASTER and DROP_MASTER perm handling
Date: Wed,  5 Feb 2020 17:48:39 +0000
Message-Id: <20200205174839.374658-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.0
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
Cc: emil.l.velikov@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

This commit reworks the permission handling of the two ioctls. In
particular it enforced the CAP_SYS_ADMIN check only, if:
 - we're issuing the ioctl from process other than the one which opened
the node, and
 - we are, or were master in the past

This allows for any application which cannot rely on systemd-logind
being present (for whichever reason), to drop it's master capabilities
(and regain them at later point) w/o being ran as root.

See the comment above drm_master_check_perm() for more details.

Cc: Adam Jackson <ajax@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
This effectively supersedes an earlier patch [1] incorporating ajax's
feedback (from IRC ages ago).

[1] https://patchwork.freedesktop.org/patch/268977/
---
 drivers/gpu/drm/drm_auth.c  | 59 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c |  4 +--
 include/drm/drm_file.h      | 11 +++++++
 3 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index cc9acd986c68..01d9e35c0106 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -135,6 +135,7 @@ static int drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
 		}
 	}
 
+	fpriv->was_master = (ret == 0);
 	return ret;
 }
 
@@ -179,12 +180,64 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 	return ret;
 }
 
+/*
+ * In the olden days the SET/DROP_MASTER ioctls used to return EACCES when
+ * CAP_SYS_ADMIN was not set.
+ *
+ * Even though the first client is _always_ master, it also had to be run as
+ * root, otherwise SET/DROP_MASTER would fail. In those cases no other client
+ * could become master ... EVER.
+ *
+ * Resulting in a) the graphics session dying badly or b) a completely locked
+ * session :-\
+ *
+ * As some point systemd-logind was introduced to orchestrate and delegate
+ * master as applicable. It does so by opening the fd and passing it to users
+ * while in itself logind a) set/drop master per users' request and b)
+ * implicitly drops master on VT switch.
+ *
+ * Even though logind looks like the future, there are a few obstacles:
+ *  - using it is not possible on some platforms, or
+ *  - applications may not be updated to use it,
+ *  - any client which fails to drop master* can DoS the application using
+ * logind, to a varying degree.
+ *
+ * * Either due missing root permission or simply not calling DROP_MASTER.
+ *
+ *
+ * Here we implement the next best thing:
+ *   We enforce the CAP_SYS_ADMIN check only if the client was not a master
+ * before. We distinguish between the original master client (say logind) and
+ * another client which has the fd passed (say Xorg) by comparing the pids.
+ *
+ * As a result this fixes, the following when using root-less build w/o logind
+ * - startx - some drivers work fine regardless
+ * - weston
+ * - various compositors based on wlroots
+ */
+static int
+drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
+{
+	if (file_priv->pid != task_pid(current) && file_priv->was_master)
+		return 0;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EACCES;
+
+	return 0;
+}
+
 int drm_setmaster_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv)
 {
 	int ret = 0;
 
 	mutex_lock(&dev->master_mutex);
+
+	ret = drm_master_check_perm(dev, file_priv);
+	if (ret)
+		goto out_unlock;
+
 	if (drm_is_current_master(file_priv))
 		goto out_unlock;
 
@@ -229,6 +282,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 	int ret = -EINVAL;
 
 	mutex_lock(&dev->master_mutex);
+
+	ret = drm_master_check_perm(dev, file_priv);
+	if (ret)
+		goto out_unlock;
+
+	ret = -EINVAL;
 	if (!drm_is_current_master(file_priv))
 		goto out_unlock;
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 9e41972c4bbc..73e31dd4e442 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -599,8 +599,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SET_SAREA_CTX, drm_legacy_setsareactx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_SAREA_CTX, drm_legacy_getsareactx, DRM_AUTH),
 
-	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, DRM_ROOT_ONLY),
+	DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, 0),
+	DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, 0),
 
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_CTX, drm_legacy_addctx, DRM_AUTH|DRM_ROOT_ONLY),
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_CTX, drm_legacy_rmctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 19df8028a6c4..c4746c9d3619 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -201,6 +201,17 @@ struct drm_file {
 	 */
 	bool writeback_connectors;
 
+	/**
+	 * @was_master:
+	 *
+	 * This client has or had, master capability. Protected by struct
+	 * &drm_device.master_mutex.
+	 *
+	 * This is used to ensure that CAP_SYS_ADMIN is not enforced, if the
+	 * client is or was master in the past.
+	 */
+	bool was_master;
+
 	/**
 	 * @is_master:
 	 *
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
