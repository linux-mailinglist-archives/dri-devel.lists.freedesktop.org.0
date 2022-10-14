Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 042FE5FEAE2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70F810EAB5;
	Fri, 14 Oct 2022 08:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F6610EAA1;
 Fri, 14 Oct 2022 08:46:56 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id l22so5916153edj.5;
 Fri, 14 Oct 2022 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5h1tswu/X88tJaPbT1f7Ia/Vt5VzuYCNSkGec6syos4=;
 b=XN1wBxIcWif1uyNDFNrFtm8+Oey4j5xKeFZ7llJBvx68/DSIetWQgM6FXt3rf1Vn2Y
 xRnBHTQWJFeuJ4xBT2fN6X9uTlzzkRhVdzJRBxLkCPWB85SrVGh2HebxFfY+hYXm8BP6
 klCjbJlido2e0rTI8EXBNW2Q9bj1nPQsplcbiQY9vspOzkgWXgYkGLBviQpDkamZ2N+N
 UoLE8Xk25D4eGh7lDe4AnCfrqbvD3x5XY9tQvYHjkqyahv7/oN9k0yJ0GzF0EUG8iAy3
 ZkRVSJmSrGoaN7vw39gnsPOsybSqcFuuE0KfaHxzQNXvQE694THrqtwGx2zyJuec0seP
 NHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5h1tswu/X88tJaPbT1f7Ia/Vt5VzuYCNSkGec6syos4=;
 b=2e1WpkgXOYFvLEOPU9eNz3giP7EKVRZJJegILo7Bock+LkVt5ct6RB8WrxVsLdNd/L
 dOYBSkxAzD8MOgipLg1wG4mRwJymE06Txj8br8YaSgtwMPPc4a0ZRmlD6U1qmJ4PlB23
 q1Q9jRMzLSZTGKmVcKcpUTHsauYvH5fb9LB7FDwsT+4wnCevdkK6FeYUzvLuAC9FZlhA
 CCM2AtVyxhOIT43ZTwAjobofXhDKsiy6p1gzo2UdihmPjZYnwOyb0MmoNJUanSlSnh+R
 IvnUjOppnEurC2sfRbII8TZwNA0ZJI0AW4cBAzIyt8ImCqVUOGyWMF6wr11FZovng/bx
 3soQ==
X-Gm-Message-State: ACrzQf1qubqShzCqCRppU5jQHvkhgtqqmBxKXfB5h3QYL6oloklND0C2
 x+1p4asl+A38mN8aWXbYkVd6DGJl7Pc=
X-Google-Smtp-Source: AMsMyM5C7GgeQBa7u2VahDbnj6fN+ZVnCQ+6rhVWZsvGCYApHzHkfqfyMyP8M9k0CeVfKC6O5JWcjw==
X-Received: by 2002:a05:6402:1913:b0:45d:fe2:40 with SMTP id
 e19-20020a056402191300b0045d0fe20040mr3023899edz.353.1665737214595; 
 Fri, 14 Oct 2022 01:46:54 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/13] drm/amdgpu: use scheduler depenencies for UVD msgs
Date: Fri, 14 Oct 2022 10:46:37 +0200
Message-Id: <20221014084641.128280-10-christian.koenig@amd.com>
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

Instead of putting that into the job sync object.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 8baddf79635b..e00bb654e24b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1177,9 +1177,9 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 		if (r)
 			goto err_free;
 	} else {
-		r = amdgpu_sync_resv(adev, &job->sync, bo->tbo.base.resv,
-				     AMDGPU_SYNC_ALWAYS,
-				     AMDGPU_FENCE_OWNER_UNDEFINED);
+		r = drm_sched_job_add_resv_dependencies(&job->base,
+							bo->tbo.base.resv,
+							DMA_RESV_USAGE_KERNEL);
 		if (r)
 			goto err_free;
 
-- 
2.25.1

