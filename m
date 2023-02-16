Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A90A699E72
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 21:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3117D10E37E;
	Thu, 16 Feb 2023 20:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A8210ED1D;
 Thu, 16 Feb 2023 10:31:46 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id ct17so1135259pfb.12;
 Thu, 16 Feb 2023 02:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=29OzWpxyOz2YKbe7gk+wlUnvCGzWDi9lW+7/pophrnY=;
 b=VuOklK73RybRMNGEpT6+1i1b0r2ft7MGsgRP6Do4TXn0wOAtQ453gLKLV0vCs72wE2
 LIEVFUbzD7N3Axn92WbHDNmCRUx40OTMkWuFJcAH/BzsSEvbWWxbfnklwTRuYC9ZNcfB
 Z3PVBqri9y2hBZYTbSA0tVDV7LeDaAm3T2Sw1K4H8uNUuilPCli5gCtosahCKn+WEn0q
 dlRyWmxqZM/+4IlhLl7Yyt/XbQQIV6y2sfkLaWCIkA+R/NPiZNnnhgomGfM1xBwMvOGB
 eagKWtVDzIDMP8Qvt6LbQtqp0PaosXeiBitO7VnnwVTS7QBgEDv3SBHIw/rwr8Vbh+Rm
 QMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=29OzWpxyOz2YKbe7gk+wlUnvCGzWDi9lW+7/pophrnY=;
 b=6A101SZVsvsR23vlyMcuP3uuut6kmQmrVw4elMy9CEQ1Zx15ChRZyPwKk/HW/++qtw
 p++pUPttaeFOfaTKCvi0o0bENWjxvkglB5GCb21QzuQLO0oLIQ2npYzPHpdNR9LfWa9C
 9Xxkog1hTEI+a6OvnC7bY0r5Az932LCa9E+LAn0ihsdgt5qwMMtimo3XtXuKI2UVaNmq
 ibh/39a0pPxYOE8EAh/ojHOsjMIQDodmsT1no7YLDuRtd8YQrr+1x1uNpSmRKthX0/q+
 RZy2zJpyPZ0gWPTVwe/hhKPGZ6khLqymNYqc13C6X4a+GnrDpgE6Qcd7N3lkVAZ7HL0w
 MM4g==
X-Gm-Message-State: AO0yUKXpe7yW/uiLG1ZmYwgRB27+2VGaiUeXG7yObNDe9iXu4ikFu8XB
 p/1atoiPFjzBoe9NorC1qiragsd6q+6wJA==
X-Google-Smtp-Source: AK7set84rxDE0S2Ui4h6nOB6QxOphwCKGJ1gDgb+KixrIcbphyNjJYz+yWMyPkvq3gRdiMhOY4RW7Q==
X-Received: by 2002:a05:6a00:3010:b0:5a8:aa5e:4bc3 with SMTP id
 ay16-20020a056a00301000b005a8aa5e4bc3mr1724493pfb.1.1676543505864; 
 Thu, 16 Feb 2023 02:31:45 -0800 (PST)
Received: from localhost.localdomain ([202.53.32.211])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a62fb11000000b005893f281d43sm975790pfm.27.2023.02.16.02.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 02:31:45 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCHv2] drm/amdgpu: register a vga_switcheroo client for MacBooks
 with apple-gmux
Date: Thu, 16 Feb 2023 21:28:57 +1100
Message-Id: <20230216102856.11987-1-orlandoch.dev@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Feb 2023 20:58:33 +0000
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
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Kerem Karabay <kekrby@gmail.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aditya Garg <gargaditya08@live.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and
vga_switcheroo") made amdgpu only register a vga_switcheroo client for
GPU's with PX, however AMD GPUs in dual gpu Apple Macbooks do need to
register, but don't have PX. Instead of AMD's PX, they use apple-gmux.

Use apple_gmux_detect() to identify these gpus, and
pci_is_thunderbolt_attached() to ensure eGPUs connected to Dual GPU
Macbooks don't register with vga_switcheroo.

Fixes: 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and vga_switcheroo")
Link: https://lore.kernel.org/amd-gfx/20230210044826.9834-10-orlandoch.dev@gmail.com/
Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
v1->v2: Use apple_gmux_detect()
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2f28a8c02f64..ef8b996f0622 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -35,6 +35,7 @@
 #include <linux/devcoredump.h>
 #include <generated/utsrelease.h>
 #include <linux/pci-p2pdma.h>
+#include <linux/apple-gmux.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
@@ -3919,12 +3920,15 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		vga_client_register(adev->pdev, amdgpu_device_vga_set_decode);
 
-	if (amdgpu_device_supports_px(ddev)) {
-		px = true;
+	px = amdgpu_device_supports_px(ddev);
+
+	if (px || (!pci_is_thunderbolt_attached(adev->pdev) &&
+				apple_gmux_detect(NULL, NULL)))
 		vga_switcheroo_register_client(adev->pdev,
 					       &amdgpu_switcheroo_ops, px);
+
+	if (px)
 		vga_switcheroo_init_domain_pm_ops(adev->dev, &adev->vga_pm_domain);
-	}
 
 	if (adev->gmc.xgmi.pending_reset)
 		queue_delayed_work(system_wq, &mgpu_info.delayed_reset_work,
@@ -4029,6 +4033,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 {
 	int idx;
+	bool px;
 
 	amdgpu_fence_driver_sw_fini(adev);
 	amdgpu_device_ip_fini(adev);
@@ -4048,10 +4053,16 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 
 	kfree(adev->bios);
 	adev->bios = NULL;
-	if (amdgpu_device_supports_px(adev_to_drm(adev))) {
+
+	px = amdgpu_device_supports_px(adev_to_drm(adev));
+
+	if (px || (!pci_is_thunderbolt_attached(adev->pdev) &&
+				apple_gmux_detect(NULL, NULL)))
 		vga_switcheroo_unregister_client(adev->pdev);
+
+	if (px)
 		vga_switcheroo_fini_domain_pm_ops(adev->dev);
-	}
+
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		vga_client_unregister(adev->pdev);
 
-- 
2.39.1

