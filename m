Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49513A86DD4
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 16:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F8910E2B4;
	Sat, 12 Apr 2025 14:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bA/r0IVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52B310E2B4
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 14:39:47 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso23082405e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 07:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744468786; x=1745073586; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/0APbTrVqZTQ7b+tNHxNW9om5cpeJ+hNOY66GU+x9GE=;
 b=bA/r0IVx2JUlL8YecfHUjtA9eEWFkiDQqKWiL8oXlsYdEaPB/I2zbNCl4O56WnMtqS
 TSHGAYHPmVwFecvVgIGNCI7Tbvz4CGLQYB1XTiU1t0ZX6msr6z+MsmoEXnk1LZMOsczm
 idh72Y2KsLPf6B0jZGsu0e6o2J2A/i120v5ThkfdEs6gnc5hbvKecakC/5k+sDExPgpo
 ctUlZxRqR8c9yzaox8Av9pzU/aMaTn1lMcHl1rgOQPcSOJCquPYRGiKVcbYoWA+m8lgt
 Zl7RxKUGArW8QoRQCjdtotANvB+CdFyexCWZNttWvaGhx+IzZAWgVPZYirROkmjxx7IX
 Qkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744468786; x=1745073586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/0APbTrVqZTQ7b+tNHxNW9om5cpeJ+hNOY66GU+x9GE=;
 b=dNDpGFXAEhTrcGTkWFwgjiBbScs3ifwd6Hko4JH/0vFRxRdniCPAl7m5jSqDgdr8ET
 MECF6kdbRa+VtoeBo1MB1OMG+1P/edqXVQq5Q50yQ0ME0P2ZzMe3VLfMFIaUX1w8RET8
 d6lMvA6J2ESTxP41P+lXZZ8j/PXXd9XeolagRznSWubGnKIYQZLKu6PDcWUBqQK9vGsQ
 9rhl5emZWc6EYKMqO3/gzO0ezdsSXLFy/SjB3PWabn17iq1hBYcI/k+64fumNyfh3qIp
 /nY/YmwHUbc8kjNOFlu1rWjP2/0PjUZWobN/Kn403p6Jio6GFFINr2bwrvDWQb58JLMW
 ar8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZvpX6tPqjYXKnSoCuZQWht+Rw5FGvvuNct+44nKSMRSVoZUbWK2wuWLniTokcemyKRCWXu85rVv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKAbZfxYGC7qrHB9JAKVEQPE8wcOkvidM2GZ978y/mK7t+Qj4b
 TO2kCVSvs5uSySp0PVVctujTwiAUHE1kzoQuoq6HBNCYHPHxlNRdTjChBNXLazA=
X-Gm-Gg: ASbGnctn4kf7WMfaDF0YSsH8bK9tr3fsi4Cre6xAbxRZAlejtiDg/1nyqSJoNgbEoBq
 I/CgiD9T+w3l1bulIVqJqlu75NIvY+9lItYZZHZgzANXH7mKKeuPLinxWQm4IxGC+p7aeZbg8tM
 o0uFVdtQSn7JgzKKs94g5OC47ZqML6Vve+6emrZE/CY39oGpBZr0ZMff/0l1Ui7RRdCCuGEYJqZ
 FZ8car0TQMyJY1+loJovXu6LLHOeNay8441+pxqjUzqTpKLaav0DXFzKM4fZG2pVjnVp7Wkm96I
 T4COwZZh80hZyeNyn6EFonQRXwEtox8JlKFTmBgKM/od7Q==
X-Google-Smtp-Source: AGHT+IEIPIweCgA9/UK8lpvU9btA6Cbv8a80TioEApKtzRIcWdW/8sHJOEnuxUXW7drGXCEjT/WBmA==
X-Received: by 2002:a05:6000:1a8f:b0:391:a74:d7dc with SMTP id
 ffacd0b85a97d-39eaaecab96mr5356300f8f.50.1744468786353; 
 Sat, 12 Apr 2025 07:39:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39eae963fccsm5179479f8f.3.2025.04.12.07.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 07:39:46 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:39:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/amdgpu: Clean up error handling in
 amdgpu_userq_fence_driver_alloc()
Message-ID: <b9adf038b3ccf058c49e7e74e1998bc2216e0678.1744468610.git.dan.carpenter@linaro.org>
References: <cover.1744468610.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744468610.git.dan.carpenter@linaro.org>
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

1) Checkpatch complains if we print an error message for kzalloc()
   failure.  The kzalloc() failure already has it's own error messages
   built in.  Also this allocation is small enough that it is guaranteed
   to succeed.
2) Return directly instead of doing a goto free_fence_drv.  The
   "fence_drv" is already NULL so no cleanup is necessary.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: New patch

 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index b012fece91e8..86eab5461162 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -75,11 +75,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
 	int r;
 
 	fence_drv = kzalloc(sizeof(*fence_drv), GFP_KERNEL);
-	if (!fence_drv) {
-		DRM_ERROR("Failed to allocate memory for fence driver\n");
-		r = -ENOMEM;
-		goto free_fence_drv;
-	}
+	if (!fence_drv)
+		return -ENOMEM;
 
 	/* Acquire seq64 memory */
 	r = amdgpu_seq64_alloc(adev, &fence_drv->va, &fence_drv->gpu_addr,
-- 
2.47.2

