Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2A66ECC02
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 14:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F66510E4D9;
	Mon, 24 Apr 2023 12:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B1E10E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 12:30:32 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-959a626b622so145385166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682339430; x=1684931430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zQmjReLMkxtS3Ylf9Gai6KIzJluY9/zyQyab67UImSw=;
 b=RvL4Wg7DTMmhUx+Ixuj6uUuOvRuSlXaAetqVK0NYggnzCU6ishQuvPfI/1mWi0NuEf
 +DHkenLS0Ag+kq4tesHSCeq+wduu6xsRbx9ZCW1f9CLTEwG7+cU9pCC6j0bqbGSaCK17
 1xkKPwFLLWqwpeAmy86FxZZ7NTkLI7J7ovGxWGYPxN0Kb7ynK9NZCwBwJWyaSyykkUNt
 flGuaKyJAC+xbzT0xN8CdrfLSnpaOvazlstw6gwaUEkCZT0pyjDV907gmB+235Xj4OZP
 47jC8vyc9HkMMFZCFhPG2M+2IUfEv3fbry1+67QOWFfFfqWX7uklcrkC2JYij+8or9c1
 rAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682339430; x=1684931430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQmjReLMkxtS3Ylf9Gai6KIzJluY9/zyQyab67UImSw=;
 b=E6KE/3NQN8rT5NOTzAD3qdeNUpphs2/fDukdVtXty1cf1UajW0TGCdhHU3XskEeb6C
 rcaJ5VtNUxKVKiUcQOPZdC/uyM4FxPGPJytEiVl5r/vbWeoPTE2ZGQUQM+5HB0T4VxNx
 2NDbMpm/Tb5yk3Fwb7qetwraW1JEyq2+Cd30qlpt69J/aUNIwTvktOtCCD3I+wr7QjEe
 qYLFahDHZwRdNnQJxhv16QNWHZEo/X5dvC52wY/lSDBF2aZHsD8RQjVEbzypjiqaYbak
 V+mbBrjuJY/Dszjz6GB2b3AhgdIIOqcTvqgdwy4+JtRVXKYLj5JVa0ndw2ViR6owIgiN
 rL8Q==
X-Gm-Message-State: AAQBX9cFkUrr0CUHFf2+dnj6crk1H9RAyxveZVvO8ZTNnDjA8iBkds+s
 PmQSRUpEnPN7w/XQtdWUjhISYKnUvlb0zw==
X-Google-Smtp-Source: AKy350asOvRRpjEPfAgWDVNGbm71Rs/paoYPnEm5MbgIhCgjG/J+yYx8xHEg+hfAqtECCvHfLpO5WA==
X-Received: by 2002:a17:906:14e:b0:94f:8605:3f31 with SMTP id
 14-20020a170906014e00b0094f86053f31mr10376608ejh.42.1682339430347; 
 Mon, 24 Apr 2023 05:30:30 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 wv14-20020a170907080e00b009598cbe55c2sm1608146ejb.28.2023.04.24.05.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 05:30:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/debugfs: drop debugfs_init() for the render and accel
 node v2
Date: Mon, 24 Apr 2023 14:30:24 +0200
Message-Id: <20230424123028.25986-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We want to remove per minor debugfs directories. Start by stopping
drivers from adding anything inside of those in the mid layer callback.

v2: drop it for the accel node as well

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/accel/drm_accel.c     | 3 ---
 drivers/gpu/drm/drm_debugfs.c | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 1b69824286fd..d473388ee807 100644
--- a/drivers/accel/drm_accel.c
+++ b/drivers/accel/drm_accel.c
@@ -99,9 +99,6 @@ void accel_debugfs_init(struct drm_minor *minor, int minor_id)
 
 	drm_debugfs_create_files(accel_debugfs_list, ACCEL_DEBUGFS_ENTRIES,
 				 minor->debugfs_root, minor);
-
-	if (dev->driver->debugfs_init)
-		dev->driver->debugfs_init(minor);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4855230ba2c6..54376e2400bb 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -242,7 +242,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		drm_client_debugfs_init(minor);
 	}
 
-	if (dev->driver->debugfs_init)
+	if (dev->driver->debugfs_init && dev->render != minor)
 		dev->driver->debugfs_init(minor);
 
 	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
-- 
2.34.1

