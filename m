Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA670A9AB
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 20:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC9710E0E6;
	Sat, 20 May 2023 18:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D82910E0E6;
 Sat, 20 May 2023 18:19:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3E776009E;
 Sat, 20 May 2023 18:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55803C433D2;
 Sat, 20 May 2023 18:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684606772;
 bh=5rn/qciF/tv9h8ztLn/cB6ntPJZT88ZGYYLG5le0pFs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ViEcJ6/z7UHUnfSdikg7AcuIJQvW2mSpi5Tza94zQkOfVvAcBWTOX1tQSZiDofaet
 R0+h62A0WRBFSFgeuZCkSvTh/3/KSGn36mJKGfcMuy1ICCbvEp+r/AxWj6QQCPj5Sm
 KqVFGR/chi9Jazx/NwS9Dd7EZpuxtiSBChlMHmPXs4JqClj+NDY7QJJlBfUKfjWtkq
 urbEqoBuWIINbSOI/GO+F9FxpJw8ut8R+QEGI0eQPPlHO1Ajz2o65E0w/Qs2hAIo52
 +AmMk76SPEhFgIfh7pnlrQytzfCH0XnU5ZCq5uILca3g35RvgwhglKonqt7HGAMJ0y
 mmdeR4SUSwgFg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 13/18] drm/amdgpu: set gfx9 onwards APU atomics
 support to be true
Date: Sat, 20 May 2023 14:17:45 -0400
Message-Id: <20230520181750.823365-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520181750.823365-1-sashal@kernel.org>
References: <20230520181750.823365-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Yifan Zhang <yifan1.zhang@amd.com>,
 lijo.lazar@amd.com, dri-devel@lists.freedesktop.org, andrey.grodzovsky@amd.com,
 Amaranath.Somalapuram@amd.com, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, YiPeng.Chai@amd.com,
 mario.limonciello@amd.com, Bokun.Zhang@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Lang Yu <lang.yu@amd.com>,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yifan Zhang <yifan1.zhang@amd.com>

[ Upstream commit af7828fbceed4f9e503034111066a0adef3db383 ]

APUs w/ gfx9 onwards doesn't reply on PCIe atomics, rather
it is internal path w/ native atomic support. Set have_atomics_support
to true.

Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
Reviewed-by: Lang Yu <lang.yu@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index aa46726dfdb01..41f27de162d7d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3738,6 +3738,12 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 		adev->have_atomics_support = ((struct amd_sriov_msg_pf2vf_info *)
 			adev->virt.fw_reserve.p_pf2vf)->pcie_atomic_ops_support_flags ==
 			(PCI_EXP_DEVCAP2_ATOMIC_COMP32 | PCI_EXP_DEVCAP2_ATOMIC_COMP64);
+	/* APUs w/ gfx9 onwards doesn't reply on PCIe atomics, rather it is a
+	 * internal path natively support atomics, set have_atomics_support to true.
+	 */
+	else if ((adev->flags & AMD_IS_APU) &&
+		(adev->ip_versions[GC_HWIP][0] > IP_VERSION(9, 0, 0)))
+		adev->have_atomics_support = true;
 	else
 		adev->have_atomics_support =
 			!pci_enable_atomic_ops_to_root(adev->pdev,
-- 
2.39.2

