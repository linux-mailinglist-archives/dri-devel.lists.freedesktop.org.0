Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3054F9ADEC6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 10:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D51110E13B;
	Thu, 24 Oct 2024 08:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c2RmtRy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E6310E8AE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 08:17:22 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-431481433bdso6149785e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 01:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729757841; x=1730362641; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jmI8CZ4fHAq0Xmul0DkZ8lYpCWQ/gTUaITTUgzA92+U=;
 b=c2RmtRy/TIg0nBSP0MqppUOL6RdgnGOn9fRmmLwMznsloRodFx5YrVPEtKwQ3KQzME
 MG+8+WT/9jK8rzoWzXyL4FZehVaRNq5Dd/TyRXhALwKQGx3zhyoXf0ngTx7IOLoSXaPu
 fqEgyoXF/jbgzXz4/dQOm1YGM4Z8c05CI8uP8g2rhTWqdvy6z8XpbK/g3vvv/ZjvYjyF
 hqwBOqKDXj7KyvDjGgLFBaIkpSCUAG6onGmOqYe8c5vKnxtY+L33XJfvXYj4dUsDGzt9
 m7bk6J8YQjqFy2H3KqNKeaDCm0VHFIDWriTHHJo/+y4iCbiT26btZFHIQTXZM1YsUOJK
 eovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729757841; x=1730362641;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jmI8CZ4fHAq0Xmul0DkZ8lYpCWQ/gTUaITTUgzA92+U=;
 b=g0bOQRYZR29Mc5xCzVg+kKwqFKwmlnj+uE3Q9PFEjEdyeRIAedMmnCY85+fZIFOuSI
 8M3NQj4fqvEDp3FfToDuxQCY0wgCscEJcspGMFWC34EefI7kxUpKeENBjjLrvyrTuqls
 4+qvrubkyKdD9qsUpJe8gLcbWQkIZHR6UidehSwOP1ncAfk1UsER1ll5eI9gV2oGccPq
 H1Q/f/siAKz981uzZzoDfSdOMhpgKVH7OT4OdJHExNaw64V3KM8DMchGJXYBu6sr5wrl
 Pyj5KgLPNHIb2WH6DsXU7Q2V7EVgdzisFu4+1FieQ/FFFZIhRr8phjmu4ydBpzU8Cx0x
 7j3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMvfan/NVSVOe0nfXtB2Uo9EESiuIgcfo0L2GtnUqTBmcnINCE+DcIy4S6d9/rdVVmD6e6hhujIEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6mvW2fH1za3iHCJTHxZI/EKP7PFfVBoobC/O6OB3AIZw4WtWh
 TF8o+eO/+ZJxxFO5mST0S9vG+HMcPVim0hAgJRYbmWv87sZoheTWvGGh61asknE=
X-Google-Smtp-Source: AGHT+IE3Nx3OTYwJ2zj5wQUJ52gt4WAcF+S2WAkAz8S9e4+HmoQbErAeCCyoj3cZNQaSJWvWbko8rg==
X-Received: by 2002:a05:600c:1c11:b0:42c:a574:6360 with SMTP id
 5b1f17b1804b1-431841aff4emr45292785e9.29.1729757840836; 
 Thu, 24 Oct 2024 01:17:20 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43186c0f4cbsm38315275e9.38.2024.10.24.01.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 01:17:20 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:17:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Victor Lu <victorchengchi.lu@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix amdgpu_ip_block_hw_fini()
Message-ID: <f4fc849e-4e76-4448-8657-caa4c69910b0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

This NULL check is reversed so the function doesn't work.

Fixes: dad01f93f432 ("drm/amdgpu: validate hw_fini before function call")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 91c1f2188498..f12fab13386a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3309,7 +3309,7 @@ static void amdgpu_ip_block_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
 
-	if (ip_block->version->funcs->hw_fini) {
+	if (!ip_block->version->funcs->hw_fini) {
 		DRM_ERROR("hw_fini of IP block <%s> not defined\n",
 			  ip_block->version->funcs->name);
 	} else {
-- 
2.45.2

