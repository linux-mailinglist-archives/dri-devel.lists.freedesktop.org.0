Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D212F8D1A3C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCD210E656;
	Tue, 28 May 2024 11:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H4iXVa2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DE410E544;
 Tue, 28 May 2024 11:51:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3476ACE12B4;
 Tue, 28 May 2024 11:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF2DC3277B;
 Tue, 28 May 2024 11:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716897057;
 bh=vCzcWUNmvMUlvI8YURG3Btky8bNrSZU0/30kwieKgRM=;
 h=From:To:Cc:Subject:Date:From;
 b=H4iXVa2XTb/BQ48DrxGjyEW4dPitPx8+zyptgCLF6aB5RzX/wgbW6GRYFlcZWatZU
 Av27wYkwultkGf236L2YZlx3kpABD8fWJNHzCf3PDx3WrqjfHHYOwkqK8YrRRCXZWJ
 vUY9esizWwtQvPkTvLsYfowh0+SrDpH0iCwQrddaKn5iZHdCWMDDVtyVE1Js5223PK
 RUCU16pKRMyY7syvM9rXuESlPMwJChch3lRQHkzy829CYpIzruGSPho2OGHhFT7FdG
 YdbIu2IxrS1n1SEnCYiPNAIkKdyLAnd0lkVYbYyWJc60j8k8rLJO2GpdxPf+Ljl6Pk
 7JO5opD9IOYxQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdkfd: select CONFIG_CRC16
Date: Tue, 28 May 2024 13:50:32 +0200
Message-Id: <20240528115050.2831206-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The amdkfd support fails to link when CONFIG_CRC16 is disabled:

aarch64-linux-ld: drivers/gpu/drm/amd/amdkfd/kfd_topology.o: in function `kfd_topology_add_device':
kfd_topology.c:(.text+0x3a4c): undefined reference to `crc16'

This is a library module that needs to be selected from every user.

Fixes: 3ed181b8ff43 ("drm/amdkfd: Ensure gpu_id is unique")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index d3c3d3ab7225..f82595af34bf 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -6,6 +6,7 @@
 config HSA_AMD
 	bool "HSA kernel driver for AMD GPU devices"
 	depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
+	select CRC16
 	select HMM_MIRROR
 	select MMU_NOTIFIER
 	select DRM_AMDGPU_USERPTR
-- 
2.39.2

