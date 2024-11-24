Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0B49D712D
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A1510E529;
	Sun, 24 Nov 2024 13:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uGZuOxIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B78010E528;
 Sun, 24 Nov 2024 13:44:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 98412A40BEA;
 Sun, 24 Nov 2024 13:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB72C4CECC;
 Sun, 24 Nov 2024 13:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455885;
 bh=/s+/VeFjJnzR6LP11OT0Qr+tOhqlkt6aZuN10ZmrTvA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uGZuOxIZ7KfHq2Lg+8H1DH6F9wIaDWpQe0osqTeYgxXJ+gJeG2E/ah2CAd0wAE49L
 qqMJ5JoW0SQYtfTiyn9tgAxsDwCgb0A/Vyk86h3WSpKPayYJ2PDEjyVCGtFOuKMFGw
 lgzoGEirSvRaR8vemin3hRFtErhDKkiWyNkLuqF8M/e9gAVyW/at40IoQLfLsntmzH
 u1y7Gpt3XNgschRzySNfzebTIhr+d7Y2AVWgTvx6wfSplf6WbqZxk3VMf6I1pW1K97
 mi1+hdwmDl5J5Bf/NFgb+7It7ywtSwcossMepBlR/Y3MiSxlbBnal1+AWKAxPusEFO
 mbGv5pDCokHkQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Victor Zhao <Victor.Zhao@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, Hawking.Zhang@amd.com,
 mario.limonciello@amd.com, Jun.Ma2@amd.com, Yunxiang.Li@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 66/87] drm/amdgpu: skip
 amdgpu_device_cache_pci_state under sriov
Date: Sun, 24 Nov 2024 08:38:44 -0500
Message-ID: <20241124134102.3344326-66-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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

From: Victor Zhao <Victor.Zhao@amd.com>

[ Upstream commit afe260df55ac280cd56306248cb6d8a6b0db095c ]

Under sriov, host driver will save and restore vf pci cfg space during
reset. And during device init, under sriov, pci_restore_state happens after
fullaccess released, and it can have race condition with mmio protection
enable from host side leading to missing interrupts.

So skip amdgpu_device_cache_pci_state for sriov.

Signed-off-by: Victor Zhao <Victor.Zhao@amd.com>
Acked-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index bcacf2e35eba0..62a9e714ad69b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6387,6 +6387,9 @@ bool amdgpu_device_cache_pci_state(struct pci_dev *pdev)
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	int r;
 
+	if (amdgpu_sriov_vf(adev))
+		return false;
+
 	r = pci_save_state(pdev);
 	if (!r) {
 		kfree(adev->pci_state);
-- 
2.43.0

