Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE20D15DEDB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74A56FA3A;
	Fri, 14 Feb 2020 16:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1EA6FA3A;
 Fri, 14 Feb 2020 16:06:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B77812067D;
 Fri, 14 Feb 2020 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696375;
 bh=Ib/kJYQoRP9+Z4hzql8Gs1MBOxNuMCCSr6QAxvEN8RM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ks9tuMRhLMqHPOU8V7g2/NI48aQuFRV+k2PMg+WXjoTP+Qmtc0jkKAfwmaEwxMU6I
 Tm+NKJfgKH7Q947Qw1cfyVZ48slxeKlTXegscUjsYYsKH2foz7jdRJ8ZnmGPZdeWap
 pm83waQGOtiJmxvL53cB2Zyjdxc0YgrvfUlFK5y0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 204/459] drm/amdgpu: fix KIQ ring test fail in TDR
 of SRIOV
Date: Fri, 14 Feb 2020 10:57:34 -0500
Message-Id: <20200214160149.11681-204-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Monk Liu <Monk.Liu@amd.com>

[ Upstream commit 5a7489a7e189ee2be889485f90c8cf24ea4b9a40 ]

issues:
MEC is ruined by the amdkfd_pre_reset after VF FLR done

fix:
amdkfd_pre_reset() would ruin MEC after hypervisor finished the VF FLR,
the correct sequence is do amdkfd_pre_reset before VF FLR but there is
a limitation to block this sequence:
if we do pre_reset() before VF FLR, it would go KIQ way to do register
access and stuck there, because KIQ probably won't work by that time
(e.g. you already made GFX hang)

so the best way right now is to simply remove it.

Signed-off-by: Monk Liu <Monk.Liu@amd.com>
Reviewed-by: Emily Deng <Emily.Deng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7a6c837c0a85f..13694d5eba474 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3466,8 +3466,6 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 	if (r)
 		return r;
 
-	amdgpu_amdkfd_pre_reset(adev);
-
 	/* Resume IP prior to SMC */
 	r = amdgpu_device_ip_reinit_early_sriov(adev);
 	if (r)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
