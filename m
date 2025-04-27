Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB7A9DEB0
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 04:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD8310E0AC;
	Sun, 27 Apr 2025 02:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MriyEWx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBEC10E0AC;
 Sun, 27 Apr 2025 02:37:10 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2295d78b45cso53239715ad.0; 
 Sat, 26 Apr 2025 19:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745721429; x=1746326229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sGhmxhSrOG99ny8cfzHBCSn4oPUOL2LGUGAF5QgBGIw=;
 b=MriyEWx3ueC7pBQpCVuOo1/PjbxkpN/B2qRqWasyRT2p9cB0txdXYgPY1XpthxXI+f
 iJgUS1lylpgSTsHlcwSv6gLBvlobR0bHOLG5SUCEEqsPWALHMmCkxbbq9QFQpOZiituJ
 H0ynQ+MfGVd1E+WpuRhsmKMumWiNcrfhMNq08tGkgZvaCimIlBMmhYyNI0Ew1bDgn8CG
 rWZTLJJ/5pHtinHwWLn7QSLwuwecQAOxYSFx+kqHq/LSihbPMNb5hbV4EgO7NmetQKxf
 VQcswkz51ema4DJfvIq1CCCRShPyz/jSfgDwdYnnl/6dVJBwG9q9Bo2ES5mhhoIB8B1T
 VGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745721430; x=1746326230;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sGhmxhSrOG99ny8cfzHBCSn4oPUOL2LGUGAF5QgBGIw=;
 b=MRKEvhCkruApeZzw6AbcfCiz2pgqg3p+hu5PVPD7eqthNHkQzgyBtBJ/30IRLEYAK4
 TRjThhSncjsyitM+NSW9SZPU/aGWyKE4wf5HYYBGVGz1AKh/Oj3NqmHvw+JCEDym8mFH
 yOZ8IiuQF+ZhWna2CBQlnL437d0S6ZMY90E9kH/Rp8XfpK0aWOm3Pnuzm+IRQm2S1Tjc
 0R0x/Ajwvj0CPhij886GBwlTznl6DAPTsiCQEHcaTSvAQdxJ30RxQyg2qhjcpzAGJQz7
 PjbTyfhOKwJ+QLFK4zC8zxQ5hcxFRVg2QNGd17JW8XyYdQzPyfyKxrYVPhJE+VWIJjYf
 VLdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK0kpFNkhLCgBuwN68DNwQiQ0Niwyn4lnE2chvEOrs3WBfHco92kOJ4GYzJirId64LooqEUGLB@lists.freedesktop.org,
 AJvYcCVS1zbEbQ6S/mvxual8jvJZU73rjyfS7TunIpEg9ULwqSyHs90rtER7oqOBbnzrQqkktNEaXhkhfyzz@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0XImfah0/eC4tHFpiwOcipGqxWIx2Ab/YCwH6l9rWJoGw+HIN
 9+uANY1SIEjOSQ75DVtfR8YePkJSLEWMnJgSIQ6srs2+2JhZtq5l
X-Gm-Gg: ASbGncvWcHpGNgYSgpEKjAtYyREBw3B6qt2tlf4PPgoVLvHqeEhlL4xFDuDk1bEFgyY
 gIc225VXanUbvNcd/+i0yT9pCSJJ5KryynsjOjCUYWuTOmpF9YKBBNhU7VwNOps1n4wvGwxgg81
 SuWZYLKaAcVL3x41SrZjysdms4ukNys1rvldkJ22ICZFPmPGwmhEAw0wDWM79E9Zu9eHCAqsk0e
 jRubyjzIrHgM7SakcnKgsCCkbGmt1UcBpxKtD+IDp6E8zI+X8Yi7FtD0hNgJP3xqMCZsaeecnbw
 9RQ+IXQsv8YPVbMHF1rdYLB9sTo3dyEiDWvhHNX4
X-Google-Smtp-Source: AGHT+IHORZxRoCwJgkxTIznfaV7sWbHLw+4c1AAkdhkWHc2dCqwboQ1cj9cnhpySTMZq7KnyUv6y+Q==
X-Received: by 2002:a17:903:1b26:b0:21f:564:80a4 with SMTP id
 d9443c01a7336-22dc6a6852amr69641655ad.33.1745721429362; 
 Sat, 26 Apr 2025 19:37:09 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4d74c93sm56570415ad.11.2025.04.26.19.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Apr 2025 19:37:08 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 0AE584208F70; Sun, 27 Apr 2025 09:37:04 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm/amdgpu/userq: fix user_queue parameters list
Date: Sun, 27 Apr 2025 09:36:26 +0700
Message-ID: <20250427023625.14327-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=bagasdotme@gmail.com;
 h=from:subject; bh=rK+u9vJhz3zpOrwMOXrVbGhSFwLMiih9GqsN16Vu+8s=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBm801606YS91/42J91SNohletaKPw1KmtNYn19wEVjq2
 vrqkJNuRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACZyK4KR4cOB5FrhC3KymaEl
 DxbEmN6Yf/ioboVi+vInemYRTs3deYwMS59Y6YpzNLeK8PPsShB5nN6ULXNG96RTdn3a5VcvFq7
 mBgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Sphinx reports htmldocs warning:

Documentation/gpu/amdgpu/module-parameters:7: drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:1119: ERROR: Unexpected indentation. [docutils]

Fix the warning by using reST bullet list syntax for user_queue
parameter options, separated from preceding paragraph by a blank
line.

Fixes: fb20954c9717 ("drm/amdgpu/userq: rework driver parameter")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250422202956.176fb590@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b9a1ef343c79cf..ec8057597c5aad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1115,11 +1115,12 @@ module_param_named(rebar, amdgpu_rebar, int, 0444);
 
 /**
  * DOC: user_queue (int)
- * Enable user queues on systems that support user queues.
- * -1 = auto (ASIC specific default)
- *  0 = user queues disabled
- *  1 = user queues enabled and kernel queues enabled (if supported)
- *  2 = user queues enabled and kernel queues disabled
+ * Enable user queues on systems that support user queues. Possible values:
+ *
+ * - -1 = auto (ASIC specific default)
+ * -  0 = user queues disabled
+ * -  1 = user queues enabled and kernel queues enabled (if supported)
+ * -  2 = user queues enabled and kernel queues disabled
  */
 MODULE_PARM_DESC(user_queue, "Enable user queues (-1 = auto (default), 0 = disable, 1 = enable, 2 = enable UQs and disable KQs)");
 module_param_named(user_queue, amdgpu_user_queue, int, 0444);

base-commit: 127e612bf16726620e431b6e0f771424916492be
-- 
An old man doll... just what I always wanted! - Clara

