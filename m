Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D728D4E7F
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 16:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6F110ECB8;
	Thu, 30 May 2024 14:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2DIovAax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CFE10ECB8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 14:58:45 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1f62a628b4cso2195385ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717081125; x=1717685925;
 darn=lists.freedesktop.org; 
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=l5khecYMdKDHw89iJpsW1yiXKEfGunwm3+6Z9OsK0so=;
 b=2DIovAaxXcJxRMtoXLypgyNj/JUBbTFUv3kkF5ToH74UPXxP2PiA5wlyZXAjvYPsZC
 9is7ToVyyDiGVc0jcpvG8/PFEMhR8cNrtrSi7K9LDse6wi4Ikv7Y2l1sMCZg/uBK3Ti8
 WRWqABouoFyneJz9Gj8bW/i3zK9Cv2t9oepQGWaIqf7JrSHLgfyUBa2knA5XxvVp1zWy
 lBrpTkI7KuWu0VovPss5tlEghp5uVrgDh0i3oSg7sDnJgI4HTIxtVqBx8t4kfbLr/P9D
 G+Yl+CHYr40+xzfeiPsRM7JaNFDsjBUGfkgutZUhAonsR4cgzprUR+4p3KkgNA8gp8WB
 yEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717081125; x=1717685925;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l5khecYMdKDHw89iJpsW1yiXKEfGunwm3+6Z9OsK0so=;
 b=JNFaC+tScgebcRGO7FEFsg5t47H4zKfnwSYxjywCtj6whtsaNMJrAR1CvLXf4Z+uOj
 vUE/PT9pHSOIkRc3Jb/yceMuYVHSm7seUrcPPYJKODJcUN/LKYaXTCpijRJ1Ydl4v6uL
 vquYBllJtQQUlY7bH5ijZcwXCqaTt4fE+d+QgX4A4tHKf+5ZnJ6l1opGxsL7TkcrnGp8
 YHOTt4aH8nn7N59UOA71kW6fGUTrPoMoH8JDeont4kGJDOLfwFq2NEvTsdqpLXqoMxV/
 PS8Xw2DESzgj3QKRRv9Oit8/7weSX6+n+8dgJWBQYp4OtAKtqHZmVnfYdj2bOCUWE17r
 SiSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW9XpcLheiuvCEzoeNAZ7OxkdG5MM1u78+S7hGGpWnRDVtDxAQQ2IoM0pxZMHYqQAwp2brLK57+DZDeYbwKyIlalHnQBzahq17UGIER93a
X-Gm-Message-State: AOJu0YxNJT35weDwdyO7vBktBP9eV1b7ibAMY8Bxm9YrE9ssIOrUmicL
 1k5DFMgmWRJnKUYHXmEbFATskqS1PjMvXvcATAfHvEUGtSeshG3ec5yvB3aa+58=
X-Google-Smtp-Source: AGHT+IEKvEjoLbbrN4JdqK6X02tKZ1Vg/fjeNLYXxvvVYtupVhUWAkZyf5sli6+XANrywg1P87S/sw==
X-Received: by 2002:a17:902:ea0b:b0:1f4:8190:33a5 with SMTP id
 d9443c01a7336-1f61a3dd9ebmr24276305ad.56.1717081124823; 
 Thu, 30 May 2024 07:58:44 -0700 (PDT)
Received: from localhost ([50.145.13.30]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c967975sm119659155ad.152.2024.05.30.07.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 07:58:44 -0700 (PDT)
Subject: [PATCH] drm/amd/display: Increase frame-larger-than warning limit
Date: Thu, 30 May 2024 07:57:42 -0700
Message-ID: <20240530145741.7506-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Qingqing.Zhuo@amd.com, 
 nathan@kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, hamza.mahfooz@amd.com,
 chenhuacai@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: alexander.deucher@amd.com
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

From: Palmer Dabbelt <palmer@rivosinc.com>

I get a handful of build errors along the lines of

    linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: error: stack frame size (2352) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Werror,-Wframe-larger-than]
    static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation(
                ^
    linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1724:6: error: stack frame size (2096) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
         ^

as of 6.10-rc1.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index c4a5efd2dda5..b2bd72e63734 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -62,9 +62,9 @@ endif
 
 ifneq ($(CONFIG_FRAME_WARN),0)
 ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
-frame_warn_flag := -Wframe-larger-than=3072
+frame_warn_flag := -Wframe-larger-than=4096
 else
-frame_warn_flag := -Wframe-larger-than=2048
+frame_warn_flag := -Wframe-larger-than=3072
 endif
 endif
 
-- 
2.45.1

