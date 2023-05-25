Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAC771141F
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 20:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF62810E73A;
	Thu, 25 May 2023 18:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B1710E73A;
 Thu, 25 May 2023 18:36:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B65C8648F1;
 Thu, 25 May 2023 18:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB37C433EF;
 Thu, 25 May 2023 18:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685039760;
 bh=/ZQtRsJbOg2XX00OHxi8ngZFPwAIM6l/UIvEwv3Ew/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RYKDbsjeUFV7/9LOXK9hpinlaaRDci/eAerox5LY7RKy1tiYKDQa5V3XtLD/6t197
 6y9TqCLlTix/vbW2UaqQqBHH0Lq5TXG6lGSgAE+cMKp82lR0ZNZX4ctwOHDeZqKidq
 3w2HR7/XrpKxw5fL4+DcWCHmlMghr1Tdr0uzvdwYz/yDOcVzyNJUgziEy0Xm5Ih8OD
 5VNCg3lphIy2t//fvN8xI0HHVaBZxKqWrlT55aOBOvY4tJv9x2e9TpPqqZ5tCpx8D0
 TIBuYJg+aFuMWRWFimd09CRouMmVlZNiYae02Skgdsee/nXksIx7HMSG2nEVbZeA30
 SkvKeV9CmwbnQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 64/67] drm/amdgpu: skip disabling fence driver
 src_irqs when device is unplugged
Date: Thu, 25 May 2023 14:31:41 -0400
Message-Id: <20230525183144.1717540-64-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183144.1717540-1-sashal@kernel.org>
References: <20230525183144.1717540-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, andrey.grodzovsky@amd.com,
 Guchun Chen <guchun.chen@amd.com>, Xinhui.Pan@amd.com, YuBiao.Wang@amd.com,
 amd-gfx@lists.freedesktop.org, slark_xiao@163.com, gpiccoli@igalia.com,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Likun.Gao@amd.com,
 Jiadong.Zhu@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Guchun Chen <guchun.chen@amd.com>

[ Upstream commit c1a322a7a4a96cd0a3dde32ce37af437a78bf8cd ]

When performing device unbind or halt, we have disabled all irqs at the
very begining like amdgpu_pci_remove or amdgpu_device_halt. So
amdgpu_irq_put for irqs stored in fence driver should not be called
any more, otherwise, below calltrace will arrive.

[  139.114088] WARNING: CPU: 2 PID: 1550 at drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:616 amdgpu_irq_put+0xf6/0x110 [amdgpu]
[  139.114655] Call Trace:
[  139.114655]  <TASK>
[  139.114657]  amdgpu_fence_driver_hw_fini+0x93/0x130 [amdgpu]
[  139.114836]  amdgpu_device_fini_hw+0xb6/0x350 [amdgpu]
[  139.114955]  amdgpu_driver_unload_kms+0x51/0x70 [amdgpu]
[  139.115075]  amdgpu_pci_remove+0x63/0x160 [amdgpu]
[  139.115193]  ? __pm_runtime_resume+0x64/0x90
[  139.115195]  pci_device_remove+0x3a/0xb0
[  139.115197]  device_remove+0x43/0x70
[  139.115198]  device_release_driver_internal+0xbd/0x140

Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index f52d0ba91a770..a7d250809da99 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -582,7 +582,8 @@ void amdgpu_fence_driver_hw_fini(struct amdgpu_device *adev)
 		if (r)
 			amdgpu_fence_driver_force_completion(ring);
 
-		if (ring->fence_drv.irq_src)
+		if (!drm_dev_is_unplugged(adev_to_drm(adev)) &&
+		    ring->fence_drv.irq_src)
 			amdgpu_irq_put(adev, ring->fence_drv.irq_src,
 				       ring->fence_drv.irq_type);
 
-- 
2.39.2

