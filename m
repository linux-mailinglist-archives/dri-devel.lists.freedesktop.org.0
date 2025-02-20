Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AC6A3E0A7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B2C10E9AD;
	Thu, 20 Feb 2025 16:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qjEAszV0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED4D10E9AE;
 Thu, 20 Feb 2025 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bp0PWENFDQt4d1lhlNW9z0EZ975rNKseh6asfm0CJ28=; b=qjEAszV0qxkvupuuBpEC/x95Yw
 BgElk3REL5tfygvk0ppu5z4PIY93VrJykZWhF9gkh3K4qfFZpQt+Vc0x7uzz1NrQGMCleFEoBUJPK
 thLpzegtH0Y7lXGEwM0G+8a8zycCzuz4msrbP/GzbpB1rQueXNG3611D7V8gqyF802mzgKZYHq2Gk
 ceU/QlLbC2xXfztiE1BNBUeF/u9HbskCt97h22g6+llmPKPhjFCRn3MKF0I2LxoNQhsNi6V2UWypG
 PMkf+yjtAphlWZL1uVLQYt61hEoreVWYl/0xCUStIJ8k84MiH9ySIbfd9EkGCgbSAAaJoh5TQDWuV
 SL4xsCtw==;
Received: from [191.204.194.148] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tl9Oz-00FS04-HF; Thu, 20 Feb 2025 17:27:59 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, siqueira@igalia.com
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v2 1/3] drm/amdgpu: Log the creation of a coredump file
Date: Thu, 20 Feb 2025 13:27:48 -0300
Message-ID: <20250220162750.343139-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220162750.343139-1-andrealmeid@igalia.com>
References: <20250220162750.343139-1-andrealmeid@igalia.com>
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

After a GPU reset happens, the driver creates a coredump file. However,
the user might not be aware of it. Log the file creation the user can
find more information about the device and add the file to bug reports.
This is similar to what the xe driver does.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 824f9da5b6ce..7b50741dc097 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -364,5 +364,9 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
 
 	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
 		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
+
+	drm_info(dev, "AMDGPU device coredump file has been created\n");
+	drm_info(dev, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
+		 dev->primary->index);
 }
 #endif
-- 
2.48.1

