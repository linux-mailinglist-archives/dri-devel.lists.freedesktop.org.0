Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA68B8DDF6
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 18:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A28C10E0FE;
	Sun, 21 Sep 2025 16:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DTYvftXf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEC010E039
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 14:55:05 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-77f1f8a114bso605990b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758466504; x=1759071304; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pJFv3ChPUzhn9GkGU13hJh9Fbrlocc4W2rtrc3dBgJk=;
 b=DTYvftXfAqx82edDPPDUzpWcUJyi1tuqxAR5lYdAMPDBDOKWIMbWbe0Ta4MChpfO1Z
 RqfjjSzpjX5rfIQeVWVmC9Tl5ZkC11lmcf/T2+3C6jomZopjdQGBqtOVHDCQvMOwczzT
 WwhnYgclvmOIcws8i1gVBdc8ZUbuXFJBeIb46eaELZ7bApwcXrHcj1+ZJOxWnKLfmYti
 Hs32xpv+NaK/f0xS22T0HDfEn6cUr7xBFQRKjkVmGo46nsX4FLc11515FtcE9Tx8efI3
 8k2pq0fcyT3W4FkiHhDkaWPwk8LHtctaqeJu4tlWXEh+BF/ON4aWsj8chzEO7S+c+cO4
 iVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758466504; x=1759071304;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJFv3ChPUzhn9GkGU13hJh9Fbrlocc4W2rtrc3dBgJk=;
 b=oRok6kfVrmWuMAW5yGMjtN2q4+CCqsZEskgVKu3aSd5vilNHWN6dZiQ5WiaXWeOgJ7
 fX3oQjfTXK84S+WMsod0AF1qg7bE0j1rnEN7wqgO0uuS1/R+05MXmvBbOtgNtvqOmPfu
 SWsS+EYg1dDaZVdd50WrgxFiVHGGT1l/tYq5ecuy5hhPymQ7lpNnkWWP3OVP/xoZSZiH
 DPXHaKeugrmvLgI/XKih3qQm8LEFx+9g/KnUy6P/HuCnHf5pvo2qpgZllU2aRPeDMs+z
 xkStmqcVd3xfU/ouN4F2tMsw/BqCgxyb87dr0OUeIP3/c2kvuMJaQI59hDSPkbbdnEiX
 KD6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ4zEmTIVHWo+sHXjMiafa9ctkQeeIkqwisSM/dZS8ydBNrD32tip9gxR5nCmdRxokPKfV0KIdiQg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw10Pi4usV/uWaVcbAzgMbwbg2xyWu+k0IYmiGuZO2pja4kP9Jk
 hL4bhHVloj8taNqpHNd3i/gHc6+vovaLF9L7FVF8tlKNiuK7ODrq61bz
X-Gm-Gg: ASbGncs7sTIV4Z6uOUfrVzvvEuWHX6mxDvyD4m8Tqn2S6XuMIFULH74xvoplbfZ9HoG
 ZObGgl6ttor+j3Y+z/6RMMh3/Zryu/Aodra7/0p7qNswpSN9o6TKFxoKG+m/pHXCCh+Dqszznnd
 U99OLpqRT9JaScAf+WDXe8Kj9UQsCR2EropHS2uV5w2lMWfga1dwB9k8i/q3a5WgYcbiG+b5M86
 b9wQ1eGP9SS9XeIIiY+H41GJvpf1L2gWOUiVBgWlVEDzlfsWLQwmEqBkT8SltitLhE87koQ4bxR
 2QbkZ4KToosVeI3UjQbroar84gSxf9shgpRyNNyGxLtUP9Bu6oeOttKwzjeTttjFHWuVIRDBxEH
 1ZHgRLmkjC2LgQ4lqgDs+yY3t7OF1rEkv5CbwB7A6LwA=
X-Google-Smtp-Source: AGHT+IGlGOrrC1qELYieezel6ZZpPzpPTwUZ/Hjhxs33BYHvkYGq6FWqHUkdWrQ5M/94vUUoWCRMpA==
X-Received: by 2002:a05:6a20:3945:b0:262:af30:e3c with SMTP id
 adf61e73a8af0-2921cafa18amr14329391637.28.1758466504480; 
 Sun, 21 Sep 2025 07:55:04 -0700 (PDT)
Received: from asahi.bialairport.com ([103.241.193.55])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77cfbb7aad7sm10415321b3a.12.2025.09.21.07.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 07:55:03 -0700 (PDT)
From: Shreyas Muppana <shreyasmuppana@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shreyas Muppana <shreyasmuppana@gmail.com>
Subject: [PATCH] drm/amdgpu: remove leading space before square bracket
Date: Sun, 21 Sep 2025 20:24:01 +0530
Message-ID: <20250921145401.22654-1-shreyasmuppana@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 21 Sep 2025 16:03:00 +0000
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

remove a space before an open square bracket,
fixes a linter error

Signed-off-by: Shreyas Muppana <shreyasmuppana@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
index cbc40cad5..8f3a31952 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
@@ -26,7 +26,7 @@
 #include "amdgpu_aca.h"
 #include "amdgpu_ras.h"
 
-#define ACA_BANK_HWID(type, hwid, mcatype) [ACA_HWIP_TYPE_##type] = {hwid, mcatype}
+#define ACA_BANK_HWID(type, hwid, mcatype)[ACA_HWIP_TYPE_##type] = {hwid, mcatype}
 
 typedef int bank_handler_t(struct aca_handle *handle, struct aca_bank *bank, enum aca_smu_type type, void *data);
 
-- 
2.51.0

