Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127BE91D2F3
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 19:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8676110E1A1;
	Sun, 30 Jun 2024 17:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SuiWkurF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B63810E0DA;
 Sun, 30 Jun 2024 17:00:43 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-79c06a06a8eso152978185a.0; 
 Sun, 30 Jun 2024 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719766842; x=1720371642; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8QLGAW+ynl8vrQtYcMfXzZ7X2GgW9XGKGc2Rji6SiN0=;
 b=SuiWkurFi+P2eXfT0SPNy07mGaeD0OVGbCS3o3fJtudlc6vohbyBNCs8Z+RNKDmqif
 MHJtOewvmEpRpSAYYfsNAmDnR1MEKcLCUlXc8HqkXlCfxT8es5sLkCerkCxt9VbnHSox
 tWYfR1S6wdq37Luun+uPcZoa7rFY+c3drGF9hTmRaf64PBpXnkwO+pQb5hM7bYrhIRvW
 WegenUtulrVnouByNI1wuGeaVcf7hKv+hV1U6jYLXfjhOTDltybSFUwltVBUK53fg9ne
 VhhR1vquU5m7UzeWc09M8AddA4Bk75CgI7BsXE1KgWPM3HUlfF1n9mq4kEIslq2MLLNc
 6niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719766842; x=1720371642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8QLGAW+ynl8vrQtYcMfXzZ7X2GgW9XGKGc2Rji6SiN0=;
 b=kmIfALL1POwK9eSAldIpFtxZ2uZlPFUkfgGLey21DgPB6lqAnGfloCZJe4Onod1hMz
 ip3ONV0VmyMRzQY2qgmc6vd1fEhEhLAZ/gTFGhfqsg1418W6GbZSGIsRALm0V69c2g0C
 XfVNbFk6rMVMMvq+UCVtAsBZZGg4jRrFibfAnybDC0tIl2W9nMVlmpyrc832WGefDN0m
 xqaFmvO6Ets+kExSoHMEMFZnUMbMh1x9e8rN2m0kdi2XrYyobQhrlJL6UG8ZmLCnAX1T
 0lChckyWzDcqOTyrEWZX3whR7FOiNup7UkE1KedW5ZwRUFQTV48+sFSRCrFA50rHEDCa
 Nkgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4Jfv1qD2EGC1Ys2EWsJskbgBCf0TyCBL8TJ5dWHJfF8XoHvyMqcHFGWbh/+T8aiVd6BANOoZyDuTNG5HQXDD0bZMsPlF2kIgmGuoPiEC6eDcZ+fHikqVwcF/SjMd12izF/CRmDSLmV4BJJ53+Lw==
X-Gm-Message-State: AOJu0YwPkrBNU6BOtOcOK+icqfg8Ym+u0B5N3oXGK6WYo9t+uAjr+BDQ
 rZr5b0a2mjCoHQGgrEAcjwVfUqOmn+MPhP6MsVGz6X5qg0K34PoU
X-Google-Smtp-Source: AGHT+IGtMyrH/5c1fTXATxN1H5bbXW5O5iGXqlIdcuzLUpq4fPCLGzb/lvYkgdM8YMFaKQxHlNRx5Q==
X-Received: by 2002:a05:620a:5783:b0:797:bc08:f495 with SMTP id
 af79cd13be357-79d7b9f1df1mr383929985a.38.1719766842329; 
 Sun, 30 Jun 2024 10:00:42 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d69295f5esm263431785a.56.2024.06.30.10.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jun 2024 10:00:42 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] drm/radeon: use variable flags as parameter
Date: Sun, 30 Jun 2024 12:59:19 -0400
Message-ID: <20240630165949.117634-4-wuhoipok@gmail.com>
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

To be consistent with amdgpu driver, use "flags" as the parameter because
it is already assigned as "ent->driver_data".

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 88d3de2a79f8..7b8aa8406751 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -314,7 +314,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_agp;
 
-	ret = drm_dev_register(ddev, ent->driver_data);
+	ret = drm_dev_register(ddev, flags);
 	if (ret)
 		goto err_agp;
 
-- 
2.45.2

