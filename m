Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07596B6C8B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 00:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE15D10E443;
	Sun, 12 Mar 2023 23:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101D810E440;
 Sun, 12 Mar 2023 23:31:45 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y4so12475841edo.2;
 Sun, 12 Mar 2023 16:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678663903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0/tNTjxjj5Y4CDnyWnc8sLr+X7IlP2dT2pnrIFsJj4=;
 b=Q1omTo4kyCm1U6Y6EIoU6QS9Ka4/F1X6BERxWFXkhTkoTv4HqfptVZykp2rxOrwabh
 FqhHs5eBk3UI+ZdlJbUxAJ/fWDV5tJTUxnvuO8yAzPusQr6dZAqcMEp9iFAtFYg/+DzQ
 Kcp+bSuVYKhn5ym/vpDjkcuCxulmoYtp5Gp5MctBH9RgB4KzmL9CXUVu/7vppAscRChX
 Z1RPOWNkgW9TO94qilWVPEGDNqYvCwNFdPnz9gJ1xSOpSQjqEY9y1KlWa7YJrEz/k+XY
 UszavXltChrgzJiAWVewYybhxUser7zUv0O73C1iBEzFRy1dEMKYyvrPT3p73CKfOgYE
 D8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678663903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H0/tNTjxjj5Y4CDnyWnc8sLr+X7IlP2dT2pnrIFsJj4=;
 b=3kRE6RdUFsvCJeORU4xhdO1UuaYYV9IMtaWQoKK+YpZeD65WaF51G/3ajuxcOwZX+i
 6KVQtwgNWVaSPcYJJHcMJr6qmkRCn/nP6NcdDfx5fyb0EjJFOsxAVMwgahYjripCfLZv
 v+Fex3eX5jDU/xYNR/Yl8mGoftYNSzU/Ggwz2gvOjJPJZR/4QzMW8qTkTD1jkHPRH7gh
 GEbwgSSfvtcerYI0/Rzam14LsvyBLnSQRn90EQ2AogFdGwYHUwczaCFRaor1DVQ6LzAY
 pA3wUlDzBpvszTA43B+dSoyQnhtQUrW9VtGKwbMxzsMyvwBALwHlhSbNaAuMMCmjGl+k
 heXQ==
X-Gm-Message-State: AO0yUKU3mjtJLZkiOWPj0u1Y9t89SRjRdYGr6cpPuKIVjUl9Ky2sNrH1
 Q9mI6pCCmPzrke8cCOLOeG8=
X-Google-Smtp-Source: AK7set/HD1FOoDlZBN3zmKjLDLlp4nulhIfT+1b32Ihq3mvgl1O4WjG1MB6UYdpuTw76CR7Gi/jCaA==
X-Received: by 2002:aa7:cb18:0:b0:4fb:fd22:29c0 with SMTP id
 s24-20020aa7cb18000000b004fbfd2229c0mr2260760edt.26.1678663903337; 
 Sun, 12 Mar 2023 16:31:43 -0700 (PDT)
Received: from centennial.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 vv11-20020a170907a68b00b009226f644a07sm2009958ejc.139.2023.03.12.16.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 16:31:42 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/lima: allocate unique id per drm_file
Date: Mon, 13 Mar 2023 00:30:51 +0100
Message-Id: <20230312233052.21095-3-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312233052.21095-1-nunes.erico@gmail.com>
References: <20230312233052.21095-1-nunes.erico@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Erico Nunes <nunes.erico@gmail.com>,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To track if fds are pointing to the same execution context and export
the expected information to fdinfo, similar to what is done in other
drivers.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_device.h |  3 +++
 drivers/gpu/drm/lima/lima_drv.c    | 12 ++++++++++++
 drivers/gpu/drm/lima/lima_drv.h    |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_device.h b/drivers/gpu/drm/lima/lima_device.h
index 41b9d7b4bcc7..71b2db60d161 100644
--- a/drivers/gpu/drm/lima/lima_device.h
+++ b/drivers/gpu/drm/lima/lima_device.h
@@ -106,6 +106,9 @@ struct lima_device {
 	struct lima_dump_head dump;
 	struct list_head error_task_list;
 	struct mutex error_task_list_lock;
+
+	struct xarray active_contexts;
+	u32 next_context_id;
 };
 
 static inline struct lima_device *
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 7b8d7178d09a..d23c0b77a252 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -218,6 +218,11 @@ static int lima_drm_driver_open(struct drm_device *dev, struct drm_file *file)
 	if (!priv)
 		return -ENOMEM;
 
+	err = xa_alloc_cyclic(&ldev->active_contexts, &priv->id, priv,
+			      xa_limit_32b, &ldev->next_context_id, GFP_KERNEL);
+	if (err < 0)
+		goto err_out0;
+
 	priv->vm = lima_vm_create(ldev);
 	if (!priv->vm) {
 		err = -ENOMEM;
@@ -237,6 +242,9 @@ static int lima_drm_driver_open(struct drm_device *dev, struct drm_file *file)
 static void lima_drm_driver_postclose(struct drm_device *dev, struct drm_file *file)
 {
 	struct lima_drm_priv *priv = file->driver_priv;
+	struct lima_device *ldev = to_lima_dev(dev);
+
+	xa_erase(&ldev->active_contexts, priv->id);
 
 	lima_ctx_mgr_fini(&priv->ctx_mgr);
 	lima_vm_put(priv->vm);
@@ -388,6 +396,8 @@ static int lima_pdev_probe(struct platform_device *pdev)
 	ldev->dev = &pdev->dev;
 	ldev->id = (enum lima_gpu_id)of_device_get_match_data(&pdev->dev);
 
+	xa_init_flags(&ldev->active_contexts, XA_FLAGS_ALLOC);
+
 	platform_set_drvdata(pdev, ldev);
 
 	/* Allocate and initialize the DRM device. */
@@ -444,6 +454,8 @@ static int lima_pdev_remove(struct platform_device *pdev)
 	struct lima_device *ldev = platform_get_drvdata(pdev);
 	struct drm_device *ddev = ldev->ddev;
 
+	xa_destroy(&ldev->active_contexts);
+
 	sysfs_remove_bin_file(&ldev->dev->kobj, &lima_error_state_attr);
 
 	drm_dev_unregister(ddev);
diff --git a/drivers/gpu/drm/lima/lima_drv.h b/drivers/gpu/drm/lima/lima_drv.h
index c738d288547b..e49b7ab651d0 100644
--- a/drivers/gpu/drm/lima/lima_drv.h
+++ b/drivers/gpu/drm/lima/lima_drv.h
@@ -20,6 +20,7 @@ struct lima_sched_task;
 struct drm_lima_gem_submit_bo;
 
 struct lima_drm_priv {
+	int id;
 	struct lima_vm *vm;
 	struct lima_ctx_mgr ctx_mgr;
 };
-- 
2.39.2

