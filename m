Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2672A78FA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2070E6E9E8;
	Thu,  5 Nov 2020 08:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993006E055;
 Wed,  4 Nov 2020 15:16:37 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id u2so4483130pls.10;
 Wed, 04 Nov 2020 07:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=jZIKcnyDJMb2Z8G5pgpKh49kTld/Nll0bzWeN8l4jNQ=;
 b=hnWWJzMkF2yndz8YqhuGUTd472AwV4s9pbS4n8KZHEEYEQdvoHfgtQLOic7YE5h2oZ
 NuWHUNfGD1zkHtuR+CiyHeMH6N9cTVaW7fCP/mzwYK4sPfCGoT1Ui0yWhdb4hIC7sz0k
 +FTStpnPx066EFde120lFLisWxT9D7kQOO+m2jNXXDtFIZldrBUyoivWTbego231h881
 z1FSXvs/8yHIqwRx1Gyud5i1RVJZrP20sUsygsxTyzSfcF5wzmfPY5iffzDI1dshwbIH
 9Ja04jc28rgxAFKUtKW8hWfwC5B2PvSYvzOTGweePmq1zY3hC1t9QCXduV1oivvB9zIH
 qhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=jZIKcnyDJMb2Z8G5pgpKh49kTld/Nll0bzWeN8l4jNQ=;
 b=IyDKYxHscF014kqn2DnCyxyMILNmFTExgk3kjbAgMeX+8PTAfVIIpBb8uVgFREIM4s
 aoJBYC5Pq4uirxtj8tcfEWddV/4ILU3rBBvVJppTHIcyc/AWxx+Ea+scVKYFVXQJg9E0
 tyeFSOHDo/GBLwUnwOQjPhncZ+9P0hd2XTbs87Lm61FjX32oG96KNU3swVDf9XA+Lyrb
 ILKp0ZWR07lmbfKZW9kLNHSEKpshcv50i7MfXXJfYbfGifqg81SZVNaw6aQSeuqf3C/5
 MOS/Sve2CY/5PTICBHu6zY4OAUjT2n4hyEuIv90p7rl/JUL18kpQ+U8qeilnGl2MsGFi
 9nEA==
X-Gm-Message-State: AOAM532f6M7hD44f3jf3ahKow4C3Z+r3H9r7mSlAKfsev3zdxZ685yus
 foakOF7f3g9HILJvflYRNLo=
X-Google-Smtp-Source: ABdhPJx1rKZCXb7hbPr95pSBrP8o4EH+puDIZ597cuNsU5hu5bc0AJchL8+5o9bWPmTxWchp1kMh+A==
X-Received: by 2002:a17:902:c14b:b029:d6:ab18:108d with SMTP id
 11-20020a170902c14bb02900d6ab18108dmr22903239plj.20.1604502997249; 
 Wed, 04 Nov 2020 07:16:37 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id a8sm2501377pgt.1.2020.11.04.07.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 07:16:36 -0800 (PST)
Date: Wed, 4 Nov 2020 20:46:30 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: replace idr_init() by idr_init_base()
Message-ID: <20201104151630.GA69221@localhost>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init() uses base 0 which is an invalid identifier. The new function
idr_init_base allows IDR to set the ID lookup from base 1. This avoids
all lookups that otherwise starts from 0 since 0 is always unused.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index c80d8339f58c..b98ae173a9de 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -576,7 +576,7 @@ int amdgpu_ctx_wait_prev_fence(struct amdgpu_ctx *ctx,
 void amdgpu_ctx_mgr_init(struct amdgpu_ctx_mgr *mgr)
 {
 	mutex_init(&mgr->lock);
-	idr_init(&mgr->ctx_handles);
+	idr_init_base(&mgr->ctx_handles, 1);
 }
 
 long amdgpu_ctx_mgr_entity_flush(struct amdgpu_ctx_mgr *mgr, long timeout)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index efda38349a03..d65a1888683b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1052,7 +1052,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	}
 
 	mutex_init(&fpriv->bo_list_lock);
-	idr_init(&fpriv->bo_list_handles);
+	idr_init_base(&fpriv->bo_list_handles, 1);
 
 	amdgpu_ctx_mgr_init(&fpriv->ctx_mgr);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index df110afa97bf..0154282771c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3199,7 +3199,7 @@ void amdgpu_vm_manager_init(struct amdgpu_device *adev)
 	adev->vm_manager.vm_update_mode = 0;
 #endif
 
-	idr_init(&adev->vm_manager.pasid_idr);
+	idr_init_base(&adev->vm_manager.pasid_idr, 1);
 	spin_lock_init(&adev->vm_manager.pasid_lock);
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
