Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2D1720E8B
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 09:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576EE10E214;
	Sat,  3 Jun 2023 07:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D436110E214;
 Sat,  3 Jun 2023 07:43:53 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64d3bc0dce9so354809b3a.0; 
 Sat, 03 Jun 2023 00:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685778233; x=1688370233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AWur87b6+FWCBKqxfBacalad+HJLdADtjiXHWwWG+kk=;
 b=HdR32jWEiMDgRFNHZ4AmO+HfNOYRhIeMt1Z5uNTHesSQqHDELs6TlofSvDyhAYT35y
 JtaJAitoMYef8byzb4Q/v3Q1X37KaWjsPrprQlD57U3+I6XKSx204zCQ1EOG7U21K4fq
 fXT6MUWv5fX/6d68aknWQA62HaAXaJ7DT2OMuNznhhusSLzEaG5OodKAGVCBaeTD9In5
 UhGE6Caok7XVhyUI2FU8bRU0U+QCu7mWwwuYcu4PH+H+U4yRVxt3yqk20JfkptJRMas7
 0UZzD5imjL3NijdOtD+bWCh0OhMtk0o+uTjgUT+aeEfbUcXYkTQbxshWNa3CPUXt94Qk
 PETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685778233; x=1688370233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AWur87b6+FWCBKqxfBacalad+HJLdADtjiXHWwWG+kk=;
 b=LvHdLBSFZwVvIUDwLru0ajoyBxDcxbdED91iGcK4v97YBUZEPmAlbE8B1KyK/3l6g/
 tHUh3ggNWTGdOEgja4Mrra1r1jTAIjRm6mfhdbsIvQM/MJymD3m6w/3YrF8xEkwZsgCH
 /hf0leFOQOIM0fGrgU3/EykROLnNxG+8IAexKLjt9C5s0TR7gqipJAouYVyd6Al3OB4H
 B3zJifkT9Qqobiqfo4kpiICCpJjveTX/LJUE3+FNKynp6trveqeICPPdZacPtkBbYPxl
 hAUcokIfnk319CM8dc44+1R9nnDQgDmXtIqHINzf4hHPA8sHvqftEnvtTgFvlAAoegtg
 Ii5A==
X-Gm-Message-State: AC+VfDywvTGSshEsOdVhIG28GNBi5n4f7i6rmccdysf4khOaxNfNoQ9W
 Lgjr6IDVgw6WqaioTBV+ZSg=
X-Google-Smtp-Source: ACHHUZ7Sb3282pwyR3Z2zP7ICZ4Es7PNecGCmDTkrXI02OgZnCeM/hb458Wo12XIa+dX4RK3fGmPTQ==
X-Received: by 2002:a17:902:ecc5:b0:1ae:1364:6086 with SMTP id
 a5-20020a170902ecc500b001ae13646086mr12068845plh.2.1685778232982; 
 Sat, 03 Jun 2023 00:43:52 -0700 (PDT)
Received: from ubuntu.localdomain ([183.208.21.185])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902c10c00b001afd275e186sm2525846pli.286.2023.06.03.00.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 00:43:52 -0700 (PDT)
From: Min Li <lm0963hack@gmail.com>
To: alexander.deucher@amd.com
Subject: [PATCH v2] drm/radeon: fix race condition UAF in
 radeon_gem_set_domain_ioctl
Date: Sat,  3 Jun 2023 15:43:45 +0800
Message-Id: <20230603074345.17907-1-lm0963hack@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Userspace can race to free the gobj(robj converted from), robj should not
be accessed again after drm_gem_object_put, otherwith it will result in
use-after-free.

Signed-off-by: Min Li <lm0963hack@gmail.com>
---
Changes in v2:
- Remove unused robj, avoid compile complain

 drivers/gpu/drm/radeon/radeon_gem.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index bdc5af23f005..d3f5ddbc1704 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -459,7 +459,6 @@ int radeon_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_radeon_gem_set_domain *args = data;
 	struct drm_gem_object *gobj;
-	struct radeon_bo *robj;
 	int r;
 
 	/* for now if someone requests domain CPU -
@@ -472,13 +471,12 @@ int radeon_gem_set_domain_ioctl(struct drm_device *dev, void *data,
 		up_read(&rdev->exclusive_lock);
 		return -ENOENT;
 	}
-	robj = gem_to_radeon_bo(gobj);
 
 	r = radeon_gem_set_domain(gobj, args->read_domains, args->write_domain);
 
 	drm_gem_object_put(gobj);
 	up_read(&rdev->exclusive_lock);
-	r = radeon_gem_handle_lockup(robj->rdev, r);
+	r = radeon_gem_handle_lockup(rdev, r);
 	return r;
 }
 
-- 
2.34.1

