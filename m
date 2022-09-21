Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFCA5C02A5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D1910E9BE;
	Wed, 21 Sep 2022 15:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0D410E4A1;
 Wed, 21 Sep 2022 15:53:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C7B5B830D6;
 Wed, 21 Sep 2022 15:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A204DC433B5;
 Wed, 21 Sep 2022 15:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663775632;
 bh=OJR+Kvk3y51iZ6Yjl4qfoMm5F58M8vlAqHec4fKuqLM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yga/v0E7FpThEg9jukqWjHbKGVIavYieDDltMRy+aFKXN6io+RwdxIoUUzETFf9iV
 Vp8pzoAIBavPsuf74iPQ8caD4UaJ3usQBhQu/1L6521TW2USRSBYdVoG82db7A7qtd
 7WZA7rzj9YZwyCPoBLei1n2DA2xqZK8+S8xoSJTTXfbSEIyXLqK0iQCMvZ+1D7shzP
 /hBM8ybhaH58qD85xi3W30Hlt4r5W51r89EXwKuG0dyAaM7ZbkT7rDHeON5OAlmnCJ
 LsYen5VFxmaOV9PHn77B9mjctNZ8iib8F95Fxovm8YAMCy+wiZyOsOjcxbRmr5Ykj0
 aUNooyTKgognA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 09/16] drm/amdgpu: add HDP remap functionality to
 nbio 7.7
Date: Wed, 21 Sep 2022 11:53:25 -0400
Message-Id: <20220921155332.234913-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921155332.234913-1-sashal@kernel.org>
References: <20220921155332.234913-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tim.huang@amd.com, Xinhui.Pan@amd.com,
 Xiaojian.Du@amd.com, yifan1.zhang@amd.com, airlied@linux.ie,
 Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org,
 sonny.jiang@amd.com, jiapeng.chong@linux.alibaba.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 8c5708d3da37b8c7c3c22c7e945b9a76a7c9539b ]

Was missing before and would have resulted in a write to
a non-existant register. Normally APUs don't use HDP, but
other asics could use this code and APUs do use the HDP
when used in passthrough.

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c
index cdc0c9779848..6c1fd471a4c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c
@@ -28,6 +28,14 @@
 #include "nbio/nbio_7_7_0_sh_mask.h"
 #include <uapi/linux/kfd_ioctl.h>
 
+static void nbio_v7_7_remap_hdp_registers(struct amdgpu_device *adev)
+{
+	WREG32_SOC15(NBIO, 0, regBIF_BX0_REMAP_HDP_MEM_FLUSH_CNTL,
+		     adev->rmmio_remap.reg_offset + KFD_MMIO_REMAP_HDP_MEM_FLUSH_CNTL);
+	WREG32_SOC15(NBIO, 0, regBIF_BX0_REMAP_HDP_REG_FLUSH_CNTL,
+		     adev->rmmio_remap.reg_offset + KFD_MMIO_REMAP_HDP_REG_FLUSH_CNTL);
+}
+
 static u32 nbio_v7_7_get_rev_id(struct amdgpu_device *adev)
 {
 	u32 tmp;
@@ -237,4 +245,5 @@ const struct amdgpu_nbio_funcs nbio_v7_7_funcs = {
 	.ih_doorbell_range = nbio_v7_7_ih_doorbell_range,
 	.ih_control = nbio_v7_7_ih_control,
 	.init_registers = nbio_v7_7_init_registers,
+	.remap_hdp_registers = nbio_v7_7_remap_hdp_registers,
 };
-- 
2.35.1

