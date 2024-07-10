Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC1992D1D3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8664610E782;
	Wed, 10 Jul 2024 12:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KU0hLPJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7700510E782
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:43:07 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-585e774fd3dso8205330a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 05:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720615386; x=1721220186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zrGWK9ix3Z5llLRfYODIcW20ljsKJIUMR1M7aT6SnbA=;
 b=KU0hLPJV4fwNqxa6QkE9k1Ct+Ij7Mscg1r4ZuVOO0HJGoZwkRKUKslT2aXmw2LmOEV
 FijbsrDu8JVA6zI0Vg8iCK9J0jd0Zxt9e/IvZ4kMio/E3APSp/FvhxhxocnPVXdsSDwk
 gznGWSj2pLFuyDHf++I80gfN+9ri3uuZhHbeWmAjI6xQa+jAscA/ceIG5hWvHWRCOvGQ
 XM1yB1MC6cxyzeSkuCDs/PZuoiXSKJK0guEv8J36gQ6nqq8JXs9q4N09YI9v7+F0u7qy
 6uVtITJNFnzuu9SctHI9ljiHooi9IOC+d3lUPNuDRHRvcOMVsJu1MJse18ek1RRtK8T0
 PrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720615386; x=1721220186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zrGWK9ix3Z5llLRfYODIcW20ljsKJIUMR1M7aT6SnbA=;
 b=i53SyUrYorkezmOcOkoJomeAVMijtFjwm4+no7AyrlpZ92IPuVSEhsInOXKRMYgryj
 8X1nvmCa+SSx7zjnf1eI0PfHMMUF4+EGnMZTzWleQ+9e7tyU/nmdXrPGEl6X2YZJymHW
 wxB2HAhxWDlZ0Pq/TvIzhMxb3ms0r2KKCXePClqicMyMRbshFZfb1WpiguuM/MYJP2kB
 hFry80hg69BD05T4RtMKFTIlEGblz39GJ7eyUL1Ljt6/n24CR5B5O8x00Ha2M7U34Wr1
 KXsrCqIzjWHnhCXkxCH6E69MoQ8Vj0+g60ja9nzEGkeSgkmmgf7YABVtzsoUJbNxen7z
 wEqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtKJh5/tKtJA9zus+cympdszTjhtbMzrq8+Z5m5xXzcwNz4tEVbgtXCl73qI1mspV9ViZ1/JXglHDWP3BuEtBwPgWRZOpkflEdE3IEINVb
X-Gm-Message-State: AOJu0YxDURSQmQ1ag2eiVyqGg1fJ4Ae3jvFamxuu2T3C8hX0WWQbaMLy
 KNcrXjqMLaz7vFw40/ZpQnUJfvmqSZLvaBN9lbL99KTp4+JsScrM
X-Google-Smtp-Source: AGHT+IH8XhK8C4D8UNL2dRYDg6OeHix/CwPk0Qzd2XGs8ECRNe09UZ5Xr7l6DMxHl8gdoWDktBhaYw==
X-Received: by 2002:a05:6402:1742:b0:57c:9ccd:c626 with SMTP id
 4fb4d7f45d1cf-594bcab136cmr3329639a12.39.1720615385601; 
 Wed, 10 Jul 2024 05:43:05 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1504:6f00:b310:1e44:6e5e:7646])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm2171868a12.15.2024.07.10.05.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 05:43:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/exec: don't immediately add the prelocked obj
Date: Wed, 10 Jul 2024 14:42:56 +0200
Message-Id: <20240710124301.1628-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710124301.1628-1-christian.koenig@amd.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
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

Some contended objects might never be locked again in the case of eviction
handling for example.

Make sure that those doesn't show up in the list of locked objects until
they are explicitely mentioned.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_exec.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 2da094bdf8a4..220df336fbd9 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -61,8 +61,11 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
 		drm_gem_object_put(obj);
 	}
 
-	drm_gem_object_put(exec->prelocked);
-	exec->prelocked = NULL;
+	if (exec->prelocked) {
+		dma_resv_unlock(exec->prelocked->resv);
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+	}
 }
 
 /**
@@ -179,16 +182,9 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
 		dma_resv_lock_slow(obj->resv, &exec->ticket);
 	}
 
-	ret = drm_exec_obj_locked(exec, obj);
-	if (unlikely(ret))
-		goto error_unlock;
-
 	exec->prelocked = obj;
 	return 0;
 
-error_unlock:
-	dma_resv_unlock(obj->resv);
-
 error_dropref:
 	drm_gem_object_put(obj);
 	return ret;
@@ -214,6 +210,10 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 		return ret;
 
 	if (exec->prelocked == obj) {
+		ret = drm_exec_obj_locked(exec, obj);
+		if (unlikely(ret))
+			return ret;
+
 		drm_gem_object_put(exec->prelocked);
 		exec->prelocked = NULL;
 		return 0;
-- 
2.34.1

