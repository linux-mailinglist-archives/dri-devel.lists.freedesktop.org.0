Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7201A94AF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5FA6E8B6;
	Wed, 15 Apr 2020 07:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71146E89F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h26so6469289wrb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cin7y8JjFO6r1ZoCllWHWqSygeCV/eCJV/SO2shQL08=;
 b=Yrpt7KT3XlOn68xkI/TE+y0cphOM86vu7opY+IqgQPWcGG1tSpbr1rqLYv/6Yt67Y7
 j2Dkapi5KTv4zOMMiHF0SQOTQ4rqDBypgUSQpq4DUKyoul8OALnM36J8jZnf2fDvDjSc
 yx8DdzD4VIZrn3vO7pfz9++t7KRmybfHhAy5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cin7y8JjFO6r1ZoCllWHWqSygeCV/eCJV/SO2shQL08=;
 b=LW/Yg8FHFvgmT6E6/7u4SSIHzfZJPZ7WqpgQrvL4xRk9+hdwE2//rHTqp0F5+MASPy
 afTf5UylbJcJBiROXRobcu423l0XMqIXN7BZyuifsgDrtPxzC2gnBA7CiioHjRZN6/i4
 uOK+EFN7pDOKEmpTiGQ+jyCQM09dl8ULlttDC7H/o+AW39Hoy/xC/GEORvsUy+FAiMps
 J0/lIhX8vI8woYEGEjymrCmNUuZ3dj9DhMhe0mgUJNkP9a8I8D0GOSrakGTi5pFJx1rG
 LU+AJgr9Gn65fgLU9Gjv8jUnWf/2Sd+Zzu0UGbUlM4d2SvSEeHz8NSsF51BX5gVWe5dC
 eY/A==
X-Gm-Message-State: AGi0Puar/yCmHKSzUccW0eR+CHFgIKG42TcyhMqZWQqJ+O0XN14LcrYw
 HOk5zrfYoGP90MmSMy+8nwRxLMADzlo=
X-Google-Smtp-Source: APiQypIDF57g90v8rquKVXNjR5Rx1ToXAodTD1y+mi/D9DEiYMaEDDtDxrnTEGQsrjaCUQ/uZkxVzA==
X-Received: by 2002:adf:e712:: with SMTP id c18mr16912315wrm.297.1586936474590; 
 Wed, 15 Apr 2020 00:41:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 32/59] drm/komeda: use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:40:07 +0200
Message-Id: <20200415074034.175360-33-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 James Qian Wang <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Komeda uses the component framework, which does open/close a new
devres group around all the bind callbacks. Which means we can use
devm_ functions for managing the drm_device cleanup, with leaking
stuff in case of deferred probes or other reasons to unbind
components, or the component_master.

Also note that this fixes a double-free in the probe unroll code, bot
drm_dev_put and kfree(kms) result in the kms allocation getting freed.

Aside: komeda_bind could be cleaned up a lot, devm_kfree is a bit
redundant. Plus I'm not clear on why there's suballocations for
mdrv->mdev and mdrv->kms. Plus I'm not sure the lifetimes are correct
with all that devm_kzalloc usage ... That structure layout is also the
reason why komeda still uses drm_device->dev_private and can't easily
be replaced with a proper container_of upcasting. I'm pretty sure that
there's endless amounts of hotunplug/hotremove bugs in there with all
the unprotected dereferencing of drm_device->dev_private.

Reviewed-by: James Qian Wang <james.qian.wang@arm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 16dfd5cdb66c..6b85d5f4caa8 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -261,18 +261,16 @@ static void komeda_kms_mode_config_init(struct komeda_kms_dev *kms,
 
 struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
 {
-	struct komeda_kms_dev *kms = kzalloc(sizeof(*kms), GFP_KERNEL);
+	struct komeda_kms_dev *kms;
 	struct drm_device *drm;
 	int err;
 
-	if (!kms)
-		return ERR_PTR(-ENOMEM);
+	kms = devm_drm_dev_alloc(mdev->dev, &komeda_kms_driver,
+				 struct komeda_kms_dev, base);
+	if (IS_ERR(kms))
+		return kms;
 
 	drm = &kms->base;
-	err = drm_dev_init(drm, &komeda_kms_driver, mdev->dev);
-	if (err)
-		goto free_kms;
-	drmm_add_final_kfree(drm, kms);
 
 	drm->dev_private = mdev;
 
@@ -329,9 +327,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
 	drm_mode_config_cleanup(drm);
 	komeda_kms_cleanup_private_objs(kms);
 	drm->dev_private = NULL;
-	drm_dev_put(drm);
-free_kms:
-	kfree(kms);
 	return ERR_PTR(err);
 }
 
@@ -348,5 +343,4 @@ void komeda_kms_detach(struct komeda_kms_dev *kms)
 	drm_mode_config_cleanup(drm);
 	komeda_kms_cleanup_private_objs(kms);
 	drm->dev_private = NULL;
-	drm_dev_put(drm);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
