Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D26F993559
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 19:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C2210E0E7;
	Mon,  7 Oct 2024 17:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UYLzhHvT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F9C10E0E7;
 Mon,  7 Oct 2024 17:49:15 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-71927b62fa1so672468b3a.2; 
 Mon, 07 Oct 2024 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728323355; x=1728928155; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xFIN27AG3WgjOnmH18Fk8WaAPf1pZ2KMgetkW6A+4t0=;
 b=UYLzhHvT+90mPuUXy9T6UQlLMSdrpLftvDkqEc1RieGiImICzGK9uiSLSIHelOA/y0
 hylcc8Xf5RGH65tuNVgWkMu7xJLFCWZtkiDUnw0LEmCtIX3mXc3qiJS7te5n7WWEaME/
 kBNpJkF5vdgoFMi/LF4BUpawILosE8/zlwjdUcaXft7Y7s9GOG1jW0FCa9fhuCAWg0xc
 6BYITVuyvch0sI9ebQlfkt2fO0EBdfrZOBvGJ2tfwsjIsZxd+ezzzJpZOP9I2/0c9Uxx
 kfLZT4hboyhS3duRzB6qE9B7gPZeHuBlkTCLG00XNMWM2pHdNRHspud9ZfD+2T2IkNox
 MHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728323355; x=1728928155;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xFIN27AG3WgjOnmH18Fk8WaAPf1pZ2KMgetkW6A+4t0=;
 b=t8Nalz/usrjY7inP+Ri6G1F0BDbN74qeIdqiQ5sqVlPukwoICqkZVdlrcV+Anwd8wA
 rqilBJfUxz8qB3QBkOQyOJOBXtTtQcf0UxAZr8SoPS/byWEMjj+tQCKFN0QAWloa512a
 PwYZe7sdkMjpLUvXrUdl6WUqVKP7s4biGoLGPsekXy51ldYbz+lVHYB8S49kA6E9fgd0
 BGGeH8S/2CneoUISWE7lWn6hrXExUHRx0KywN646AouDdxe+4+C4F0FzbplGSM6dRi7A
 +EB3ktGBQfYqgmEbsO4KDf9O55DMdVcSKr8/k+xhDfnu12vz9D6qa212ucJzkNdocTd3
 yqRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb4mtaulSbMRSfiruD6KH90/3aPT1+rMinDeEYmwkweNj5g6cEPdcwUeCLbc1qxbbwFtoFMU1qBHM=@lists.freedesktop.org,
 AJvYcCV235rMUhHCcsuQFU5oealB4rd7lGnpFQU8FXr1cIxYr7T003bCUjYpR89bH+FIp+xvrUv2gm+DdaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyk9zfkwW4aEzerDXkMHaOTWQouj6ZkjwyTGcluD+Sf+T4v3W74
 z7QQY8zOVvmOUygP+Ri4PNwAQYTdg3zUc9hBLfP9OkRv27LBLDfB
X-Google-Smtp-Source: AGHT+IH236XZqVh5kSYznYvuShbIvj5woyfy5XKiXBwQQoAWzcu2Nl7W5TjR15p5S8ffsQdMMGim+g==
X-Received: by 2002:a05:6a00:2e24:b0:71d:f744:67 with SMTP id
 d2e1a72fcca58-71df744011amr4789204b3a.7.1728323354725; 
 Mon, 07 Oct 2024 10:49:14 -0700 (PDT)
Received: from dev.. ([2402:e280:214c:86:a843:852f:eac4:ff92])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0cd0ae9sm4649923b3a.82.2024.10.07.10.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 10:49:14 -0700 (PDT)
From: R Sundar <prosunofficial@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imre.deak@intel.com, ville.syrjala@linux.intel.com,
 R Sundar <prosunofficial@gmail.com>, kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH linux-next] drm/i915/dp: use string choice helpers
Date: Mon,  7 Oct 2024 23:18:57 +0530
Message-Id: <20241007174857.85061-1-prosunofficial@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Use str_on_off string helpers for better readability and to fix cocci
warning.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202410071252.cWILJzrH-lkp@intel.com/
Signed-off-by: R Sundar <prosunofficial@gmail.com>
---

Reported in linux repo:
tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_dp.c:2243:6-9: opportunity for str_on_off(dsc)

vim +2243 drivers/gpu/drm/i915/display/intel_dp.c

compile tested only.

 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fbb096be02ad..733619b14193 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2475,7 +2475,7 @@ intel_dp_compute_config_link_bpp_limits(struct intel_dp *intel_dp,
 		    encoder->base.base.id, encoder->base.name,
 		    crtc->base.base.id, crtc->base.name,
 		    adjusted_mode->crtc_clock,
-		    dsc ? "on" : "off",
+		    str_on_off(dsc),
 		    limits->max_lane_count,
 		    limits->max_rate,
 		    limits->pipe.max_bpp,
-- 
2.34.1

