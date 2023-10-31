Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66057DCE0F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252FE10E4D4;
	Tue, 31 Oct 2023 13:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6828B10E4CE;
 Tue, 31 Oct 2023 13:41:17 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1cc13149621so10577255ad.1; 
 Tue, 31 Oct 2023 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698759676; x=1699364476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WY87l0JQJecUS5eNh5/9T1RB/XaRsBA9P7FgGHx3yR8=;
 b=CZ0jd4T2ekGtb0cD0jCfL48CfrfHtw+4/WHtJArqERqoBp1j2fKcau50bTUbGSsHCA
 8wDZVpgcNRDluJO3lwUDNjJI9krihZ1DGEXEvJ+mvbHN4KKzhKRANlsmAqgvFpQMKo6+
 MTDf9Q8oi+SjFBB73xr6NaDh/UoEfpzsXeNRVtQWzkwEuQWvMCJOwuwOL2bAAYX+bi9k
 rBYI+WBXrodHxAqY+KSzEOz5BMdTV9+EuR06e/oy+HMXNaPaokS6LWzP+sUXHSGWcQsv
 mgVmeuQ/RCp9bkGtiA7K9t6G8Fmg6pRHKCw6FcQ07eaekeqoLHvEfCNRxZ6UzrSW8ODE
 //2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698759676; x=1699364476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WY87l0JQJecUS5eNh5/9T1RB/XaRsBA9P7FgGHx3yR8=;
 b=ifwYqVwKTCh+upQ3QQVga+csR491BNOkGW04vVK8IqjoxMa4P+54ZIWWPwtaOUPB/S
 8Gl0c2agRzG07ytLKRtzM1+Dp+dX5T1MylTGssOP3cPvpEYl40RIilYV5kzkem3NSAoc
 rDtMxXhk7rfnls/1MDwPm/Emp+N6HflukVaTIpx90Mh0ZYND6rHLwaaCFfCNqQFAkMez
 7BL1i1vApPhPutuHi0Fd47SXQHLz8n2H26YD0Do4OkYDmZCWt33RBvpB7pcfkarApiyz
 tFRKGe+dKsRaBhDOOWmhCgP1uTQDQPAeq2XFFTR/Av69OkHzMQtwT6lPXC19lCWdSbmc
 aA1A==
X-Gm-Message-State: AOJu0YzUz2AvRnjx2ZWcbBHEGnPhe54wq2esqPbO/F1zyn/1hl5ZIeVa
 PuXHUsmLzhJmfptb2CYUVX84e5DttL+ZBEut
X-Google-Smtp-Source: AGHT+IFwtVzRkNcTy9skkE5aci9x4sNK6+drL8OUwSHr70IlPrdtWDnGxwVf6cUO7/3m9DEeG1d4xA==
X-Received: by 2002:a17:902:d1c2:b0:1cc:277f:b4f6 with SMTP id
 g2-20020a170902d1c200b001cc277fb4f6mr10650649plb.6.1698759675898; 
 Tue, 31 Oct 2023 06:41:15 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 j18-20020a170902c3d200b001cc54202429sm1328207plj.288.2023.10.31.06.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 06:41:15 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: Remove redundant state change after
 validation.
Date: Tue, 31 Oct 2023 22:40:57 +0900
Message-ID: <20231031134059.171277-5-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All the state changes are handled in the TTM move callback; doing it again
here just leads to more confusion.

The table update remains here because it needs to be done exactly once,
while doing it in the move callback will result it getting triggered twice,
once by the actual BO and once by the shadow BO.

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 01d31891cd05..50f7cee639ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -495,12 +495,9 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 				return r;
 		}
 
-		if (bo->tbo.type != ttm_bo_type_kernel) {
-			amdgpu_vm_bo_moved(bo_base);
-		} else {
+		if (bo->tbo.type == ttm_bo_type_kernel)
 			vm->update_funcs->map_table(to_amdgpu_bo_vm(bo));
-			amdgpu_vm_bo_relocated(bo_base);
-		}
+
 		spin_lock(&vm->status_lock);
 	}
 	spin_unlock(&vm->status_lock);
-- 
2.42.0

