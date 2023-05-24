Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6CE70FB1F
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 18:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E765110E4C7;
	Wed, 24 May 2023 16:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37FB10E4BD;
 Wed, 24 May 2023 16:00:15 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-51b0f9d7d70so438110a12.1; 
 Wed, 24 May 2023 09:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684944015; x=1687536015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/m5y9DMBAGNOMht9FaF2vJN36JyHjRD9qCEwtOdPVI=;
 b=L8hNGSICE/y/nRGAQSHMJZxKPdKQY4FYCJuUBDFNI+lBh9XwgJXWj1MTK261vpT2/K
 jtkGpVeK2J8cN8NpfKHIcmaDuURs1mPLgUztOiDhp3ShT4g23biQjG6LVnCoh4Y5ufug
 5g4/r35PXOttozl/FpTusNYuR9X/LmpiRX/z4tKuF9Uk2DHKZtJg2MPwo11nr1ErQFOn
 aCk7xWcaFff7yKrZY9K5IsPYZLoucw2Gd8pGycY8/c/T7fuBdkImH58/PuVAJBNEL6Qg
 6eUMjLayFAICkxsxSWnQul10VkazeTO9UIrOzZLqRN83OYlB2OUAjjVwThbgv5ghAi8H
 q0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684944015; x=1687536015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7/m5y9DMBAGNOMht9FaF2vJN36JyHjRD9qCEwtOdPVI=;
 b=S9oHQaEEfzDY5DJgSVQmDybHpAymq0Mko4PMgjyB1ng768KlNcPnQiBD5bQrQ79gRA
 h6wQSBAV4kFzn+BjTP3yhAFT2YECJ8+2edd4X/Bjk/gNCYHpXQfeyhas7giqEkNIDnKO
 KXRsoZ9wlkLCXv/cd4gKhE+zgmerB30y+BX9bwQHbQRjHlmiLo+B6Kt9lrVb7GPje8gz
 S0zHBEyQ/TvRb0UKKMXfoWDzl7i282zOQHg8G8fgRpC5DxNfmlm8yGA/sKxryfD4PAKp
 ECLKR2qlVx+LgcjywdjtfkrrCG23dbyZ+O0ss8EPdHoMreA/VHqPFaAkz02QHdIVQRnN
 moRQ==
X-Gm-Message-State: AC+VfDyLCBuS8AwXS1l0F/7jgJZYrpVTd1nx859Upwqf7fODCJhX7eQu
 PXZ2jGc8OP/FKtnWEg8esiFkI8OcZpc=
X-Google-Smtp-Source: ACHHUZ5YU5N8QTK4ZBBBpjdCK9cdIFp3zFxCoHqfb2M0Eo2l5hXrUlfHUARcaMsKKWFPJi/3lOzliw==
X-Received: by 2002:a17:902:f681:b0:1af:e295:ad68 with SMTP id
 l1-20020a170902f68100b001afe295ad68mr2278321plg.30.1684944014575; 
 Wed, 24 May 2023 09:00:14 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a1709028c9600b001afebec96basm264091plo.148.2023.05.24.09.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 09:00:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/7] drm: Add common fdinfo helper
Date: Wed, 24 May 2023 08:59:32 -0700
Message-Id: <20230524155956.382440-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524155956.382440-1-robdclark@gmail.com>
References: <20230524155956.382440-1-robdclark@gmail.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Handle a bit of the boiler-plate in a single case, and make it easier to
add some core tracked stats.  This also ensures consistent behavior
across drivers for standardised fields.

v2: Update drm-usage-stats.rst, 64b client-id, rename drm_show_fdinfo
v3: Rebase on drm-misc-next

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Dave Airlie <airlied@redhat.com>
---
 Documentation/gpu/drm-usage-stats.rst | 10 +++++++-
 drivers/gpu/drm/drm_file.c            | 35 +++++++++++++++++++++++++++
 include/drm/drm_drv.h                 |  7 ++++++
 include/drm/drm_file.h                |  4 +++
 4 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 72d069e5dacb..552195fb1ea3 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -119,14 +119,22 @@ value until a monotonic update is seen.
 
 - drm-maxfreq-<str>: <uint> [Hz|MHz|KHz]
 
 Engine identifier string must be the same as the one specified in the
 drm-engine-<str> tag and shall contain the maximum frequency for the given
 engine.  Taken together with drm-cycles-<str>, this can be used to calculate
 percentage utilization of the engine, whereas drm-engine-<str> only reflects
 time active without considering what frequency the engine is operating as a
 percentage of it's maximum frequency.
 
+Implementation Details
+======================
+
+Drivers should use drm_show_fdinfo() in their `struct file_operations`, and
+implement &drm_driver.show_fdinfo if they wish to provide any stats which
+are not provided by drm_show_fdinfo().  But even driver specific stats should
+be documented above and where possible, aligned with other drivers.
+
 Driver specific implementations
