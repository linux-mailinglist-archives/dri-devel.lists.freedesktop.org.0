Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4DE6DE7A7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3CD10E36B;
	Tue, 11 Apr 2023 22:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9D710E00C;
 Tue, 11 Apr 2023 22:57:43 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id la3so9234959plb.11;
 Tue, 11 Apr 2023 15:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681253863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ndo7/lTZcfHCD79DpWpY2qpFEQ7Xd6kuppJxXwpF0ms=;
 b=MelNz4UYP8A57Tyb6z4hyxuO2j+c1WaLKmnMvc26DemjfOxamU6zD12VnHZGDqc3sF
 4JknlyvWJJOyzN5YxBtAvezxx7qilD7GR1KNApjm5w6EZsbjOgJGjZ/4Ba0Fzji691EF
 1Y3u1YQgRH+e7cr4XvUp3YKWJZVhGVuUBQQXdoeyZeo5IpFjDBJ5UpUSYju5WqonLxiY
 l5gtPurRXeR9im6uK0YSjH3U2DkCFTYfk6z0UQOGDdyqhHcVHMoD8oycqXJuSKE4EU6v
 lwhf+f/43tdjxsEik3bx8Ya98FAq/i5VpC6UxsGWxOykAX6edRGBz6615HG4mMwyKsoa
 4QoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681253863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ndo7/lTZcfHCD79DpWpY2qpFEQ7Xd6kuppJxXwpF0ms=;
 b=WfBEzW5MJqaH1QaTduhjMNDHzN0X/pItpi52uP5gf7ypkMTPkUoeL83LfoRuEPkHWB
 g1Zsu2+1E8RUpUowQ0fL7lCSiIgPV1LEqc+56L37zWXsoOpWMQbCeXO6zbeMRsecDE4u
 veiILloRzT4YPc1vtPmMxWdwGqXltFKW1zPcll5W174fmB3xe+1QGO9kPmkJCWPxyWOx
 ypq8qH9KL+UD4MUnVVAH7dWfmaqaJk7SmNUIhzKT6MXyMNB/jqX5XyLXLQinNKHUroVL
 KZv5rKxwXGKOJmjrWpJVRMLKNb8lcyApCEq/lue9clwKnWe+OBNg6zdJ8ANjdFus73Va
 KcaA==
X-Gm-Message-State: AAQBX9djVxnCpqbmHT58vEhjW2zPE4fp8IrKqoewsT/NWfNWpZ6o4xhM
 6h0r9nVs4fKiYZ8W2MsBgtLqdfS+5T0=
X-Google-Smtp-Source: AKy350YX8burQawQVvj0e8kKDtvhq+EucOeKpgDFXUOzjPZ8nmdMytz6DHh0nGTKQtDt5xjLGlyawA==
X-Received: by 2002:a17:902:ce89:b0:1a1:f70c:c81a with SMTP id
 f9-20020a170902ce8900b001a1f70cc81amr23063606plg.9.1681253862885; 
 Tue, 11 Apr 2023 15:57:42 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a1709027b8100b001a664e49ebasm436209pll.304.2023.04.11.15.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 15:57:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm: Add common fdinfo helper
Date: Tue, 11 Apr 2023 15:56:06 -0700
Message-Id: <20230411225725.2032862-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411225725.2032862-1-robdclark@gmail.com>
References: <20230411225725.2032862-1-robdclark@gmail.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-arm-msm@vger.kernel.org,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Handle a bit of the boiler-plate in a single case, and make it easier to
add some core tracked stats.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_file.c | 39 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_drv.h      |  7 +++++++
 include/drm/drm_file.h     |  4 ++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index a51ff8cee049..37dfaa6be560 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -148,6 +148,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
  */
 struct drm_file *drm_file_alloc(struct drm_minor *minor)
 {
+	static atomic_t ident = ATOMIC_INIT(0);
 	struct drm_device *dev = minor->dev;
 	struct drm_file *file;
 	int ret;
@@ -156,6 +157,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 	if (!file)
 		return ERR_PTR(-ENOMEM);
 
+	/* Get a unique identifier for fdinfo: */
+	file->client_id = atomic_inc_return(&ident) - 1;
 	file->pid = get_pid(task_pid(current));
 	file->minor = minor;
 
@@ -868,6 +871,42 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 }
 EXPORT_SYMBOL(drm_send_event);
 
+/**
+ * drm_fop_show_fdinfo - helper for drm file fops
+ * @seq_file: output stream
+ * @f: the device file instance
+ *
+ * Helper to implement fdinfo, for userspace to query usage stats, etc, of a
+ * process using the GPU.
+ */
+void drm_fop_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct drm_file *file = f->private_data;
+	struct drm_device *dev = file->minor->dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	/*
+	 * ******************************************************************
+	 * For text output format description please see drm-usage-stats.rst!
+	 * ******************************************************************
+	 */
+
+	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
+	drm_printf(&p, "drm-client-id:\t%u\n", file->client_id);
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
+EXPORT_SYMBOL(drm_fop_show_fdinfo);
+
 /**
  * mock_drm_getfile - Create a new struct file for the drm device
  * @minor: drm minor to wrap (e.g. #drm_device.primary)
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 5b86bb7603e7..a883c6d3bcdf 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -401,6 +401,13 @@ struct drm_driver {
 			       struct drm_device *dev, uint32_t handle,
 			       uint64_t *offset);
 
+	/**
+	 * @fdinfo:
+	 *
+	 * Print device specific fdinfo.  See drm-usage-stats.rst.
+	 */
+	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
+
 	/** @major: driver major number */
 	int major;
 	/** @minor: driver minor number */
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 0d1f853092ab..dfa995b787e1 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -258,6 +258,9 @@ struct drm_file {
 	/** @pid: Process that opened this file. */
 	struct pid *pid;
 
+	/** @client_id: A unique id for fdinfo */
+	u32 client_id;
+
 	/** @magic: Authentication magic, see @authenticated. */
 	drm_magic_t magic;
 
@@ -437,6 +440,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
 void drm_send_event_timestamp_locked(struct drm_device *dev,
 				     struct drm_pending_event *e,
 				     ktime_t timestamp);
+void drm_fop_show_fdinfo(struct seq_file *m, struct file *f);
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 
-- 
2.39.2

