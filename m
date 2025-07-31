Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45436B16C9F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 09:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F6C10E70F;
	Thu, 31 Jul 2025 07:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ax359iaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A2910E702;
 Thu, 31 Jul 2025 05:36:48 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso424157f8f.3; 
 Wed, 30 Jul 2025 22:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753940206; x=1754545006; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=55O+VIoR/xi+3QJpaWR1sqlb+0LX3xYA869Y7SaOfBE=;
 b=ax359iaH+nrcudz1+VH1XXD6bSLBRP8jkVZumqWjWxHc69ozBs/RTTwySgYDPW8osD
 GoVKMvFSt17TW2cwUmJ1BUJ9DkLPvvIBkH/DNxYl78tn0MeK1+59nJWUJchtnsU+NIYv
 xTtLWSDzhBqbIlLFLM0nIbOQF/XsieWF5ztWzYl1FAkAl5bnD/x0t32zvRCrvu15XBjF
 n3D7TZg+VsrMRqi9KmelL0lXm+RMhTAYCHoKSxQyNWnemP5oBdU4Mr0lC1UpAnVRbj+S
 gJ7G18t/X/9ar3i/Ssc3zUfyyOBLfiTRrmUmmLD0Qr024CbPCIP/OjQqLCmsXO8rHrZz
 fjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753940206; x=1754545006;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55O+VIoR/xi+3QJpaWR1sqlb+0LX3xYA869Y7SaOfBE=;
 b=V+9A9DEXVUz9KBHWHtGYJBramYHqkYStYeQoEOwNuBsjaQO5T3QweJ/UV3hS9fpBaS
 wjwxqPy7UgNzYOhOUMiJqqgG4UbUYwZCqzwYdtlkZQN8XbOfE5cY51hEU5RQqcDmoiAk
 0qj5ne28Uh/cOtmNNe0hM2P8fCSmE59WCHHYcRWPBimQCwkA0xKsrWdopu5hTkHjFdCn
 qp7+Mz3Ej0nFT3GszND1NpcVFkxQpw2BRCveAkQ8vzjghhwLbX9/mb8hWamhK6Wdwo0f
 hTw1dSA5EqAdv1Oaf8aN5Smwn0DQ0LUVVzgZYlNoKrfoybAPjNQw6aqSKtboBCwvFCXF
 BP8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeEt5LT0EDQ2VUw7PmzBilQeS0Nm9KA7QNC5GcYBhd9Xa7CQsAct7zgxjFj9Zbwn6K5cZcYs/FkwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yya1kiXLm7TyTuhQpZMfzyfQORx4D3aoIlbodi7P8cApAnJBxQ0
 6xOyKEI4dTmrY9HEw1WmyUbCmw4v5XMNZN97gGSFZOHDNVcr0bnY98D3
X-Gm-Gg: ASbGncvbar9Zd2m9rskBF/UmZOSrFZoUIc/kBF5E4luJ0vopg4K4bIwRQTgteaPV/Qo
 NdfQRPFwVMkn5CNdMv5EdYCKtRDn7mLlKZtwUrXS6PXhCoFD5MzN+XVbrwBaLTEbL4K4hJCOuvc
 v1kTK4u14Z6hJX1+FmiDzWbPkeMNySTSPu0+sZPDXqEkl34mJ/YGI2A+Sf+nwqotM7DPF5xuV9E
 8j5Q//pAElE8V74iqiFofORk5D8bGLqNk4ggrSyvlwJWalG8yJtHfmC8azqthbTiA1oJfkfYz+w
 RjcRpFeVRer9VKbLcQkeyspFJIOzBWGV2/IPCVNoyWwukehkopYIoAI2dmoQ0JD/eKmfcSuCpJc
 6Hv+Xx7GYiTPMkWltFX5Lz4A9ddXwGsik/DZRoCScb0kDDLKglJUAeawUhku/
