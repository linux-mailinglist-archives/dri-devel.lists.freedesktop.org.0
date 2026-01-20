Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBDFD3BF5E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 07:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4569210E4BB;
	Tue, 20 Jan 2026 06:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hmEchLZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9377C10E2C4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 06:38:37 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-81f4ba336b4so4568559b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 22:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768891117; x=1769495917; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23Yab1Aml37M0q2X0GSrkWMBaoajqXvi7yvWyWBhLVA=;
 b=hmEchLZpfArby97fMVeHEVpf0bEmXZQbHLSeaxtZRKMF2sZB2Kxahg/2yZk7gewblB
 AT8nQNvhsRkVWmRJXvsYO9Il2VJlIXTd3nd5AiQkl8Oc4TpC78VnDdqBjlSKKEeI1dLJ
 bS+0jsEvo8SIV4kkx0IMPdmaazlqSxsttAPhslI6bX94NtsQbpbPs38k9roeK7N3N8d4
 qLUjqb/VmNPYqITtchgT51AWWSAvseuVcKVr+v4/DcXNdEaJ/L3rdZkoI82SFXz+8nvC
 bYAwqoBe1VK+yt2j7TUqva7tfoagkYsYGj2ffZmy/O4Fjwhtea9FDqpPylfweBqlF6Gt
 opzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768891117; x=1769495917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=23Yab1Aml37M0q2X0GSrkWMBaoajqXvi7yvWyWBhLVA=;
 b=rvgcU+7Yu0hcDlYnJWYXWi0x7p2aMD0H72r0FEzWjuO6blAoUUqtx+TIGwp3lK/Sd2
 ZCmu2BDI3PqjbhQSgOGhxtedDpwOmCW3CNIKgsNpQ6SduFNXD7oCLrkCtxIki+oao+/5
 BzNgYXYYUxUzzLc+3BO8e6OSrTwCn/6mmKg3Do0F/fQLMxDllezuR7kn4vaSJDIlTyU2
 gsbTY/0TUwsDu8gn+hjQGtqtob1wnPHEGrqi4IS1Lt0KkpM44sdeIBkBMlDlWLYbWeaY
 ffFkY2ajMxEs7xzibr2llYRcen4nVjinsfV0hi7HUsOExedKS/xADWSxfT1OuoV9FjqZ
 oxAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyYofqkHgcn9DH+2dw8GWlxZOczEeLWLrQEnGJMSBX1boHMGUjmkPDdNW7d6gcmm12JquSGUnRKz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq6QmYG+5fGYRtxdXEPBImG7qiRtBpgVKv7fjsG9nAEt1bimyG
 02MEwYnieYHvtS6smcEJ+L3tmSLVebpjZqJqz9BTfK2gP+6mM2YFMAAV
X-Gm-Gg: AY/fxX41xfeWP3mnYbZ986dHzPWY5EiO27bo0E4X2pi034d5AXz45PMrzCok8DypJiy
 dbQcNfFr44VPD2onWzPax5BFWe5bMJKYsPlYW155qs40h+1g9f92ZcdZ7KlbfGddcCVv/4lf4mF
 Rao/yX/oiGBCwIlutcxsrkK1evHOnoHIUHgJHgcY47nh8XHFFLklEs2hN5uYqzNSJQLMdF1M3PQ
 jUMgmQ7bxr1YSAaIAI33SM4EcyownPlmpq8ZO1+l7Vckz8kfDoLJHx4SlsDvk9PY342RLuskXEm
 0DLXl5cDqi8nifGqz4mhJlEWVpE2Lsq3VaA0yfNXOE/GGju3LgwqHCBWmbe5X5iaM5I0wuBCACz
 ijlc+3Xh/KLmYv7dZ/u6kj5yHscrbxeUvM5XIfOFRurklFmkRGLgPUyHtN9UqPfsYhrm6Ahu5Fq
 liFIGaNb460Ic/18c4dPGvkCO8CHUG94D7OWoZf4o1uLfZU9e7TEnoQjZAgjz0h/s=
X-Received: by 2002:a05:6a21:b95:b0:371:5a31:e487 with SMTP id
 adf61e73a8af0-38dfe93bb92mr9776007637.70.1768891117009; 
 Mon, 19 Jan 2026 22:38:37 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c5edf264b9csm10561055a12.15.2026.01.19.22.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 22:38:36 -0800 (PST)
From: Mukesh Ogare <mukeshogare871@gmail.com>
To: christian.koenig@amd.com
Cc: alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukesh Ogare <mukeshogare871@gmail.com>
Subject: [PATCH] drm/radeon: convert VCE logging to drm_* helpers
Date: Tue, 20 Jan 2026 12:07:18 +0530
Message-ID: <20260120063718.203785-1-mukeshogare871@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b6bd1fdd-fae7-4ee9-ae06-9abe168adbd4@amd.com>
References: <b6bd1fdd-fae7-4ee9-ae06-9abe168adbd4@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace legacy DRM_INFO() logging in the VCE code with drm_info()
helper that takes a struct drm_device.

This provides proper device context in dmesg on multi-GPU systems and
aligns the radeon driver with current DRM logging practices.

Note that this change logs firmware version information at info level
and does not indicate a failure.

Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_vce.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon/radeon_vce.c
index bdbc1bbe8a9b..ed631c0e5e28 100644
--- a/drivers/gpu/drm/radeon/radeon_vce.c
+++ b/drivers/gpu/drm/radeon/radeon_vce.c
@@ -121,8 +121,9 @@ int radeon_vce_init(struct radeon_device *rdev)
 	if (sscanf(c, "%2u]", &rdev->vce.fb_version) != 1)
 		return -EINVAL;
 
-	DRM_INFO("Found VCE firmware/feedback version %d.%d.%d / %d!\n",
-		 start, mid, end, rdev->vce.fb_version);
+	drm_info(&rdev->ddev,
+			"Found VCE firmware/feedback version %d.%d.%d / %d!\n",
+			start, mid, end, rdev->vce.fb_version);
 
 	rdev->vce.fw_version = (start << 24) | (mid << 16) | (end << 8);
 
-- 
2.43.0

