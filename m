Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6045702FD5
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D0310E20E;
	Mon, 15 May 2023 14:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2135710E207;
 Mon, 15 May 2023 14:31:05 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6436e075166so9583748b3a.0; 
 Mon, 15 May 2023 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684161064; x=1686753064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ALq25/GYGH1zBk6Bxp4nZpXzMg5fERkeTFcF2Sc5VQ=;
 b=rObvimGJrFK2A8lzFbnXDUzo+N+GHtHZxseJ0knzMtMqtfIou+p1+b/gJAnOQr7Tug
 g14TqF12i3WogQ2yshrldLo4we4vKJv7pMlBBKn+h1RheZ2bvIeIFVRwmJoXh5iiiCc2
 cfLRMefKYsBGfy+wY2jtzgJHkbms95Kk1PZyRXhwyJz8dKOS/Pm00fPPLR2PY9o6K7KF
 UFXy1gWIuNJLFWLZaRGfUGOCJg1cjJWhflRUt2UBOkoIXDtTT6oAJfDKpmV2BVCyUtLZ
 i73eCt+MQqGRfZDSOLBD77U1CRi8XUQrENwO9ex5Ku0PD0hAa5CESfb40DrLKGcRRsWg
 MtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161064; x=1686753064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ALq25/GYGH1zBk6Bxp4nZpXzMg5fERkeTFcF2Sc5VQ=;
 b=TNJAgAIOCsWM9999aKTe5CgCfIOWN4ceYASRWDkzZSEM8dZ33zEYZ9383sf/JAo+yI
 9YKWFicyNbTZkYpJ5ikBM26COVzaW74hdawyeqTij+8hzaGavda2dwYtF1lOxY3sXbOw
 CfklT5SZZ9N8DXchVuT10BjJGcDRRAx6hAZfsFUYCknDQ33FjkRjewx3xEElUeFHSOkN
 GYnaJkgXUnT7qhV1SD2wyYWHaJ+Nyi6y5lh06GJUPZHCCmQmA1ydLypoTPP76ogmrBLm
 Ox0FxV3AaYseL2VvOex3GJVem0B6LFdpEvzlR/3efuRU8lZx/ez4OVM5q7cL2Y1odk9z
 +QKw==
X-Gm-Message-State: AC+VfDx8FDAnEbwSgoK2CzuwAjNezdaVdoiOLrCI4P0N9aJszdf7WzOs
 P3JiNQDCnK6/W5/xX/5iY2I1S5Mi1zg=
X-Google-Smtp-Source: ACHHUZ4R3D/gaKOk7QkT8FMcc9BtENuYixxz4Hv1MjvFhVsW4kdm9Xr25qLw7//hiieQaz81R+IUPw==
X-Received: by 2002:a05:6a00:218a:b0:640:defd:a6d5 with SMTP id
 h10-20020a056a00218a00b00640defda6d5mr40180183pfi.12.1684161063962; 
 Mon, 15 May 2023 07:31:03 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 j18-20020aa78dd2000000b0064c9c80617csm2666690pfr.214.2023.05.15.07.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:31:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 8/9] drm/fdinfo: Add comm/cmdline override fields
Date: Mon, 15 May 2023 07:30:15 -0700
Message-Id: <20230515143023.801167-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515143023.801167-1-robdclark@gmail.com>
References: <20230515143023.801167-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

These are useful in particular for VM scenarios where the process which
has opened to drm device file is just a proxy for the real user in a VM
guest.

v2: doc cleanups

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/gpu/drm-usage-stats.rst | 10 ++++++++++
 drivers/gpu/drm/drm_file.c            | 15 +++++++++++++++
 include/drm/drm_file.h                | 19 +++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index fe35a291ff3e..03bd92b9125a 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -66,20 +66,30 @@ question.
 Unique value relating to the open DRM file descriptor used to distinguish
 duplicated and shared file descriptors. Conceptually the value should map 1:1
 to the in kernel representation of `struct drm_file` instances.
 
 Uniqueness of the value shall be either globally unique, or unique within the
 scope of each device, in which case `drm-pdev` shall be present as well.
 
 Userspace should make sure to not double account any usage statistics by using
 the above described criteria in order to associate data to individual clients.
 