X-Google-Smtp-Source: AGHT+IGzUXir19zXUYKXSGg93uN8+VK+de8qh6rGcvNpNSIf0qBeuNeoorLazodERZ0vHpkgXIleng==
X-Received: by 2002:a05:6000:2387:b0:3b7:9aff:db60 with SMTP id
 ffacd0b85a97d-3b79affdbc3mr1504704f8f.10.1753940206455; 
 Wed, 30 Jul 2025 22:36:46 -0700 (PDT)
Received: from [192.168.1.205]
 (dynamic-176-005-138-071.176.5.pool.telefonica.de. [176.5.138.71])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac093sm1149137f8f.9.2025.07.30.22.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 22:36:45 -0700 (PDT)
From: Philipp Zabel <philipp.zabel@gmail.com>
Date: Thu, 31 Jul 2025 07:36:35 +0200
Subject: [PATCH RFC 2/6] drm/amdgpu: don't wake up the GPU when opening the
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-b4-dont-wake-next-v1-2-e51bdc347fa3@gmail.com>
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
In-Reply-To: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Philipp Zabel <philipp.zabel@gmail.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Mailman-Approved-At: Thu, 31 Jul 2025 07:23:44 +0000
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

Don't wake the GPU when opening the device. Delay amdgpu_fpriv (and
with it VM) initialization until the first IOCTL that wakes the GPU
anyway, unless it is already active.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2295
Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     | 11 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c  |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     | 66 ++++++++++++++++++++---------
 5 files changed, 68 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index a1737556a77eb..e33c90c44697e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -508,6 +508,8 @@ struct amdgpu_fpriv {
 
 	/** GPU partition selection */
 	uint32_t		xcp_id;
+	struct mutex		init_lock;
+	bool			initialized;
 };
 
 int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv);
@@ -1617,6 +1619,8 @@ extern const int amdgpu_max_kms_ioctl;
 int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
 void amdgpu_driver_unload_kms(struct drm_device *dev);
 int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