-===============================
+-------------------------------
 
 :ref:`i915-usage-stats`
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index c1018c470047..37b4f76a5191 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -141,28 +141,31 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
  *
  * This allocates a new DRM file context. It is not linked into any context and
  * can be used by the caller freely. Note that the context keeps a pointer to
  * @minor, so it must be freed before @minor is.
  *
  * RETURNS:
  * Pointer to newly allocated context, ERR_PTR on failure.
  */
 struct drm_file *drm_file_alloc(struct drm_minor *minor)
 {
+	static atomic64_t ident = ATOMIC_INIT(0);
 	struct drm_device *dev = minor->dev;
 	struct drm_file *file;
 	int ret;
 
 	file = kzalloc(sizeof(*file), GFP_KERNEL);
 	if (!file)
 		return ERR_PTR(-ENOMEM);
 
+	/* Get a unique identifier for fdinfo: */
+	file->client_id = atomic64_inc_return(&ident);
 	file->pid = get_pid(task_tgid(current));
 	file->minor = minor;
 
 	/* for compatibility root is always authenticated */
 	file->authenticated = capable(CAP_SYS_ADMIN);
 
 	INIT_LIST_HEAD(&file->lhead);
 	INIT_LIST_HEAD(&file->fbs);
 	mutex_init(&file->fbs_lock);
 	INIT_LIST_HEAD(&file->blobs);
@@ -861,20 +864,52 @@ EXPORT_SYMBOL(drm_send_event_locked);
 void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 {
 	unsigned long irqflags;
 
 	spin_lock_irqsave(&dev->event_lock, irqflags);
 	drm_send_event_helper(dev, e, 0);
 	spin_unlock_irqrestore(&dev->event_lock, irqflags);
 }
 EXPORT_SYMBOL(drm_send_event);
 
+/**
+ * drm_show_fdinfo - helper for drm file fops
+ * @seq_file: output stream
+ * @f: the device file instance
+ *
+ * Helper to implement fdinfo, for userspace to query usage stats, etc, of a
+ * process using the GPU.  See also &drm_driver.show_fdinfo.
+ *
+ * For text output format description please see Documentation/gpu/drm-usage-stats.rst
+ */
+void drm_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct drm_file *file = f->private_data;
+	struct drm_device *dev = file->minor->dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
+	drm_printf(&p, "drm-client-id:\t%llu\n", file->client_id);
+
+	if (dev_is_pci(dev->dev)) {
+		struct pci_dev *pdev = to_pci_dev(dev->dev);
+
+		drm_printf(&p, "drm-pdev:\t%04x:%02x:%02x.%d\n",
+			   pci_domain_nr(pdev->bus), pdev->bus->number,
+			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+	}
+
+	if (dev->driver->show_fdinfo)
+		dev->driver->show_fdinfo(&p, file);
+}
+EXPORT_SYMBOL(drm_show_fdinfo);
+
 /**
  * mock_drm_getfile - Create a new struct file for the drm device
  * @minor: drm minor to wrap (e.g. #drm_device.primary)
  * @flags: file creation mode (O_RDWR etc)
  *
  * This create a new struct file that wraps a DRM file context around a
  * DRM minor. This mimicks userspace opening e.g. /dev/dri/card0, but without
  * invoking userspace. The struct file may be operated on using its f_op
  * (the drm_device.driver.fops) to mimick userspace operations, or be supplied
  * to userspace facing functions as an internal/anonymous client.
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index b419c59c4bef..89e2706cac56 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -394,20 +394,27 @@ struct drm_driver {
 	 * Called by the user via ioctl.
 	 *
 	 * Returns:
 	 *
 	 * Zero on success, negative errno on failure.
 	 */
 	int (*dumb_map_offset)(struct drm_file *file_priv,
 			       struct drm_device *dev, uint32_t handle,
 			       uint64_t *offset);
 
+	/**
+	 * @show_fdinfo:
+	 *
+	 * Print device specific fdinfo.  See Documentation/gpu/drm-usage-stats.rst.
+	 */
+	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
+
 	/** @major: driver major number */
 	int major;
 	/** @minor: driver minor number */
 	int minor;
 	/** @patchlevel: driver patch level */
 	int patchlevel;
 	/** @name: driver name */
 	char *name;
 	/** @desc: driver description */
 	char *desc;
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index ecffe24e2b1b..7d9b3c65cbc1 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -251,20 +251,23 @@ struct drm_file {
 	 * primary nodes and authentication <drm_primary_node>`.
 	 */
 	struct drm_master *master;
 
 	/** @master_lookup_lock: Serializes @master. */
 	spinlock_t master_lookup_lock;
 
 	/** @pid: Process that opened this file. */
 	struct pid *pid;
 
+	/** @client_id: A unique id for fdinfo */
+	u64 client_id;
+
 	/** @magic: Authentication magic, see @authenticated. */
 	drm_magic_t magic;
 
 	/**
 	 * @lhead:
 	 *
 	 * List of all open files of a DRM device, linked into
 	 * &drm_device.filelist. Protected by &drm_device.filelist_mutex.
 	 */
 	struct list_head lhead;
@@ -431,14 +434,15 @@ int drm_event_reserve_init(struct drm_device *dev,
 			   struct drm_file *file_priv,
 			   struct drm_pending_event *p,
 			   struct drm_event *e);
 void drm_event_cancel_free(struct drm_device *dev,
 			   struct drm_pending_event *p);
 void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e);
 void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
 void drm_send_event_timestamp_locked(struct drm_device *dev,
 				     struct drm_pending_event *e,
 				     ktime_t timestamp);
+void drm_show_fdinfo(struct seq_file *m, struct file *f);
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 
 #endif /* _DRM_FILE_H_ */
-- 
2.40.1

