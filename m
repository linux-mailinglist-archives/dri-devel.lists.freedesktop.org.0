Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C1F2948C6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6126F475;
	Wed, 21 Oct 2020 07:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D556E96C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 06:55:22 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id f126so966474qke.17
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 23:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=kqIBqfY+Hcr7A7v5M3/iiJmOoTUsbHrDS0m6HNeC0jY=;
 b=ciLRT5zHEWJ9eOvi55jX9OgHieT3KfG13ACzGI33brcOzxHpY42/gk3kXwkC3NBr0s
 E5cXf94irMI6gsUS2rN8ZC00zBnIlI941Z53PtVlA2u4nTyU7iNcM2REf9qEHdhVtegL
 i/Xr5J10pjo4xWUzVftp6A9pl731OD6vOOlIkr7o6YsvF52LJtCD7ug1gd0vcy3LM9iH
 cM0mMDvjc/PP7FeDApsE+YhfNMMM/S1X8aSSBNCJPI36qBPQZfi8kI/r9RIFs+8omAop
 bD8npsSgf2T8u9/XlaTpZul4i0TdrO66/23M/g+HNZLNh80Yxsik5R69Xz9z1H0ZVf13
 aG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=kqIBqfY+Hcr7A7v5M3/iiJmOoTUsbHrDS0m6HNeC0jY=;
 b=VQVaUBKYC9fLcguRS0NTdjBYM7fQGS8Uq4U2h7xZ8xwgG+kXDrzNxYqkpSBA2ZUqYc
 IPQGi21VoJ6heMOy/0D9zDkiwsKXxb+aAs5sxgx+4oMhjW39eC5oee4pFagx/LvfsUOQ
 LgJ2gzXC/gMFDep6Fd6ubrj6Hw2AYrt44Nt2YyjZuFF/8t6nbjvx13j23a3MiQ8DWOgv
 d5JcZUbjclmBv+cBdv8DMBMm/LAnwo4yghzTxeKwo0K0JVAuWJsur7NBhrcKxzVGPWyV
 cZkvMaCdEphVXff4apNvHlI98JfUCROWCMyIswTWK9NuqZ/mbjlB/EnemNi23qryW12I
 vOfw==
X-Gm-Message-State: AOAM533ZEUwNrpZ6T/ebahAFV+m0VzBK1pwwFhv4KUDi2II5Zc1NX+A2
 ZHJ1Hjl19GFfZYW8cbMNpHvsz/74WHuhbC3V
X-Google-Smtp-Source: ABdhPJyVeRl2TfkbPk0Oo2hxaHWZvtsEyFHMTPbqqvBXQ5/1B1CjslD9c9JP/8ORxT0A/2gVMqJQrgnb5FHjFsmb
X-Received: from kenbshuang.ntc.corp.google.com
 ([2401:fa00:fc:202:3e52:82ff:fe5b:37a9])
 (user=kenbshuang job=sendgmr) by 2002:ad4:45ca:: with SMTP id
 v10mr312755qvt.48.1603263321099; Tue, 20 Oct 2020 23:55:21 -0700 (PDT)
Date: Wed, 21 Oct 2020 14:54:04 +0800
Message-Id: <20201021065404.1336797-1-kenbshuang@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH] drm: add client cap to expose low power modes
From: Ken Huang <kenbshuang@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: Ken Huang <kenbshuang@google.com>, Adrian Salido <salidoa@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Adrian Salido <salidoa@google.com>

Some displays may support Low Power modes, however, these modes may
require special handling as they would usually require lower OPR
content on framebuffers. Add a drm mode flag to specify display
capability to support low power mode, and add a drm client cap for
it. If a client doesn't support the capability, that will filter it
out for the client.

Signed-off-by: Adrian Salido <salidoa@google.com>
Signed-off-by: Ken Huang <kenbshuang@google.com>
---
 drivers/gpu/drm/drm_connector.c |  4 ++++
 drivers/gpu/drm/drm_ioctl.c     |  5 +++++
 include/drm/drm_file.h          |  7 +++++++
 include/uapi/drm/drm.h          | 10 ++++++++++
 include/uapi/drm/drm_mode.h     |  3 +++
 5 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 717c4e7271b0..46a29b156ffa 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2318,6 +2318,10 @@ drm_mode_expose_to_userspace(const struct drm_display_mode *mode,
 		}
 	}
 
+	if (!file_priv->low_power_modes_allowed &&
+	    (mode->flags & DRM_MODE_FLAG_LOW_POWER))
+		return false;
+
 	return true;
 }
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 789ee65ac1f5..e7e025698b3b 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -362,6 +362,11 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->writeback_connectors = req->value;
 		break;
+	case DRM_CLIENT_CAP_LOW_POWER_MODES:
+		if (req->value > 1)
+			return -EINVAL;
+		file_priv->low_power_modes_allowed = req->value;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 716990bace10..2fa66c32f066 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -212,6 +212,13 @@ struct drm_file {
 	 */
 	bool was_master;
 
+	/**
+	 * @low_power_modes_allowed:
+	 *
+	 * True if the client understands how to work with low power modes
+	 */
+	bool low_power_modes_allowed;
+
 	/**
 	 * @is_master:
 	 *
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 808b48a93330..12f39a628bb5 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -698,6 +698,16 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_LOW_POWER_MODES
+ *
+ * If set to 1, the DRM core will expose modes that support Lower Power at the
+ * potential cost of reduced fidelity. Special care must be taken by clients
+ * that work with these modes, (ex. framebuffer contents are expected to
+ * have reduced OPRs)
+ */
+#define DRM_CLIENT_CAP_LOW_POWER_MODES	6
+
 /** DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 863eda048265..71137280b1e6 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -124,6 +124,8 @@ extern "C" {
 #define  DRM_MODE_FLAG_PIC_AR_256_135 \
 			(DRM_MODE_PICTURE_ASPECT_256_135<<19)
 
+#define  DRM_MODE_FLAG_LOW_POWER		(1<<23)
+
 #define  DRM_MODE_FLAG_ALL	(DRM_MODE_FLAG_PHSYNC |		\
 				 DRM_MODE_FLAG_NHSYNC |		\
 				 DRM_MODE_FLAG_PVSYNC |		\
@@ -136,6 +138,7 @@ extern "C" {
 				 DRM_MODE_FLAG_HSKEW |		\
 				 DRM_MODE_FLAG_DBLCLK |		\
 				 DRM_MODE_FLAG_CLKDIV2 |	\
+				 DRM_MODE_FLAG_LOW_POWER |	\
 				 DRM_MODE_FLAG_3D_MASK)
 
 /* DPMS flags */
-- 
2.29.0.rc1.297.gfa9743e501-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
