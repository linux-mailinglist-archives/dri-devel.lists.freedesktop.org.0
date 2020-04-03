Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C878B19D86E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9406EBF2;
	Fri,  3 Apr 2020 13:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBE76EBEA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t128so7286930wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DwjpgcarYM+8aGKrs11VTHSyWauKYAVl6l/HmjRURCU=;
 b=PKxBjCigi9+pox7dqN2YInDls7AEIfNELfg/uVGgggR9qqnA7YCeAqQ3lR8KlOzMku
 IPGGjTcyGqhwdD+pgXeTye1/8mvyuKtHOOOk/Uw8/eUrK+gHeIfvBlzx3FI8gQLdGohE
 /+tAvp1FOOGXjLmH80d8F60jiEdsc1Ch8TWIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DwjpgcarYM+8aGKrs11VTHSyWauKYAVl6l/HmjRURCU=;
 b=TI5CG5P6eLNhnQVoEDPoNkpDT5Zow4U2wQt3p9gORPGXnQoR1mO8SOn/Ar3Y5jYzdN
 4APw4ZjGN2WE7TbDflcnvhtYUphmNYAQJUXOLHLlhGOjEUM4d34sIli35ZIRBm+695qJ
 Lds+JTrLi5G22xolLN7TbruisJylJMAunYNSrCOEIM5K374/VHJDb7+p+kv5LazOTBDf
 llQvMtTJ/7W8gEIuLHclOXzgSpV7di3IfRiUwNJSsBaAI7WgERMWq2rwSGp2SgF6Paja
 i4t17cGHAuYf8UQRTz6lwhaBHk7MY9q+J5EkbQlSYsEmnDGAmg3+1WRe+7twx7MMbymC
 ANiA==
X-Gm-Message-State: AGi0PuZtDxd4zPqs2Ut8t92AMgQQgBvBbPIM6wf/csjZSPb1bHcFCLOU
 3yEOgHQhOB5CNpj84AfrfW9l16KvOkfLdQ==
X-Google-Smtp-Source: APiQypJWGcuclzb2Pq80VxKf/IGapwW7SM2Ek8a6nCiEdmZWt84diO2ec8SEgV1/wYU03TXW6OqctQ==
X-Received: by 2002:a05:600c:21cc:: with SMTP id
 x12mr9272213wmj.104.1585922355709; 
 Fri, 03 Apr 2020 06:59:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:14 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 36/44] drm/komeda: use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:20 +0200
Message-Id: <20200403135828.2542770-37-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
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
