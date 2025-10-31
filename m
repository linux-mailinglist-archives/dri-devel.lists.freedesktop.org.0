Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C29C25532
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2463810EB9F;
	Fri, 31 Oct 2025 13:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A5osG8y8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FAE10EB7A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:45:07 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47114a40161so25793925e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918306; x=1762523106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RL6rVAENXblPP/WtJ2kkdTszLuUIj+9DJtEA2dEhVX8=;
 b=A5osG8y8qPdV5K2DVMPTQUZVfiEgmpFoO2Cw1tZrw3bRW7Lqq7C7ikXcjG9NU9nkQC
 mai4JkKUrGtu+W5+qjz9xXnI0n9Aijcqaovj+ZDuvS4GEqC+0JZBA+nZCGfOsatnFKS0
 nr5ijSFE8P6Z+0sKOx2+SlT480rzWI6kmHFsArigGpskslsxgvpDW+scKlNCBSpEs5x/
 JchBIe/O3bb5y4nNShKVMEaX+N1aGqpcYX+aUS6zYQljXEeQRs35PNuycL2goccQDU0X
 2IwiH7JnBXgPSzKdgIfK4EbrZS0+Sn99kYi5l1T/jjFtl3w7s7l2sH3Wef5bKjmAfQ/l
 9ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918306; x=1762523106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RL6rVAENXblPP/WtJ2kkdTszLuUIj+9DJtEA2dEhVX8=;
 b=Q5Vb/uAyX18hIJ8PUtsLh/4SCbrI7mE4bi1N7rlCUOypJJ94hS9J0R6LeAgHLKXfge
 Ed8pG8Dx5nAkJ2gsICthTkrNVXebM9S/XPPBBsO2hw9bb3Q7TkVC2K5fMF/XzOr8ALO3
 qD3kWud2svNYrForf/7xgDxXnVmp5rG8U4f32DRHG0FE2/ooyqxI9W1YTxjhIcwm5oAv
 C9nVuzIR3F0Em3DvnU42rVhEX9fl/y7HoF7O4dlG0b+O9Mc+ATXYpyhclAp88lwETTXI
 pIgVkqUYNnfy+YTZqwP3loLBQcEIwpAO39XIMjcZsa/H6kxL375HqYCUmgtDC1jXOGJC
 ezBQ==
X-Gm-Message-State: AOJu0Yx6QKeFXqmGmDR20TznyOeQ2Iu1EfjtSSCZXT8GRevZHvdnl8M0
 izDnYan4iTS+sPfj/wqLhMlb2G+6Soi5e91DKIuZ9woP4UHbHp3myw3M
X-Gm-Gg: ASbGncvq7Z7QDMETwNMrXK9ZOu6cp3573EWWfpbHM3pISBUkd+cMBJzUbl2U01h0EIy
 O5D3Gf3jKSoAXU39yyveqKsHBun779tCqx1bzvmgu7FE0CNz1VTGBCfq8YIVDnl8CzKu4oVgjIR
 NKCH/2e/CtOqEESXeWXKw3L0liNBWERR+k8ZTPW8fx0K3lcqP1DBqyaB6LNro4WupzmjaMacC2X
 IZLwSuQCWdAGPjg+7/zlX5gAef5M15bY1a++sYDoKTMz0NrRu1pJ5KnVg/QT4Vyc6nKddGm3VRg
 wxOO8QO2fAGyV5zJ/+32b5ckBqkeCURXddra8vaqnZpGm/kVj+jL9wmRrSkx1gXfgnN24nfOVKv
 GY0rvfLUKNpgpAFXRGxgNo6MJ+/w+p9F1b0j35qKZ3Xgx3lcwOEpcm605612WtpjdkNU07y7nLL
 XixveC88towBS0y7IcVRjFqbpn
X-Google-Smtp-Source: AGHT+IGQQWhW4KydYllYE96yBXpnJNZb+d0a1/v5j1qYDJHW7rwr/iQL8xbdeQKjOGiZIyvMilnY7A==
X-Received: by 2002:a05:600c:548b:b0:475:de55:9304 with SMTP id
 5b1f17b1804b1-4773089c775mr36273065e9.19.1761918305811; 
 Fri, 31 Oct 2025 06:45:05 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:45:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/20] drm/amdgpu: fix KFD eviction fence enable_signaling path
Date: Fri, 31 Oct 2025 14:16:45 +0100
Message-ID: <20251031134442.113648-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
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

Calling dma_fence_is_signaled() here is illegal!

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 1ef758ac5076..09c919f72b6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 {
 	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
 
-	if (!fence)
-		return false;
-
-	if (dma_fence_is_signaled(f))
-		return true;
-
 	if (!fence->svm_bo) {
 		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
 			return true;
-- 
2.43.0

