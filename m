Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B65FEACA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6268510E390;
	Fri, 14 Oct 2022 08:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCAF10E0C7;
 Fri, 14 Oct 2022 08:46:48 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id u21so5893377edi.9;
 Fri, 14 Oct 2022 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SDd46E6BiGmJooreKj2b+XWntFRTxtYdkjPHDT9vfYk=;
 b=b/hecUmPjSmY2OOhVcYFuRex+2hJRfZgPq/2hnbJQ4M/G800Mw11FQzkj1TumGJc7e
 Tijjt3Y+8kskDyWIVE8gbzGy+zSDm313nKbLfPDINHxdcrNG7VwAl5DN176qDRUxLDd+
 XxYE7jpUJeIkd3AXavcWaUw1LqSSssyMVXNRrb1Dy4S3lvnkQbI7j6gn/HRziG7L5ZrD
 QoIGff2uqVmpZmSbqocg9HAW6T8XGzK7GZmGKlD5YF7Qs3T3TfWvPxnY53cW/k9aqCnj
 DgIc+tQsnQ7CMKV19UE741enSN8JNWdm/0fw4vQTavaEE4Q0px5vzL2D6JxkyWN9BetW
 8QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SDd46E6BiGmJooreKj2b+XWntFRTxtYdkjPHDT9vfYk=;
 b=OIpt2JWfJy6wmh//h3iHrRddlODnGxVpmAIdt9ZgMMu1cXi52pNwrY2ixnl/alP+qh
 E4l4G6dNIA7TIILkVNEyLMEdcfAm7c5q0TUJBTjkA04aN+QYLACAINZqtT6HQY9gsv2C
 bcgqBfGu9FzrbMMiUA8SND1852zInxTO87IJFrEWMedwDh/S+XdimVczu6r0EgXa9mlJ
 aHkNmqJELa9xXa9aEpiMBgb8hl0FVCSj8iAqFirAw8UmXcYU/QaWu/j1AYFjKZvxbvW6
 zse7jcwUPkmQEz9Q9Lh8rX7Hli7/rireqEEjFpeIa2y6Fndq/G6hwyXRROmjHuUXB5d5
 4Uow==
X-Gm-Message-State: ACrzQf3dEOPcgDctUQeDHd5pyyiR37OBeUJZt2UKlDomWj/k3HAX1YgI
 ZJcHuKGtJrjUIUPgetwW3fg=
X-Google-Smtp-Source: AMsMyM6mpoKDvjSAmWRlZgkIdYKetsE/HILABvs8pdi2G6u49eMEyK0eTSE18CHYXHytIYKPkXfmZA==
X-Received: by 2002:aa7:cc8a:0:b0:45b:f851:2943 with SMTP id
 p10-20020aa7cc8a000000b0045bf8512943mr3414539edt.103.1665737208147; 
 Fri, 14 Oct 2022 01:46:48 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/13] drm/amdgpu: use drm_sched_job_add_resv_dependencies for
 moves
Date: Fri, 14 Oct 2022 10:46:31 +0200
Message-Id: <20221014084641.128280-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014084641.128280-1-christian.koenig@amd.com>
References: <20221014084641.128280-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new common scheduler functions to figure out what to wait for.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 794062ab57fc..f898e870d157 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1984,17 +1984,11 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 							adev->gart.bo);
 		(*job)->vm_needs_flush = true;
 	}
-	if (resv) {
-		r = amdgpu_sync_resv(adev, &(*job)->sync, resv,
-				     AMDGPU_SYNC_ALWAYS,
-				     AMDGPU_FENCE_OWNER_UNDEFINED);
-		if (r) {
-			DRM_ERROR("sync failed (%d).\n", r);
-			amdgpu_job_free(*job);
-			return r;
-		}
-	}
-	return 0;
+	if (!resv)
+		return 0;
+
+	return drm_sched_job_add_resv_dependencies(&(*job)->base, resv,
+						   DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
-- 
2.25.1

