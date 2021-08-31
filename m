Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A55E43FC372
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 09:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848B689DDD;
	Tue, 31 Aug 2021 07:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B848889DDD;
 Tue, 31 Aug 2021 07:25:48 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id j1so11178771pjv.3;
 Tue, 31 Aug 2021 00:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FzExCBQE7rwMYVKetJ9aGi6+oVAsZBZjfgGFXxeHd5E=;
 b=LXe0f4nPVCe1oh3x5+e3cE7j/bEYgV/8zc80PbZ6LXQLG2n57Lx1fHt9akzFhqF06M
 vTvHuTvzUYHRxqmg69BlMsboB6VGAAGly8qOMokYCtmYecsc/TOUv+8JqRokhbx5GxOf
 7AygM2bgBVxhQiCJ+s58MVLwLzRG/hbTFKHxlKIBKZrVwYd8An/rad3jdSNesX1cumJH
 kim90j9snnZU2/XgbD1BGQHgdYI+34sJTM6Na8n8uyhqGf+YOlaw6x6qj5shKYDbrYDE
 /gEJcfnkwnbfBUfokZXQMndj6Ux36lZJFc0ABmo8rh6Fp59spcjw6h7Gh/LyKq5bjNxX
 cypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FzExCBQE7rwMYVKetJ9aGi6+oVAsZBZjfgGFXxeHd5E=;
 b=cjA1kRf19UTQXv/sRgJhKaGfe55YWdH0ahu9kjR/yGN3kElQRSPWeXrakKwpSR+7Iy
 X8N9Z3xxP6Vq1cV0DKQxAq3PCvnQx102k5s1HiWjYM1YVflGWRwBQZcGj7QK8Xxz++Iq
 h+j6oiQ7CMdCVLP10iYbRYla+EoQKiQO+rnMd/ie/FpZlkKnVqRStOuQc/l2yKzUHPii
 3OkpES8W4//F0Woi0gaDj19P8RuPqVbicYPVLVtrZKqcwvYwQEzBPnLDIZGgd2TjOxgL
 17sYj8/9GRuJiUk02FKF8QfUxaH3lcNS1Z6Y8G2dTYsoMAqy9rKD4qL0p5Ynw6IlRkHA
 I7Ng==
X-Gm-Message-State: AOAM533xMoASfPBLjVEo3VHQBDA/OxMGnGniqay+YxetWdkTgIR6NVbe
 2LaBnQCpq4h0/Uwh3j2li3k=
X-Google-Smtp-Source: ABdhPJysGpkZ0cAY6VQlN8tnvez7JJZxx3OJmr6/KKxgL/wi48F5mbtV0mBFI6qvB9e1Z3DLUIq34w==
X-Received: by 2002:a17:90a:e64a:: with SMTP id
 ep10mr3657825pjb.167.1630394748361; 
 Tue, 31 Aug 2021 00:25:48 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
 by smtp.gmail.com with ESMTPSA id m11sm1720724pjn.2.2021.08.31.00.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 00:25:47 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v10 3/4] drm: lock drm_global_mutex earlier in the ioctl
 handler
Date: Tue, 31 Aug 2021 15:25:00 +0800
Message-Id: <20210831072501.184211-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831072501.184211-1-desmondcheongzx@gmail.com>
References: <20210831072501.184211-1-desmondcheongzx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a future patch, a read lock on drm_device.master_rwsem is
held in the ioctl handler before the check for ioctl
permissions. However, this inverts the lock hierarchy of
drm_global_mutex --> master_rwsem.

To avoid this, we do some prep work to grab the drm_global_mutex
before checking for ioctl permissions.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_ioctl.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 9fc00e36c5d6..fe9c4c0264a9 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -767,24 +767,27 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t *func, void *kdata,
 {
 	struct drm_file *file_priv = file->private_data;
 	struct drm_device *dev = file_priv->minor->dev;
+	bool locked_ioctl;
 	int retcode;
 
 	if (drm_dev_is_unplugged(dev))
 		return -ENODEV;
 
+	/* Enforce sane locking for modern driver ioctls. */
+	locked_ioctl = (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)) &&
+			!(flags & DRM_UNLOCKED));
+	if (locked_ioctl)
+		mutex_lock(&drm_global_mutex);
+
 	retcode = drm_ioctl_permit(flags, file_priv);
 	if (unlikely(retcode))
-		return retcode;
+		goto out;
 
-	/* Enforce sane locking for modern driver ioctls. */
-	if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
-	    (flags & DRM_UNLOCKED))
-		retcode = func(dev, kdata, file_priv);
-	else {
-		mutex_lock(&drm_global_mutex);
-		retcode = func(dev, kdata, file_priv);
+	retcode = func(dev, kdata, file_priv);
+
+out:
+	if (locked_ioctl)
 		mutex_unlock(&drm_global_mutex);
-	}
 	return retcode;
 }
 EXPORT_SYMBOL(drm_ioctl_kernel);
-- 
2.25.1

