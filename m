Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B878C7E17
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 23:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D9410EDD3;
	Thu, 16 May 2024 21:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VqjS+Ewm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E8A10E1ED
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 17:57:43 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-7e1bf0e9ab5so64260939f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715882263; x=1716487063;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Yk3zlTkgWi4AihMGcc8aW5GoxToOm2dN986l+VV/uk=;
 b=VqjS+EwmtFhqa2iQGyU5eK4U9sgYg2Jw5Kec9zwJtnat9iGhZU4dyO2EaDj8Sb6O8p
 NxtBib9e/hSlNnMvZ2ZapWtSrXfgMSUc+Oq9b7Kz4WBLpbX7K6kA4sur9zQAjPpcBRrD
 XakhgOyT6ACxo1kFZ9vpEJeS6tChuwCXW4niI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715882263; x=1716487063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Yk3zlTkgWi4AihMGcc8aW5GoxToOm2dN986l+VV/uk=;
 b=rmW9TldzyNImfv9uwodkFDOt0BmJaOa+GaVd28dOVll6qXwWuLrsVfTb1uKGHSIebB
 /BOOEd90DOYZ47+r51Pi5SZ6Gun2K2ncdkX7y2nNl++xXWcjQr5LgDd/nbB0+IS7LmCo
 fLHY+lDasQGIYzhiQa5lQWYE6/o9rUfY7SngX+0U2iO/+25/XKM39deYCxErfp5pfMiU
 mpPSQUj1nJYTAfmZHhFUb4szaJXe7fbQueS9F5/BIHfYDWAROiZE4T7nt47BD4xXSrA1
 6tWzjkkjDIJnh0wBIyZMz/7ApQKfFxb7+jsN1dcSOhUodBEAEdP67YlHYYa+9quIpDXL
 xRNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrmGWIOIX7aUNEBsfeBPWNdbXBktSLDT+klfOYCQm8WsHfYIIcx1dWNzS75MjbE8ZLFll8uQeAxvfe9JJ4ojqQcBKb2H412Tl2uSitQMje
X-Gm-Message-State: AOJu0YxHRWjPSS7bct95KtppXs+rU0lIU8fW3cDcFWt8hQ4/lPr8J2cd
 5q+6VnQ6S/8fC6/XV7k1BEYt6v+phiSTYNi4ch1byI4TzLOSNkYXBmxlvaB+jg==
X-Google-Smtp-Source: AGHT+IFsR9ezgvWfNnErH4JZuNFg8b3FDJaa1H1EfDvT9mRukNmnEvHG/5IFxY/twUfl/3j6BsBKdg==
X-Received: by 2002:a05:6e02:216f:b0:36c:c8f:89b with SMTP id
 e9e14a558f8ab-36cc148e4f7mr235882165ab.11.1715882263135; 
 Thu, 16 May 2024 10:57:43 -0700 (PDT)
Received: from timvp-p620-9115096.bld.corp.google.com
 ([2620:15c:183:200:93ff:e692:b652:436e])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4893703bfd8sm4301631173.47.2024.05.16.10.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 10:57:42 -0700 (PDT)
From: Tim Van Patten <timvp@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: alexander.deucher@amd.com, prathyushi.nangia@amd.com,
 Tim Van Patten <timvp@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Ikshwaku Chauhan <ikshwaku.chauhan@amd.com>, Le Ma <le.ma@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Shaoyun.liu" <Shaoyun.liu@amd.com>,
 Shiwu Zhang <shiwu.zhang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=1
Date: Thu, 16 May 2024 11:57:25 -0600
Message-ID: <20240516115721.1.I8d413e641239c059d018d46cc569048b813a5d9b@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 May 2024 21:36:01 +0000
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

From: Tim Van Patten <timvp@google.com>

The following commit updated gmc->noretry from 0 to 1 for GC HW IP
9.3.0:

    commit 5f3854f1f4e2 ("drm/amdgpu: add more cases to noretry=1")

This causes the device to hang when a page fault occurs, until the
device is rebooted. Instead, revert back to gmc->noretry=0 so the device
is still responsive.

Fixes: 5f3854f1f4e2 ("drm/amdgpu: add more cases to noretry=1")
Signed-off-by: Tim Van Patten <timvp@google.com>
---

 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index be4629cdac049..bff54a20835f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -876,7 +876,6 @@ void amdgpu_gmc_noretry_set(struct amdgpu_device *adev)
 	struct amdgpu_gmc *gmc = &adev->gmc;
 	uint32_t gc_ver = amdgpu_ip_version(adev, GC_HWIP, 0);
 	bool noretry_default = (gc_ver == IP_VERSION(9, 0, 1) ||
-				gc_ver == IP_VERSION(9, 3, 0) ||
 				gc_ver == IP_VERSION(9, 4, 0) ||
 				gc_ver == IP_VERSION(9, 4, 1) ||
 				gc_ver == IP_VERSION(9, 4, 2) ||
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

