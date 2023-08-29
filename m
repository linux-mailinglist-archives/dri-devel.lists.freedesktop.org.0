Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC4978C2E2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0889310E20E;
	Tue, 29 Aug 2023 11:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0732E10E201
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:01:19 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9a5be3166a2so200021666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 04:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693306878; x=1693911678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=D2eRnoFZrUjASmOPG7eOs34IpVUTa8NA0xCYsyaGhog=;
 b=jPfJlTWJs9t2BSNDoY8NwY2CSvjxggDwJCMGZDomHVdC2tE8TfD1ZApA1jTtErIZXb
 F2+TLt0n52jvlzXsN48NznpfqfUbsbkfYH43brIIE2NQhEFgoXYgOy7LdH59GA7R8bNj
 tGxBTkiz5SABMiUWuNi6PKaJnXbyEDiZhxAHIO9PcRXcwEJb48myNpqOb9ZeSz94uaFg
 j9OuGFNf61GGMPujQKOnhAwL6d0PZ/ZlSjHEL2dtjp9Uh0DEQg5uEf44eSNzeiiVAUH4
 2Kl/eXMe74lWI6bL9UKeVLQob4TInR8z+U1KCWgoux4agtq7WGndwZryt/6jZ9cyh7DD
 IjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693306878; x=1693911678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D2eRnoFZrUjASmOPG7eOs34IpVUTa8NA0xCYsyaGhog=;
 b=Bn3k4/ZKvMLjaWTXCrSPSSuUEpBhSV3WF3Kt2PNkXEQ7SwNQFMeRiKgB6HTB+TSCrK
 hBYXX9+v1rkxIZ7ezdFmqVqy+ZQ7wFvgm/4pQKF2XRMkQr/gYGYS38g4yylOqzuZEN3i
 3xFUt0FfasekRJ3TLHEyI7hyH55LjfN+LAky2eX3CPZxv4WDwIbg86mUIVBsEKuL7w2W
 DQvkMLGnoFvp+OC4MP2dNRrIxRzsG2ILDuCX3R8mR8hZ1MvtSbjsTEhvjJME+I2ldQET
 GlOJXt6HbKrDHwyaKjwdo1/j1FA479azbTkjo3QxdijQDZ0A9s9zbD8PBaWENaz0onew
 rYzg==
X-Gm-Message-State: AOJu0Yw+abauduCc8fyySCSx+q2CcmWDlJaNg0bQJGXGPwkfJSqBNR42
 6s9deUD9Ob0CBgcv2OrzWo0=
X-Google-Smtp-Source: AGHT+IE7y1zGvm4etr5CvIZGfe3h8kp7DY7WBb5WivqpuFR1xl4HyEtpig2BtUKiKUShg3zZ6S6E7Q==
X-Received: by 2002:a17:907:78d1:b0:9a5:d242:d9b3 with SMTP id
 kv17-20020a17090778d100b009a5d242d9b3mr736580ejc.21.1693306878307; 
 Tue, 29 Aug 2023 04:01:18 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:158b:d500:cd84:8e32:621d:b36b])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a1709063c5b00b009928b4e3b9fsm5805885ejg.114.2023.08.29.04.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 04:01:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ogabbay@kernel.org,
	ttayar@habana.ai,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/debugfs: drop debugfs_init() for the render and accel
 node v2
Date: Tue, 29 Aug 2023 13:01:11 +0200
Message-Id: <20230829110115.3442-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829110115.3442-1-christian.koenig@amd.com>
References: <20230829110115.3442-1-christian.koenig@amd.com>
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
index 2de43ff3ce0a..d90d0827bfad 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -284,7 +284,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		drm_client_debugfs_init(minor);
 	}
 
-	if (dev->driver->debugfs_init)
+	if (dev->driver->debugfs_init && dev->render != minor)
 		dev->driver->debugfs_init(minor);
 
 	list_for_each_entry_safe(entry, tmp, &dev->debugfs_list, list) {
-- 
2.34.1

