Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D82774AF88
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 13:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D475C10E55F;
	Fri,  7 Jul 2023 11:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8677F10E55E;
 Fri,  7 Jul 2023 11:12:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C511D61275;
 Fri,  7 Jul 2023 11:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13DFC433CB;
 Fri,  7 Jul 2023 11:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688728324;
 bh=2NoIPMcY+haGQrbKaoQREEDgCnwtLhX96He1p8v4ak8=;
 h=From:To:Cc:Subject:Date:From;
 b=ne/2Rigj0ihkn2iVY9+viD5p8iMAXpVc9E3dlZdOVtcXs6tKHWaPAxUXywTlHrQIl
 dd52dv83urUzoftcpY+Y9y3orCGvxcKMJpjyq3171ghvBkwxjVkNvXMiSbR8kl1i+J
 ycLULiSs0XXlgdTuzPqeWqr/2Jw2jj0V+zNQ9Ff2EZzoCynUCCGOuoyYrusrbeTOK2
 U7HeOQffHtSz05nEtiRe/S8Gcv7G6JqioP1pI/Hu2gu3pqzMNrsx5qRmq0TVZ0bGcZ
 PeisAzbZft2H19BkDqExDo6QAtxfrQ/8BZNOZafhT4RT1IbTJY8QZ2Wwz/coHQChZP
 xMKuLcpBf7QiA==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] [v2] drm/amdgpu: avoid integer overflow warning in
 amdgpu_device_resize_fb_bar()
Date: Fri,  7 Jul 2023 13:11:51 +0200
Message-Id: <20230707111157.209432-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: amd-gfx@lists.freedesktop.org,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Bokun Zhang <Bokun.Zhang@amd.com>,
 dri-devel@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
 linux-kernel@vger.kernel.org, Shiwu Zhang <shiwu.zhang@amd.com>,
 Le Ma <le.ma@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

On 32-bit architectures comparing a resource against a value larger than
U32_MAX can cause a warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1344:18: error: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
                    res->start > 0x100000000ull)
                    ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~

As gcc does not warn about this in dead code, add an IS_ENABLED() check at
the start of the function. This will always return success but not actually resize
the BAR on 32-bit architectures without high memory, which is exactly what
we want here, as the driver can fall back to bank switching the VRAM
access.

Fixes: 31b8adab3247e ("drm/amdgpu: require a root bus window above 4GB for BAR resize")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: return early instead of shutting up the warning with a cast and
running into a failure
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7f069e1731fee..fcf5f07c47751 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1325,6 +1325,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 	u16 cmd;
 	int r;
 
+	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
+		return 0;
+
 	/* Bypass for VF */
 	if (amdgpu_sriov_vf(adev))
 		return 0;
-- 
2.39.2

