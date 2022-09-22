Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DAD5E7492
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EBD10E446;
	Fri, 23 Sep 2022 07:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAFB10E052;
 Thu, 22 Sep 2022 20:08:39 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id u132so10366161pfc.6;
 Thu, 22 Sep 2022 13:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=IJN11SETmy+B9JV6I30KOXoXYKi95lkVmtL9b34Ld0M=;
 b=ixo9+NYtTdPVxDr15roMSGrLMpGCDN4OH3NY6zQwJ/ISHY7skrhFWe/fsORH7fdaPp
 AVhohfxmyHnKgqiytysVmwQmTN5iAcedIg+qWpy+o5y5Qi+XneRF0CxcFejOiiHotoXA
 2yNOowF9hkh6nCCgFB6Bj0lzWMkx+S+/GAl+5L/8AuClAS7UhZ9dbdsOWIkRQFl2TZ5G
 7EOP7+wOqZ2/tdPT3Dz/W6NjnTU7YkJ528/K/713bjOk91eohXB1nD3iQkEyirq5ryTC
 3Hb986HO3rVGnb2dYCno/lW1hADbH9yJQxrRPBa64Atpl2WXBSFQPN3yw/GKBrgFV0+b
 1+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=IJN11SETmy+B9JV6I30KOXoXYKi95lkVmtL9b34Ld0M=;
 b=JgYXsOxJJBbon1TLzfTuM2GSvRGKILd3Uv5LKP29vqZ4bf3UMN5g3K7sIfg8TLZY6U
 2nndl7kcYjO/kIvxvjuZUYYynFsmVj/pUSabP1ow2IU2/C11TcrLrhfOKCPIk5SGPVIE
 5DTmT4poT1BosfhWQp9MoPga2cRq+FuKcTWiylMKnncdD9sWRYtZiDslMXVDxt/gNWnx
 3xah9QjMkY7Z2R6FHo/sd+2AiMNLQ6Qa4xEaFcA76PMKVAtFq/zYXmSZhajrrc1JAo/s
 A+aA5SWa8nayVLxbzVmyt7qFeywjItdEkW1Xvk1VvnTYJRpSsvMZVKOdDxFqqdoni1jM
 yAgQ==
X-Gm-Message-State: ACrzQf2kdFhxjz8fYMKKLOzE4Wz9cPGRQfk6zojG61+aF1modIOXgb7M
 y5hTWQATetqK27ru9C0A9d5gSns7fjHX1w==
X-Google-Smtp-Source: AMsMyM65xpLSZzi723yIDdhumvp/E3d7HQ+HQ1pZXctUG3QhPsr4efXDUHl2y4bJE6f4oAaFQl9d0g==
X-Received: by 2002:a05:6a00:2446:b0:528:5da9:cc7 with SMTP id
 d6-20020a056a00244600b005285da90cc7mr5408473pfj.51.1663877318382; 
 Thu, 22 Sep 2022 13:08:38 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu.
 [2607:f720:1300:3033::1:4dd]) by smtp.googlemail.com with ESMTPSA id
 o64-20020a625a43000000b0053e9d14e51asm4849503pfb.98.2022.09.22.13.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 13:08:37 -0700 (PDT)
From: Li Zhong <floridsleeves@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v1] drivers/amd/kv_dpm: check the return value of
 amdgpu_kv_smc_bapm_enable
Date: Thu, 22 Sep 2022 13:06:13 -0700
Message-Id: <20220922200613.1703624-1-floridsleeves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Sep 2022 07:09:53 +0000
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
Cc: lijo.lazar@amd.com, airlied@linux.ie, Xinhui.Pan@amd.com,
 Li Zhong <floridsleeves@gmail.com>, alexander.deucher@amd.com,
 evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check the return value of amdgpu_kv_smc_bapm_enable() and log the error
when it fails.

Signed-off-by: Li Zhong <floridsleeves@gmail.com>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 8fd0782a2b20..d392256effe2 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -1384,13 +1384,16 @@ static int kv_dpm_enable(struct amdgpu_device *adev)
 static void kv_dpm_disable(struct amdgpu_device *adev)
 {
 	struct kv_power_info *pi = kv_get_pi(adev);
+	int err;
 
 	amdgpu_irq_put(adev, &adev->pm.dpm.thermal.irq,
 		       AMDGPU_THERMAL_IRQ_LOW_TO_HIGH);
 	amdgpu_irq_put(adev, &adev->pm.dpm.thermal.irq,
 		       AMDGPU_THERMAL_IRQ_HIGH_TO_LOW);
 
-	amdgpu_kv_smc_bapm_enable(adev, false);
+	err = amdgpu_kv_smc_bapm_enable(adev, false);
+	if (ret)
+		DRM_ERROR("amdgpu_kv_smc_bapm_enable failed\n");
 
 	if (adev->asic_type == CHIP_MULLINS)
 		kv_enable_nb_dpm(adev, false);
-- 
2.25.1

