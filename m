Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AB59F33F8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 16:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0FC10E6C0;
	Mon, 16 Dec 2024 15:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="by5kvuIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F90110E6C0;
 Mon, 16 Dec 2024 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3eVpJx106NZNtZJBx56mmaimA9TRsBvd5tEkdIyqrT8=; b=by5kvuIswIqoBNE+J81OWkm2bG
 05g304C+qXB5ENeUmBQDYYgpgvreGWQ2cLmqmMhps+2G4e/ld5b5wXj0ieD2GCvml3SaERojT5fIA
 rWn6oMwQA2/3lauIaxRR6a0zs3FK6dlfjbGGbT+4Zkvhf4JB3coOV+VPXtm0eXr5TRxGKR3GClMt3
 m4aFxuANba4ftaoRPxT9WJ91cpIXywCNnWP4F/RWrgaZVMuCX9rfou8ofxG/YpneZaW+onRfcY28j
 QgMZM4Nwhd/MsfrNLB3nT360N+ERJi/6HZFbFinroWeIBQVMvEKQE8XvlF2DjaNfZWLe0eAnlQpDX
 zD6DCTzg==;
Received: from [179.193.1.214] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tNCdy-003p0Z-Vh; Mon, 16 Dec 2024 16:04:23 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 andrealmeid@igalia.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Shashank Sharma <shashank.sharma@amd.com>
Subject: [PATCH v2 1/1] drm/amdgpu: Use device wedged event
Date: Mon, 16 Dec 2024 12:02:50 -0300
Message-ID: <20241216150250.38242-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216150250.38242-1-andrealmeid@igalia.com>
References: <20241216150250.38242-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use DRM's device wedged event to notify userspace that a reset had
happened. For now, only use `none` method meant for telemetry
capture.

In the future we might want to report a recovery method if the reset didn't
succeed.

Acked-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v2: Only report reset if reset succeeded
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 96316111300a..b0079d66d9e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6057,6 +6057,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
 
 	atomic_set(&adev->reset_domain->reset_res, r);
+
+	if (r)
+		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
+
 	return r;
 }
 
-- 
2.47.1

