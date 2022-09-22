Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7484C5E5C4F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB6410E0CE;
	Thu, 22 Sep 2022 07:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA9510E110;
 Thu, 22 Sep 2022 04:18:20 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id e67so1845177pgc.12;
 Wed, 21 Sep 2022 21:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Nn/xaYDr70nfIgJ9YO/J5RCYgkbZZtOIDhcd1yX3ucQ=;
 b=McbPgHOuUAiXhKa8Mj/J8qvc8uJydjQKaMHJnUcZolHmMcxxuHccaLMo6FfOnltQTP
 f6F79C3tOlRc/edjDAGL0O2YVAqZhTXwvOyePXjxhdEdwWQIwz7uHeVHOKNq45JbSBCG
 f38b5lvnmPU1iyyPZNZga/BlN2pqi6qaISLQiG91J6jOgP7EP0uHEZk99Gmbik63kXHg
 BpJl2ds/vS6T6JIm/3lcAm3sfFXq331P9O7kYXK1WeXtnmQ+tAXcm/aj4+fklTxF8g6B
 VHYq+NNMexWVu4RmkQhy3IlVFYCfAAsAdCh/23DXtnX/U5UfO1zSejTU72cpAO7kJSps
 /p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Nn/xaYDr70nfIgJ9YO/J5RCYgkbZZtOIDhcd1yX3ucQ=;
 b=5izdVv/YYHEa+6cmAZF8GhFqMI5Kyri9U2wvV9o/m26SS4BtIzOyg0ronXupGb+wCW
 ZJ2BVid3CyWzNvb8JCnP8lYk814aP/vOVcD1yrn6+6xnB62nJfi4bsPYk7/ZNQwr9Ag+
 lg6BTLEPhB8sSfdjvz5dWkjtyUmJ70iru95F74A335ym7PKiSL4+JGZolC6bEYPoYIFP
 +nHUujZ/A1s3Pd/yhNzt+RJkGpUBRhu+DHJxklQpcHwOmD39vGKJikKo325lYot5fL74
 yZjcFZUooQ84zJdxqEYeDsg3F61o8n2GA/I1IhlK6xDFTjciSYZQ6yP4DwWsrXBiSmM8
 +HqQ==
X-Gm-Message-State: ACrzQf2G61kPsxNlM4KKNYztoWrq9znTWgJjqhXI9Roo4/KYKk12/kDG
 d0s70K6zV/jiEpn0Af4rorhkkem+N0viVQ==
X-Google-Smtp-Source: AMsMyM50FzxRj2HlMqLUhKs7DyuUnvQs7gW82ejReGQGM3ZrmkM6wbsvNINnTUoBNEBG17AXJLYY2Q==
X-Received: by 2002:a65:6d93:0:b0:42c:50ec:8025 with SMTP id
 bc19-20020a656d93000000b0042c50ec8025mr1380786pgb.62.1663820299647; 
 Wed, 21 Sep 2022 21:18:19 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu.
 [2607:f720:1300:3033::1:4dd]) by smtp.googlemail.com with ESMTPSA id
 n124-20020a634082000000b004388ba7e5a9sm2697825pga.49.2022.09.21.21.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 21:18:18 -0700 (PDT)
From: Li Zhong <floridsleeves@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2] drivers/amd/pm: check the return value of amdgpu_bo_kmap
Date: Wed, 21 Sep 2022 21:17:56 -0700
Message-Id: <20220922041756.1681845-1-floridsleeves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Sep 2022 07:24:23 +0000
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
Cc: jiapeng.chong@linux.alibaba.com, Xinhui.Pan@amd.com, guchun.chen@amd.com,
 airlied@linux.ie, lijo.lazar@amd.com, mario.limonciello@amd.com,
 darren.powell@amd.com, alexander.deucher@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com, Li Zhong <floridsleeves@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_bo_kmap() returns error when fails to map buffer object. Add the
error check and propagate the error.

Signed-off-by: Li Zhong <floridsleeves@gmail.com>
---
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index 1eb4e613b27a..ec055858eb95 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -1485,6 +1485,7 @@ static int pp_get_prv_buffer_details(void *handle, void **addr, size_t *size)
 {
 	struct pp_hwmgr *hwmgr = handle;
 	struct amdgpu_device *adev = hwmgr->adev;
+	int err;
 
 	if (!addr || !size)
 		return -EINVAL;
@@ -1492,7 +1493,9 @@ static int pp_get_prv_buffer_details(void *handle, void **addr, size_t *size)
 	*addr = NULL;
 	*size = 0;
 	if (adev->pm.smu_prv_buffer) {
-		amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
+		err = amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
+		if (err)
+			return err;
 		*size = adev->pm.smu_prv_buffer_size;
 	}
 
-- 
2.25.1

