Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9DD7A9D23
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8985910E5FB;
	Thu, 21 Sep 2023 19:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA0910E5F9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:37 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c364fb8a4cso12168835ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324515; x=1695929315;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIB9Su1U7bIPFr+7ANN/OcavTAqWwcBq0GS4I1/bwSs=;
 b=l2BIvCiTSlEeYV3AHCWuG1EjJtQ1Tq5QFsmA3+WnxpRaDsLpSyXGzP99/Px3S/RYJi
 OvzoY4Gl3kOSm/S7jqJLV4cexx3bDlUbgwNqqP2KNNRVI+/KwqZfMTDYiR8dwe7sbWVw
 dXaK1YcV25iuN1inqY9GzbFqqORYTKFO66QoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324515; x=1695929315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yIB9Su1U7bIPFr+7ANN/OcavTAqWwcBq0GS4I1/bwSs=;
 b=rFHqH1IkSB9Ww1j3pbODFKn+71AvmflBcyd32YtM+fnLHBPrxbY9NC0ZBRE3QyaakI
 xxdh4h9bYO+eF72PAdv5S5IxDkQ/CBpa9/wkqG1d0/qQB/pV96ZqyphESi+RuCSOcB9t
 z7uIT0iQaDw9Mr9R4ACWyByy6urzvTaKxY1mREQztkG77DBkkgUAT2E/BPwU3I/r3VsX
 WvE23OrnKi7lt44D01d4/KLTnPsQ14w/Hogg0Mqkl9RKFCDCbDs0epoA4mBZYKjXdJcf
 sUYwrjbS3fuf/o6W9eYQgEZqOTCX80+QkK0pwaqYEKqvtNQHbs80qg+rBJSFoI76r02J
 cPWQ==
X-Gm-Message-State: AOJu0YxNtLj7ItGVkIT+GObYszcQayDTkY9y6cWtJ0ZbqnJSNOGMAlxF
 KXgCC2o8WCc8F1Yda9+bUz2Mjol40TYgIBt6kokIM9vY
X-Google-Smtp-Source: AGHT+IG6gT2BLC16ToMT+YRTSkTdSEdEW0H2PnMiZoFRHOn+2vS6h4Vr0OhvW/jKYuQ4kfyd3+axAQ==
X-Received: by 2002:a17:902:bb83:b0:1c2:82e:32de with SMTP id
 m3-20020a170902bb8300b001c2082e32demr5155768pls.0.1695324515416; 
 Thu, 21 Sep 2023 12:28:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 07/12] drm/amdgpu: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Thu, 21 Sep 2023 12:26:50 -0700
Message-ID: <20230921122641.RFT.v2.7.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230921192749.1542462-1-dianders@chromium.org>
References: <20230921192749.1542462-1-dianders@chromium.org>
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
Cc: Victor.Zhao@amd.com, linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 mario.limonciello@amd.com, amd-gfx@lists.freedesktop.org, lijo.lazar@amd.com,
 srinivasan.shanmugam@amd.com, Bokun.Zhang@amd.com, shiwu.zhang@amd.com,
 le.ma@amd.com, James.Zhu@amd.com, felix.kuehling@amd.com, Xinhui.Pan@amd.com,
 Douglas Anderson <dianders@chromium.org>, tzimmermann@suse.de,
 alexander.deucher@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

...and further, I'd say that this patch is more of a plea for help
than a patch I think is actually right. I'm _fairly_ certain that
drm/amdgpu needs this call at shutdown time but the logic is a bit
hard for me to follow. I'd appreciate if anyone who actually knows
what this should look like could illuminate me, or perhaps even just
post a patch themselves!

(no changes since v1)

 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  2 ++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 8f2255b3a38a..cfcff0b37466 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1104,6 +1104,7 @@ static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_device *bdev)
 int amdgpu_device_init(struct amdgpu_device *adev,
 		       uint32_t flags);
 void amdgpu_device_fini_hw(struct amdgpu_device *adev);
+void amdgpu_device_shutdown_hw(struct amdgpu_device *adev);
 void amdgpu_device_fini_sw(struct amdgpu_device *adev);
 
 int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a2cdde0ca0a7..fa5925c2092d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4247,6 +4247,16 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 
 }
 
+void amdgpu_device_shutdown_hw(struct amdgpu_device *adev)
+{
+	if (adev->mode_info.mode_config_initialized) {
+		if (!drm_drv_uses_atomic_modeset(adev_to_drm(adev)))
+			drm_helper_force_disable_all(adev_to_drm(adev));
+		else
+			drm_atomic_helper_shutdown(adev_to_drm(adev));
+	}
+}
+
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 {
 	int idx;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index e90f730eb715..3a7cbff111d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2333,6 +2333,8 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 	struct amdgpu_device *adev = drm_to_adev(dev);
 
+	amdgpu_device_shutdown_hw(adev);
+
 	if (amdgpu_ras_intr_triggered())
 		return;
 
-- 
2.42.0.515.g380fc7ccd1-goog

