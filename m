Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9CD79A1CA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 05:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26FE10E0EE;
	Mon, 11 Sep 2023 03:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F9710E0EE;
 Mon, 11 Sep 2023 03:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cNOjsnSfznKSrF57vcS0OcARw+qwbmzL72qeMCKDJ7A=; b=oaLj+SBw7ge4ZBUw3+gvlRxsYG
 9c/u85hN+5Y+inBKR/b4Ft+6E5BcHGnh6FO2SF0ohblfHE9P8VhE7mnDlGFdwfp2HEDRmp2vsrq5p
 LlsZ9PAJKlX2Hu9G9SklpxE82A9gk81uPsce/0X1sbUdnaPdcENt6B8FHYt6ehfwpOC8x+f2oSctX
 ZbwupWRkESeMfHgIznwic5DkN2v+XabRh1R4e+naEp3HA72rBW9TPZX516FL8hnM3DQHAi4VrK+T+
 XYtOAzmbX3is8oOC2nFgrWa7vo3oQY5OUWgkWVnRdn62zevJNjoNzT1Aa3i45es8q2xMqyp2djPd8
 0YZS4OFw==;
Received: from [187.10.204.7] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qfXA2-002C6C-Fr; Mon, 11 Sep 2023 05:00:26 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/5] drm/amdgpu: Allocate coredump memory in a nonblocking
 way
Date: Mon, 11 Sep 2023 00:00:14 -0300
Message-ID: <20230911030018.73540-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911030018.73540-1-andrealmeid@igalia.com>
References: <20230911030018.73540-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Shashank Sharma <shashank.sharma@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During a GPU reset, a normal memory reclaim could block to reclaim
memory. Giving that coredump is a best effort mechanism, it shouldn't
disturb the reset path. Change its memory allocation flag to a
nonblocking one.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
v5: no change
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index aa171db68639..bf4781551f88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4847,7 +4847,7 @@ static void amdgpu_reset_capture_coredumpm(struct amdgpu_device *adev)
 	struct drm_device *dev = adev_to_drm(adev);
 
 	ktime_get_ts64(&adev->reset_time);
-	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_KERNEL,
+	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_NOWAIT,
 		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
 }
 #endif
-- 
2.42.0

