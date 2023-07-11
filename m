Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B2374F10F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA53410E3A3;
	Tue, 11 Jul 2023 14:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEC210E3A3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:04:23 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9928abc11deso724026666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689084262; x=1691676262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=igxnjybBl9nRhvD39E9bq9tTp/UCx9mEEqgWgst1jfY=;
 b=Yuuk+19uhNTOL7XK+v1UqOkEzOlwusBc0HIKFzZ0Km+HrrL7jE3MV1/GwHNCvSnOet
 8yFtSKYI9LRfy2q0x5B28JRrepflY7Zvq0GWIOz/FDCQbM0TuAtwOXOsPX4NmiN/m+Zs
 IabrXgtR1UqPWGpb7KNJUUWWBW9QQdE/sMAzmHqYAGlWlVp0VdeAep1jkp4AC+CKDF7G
 4+Pkxi/xWBsosrt25nQYcJPPpJzbrY6SsHbTCha9kGetpGxPfU5e5T6yyQ8XBIJSW1Rq
 tswbH6dwzdhzOU+uEUzwuL6xsf4Yucm0PeF9afFrIPc4H/C48mqT0o+EBSLYzHK6HmFU
 trDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689084262; x=1691676262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=igxnjybBl9nRhvD39E9bq9tTp/UCx9mEEqgWgst1jfY=;
 b=aJTyHy7J8eTnbPKrGU5k5nP6qPogPbMLvXLho3zWbNo0Z5L7LNWw/lOZPC23QgvMw1
 95qvsrDpWt/3uwgrnTfTU/gw0lxIG8g//nKZWJrtwkqpe6sXm5zdoK2o3po/mDIQrkgY
 jX+SUlpXRh5bnn3U4T5jyHTG9+IFY2+ykzKdTLhbE4U0y+yjDH2HW5e269sFYbzRJ1aw
 mZhpKNiSgRnmJgnTz4YG/GJvEcw3mTB8jkKrIhqZauJ4vB3aQJypW2V+tS61Zvv0bRQm
 GRly98+B/gV/ST/agz+qvT5ghg5CUDYiN627dd4pcoZOy2ywxIoa1TQXWTC/4hPU0bNZ
 7GMw==
X-Gm-Message-State: ABy/qLaLq69cVhIq6gbAWwGRJKoPmjWUeWfaqHO+5QAafQET8tuCF7Tx
 O8inY51XIbcNA103r8VoV9Xwsweukw8=
X-Google-Smtp-Source: APBJJlGuLDME0AvXeNgZg4NtLwvHnoQzxTyFol6ViP1JWSh84R8T7MW8ccoCgLV78CP6ndzmvfotUg==
X-Received: by 2002:a17:906:aac6:b0:992:345e:8319 with SMTP id
 kt6-20020a170906aac600b00992345e8319mr13091593ejb.58.1689084261850; 
 Tue, 11 Jul 2023 07:04:21 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154b:c600:dcae:ab99:6259:7e2b])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a170906505200b00989257be620sm1199006ejk.200.2023.07.11.07.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:04:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/debugfs: drop debugfs_init() for the render and accel
 node v2
Date: Tue, 11 Jul 2023 16:04:14 +0200
Message-Id: <20230711140418.3059-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711140418.3059-1-christian.koenig@amd.com>
References: <20230711140418.3059-1-christian.koenig@amd.com>
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
Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/drm_accel.c     | 3 ---
 drivers/gpu/drm/drm_debugfs.c | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
index 4a9baf02439e..01edf2c00b5a 100644
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

