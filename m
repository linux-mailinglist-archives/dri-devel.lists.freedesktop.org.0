Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1C98EE52
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D99210E1A1;
	Thu,  3 Oct 2024 11:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hC5R2T7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63DF10E0E2;
 Thu,  3 Oct 2024 10:26:35 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20b01da232aso6170715ad.1; 
 Thu, 03 Oct 2024 03:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727951195; x=1728555995; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bDaF4ZaP993V4kYD6pYXH6Xnw0kgfu6U+rAc0OMJWWQ=;
 b=hC5R2T7ml1cuW4AN/GF+HzlT61dNia4kofA4+oF6/QOkgnnwUS42aNLrA8DTNlfml7
 ux+Szn5C5vYERCmlW0ojAjmctpBcg50ETSMetvRVrUPwYkbEE+wBc1+EftESZDyWwg1H
 bSgvulkpCXqckRLEMgaW5IoCYD5t2xMmakXmGdUrUTJQzGSA1WZFnomGRO7zGC+VTGZf
 RBPqQSG/8ks5meBIG1XcAs2yaTYe/ab32d37OLpsgMnrNhBFmWTSshIzv0H4glmduujW
 7W8OCdJL+ejNGtY7h8NQv9/td4Tn1c0ky9rWlQiO/0v95/Qpd/aaqx5uDouF77Mp37em
 R2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727951195; x=1728555995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bDaF4ZaP993V4kYD6pYXH6Xnw0kgfu6U+rAc0OMJWWQ=;
 b=Hon4lsP4hmoSzLpnsYKn2p4LtNsbM4IEQ4p/4ua6tDNTmcpu9nKP+/n5ueWzu4m3no
 midCNk3/PdNv5T1Vh/5kMqL9qC8lkIF0kW27XDdk+n7oyKHwiAQHrKGW4H0QjqM9YiLC
 5vqVTnKH2LBrFklhDhdpJ1OKiqUQCVXDUN50roAbwCStWMZfdGNMOBGjL5VlGZ1g17Qt
 oylVlKxwpWkMNACHRVdJ+kVz6v9iHr5BdLLk933FvsByl/jisRaxG0XQjzDT4TZ86oXr
 kXwJCEiASO3Quac+hgvZOSCAP+i2q09p9NAkkhtz499vf1DFEE39K8JynqDItKV6ETJp
 qpAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVGt49OtGOjRCkZc2La8VAsKcwCB+qZa+GEgvyNaPiHUeKOfqmIacXpsDUWIr/xpO8A2qSVbE4yII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEYek9uEa7c822VfC8mtXtimiNVWyIAon9SBMA9wfcGMjgfL87
 2wgAb1gWGQwB8qsji96HAiWqpGTeqHZbo/qhyO5x/2x//g85mAZu
X-Google-Smtp-Source: AGHT+IGo37GKqQtikoviYEnk2OxpIfz8FZmT6Ip6E5UkGYqwcD89Hrh/VwPrSgDk9Mm6GjcwA32CbQ==
X-Received: by 2002:a17:902:d503:b0:20b:9831:9edf with SMTP id
 d9443c01a7336-20be18c7b4cmr47675395ad.6.1727951195194; 
 Thu, 03 Oct 2024 03:26:35 -0700 (PDT)
Received: from advait-kdeneon.. ([2405:201:1e:f1d5:d1e9:7a9b:5841:2826])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20beeca14bdsm6514475ad.64.2024.10.03.03.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 03:26:34 -0700 (PDT)
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, leo.liu@amd.com,
 sathishkumar.sundararaju@amd.com, saleemkhan.jamadar@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, advaitdhamorikar@gmail.com,
 sonny.jiang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com
Subject: [PATCH-next v2] Fix unintentional integer overflow
Date: Thu,  3 Oct 2024 15:56:23 +0530
Message-Id: <20241003102623.11262-1-advaitdhamorikar@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Oct 2024 11:39:20 +0000
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

Fix shift-count-overflow in JPEG instance
multiplication. The expression's value may not be
what the programmer intended, because the expression
is evaluated using a narrower integer type.

Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
---
 V1 -> V2: addressed review comments
 
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 95e2796919fc..b6f0435f56ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -357,7 +357,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_set(void *data, u64 val)
 	if (!adev)
 		return -ENODEV;
 
-	mask = (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
+	mask = ((uint64_t)1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
 	if ((val & mask) == 0)
 		return -EINVAL;
 
-- 
2.34.1

