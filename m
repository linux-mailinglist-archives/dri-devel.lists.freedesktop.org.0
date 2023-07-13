Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD095752C29
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 23:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3806710E78C;
	Thu, 13 Jul 2023 21:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76A710E78B;
 Thu, 13 Jul 2023 21:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=haPtXaNAbjvN1gN1Qc0VL4/srlGmwa1LiUX0uWr0Rds=; b=fhZEZ2ePHPD4F7ZyhdzLTbQBCf
 rZf9p38ZMoyLzNjguHX2WxksXK87S9PdlLTBmb/09UUfMsmrJobTVCSPpRaHTUVeXOrglzEUvwiU1
 felj1TAmGjwM3GSnZnYSe4Y2LmXYgUl79uIuVf2iqD39jbE1V4T9adEhJxReB7AN5R6xjpVQpMeQw
 7qy8bZgfTfAbHcFGmxfsmowYhIoyeeCWUO2pt1DsDpNtfFTJHGJZePWyyGJPVxcr1h/MaWUxxT4MP
 uy+YJu/infhFCmMdKL2Pn3ibV1KPnwmqZTin024o1EppE5z4I+C40CPZUgHO92MHheEkkHMpALdtb
 ddkuMeXQ==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qK3w9-00EDEa-7m; Thu, 13 Jul 2023 23:33:21 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] drm/amdgpu: Allocate coredump memory in a nonblocking
 way
Date: Thu, 13 Jul 2023 18:32:38 -0300
Message-ID: <20230713213242.680944-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713213242.680944-1-andrealmeid@igalia.com>
References: <20230713213242.680944-1-andrealmeid@igalia.com>
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
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During a GPU reset, a normal memory reclaim could block to reclaim
memory. Giving that coredump is a best effort mechanism, it shouldn't
disturb the reset path. Change its memory allocation flag to a
nonblocking one.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v2: New patch

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e25f085ee886..a824f844a984 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5011,7 +5011,7 @@ static void amdgpu_reset_capture_coredumpm(struct amdgpu_device *adev)
 	struct drm_device *dev = adev_to_drm(adev);
 
 	ktime_get_ts64(&adev->reset_time);
-	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_KERNEL,
+	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_NOWAIT,
 		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
 }
 #endif
-- 
2.41.0

