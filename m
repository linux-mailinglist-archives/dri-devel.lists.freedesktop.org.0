Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606465EF647
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC69C10E61A;
	Thu, 29 Sep 2022 13:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60FA10E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:41 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dv25so2726957ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Mk095mcuW7h+d0K7+O9spF3m19iEbhY6Mw+WEYy58/0=;
 b=GTimkZT8l+IBWkN/ezpqb9BFfYksXHlNEI/lBzXMJXrK2TQP/ZVUcKcAuCIT9i0emo
 mhV9cwrMnnShDelaEbO5T+b81KwnSob83MYCfLZDifqLNEO+TaccqcpDHyHj26FWC0FZ
 LmipWebvTaZknOhnPaK1yYkLFio+vjd/bE9/t1SedRSOPNp7QSuD93VJwLPGThEjzy0T
 42WsSI+GaD2S+JWpknsq1OjHEUH8d5vJHyM3A7Xdn/xoJrdg6WNGsU/iXZGyZ+YZ8AjI
 NYwaXD+9y3m9viQuDYnpz0n97ZOBnj7TW9kQiONyOpxsQ9v63FPZcAloLKusJSD/HW2V
 3N+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Mk095mcuW7h+d0K7+O9spF3m19iEbhY6Mw+WEYy58/0=;
 b=pyxP5mebHY7+9M3te9W3M3oiFWokdebs4JvyUFH/y9CGM37/STNVOBHggfDlu7RJw6
 jLm4Bbldcih/KPN5PT6QbIn0PuhoW6w6LAiAJrOXvYFXL/DIi7nAgZtnI8oVVuyhhBJj
 8Trz8bVO0YOD1uVMb+Ds4GV6gVWnifWEvugUAPPnbzHIuACVNOBV+f+sout++ikPHnIr
 xCBb32ynJFozjmhWhzNede9EZeE/znEjyIid+4vSClRdmKMyFHLylOAz1j3CCrF7bl3F
 PJv09aR3ueRsDIxH9GqHGk5Bq8SEt/tWGZdBYAKMFzhqHtwg+d7IS2OBZUS6mEwxt2B3
 nYoA==
X-Gm-Message-State: ACrzQf240mJNrbMbxA7YCmrUiAXSXkHwjwWG6v5pFShS5X7aUqD0veQG
 fX+wS6P8iK5uLRUHoqkL5AypCop9mFg=
X-Google-Smtp-Source: AMsMyM7DDZzwkKcEHodIqZIBNqILx19OsjNZVPzPTMn3vqx3r56VK0PPq+a+63t6aswWQlPnwxLBZQ==
X-Received: by 2002:a17:907:160d:b0:782:bc5d:162e with SMTP id
 hb13-20020a170907160d00b00782bc5d162emr2731745ejc.291.1664457700362; 
 Thu, 29 Sep 2022 06:21:40 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 gx6-20020a1709068a4600b007836d075152sm3983807ejc.187.2022.09.29.06.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:21:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/13] drm/amdgpu: use drm_sched_job_add_resv_dependencies for
 moves
Date: Thu, 29 Sep 2022 15:21:26 +0200
Message-Id: <20220929132136.1715-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929132136.1715-1-christian.koenig@amd.com>
References: <20220929132136.1715-1-christian.koenig@amd.com>
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
Cc: shansheng.wang@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, WenChieh.Chien@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new common scheduler functions to figure out what to wait for.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 134575a3893c..4fabb194ef89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1977,17 +1977,11 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
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

