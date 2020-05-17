Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4F51D6C73
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF08C6E10D;
	Sun, 17 May 2020 19:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C93A6E0EC
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:39:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so9432796wru.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=78Ql/A+/40FuhQeFxdMB/7R+c308m82Cc+zcYdE210Q=;
 b=BFxVAb0blYJqX2Isk8ugYI0/40/CgYqqtv+Ckm3wUKh7SONtgKQ8QUREztd8RerQ05
 G4faqkC7UZsZTHt/QrsQKJ6N5euwoJAkZ1vq41/dprZj8yp0kziAJCnaGUKycZJZuoYr
 DviI561ZKvxOwg8xbH5ra2c9nsuDUI59LRyQE5gun6kN/AO1JLxQDMeJRXZsTPdxC6Mq
 kYepmpqhN6oRWmc3iTT863mmPuouMH7kgfx6gPD3GfVNiWYVLSWRjLBgkM/k0f6vp336
 waNzOySNWC00308Z8LBt22FLmzN+D5ThyT2qtNiPW0yjwYOmj0ih/ceI9U2fSK2SWPE3
 SfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=78Ql/A+/40FuhQeFxdMB/7R+c308m82Cc+zcYdE210Q=;
 b=akmn01VHK9lpOOpdqMCwCKbRz2tBNWJFPtiFTDkiaXC8yvGSuNkdozy7fEQspQL9Yy
 9T5d01PyKtc/k96+Cu9nO3BQSfbrVNW0PKPZOH7SZLJDaAg9S0x5yniX00kRq3bKPrWH
 gNhLxupqNa/y9RMCQjibbOnyp+Ak1igAXoNI+ygjPaQKkXoVfJRbOBSE28T4mU0O5e98
 TUOsfduhacT7uDLoWO7du32+nXZqvpGZybNEnFS4h8EigFWCDJ3u6lGiVP87xhPVO7O9
 3WcgPDirhbLczN9hibxt21zm0jK+N8P3lb+eLSxGKEvo/dVgy+7ZGf+ELFjwdtSH2zXf
 9oOQ==
X-Gm-Message-State: AOAM531SoIr0wzvHImDd7JXWhp1kab/rtXb+kcwUHe9/KPPik08Vhe+7
 +lbRILTqdi47Kv073L8r3RaFeouB
X-Google-Smtp-Source: ABdhPJxmUWX5DHfR0h++C32HpeELiuKq8m8qiTrW75lBMadKB/BGjnk3rGRNCidnS+69LZFPMpgkDQ==
X-Received: by 2002:a5d:614b:: with SMTP id y11mr16620471wrt.77.1589744385085; 
 Sun, 17 May 2020 12:39:45 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id g24sm13882339wrb.35.2020.05.17.12.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:39:44 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/malidp: convert platform driver to use dev_groups
Date: Sun, 17 May 2020 20:36:54 +0100
Message-Id: <20200517193655.3895087-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517193655.3895087-1-emil.l.velikov@gmail.com>
References: <20200517193655.3895087-1-emil.l.velikov@gmail.com>
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
Cc: Liviu Dudau <liviu.dudau@arm.com>, emil.l.velikov@gmail.com,
 Mali DP Maintainers <malidp@foss.arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Platform drivers now have the option to have the platform core create
and remove any needed sysfs attribute files.  So take advantage of that
and do not register "by hand" a sysfs file.

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Mali DP Maintainers <malidp@foss.arm.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Compile tested only. Please test locally and merge through your tree.
---
 drivers/gpu/drm/arm/malidp_drv.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index def8c9ffafca..dafdb6e95d73 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -666,20 +666,11 @@ static ssize_t core_id_show(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(core_id);
 
-static int malidp_init_sysfs(struct device *dev)
-{
-	int ret = device_create_file(dev, &dev_attr_core_id);
-
-	if (ret)
-		DRM_ERROR("failed to create device file for core_id\n");
-
-	return ret;
-}
-
-static void malidp_fini_sysfs(struct device *dev)
-{
-	device_remove_file(dev, &dev_attr_core_id);
-}
+static struct attribute *mali_dp_attrs[] = {
+	&dev_attr_core_id.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(mali_dp);
 
 #define MAX_OUTPUT_CHANNELS	3
 
@@ -841,10 +832,6 @@ static int malidp_bind(struct device *dev)
 	if (ret < 0)
 		goto query_hw_fail;
 
-	ret = malidp_init_sysfs(dev);
-	if (ret)
-		goto init_fail;
-
 	/* Set the CRTC's port so that the encoder component can find it */
 	malidp->crtc.port = of_graph_get_port_by_id(dev->of_node, 0);
 
@@ -902,8 +889,6 @@ static int malidp_bind(struct device *dev)
 bind_fail:
 	of_node_put(malidp->crtc.port);
 	malidp->crtc.port = NULL;
-init_fail:
-	malidp_fini_sysfs(dev);
 	malidp_fini(drm);
 query_hw_fail:
 	pm_runtime_put(dev);
@@ -937,7 +922,6 @@ static void malidp_unbind(struct device *dev)
 	component_unbind_all(dev, drm);
 	of_node_put(malidp->crtc.port);
 	malidp->crtc.port = NULL;
-	malidp_fini_sysfs(dev);
 	malidp_fini(drm);
 	pm_runtime_put(dev);
 	if (pm_runtime_enabled(dev))
@@ -1033,6 +1017,7 @@ static struct platform_driver malidp_platform_driver = {
 		.name = "mali-dp",
 		.pm = &malidp_pm_ops,
 		.of_match_table	= malidp_drm_of_match,
+		.dev_groups = mali_dp_groups,
 	},
 };
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
