Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC5C1D6C74
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475A66E104;
	Sun, 17 May 2020 19:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2F96E0F9
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:39:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k13so7274242wrx.3
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nbRokrSrVR0v/K6xw2WDQQHre/7eWiBASSH5E9b9KBA=;
 b=PDtJZOJiAXIEQfW+XQacENA0ShgkfZIaBCTOFz2r0KCd0GJwXPpo75mWA/ieBFWYyg
 DuwLJV816FGu4+l4kA9BG4JEvw8y9NDmF+Ps5zzUYZ20Ex6u8NHFIUWzOe8tMsQafIZU
 Uwna8rQhsSqkn20xMGHM6t2CmAHgBlMcFd6LzE4/QhkaAGm8KQr2aU+JvVQC1qnpcPGX
 WFYrgQMo90/khUujgyqV9455XbEs4HH5AbnfrSmEyTA4Y6VBn3Qd995nkOjRY3zT8HCU
 TGOa9t8V9X5iNihsAuWtFqimlsAwcoFIu9Qs2ZGcUytqxwLHb+FYRkFjyIYqEad6wScK
 niSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbRokrSrVR0v/K6xw2WDQQHre/7eWiBASSH5E9b9KBA=;
 b=LJ1ucVckl/aS9XYPan2aRNglmcc/qbs/bdsZW3J749Y6NF3D+VR/K31zSJ5Qjy11xk
 jEnVf0KojvCj6auCA0XgyCUMRJ/RhHp9GG0NPflB7bvlKyD8POxH1uGOIHo98K0dVlgR
 UHspzXThbHC0y4tfjZE+L9e7+yRdrY1hzOi0ANFKaAM8SurgavI/yy7AryNLmaq54E+B
 a1xnk86Q5Qf/AZ23ackjAjYxFD7p5gQtu7tsVkFDLeWHvMrW5UYOEiNJqy4ywV9wEreT
 BkaA32LPpHNWx5Yq21A+387PkOnO1J8EKlRIi4HZ9CLL060pFIgrM4A4ltZ5WOMXP2OJ
 KYqw==
X-Gm-Message-State: AOAM532F9a7CeAtz9yuuZIqmjPIU6VNrpPP0KPXMc3TtUOY7yyJmLkXs
 WVmwMIdC8q3/5HLRVYda8MG26tln
X-Google-Smtp-Source: ABdhPJyVoY4/mcYkR+vMN4BsFWvE4vWtLeSWLYuByLNVIp/jv5sFfmBgCFsqEugv88/TvzdIkJl5gg==
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr16510577wrw.16.1589744386034; 
 Sun, 17 May 2020 12:39:46 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id g24sm13882339wrb.35.2020.05.17.12.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:39:45 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/exynos-vidi: convert platform driver to use dev_groups
Date: Sun, 17 May 2020 20:36:55 +0100
Message-Id: <20200517193655.3895087-3-emil.l.velikov@gmail.com>
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
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, emil.l.velikov@gmail.com,
 Joonyoung Shim <jy0922.shim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Platform drivers now have the option to have the platform core create
and remove any needed sysfs attribute files.  So take advantage of that
and do not register "by hand" a sysfs file.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Compile tested only. Please test locally and merge through your tree.
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 26 ++++++++----------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 282467121699..e5662bdcbbde 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -214,6 +214,12 @@ static ssize_t vidi_store_connection(struct device *dev,
 static DEVICE_ATTR(connection, 0644, vidi_show_connection,
 			vidi_store_connection);
 
+static struct attribute *vidi_attrs[] = {
+	&dev_attr_connection.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(vidi);
+
 int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 				struct drm_file *file_priv)
 {
@@ -439,7 +445,6 @@ static int vidi_probe(struct platform_device *pdev)
 {
 	struct vidi_context *ctx;
 	struct device *dev = &pdev->dev;
-	int ret;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -453,23 +458,7 @@ static int vidi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
-	ret = device_create_file(dev, &dev_attr_connection);
-	if (ret < 0) {
-		DRM_DEV_ERROR(dev,
-			      "failed to create connection sysfs.\n");
-		return ret;
-	}
-
-	ret = component_add(dev, &vidi_component_ops);
-	if (ret)
-		goto err_remove_file;
-
-	return ret;
-
-err_remove_file:
-	device_remove_file(dev, &dev_attr_connection);
-
-	return ret;
+	return component_add(dev, &vidi_component_ops);
 }
 
 static int vidi_remove(struct platform_device *pdev)
@@ -494,5 +483,6 @@ struct platform_driver vidi_driver = {
 	.driver		= {
 		.name	= "exynos-drm-vidi",
 		.owner	= THIS_MODULE,
+		.dev_groups = vidi_groups,
 	},
 };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
