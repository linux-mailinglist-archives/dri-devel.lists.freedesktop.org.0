Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF19C18BE03
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 18:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F966EA41;
	Thu, 19 Mar 2020 17:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106296EA41
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 17:30:34 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w10so4164413wrm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0d7zIwG53qE4nDg8R9G9mpn3/riI4mVlhLQJEQbgbHo=;
 b=mO11wYTvc9zHnfEmEDo/eozB2cxn5oC++d1dqEBUDeV4qd+T4D9MA0B4NByjtPIXdM
 5ZL3uzwwWS+5nshyBoYmldgin1tRMoWWsnDxK5vOOExZRRFHjBkuOgT7+ZFWfF4MkxMg
 sFvoSqRn37D2+ICnV3kd+G8F5unhpWRxncyfRFuCteXT7Xp302lBRm+wYs9B9gR6RRoX
 2PPSBR5S4SVrTNDWTBdqzYACcTbJHBd7VEgu4EHm/z8x4zcElXgIGoyY+gPw/+NhJ17t
 X1jUeFklGVk+th3CHv1E4fWDyrqx378mcVXN48wgvMsn6PkzOaYok15iZlL0eH2oA/l1
 zm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0d7zIwG53qE4nDg8R9G9mpn3/riI4mVlhLQJEQbgbHo=;
 b=VOibtvQE9jbo+LiWTBkDSzmq2SYT+8V0Cfd3kNYEan7d5MQUMI09eN3ra4KktPJ1Xk
 2fw1MGAetaKWvwTzWIarPSpUiRlkMhYatPlp3uhyNDiG/nujtoDlnR4xs8VgIW0itoEq
 rr/75ZSGMvynoxCXmYY6fDIlezZlV4Mf9nlCnJujbpQmPOsKivNxDixMC7HlCp2NkW6t
 nQ4dj6JVv8pwR/g/9lWfWMJeildLDUSwQC0GDK1lN3pLrEKIgcKbvba1D3pkMi1WifM6
 ld3xyFDqepJHb/XcZ5C0MTibXucvjLcuq9B2jbPHngNZz1sTWRYHRl/NwfFtIn9nL4gu
 1YnA==
X-Gm-Message-State: ANhLgQ0z/cvLUXI4DolSnLKMGSYKK6WAM6tLEfSSTSspdBdKhftzkici
 QHMHn2Vk5HGCL32E9eIzI9QCpVFR
X-Google-Smtp-Source: ADFU+vtcajybqmS91n+pWUnHeO7uxluzI2IBvA5hwvrmLA+EMy9wYSjBONb0ufh2d/X8CSM0icdh/Q==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr5508099wrk.407.1584639032217; 
 Thu, 19 Mar 2020 10:30:32 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id k9sm4534601wrd.74.2020.03.19.10.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 10:30:31 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm: rework SET_MASTER and DROP_MASTER perm handling
Date: Thu, 19 Mar 2020 17:29:29 +0000
Message-Id: <20200319172930.230583-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This ensures that we:
 - do not regress the systemd-logind style of DRM_MASTER arbitrator
 - allow applications which do not use systemd-logind to drop their
master capabilities (and regain them at later point) ... w/o running as
root.

See the comment above drm_master_check_perm() for more details.

v1:
 - Tweak wording, fixup all checks, add igt test

v2:
 - Add a few more comments, grammar nitpicks.

Cc: Adam Jackson <ajax@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Testcase: igt/core_setmaster/master-drop-set-user
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Reviewed-by: Adam Jackson <ajax@redhat.com>
---
 drivers/gpu/drm/drm_auth.c  | 67 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c |  4 +--
 include/drm/drm_file.h      | 11 ++++++
 3 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index cc9acd986c68..37cac0a221ff 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -135,6 +135,7 @@ static int drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
 		}
 	}
 
+	fpriv->was_master = (ret == 0);
 	return ret;
 }
 
@@ -179,12 +180,72 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
 	return ret;
 }
 
+/*
+ * In the olden days the SET/DROP_MASTER ioctls used to return EACCES when
+ * CAP_SYS_ADMIN was not set. This was used to prevent rogue applications
+ * from becoming master and/or failing to release it.
+ *
+ * At the same time, the first client (for a given VT) is _always_ master.
+ * Thus in order for the ioctls to succeed, one had to _explicitly_ run the
+ * application as root or flip the setuid bit.
+ *
+ * If the CAP_SYS_ADMIN was missing, no other client could become master...
+ * EVER :-( Leading to a) the graphics session dying badly or b) a completely
+ * locked session.
+ *
+ *
+ * As some point systemd-logind was introduced to orchestrate and delegate
+ * master as applicable. It does so by opening the fd and passing it to users
+ * while in itself logind a) does the set/drop master per users' request and
+ * b)  * implicitly drops master on VT switch.
+ *
+ * Even though logind looks like the future, there are a few issues:
+ *  - some platforms don't have equivalent (Android, CrOS, some BSDs) so
+ * root is required _solely_ for SET/DROP MASTER.
+ *  - applications may not be updated to use it,
+ *  - any client which fails to drop master* can DoS the application using
+ * logind, to a varying degree.
+ *
+ * * Either due missing CAP_SYS_ADMIN or simply not calling DROP_MASTER.
+ *
+ *
+ * Here we implement the next best thing:
+ *  - ensure the logind style of fd passing works unchanged, and
+ *  - allow a client to drop/set master, iff it is/was master at a given point
+ * in time.
+ *
+ * Note: DROP_MASTER cannot be free for all, as an arbitrator user could:
+ *  - DoS/crash the arbitrator - details would be implementation specific
+ *  - open the node, become master implicitly and cause issues
+ *
+ * As a result this fixes the following when using root-less build w/o logind
+ * - startx
+ * - weston
+ * - various compositors based on wlroots
+ */
+static int
+drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
+{
+	if (file_priv->pid == task_pid(current) && file_priv->was_master)
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
 
@@ -229,6 +290,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