+int amdgpu_driver_init_fpriv(struct drm_device *dev, struct drm_file *file_priv,
+			     struct amdgpu_fpriv *fpriv);
 void amdgpu_driver_postclose_kms(struct drm_device *dev,
 				 struct drm_file *file_priv);
 void amdgpu_driver_release_kms(struct drm_device *dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 0e6e2e2acf5b5..2b6cb3b1ca276 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1784,6 +1784,9 @@ static int amdgpu_debugfs_vm_info_show(struct seq_file *m, void *unused)
 		struct amdgpu_vm *vm = &fpriv->vm;
 		struct amdgpu_task_info *ti;
 
+		if (!fpriv->initialized)
+			continue;
+
 		ti = amdgpu_vm_get_task_info_vm(vm);
 		if (ti) {
 			seq_printf(m, "pid:%d\tProcess:%s ----------\n", ti->task.pid, ti->process_name);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 34b9d63a86227..732f398922da5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2967,6 +2967,7 @@ long amdgpu_drm_ioctl(struct file *filp,
 		      unsigned int cmd, unsigned long arg)
 {
 	struct drm_file *file_priv = filp->private_data;
+	struct amdgpu_fpriv *fpriv = file_priv->driver_priv;
 	struct drm_device *dev;
 	long ret;
 	bool wake = true;
@@ -2984,10 +2985,17 @@ long amdgpu_drm_ioctl(struct file *filp,
 		ret = pm_runtime_get_sync(dev->dev);
 		if (ret < 0)
 			goto out;
+
+		if (unlikely(!fpriv->initialized)) {
+			ret = amdgpu_driver_init_fpriv(dev, file_priv, fpriv);
+			if (ret < 0)
+				goto out_suspend;
+		}
 	}
 
 	ret = drm_ioctl(filp, cmd, arg);
 
+out_suspend:
 	if (wake)
 		pm_runtime_mark_last_busy(dev->dev);
 out:
@@ -3017,6 +3025,9 @@ static int amdgpu_flush(struct file *f, fl_owner_t id)
 	struct amdgpu_fpriv *fpriv = file_priv->driver_priv;
 	long timeout = MAX_WAIT_SCHED_ENTITY_Q_EMPTY;
 
+	if (!fpriv->initialized)
+		return 0;
+
 	timeout = amdgpu_ctx_mgr_entity_flush(&fpriv->ctx_mgr, timeout);
 	timeout = amdgpu_vm_wait_idle(&fpriv->vm, timeout);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index 91d638098889d..e13024bcd8bd1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -73,6 +73,9 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	};
 	unsigned int hw_ip, i;
 
+	if (!fpriv->initialized)
+		return;
+
 	amdgpu_vm_get_memory(vm, stats);
 	amdgpu_ctx_mgr_usage(&fpriv->ctx_mgr, usage);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 8a76960803c65..60f36e03def2a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1382,7 +1382,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 {
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_fpriv *fpriv;
-	int r, pasid;
+	int r;
 
 	/* Ensure IB tests are run on ring */
 	flush_delayed_work(&adev->delayed_init_work);
@@ -1395,16 +1395,45 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 
 	file_priv->driver_priv = NULL;
 
-	r = pm_runtime_get_sync(dev->dev);
+	fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
+	if (unlikely(!fpriv))
+		return -ENOMEM;
+
+	mutex_init(&fpriv->init_lock);
+
+	r = pm_runtime_get_if_active(dev->dev);
 	if (r < 0)
-		goto pm_put;
+		goto error_free;
 
-	fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
-	if (unlikely(!fpriv)) {
-		r = -ENOMEM;
-		goto out_suspend;
+	if (r == 1) {
+		r = amdgpu_driver_init_fpriv(dev, file_priv, fpriv);
+
+		pm_runtime_mark_last_busy(dev->dev);
+		pm_runtime_put_autosuspend(dev->dev);
+
+		if (r < 0)
+			goto error_free;
 	}
 
+	file_priv->driver_priv = fpriv;
+	return 0;
+
+error_free:
+	kfree(fpriv);
+
+	return r;
+}
+
+int amdgpu_driver_init_fpriv(struct drm_device *dev, struct drm_file *file_priv,
+			     struct amdgpu_fpriv *fpriv)
+{
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	int r, pasid;
+
+	mutex_lock(&fpriv->init_lock);
+	if (fpriv->initialized)
+		goto out_unlock;
+
 	pasid = amdgpu_pasid_alloc(16);
 	if (pasid < 0) {
 		dev_warn(adev->dev, "No more PASIDs available!");
@@ -1457,8 +1486,8 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 
 	amdgpu_ctx_mgr_init(&fpriv->ctx_mgr, adev);
 
-	file_priv->driver_priv = fpriv;
-	goto out_suspend;
+	fpriv->initialized = true;
+	goto out_unlock;
 
 error_vm:
 	amdgpu_vm_fini(adev, &fpriv->vm);
@@ -1469,13 +1498,8 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 		amdgpu_vm_set_pasid(adev, &fpriv->vm, 0);
 	}
 
-	kfree(fpriv);
-
-out_suspend:
-	pm_runtime_mark_last_busy(dev->dev);
-pm_put:
-	pm_runtime_put_autosuspend(dev->dev);
-
+out_unlock:
+	mutex_unlock(&fpriv->init_lock);
 	return r;
 }
 
@@ -1500,6 +1524,9 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 	if (!fpriv)
 		return;
 
+	if (!fpriv->initialized)
+		goto out_free;
+
 	pm_runtime_get_sync(dev->dev);
 
 	if (amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_UVD) != NULL)
@@ -1537,11 +1564,12 @@ void amdgpu_driver_postclose_kms(struct drm_device *dev,
 	idr_destroy(&fpriv->bo_list_handles);
 	mutex_destroy(&fpriv->bo_list_lock);
 
-	kfree(fpriv);
-	file_priv->driver_priv = NULL;
-
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
+
+out_free:
+	kfree(fpriv);
+	file_priv->driver_priv = NULL;
 }
 
 

-- 
2.50.1

