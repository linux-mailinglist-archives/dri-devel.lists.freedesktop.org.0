Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529A91D2F0
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 19:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5CF10E156;
	Sun, 30 Jun 2024 17:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a0KV6aRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651F810E0C5;
 Sun, 30 Jun 2024 17:00:35 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-79c072af217so182184485a.0; 
 Sun, 30 Jun 2024 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719766834; x=1720371634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aOAqEF8HBq/c8/HLVMEZy1JjMjgUXa4TTTkMry5URs4=;
 b=a0KV6aRIPc+E65X3yCRL42MD72rlCMFTg/WD0q+/RAzg0IebdSh3jxfH5Jo48ru3p2
 J+MxZyMWJX1JYeYtNRwDnLUpBfflC6MnsJPuqKEa61rjIBX/3LdIBIshIePv64LwUcic
 GHJasnZQ8EVcl0vEDnll9owuVxTE2lThvp/lBBDt4Q/MFcWKxYMWKfqJoFtncUGhDUKi
 6Wrd64+QCiY15T2FDzE3qKAQ/g9opek7iDP92dN1vQAUB6nwCBX3ZQlRrCdVlb3T7NGE
 Ci6ECxCVPjRJIzazM3e17yIdWS7I2P+wwKf7KtrnCy8yMMTlKtT+VJAlN0dP2vJhjrKS
 vQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719766834; x=1720371634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aOAqEF8HBq/c8/HLVMEZy1JjMjgUXa4TTTkMry5URs4=;
 b=YFA6xlatjHJncBe6W6Aa1Z+hz5DaDluvCROrcgivqRvuSHsHjO2WMDbVq2uU9+umgj
 plxlnHHn4Rd4eYk5YjmgyR8yocGLaWcU17qOqaQW7sI4xyKca3xqpNYJvIeuEXlz1roi
 5wf2KHsxDhWiYovqE+vLbN9kj54l7G2jDEctw+oxNnklREGiLMNE8r4DlopfoexGTJXj
 9MBd7n9KtIAdWc1T57NwKieHuIRzl16QWpopC+YTn2baNqYbDeM1qAd1zdImW0110bJl
 B30JaKAQHSXZfQZ7GXzVH63wuAupHY4T831kBXmKNryfxwpon6u+5Kz2jKnOJVw0MkBG
 XKzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBa/5m3KFwofgGRLtN7n2+xCnCF1Xm4TJXQpbtHpbPvdLvNAUccENJ9l5LnE4C2fsrzgJjLPek2bDNfPCpkyKnJMRLuUNEkHziRr/Pz6LGPOzhqTmT/vNeKMopEk5gURamVxr0nbp7mhHs3ZS7RQ==
X-Gm-Message-State: AOJu0Yz0m2h05iJPLbsb0r980Hkf1Ns0v3EgCqMCslVeOxISZG75LOup
 5PEJvtyi3RH0GsIx78QDw7N6PCrn5173wC+SzmcJaK9He8uzFNeB
X-Google-Smtp-Source: AGHT+IHk5xMH+iHy4kgznjXyO/Fbae7oHqigKr2e4C+Oquw5T9HXa7nj+zH8AokmUX3S0CDkJ/rPMw==
X-Received: by 2002:a05:620a:1098:b0:79d:561c:bba1 with SMTP id
 af79cd13be357-79d7b9d68b8mr412701885a.25.1719766834330; 
 Sun, 30 Jun 2024 10:00:34 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d69295f5esm263431785a.56.2024.06.30.10.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jun 2024 10:00:34 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] drm/radeon: change variable name "dev" to "ddev" for
 consistency
Date: Sun, 30 Jun 2024 12:59:17 -0400
Message-ID: <20240630165949.117634-2-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240630165949.117634-1-wuhoipok@gmail.com>
References: <20240630165949.117634-1-wuhoipok@gmail.com>
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

In the probe function of amdgpu, it uses "ddev" as the name of "struct drm_device *",
so I suggest renaming it to be consistent.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 7bf08164140e..739bb1da9dcc 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -259,7 +259,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
 {
 	unsigned long flags = 0;
-	struct drm_device *dev;
+	struct drm_device *ddev;
 	int ret;
 
 	if (!ent)
@@ -300,28 +300,28 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&kms_driver, &pdev->dev);
-	if (IS_ERR(dev))
-		return PTR_ERR(dev);
+	ddev = drm_dev_alloc(&kms_driver, &pdev->dev);
+	if (IS_ERR(ddev))
+		return PTR_ERR(ddev);
 
 	ret = pci_enable_device(pdev);
 	if (ret)
 		goto err_free;
 
-	pci_set_drvdata(pdev, dev);
+	pci_set_drvdata(pdev, ddev);
 
-	ret = drm_dev_register(dev, ent->driver_data);
+	ret = drm_dev_register(ddev, ent->driver_data);
 	if (ret)
 		goto err_agp;
 
-	radeon_fbdev_setup(dev->dev_private);
+	radeon_fbdev_setup(ddev->dev_private);
 
 	return 0;
 
 err_agp:
 	pci_disable_device(pdev);
 err_free:
-	drm_dev_put(dev);
+	drm_dev_put(ddev);
 	return ret;
 }
 
-- 
2.45.2

