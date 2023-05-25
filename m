Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB8871100A
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3E810E185;
	Thu, 25 May 2023 15:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DBA10E185;
 Thu, 25 May 2023 15:52:36 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d426e63baso2622737b3a.0; 
 Thu, 25 May 2023 08:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685029954; x=1687621954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B028AMgHgIkluZU0zuRGNx2AL7YCJmhMQ1JhCo1iuVI=;
 b=aNjbFnxBXnxByFTRM8dPMKH30Q/RAItyAVPrx2g23rtM7K5RWxj+jmeY6jXFFznBG8
 pZqa5Xzxd1RRC2cPJg3QGgjGxOjLvyujqb9O9tcPfbR593fGXpYl3mOh5ZMS70oGFBGx
 /kODJQcTOcwHEpMnyoc86lxFHBYsH/DD5AKNjW9UO2OsMqqQ2MWgTe01bSRUdSQhsbPO
 HwPjvWfdCJ2EOfQB47cDxADCc6pqDUoGCx5AXuAzBnna+gSSbl1TzveMRSHPcwsOMc9C
 wHzrhMVQZe5ZakVsucQjfNI9Kib8KYriF/UaUAqKAv8sC9wrGskiyYSbQvyoaQHzfDNc
 wOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685029954; x=1687621954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B028AMgHgIkluZU0zuRGNx2AL7YCJmhMQ1JhCo1iuVI=;
 b=dz+k+WltfBc5t4c0cdN6RQqLM+T7ywUDTyZYMBrtqzgnILK2DrUFeV9l0NoKkusJ8m
 mhwiwH85SczPFrGjgQEHwpcdKyw3qkIDYS0DQSe6/Xaok7PM7EW+EX2pAU2LDSJxIpVF
 gRVVVg8CXf9/ZaQw+i3yoPQQDIWdkroR1dfIKvDLfcsklOO6jB/im5PTeNnyD2bfzGmX
 hLeut/AmGixbqtepfGhNmhhIvTtMYsOL8EtcTDRlMK7pd/DY4l7+sbcvKU68o4mmZizE
 tAsH4SwGIMBBbm4Z9IWxkjcKYpPM+dj5XTS43Rbns2lghWtzg71t7P3n5frtmrV6yMIU
 NWCg==
X-Gm-Message-State: AC+VfDyDg0sVznLdh4urIh4OjsgoJBumlCt5wrbyf2h5XYGwElcJL05K
 yU0ysmaUnul7Xx4scsF/htoINkEa2aA=
X-Google-Smtp-Source: ACHHUZ7BKQyzScKNxtc9uAdkTbbH9pyva2m8zTt95GYPrMvfBGWVRwI16fpeyUdAfC7gPDigiNmWcw==
X-Received: by 2002:a05:6a00:10c4:b0:646:6cc3:4a52 with SMTP id
 d4-20020a056a0010c400b006466cc34a52mr8951192pfu.3.1685029954365; 
 Thu, 25 May 2023 08:52:34 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a62bd11000000b0063b6bd2216dsm1335974pff.187.2023.05.25.08.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 08:52:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: Fix no-procfs build
Date: Thu, 25 May 2023 08:52:24 -0700
Message-Id: <20230525155227.560094-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 kernel test robot <lkp@intel.com>, Guchun Chen <guchun.chen@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes undefined symbol when PROC_FS is not enabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305251510.U0R2as7k-lkp@intel.com/
Fixes: 376c25f8ca47 ("drm/amdgpu: Switch to fdinfo helper")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 1b46e7ac7cb0..c9a41c997c6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2795,21 +2795,23 @@ static const struct drm_driver amdgpu_kms_driver = {
 	    DRIVER_SYNCOBJ_TIMELINE,
 	.open = amdgpu_driver_open_kms,
 	.postclose = amdgpu_driver_postclose_kms,
 	.lastclose = amdgpu_driver_lastclose_kms,
 	.ioctls = amdgpu_ioctls_kms,
 	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
 	.release = &amdgpu_driver_release_kms,
+#ifdef CONFIG_PROC_FS
 	.show_fdinfo = amdgpu_show_fdinfo,
+#endif
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = amdgpu_gem_prime_import,
 	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 	.date = DRIVER_DATE,
 	.major = KMS_DRIVER_MAJOR,
-- 
2.40.1