+- drm-comm-override: <valstr>
+- drm-cmdline-override: <valstr>
+
+Returns the client comm (executable) or cmdline override strings.  Some drivers
+support letting userspace override this in cases where the userspace is simply a
+"proxy".  Such as is the case with virglrenderer drm native context, where the
+host process is just forwarding command submission, etc, from guest userspace.
+This allows the proxy to make visible the cmdline of the actual app in the VM
+guest.
+
 Utilization
 ^^^^^^^^^^^
 
 - drm-engine-<keystr>: <uint> ns
 
 GPUs usually contain multiple execution engines. Each shall be given a stable
 and unique name (keystr), with possible values documented in the driver specific
 documentation.
 
 Value shall be in specified time units which the respective GPU engine spent
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 739d9b7ab9ec..a0684c4a021d 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -171,20 +171,22 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	mutex_init(&file->fbs_lock);
 	INIT_LIST_HEAD(&file->blobs);
 	INIT_LIST_HEAD(&file->pending_event_list);
 	INIT_LIST_HEAD(&file->event_list);
 	init_waitqueue_head(&file->event_wait);
 	file->event_space = 4096; /* set aside 4k for event buffer */
 
 	spin_lock_init(&file->master_lookup_lock);
 	mutex_init(&file->event_read_lock);
 
+	mutex_init(&file->override_lock);
+
 	if (drm_core_check_feature(dev, DRIVER_GEM))
 		drm_gem_open(dev, file);
 
 	if (drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		drm_syncobj_open(file);
 
 	drm_prime_init_file_private(&file->prime);
 
 	if (dev->driver->open) {
 		ret = dev->driver->open(dev, file);
@@ -285,20 +287,22 @@ void drm_file_free(struct drm_file *file)
 		drm_master_release(file);
 
 	if (dev->driver->postclose)
 		dev->driver->postclose(dev, file);
 
 	drm_prime_destroy_file_private(&file->prime);
 
 	WARN_ON(!list_empty(&file->event_list));
 
 	put_pid(file->pid);
+	kfree(file->override_comm);
+	kfree(file->override_cmdline);
 	kfree(file);
 }
 
 static void drm_close_helper(struct file *filp)
 {
 	struct drm_file *file_priv = filp->private_data;
 	struct drm_device *dev = file_priv->minor->dev;
 
 	mutex_lock(&dev->filelist_mutex);
 	list_del(&file_priv->lhead);
@@ -988,20 +992,31 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 	drm_printf(&p, "drm-client-id:\t%llu\n", file->client_id);
 
 	if (dev_is_pci(dev->dev)) {
 		struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 		drm_printf(&p, "drm-pdev:\t%04x:%02x:%02x.%d\n",
 			   pci_domain_nr(pdev->bus), pdev->bus->number,
 			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
 	}
 
+	mutex_lock(&file->override_lock);
+	if (file->override_comm) {
+		drm_printf(&p, "drm-comm-override:\t%s\n",
+			   file->override_comm);
+	}
+	if (file->override_cmdline) {
+		drm_printf(&p, "drm-cmdline-override:\t%s\n",
+			   file->override_cmdline);
+	}
+	mutex_unlock(&file->override_lock);
+
 	if (dev->driver->show_fdinfo)
 		dev->driver->show_fdinfo(&p, file);
 }
 EXPORT_SYMBOL(drm_show_fdinfo);
 
 /**
  * mock_drm_getfile - Create a new struct file for the drm device
  * @minor: drm minor to wrap (e.g. #drm_device.primary)
  * @flags: file creation mode (O_RDWR etc)
  *
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 5f5c156903d2..25384edd1e91 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -363,20 +363,39 @@ struct drm_file {
 	/** @event_read_lock: Serializes drm_read(). */
 	struct mutex event_read_lock;
 
 	/**
 	 * @prime:
 	 *
 	 * Per-file buffer caches used by the PRIME buffer sharing code.
 	 */
 	struct drm_prime_file_private prime;
 
+	/**
+	 * @comm: Overridden task comm
+	 *
+	 * Accessed under override_lock
+	 */
+	char *override_comm;
+
+	/**
+	 * @cmdline: Overridden task cmdline
+	 *
+	 * Accessed under override_lock
+	 */
+	char *override_cmdline;
+
+	/**
+	 * @override_lock: Serialize access to override_comm and override_cmdline
+	 */
+	struct mutex override_lock;
+
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 	unsigned long lock_count; /* DRI1 legacy lock count */
 #endif
 };
 
 /**
  * drm_is_primary_client - is this an open file of the primary node
  * @file_priv: DRM file
  *
-- 
2.40.1

