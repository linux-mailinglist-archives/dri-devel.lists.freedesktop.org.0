Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9BE57F1B5
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 23:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43F8ADF8A;
	Sat, 23 Jul 2022 21:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0E0ADF86
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jul 2022 21:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658610541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9KeV3b2L++kC1oJ9l6Py5QcKGf/q+aaG3Cox8NYOjJ4=;
 b=LILogoa5oB3YUxS7+VXV8Y6/OZMR+BOwymphCIqp8OP/eSr5F1k6cRs2oYgBGXMlKhJ60I
 914oEEzj4PtxrqPI6wTWV9yYUKDUh50TWcUqimg306VOQvF1azQ7VjOMKifVmw1Gg/BEgu
 kGBwyl5rzgvL2FHNa0V5Ys8dz6EhECQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-A8lmpO9fOM-wrRq4KqNiuQ-1; Sat, 23 Jul 2022 17:08:59 -0400
X-MC-Unique: A8lmpO9fOM-wrRq4KqNiuQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r82-20020a1c4455000000b003a300020352so4045199wma.5
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jul 2022 14:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9KeV3b2L++kC1oJ9l6Py5QcKGf/q+aaG3Cox8NYOjJ4=;
 b=Dq37NyISWmYM8WLbDRYZEbuGC/z4ErCPclr1y9WokacGQOxvNdRd5gBV2LrkgfGSjd
 6E62DduN2HVeMP/vhSY8f6EIvtVrOcu/Qn97x+EhOy6jNZVCRQRdKx/sM7hdeVaYAj+7
 hyuC/w4K7lmf6DZYttXldDBeYRyZgH2zhvVfaODfoi+pGn5/q97y6UHF6XDCWkbIyqL5
 uwVelUjmGEXO2ecxunTzkDk4bPH0kgMDFNLICZDgw7zOV06RIQT3B2biqFXefPB8DUgP
 xuQ6YFq/4Uf0/YCpdEGzAcd4eEIubGPCr/Yf4SDANyCv3Kl9mLNz555WC/1FKNiMsaa4
 iZ8g==
X-Gm-Message-State: AJIora9R5++JuGCVkaEGGEE4zkmoW/qqJl1HIgiRmQ7OeJcudkpP42fQ
 h71IusrQP40B5sdvBVLwIkLE8tc11g0PA+j/GcS0rh19v1Gh5IDMbffrvuN/EZEZ74HxP7tXv6l
 5MDZOk2DTGWjTsY31KU5gzWiT7gAH
X-Received: by 2002:adf:f90f:0:b0:21e:7e3d:6af6 with SMTP id
 b15-20020adff90f000000b0021e7e3d6af6mr1780652wrr.183.1658610537956; 
 Sat, 23 Jul 2022 14:08:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tScx1EViU35wGKRbd11AAdwaQ2ZMMsBGJoIAt1Cxrb2NeGSD2oe3BbzTHgx6jv08s5IYWO2Q==
X-Received: by 2002:adf:f90f:0:b0:21e:7e3d:6af6 with SMTP id
 b15-20020adff90f000000b0021e7e3d6af6mr1780646wrr.183.1658610537607; 
 Sat, 23 Jul 2022 14:08:57 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j14-20020adfd20e000000b0021e40019ae7sm7643643wrh.48.2022.07.23.14.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 14:08:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: Make .remove and .shutdown HW shutdown consistent
Date: Sat, 23 Jul 2022 23:08:25 +0200
Message-Id: <20220723210825.564922-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers' .remove and .shutdown callbacks are executed on different code
paths. The former is called when a device is removed from the bus, while
the latter is called at system shutdown time to quiesce the device.

This means that some overlap exists between the two, because both have to
take care of properly shutting down the hardware. But currently the logic
used in these two callbacks isn't consistent in msm drivers, which could
lead to kernel oops.

For example, on .remove the component is deleted and its .unbind callback
leads to the hardware being shutdown but only if the DRM device has been
marked as registered.

That check doesn't exist in the .shutdown logic and this can lead to the
driver calling drm_atomic_helper_shutdown() for a DRM device that hasn't
been properly initialized.

A situation when this can happen is when a driver for an expected device
fails to probe, since the .bind callback will never be executed.

This bug was attempted to be fixed in commit 623f279c7781 ("drm/msm: fix
shutdown hook in case GPU components failed to bind"), but unfortunately
it still happens in some cases.

Rather than trying to keep fixing in both places, let's unify in a single
helper function that could be used for the two callbacks.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/msm/msm_drv.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1ed4cd09dbf8..669891bd6f09 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -190,14 +190,8 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
 	return 0;
 }
 
-static int msm_drm_uninit(struct device *dev)
+static void msm_shutdown_hw(struct drm_device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_drm_private *priv = platform_get_drvdata(pdev);
-	struct drm_device *ddev = priv->dev;
-	struct msm_kms *kms = priv->kms;
-	int i;
-
 	/*
 	 * Shutdown the hw if we're far enough along where things might be on.
 	 * If we run this too early, we'll end up panicking in any variety of
@@ -205,10 +199,21 @@ static int msm_drm_uninit(struct device *dev)
 	 * msm_drm_init, drm_dev->registered is used as an indicator that the
 	 * shutdown will be successful.
 	 */
-	if (ddev->registered) {
+	if (dev->registered)
+		drm_atomic_helper_shutdown(dev);
+}
+
+static int msm_drm_uninit(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+	struct msm_kms *kms = priv->kms;
+	int i;
+
+	if (ddev->registered)
 		drm_dev_unregister(ddev);
-		drm_atomic_helper_shutdown(ddev);
-	}
+	msm_shutdown_hw(ddev);
 
 	/* We must cancel and cleanup any pending vblank enable/disable
 	 * work before msm_irq_uninstall() to avoid work re-enabling an
@@ -1242,10 +1247,8 @@ void msm_drv_shutdown(struct platform_device *pdev)
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *drm = priv ? priv->dev : NULL;
 
-	if (!priv || !priv->kms)
-		return;
-
-	drm_atomic_helper_shutdown(drm);
+	if (drm)
+		msm_shutdown_hw(drm);
 }
 
 static struct platform_driver msm_platform_driver = {
-- 
2.37.1

