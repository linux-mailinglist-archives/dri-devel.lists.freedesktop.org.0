Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9169D5F261A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 00:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733F210E13C;
	Sun,  2 Oct 2022 22:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F1C10E12C;
 Sun,  2 Oct 2022 22:49:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A03D460EFE;
 Sun,  2 Oct 2022 22:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A10C433C1;
 Sun,  2 Oct 2022 22:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664750998;
 bh=rmXLxzGf9Iaux4QL9qj05LHuT3qVQhmty6LBfQnYxuQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DdWc+jMHU4z550os7ycmizdjNEebABGMKVgfiNcMJP6K7pd16SPQwXOjzzVddNF4e
 xaFhxDUPXgv2fi/u4Y9I8sQpA7nL6luUvATlA1iIMxTyUVmGIT1WdCEnzppTYeHg0/
 ImDYKUwn3zpHIxF6cpL0rsQ/4IXjVkREwFVTmnSs5gM3I9HELJ6bm+f27dbEV0A8p3
 Cs6mRf+mQdebrL4/zBV0aoO3WQXS4PrSACt5/iO3W6DlzSd6r5pzjlTTqLZPyLr2x0
 9Kb5zMk0FEZTOGYIeHplMIG1NSPJJx5XNlpld6ihbrbjmqG0RBA8CB1qJpzM3s3hyE
 aQZ0ZdQ3jdMlw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 11/29] drm/amdgpu/mes: zero the sdma_hqd_mask of
 2nd SDMA engine for SDMA 6.0.1
Date: Sun,  2 Oct 2022 18:49:04 -0400
Message-Id: <20221002224922.238837-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221002224922.238837-1-sashal@kernel.org>
References: <20221002224922.238837-1-sashal@kernel.org>
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
 Jack.Xiao@amd.com, Tim Huang <Tim.Huang@amd.com>,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, mukul.joshi@amd.com,
 le.ma@amd.com, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yifan Zhang <yifan1.zhang@amd.com>

[ Upstream commit 0af4ed0c329ebb4cef95fda4fcdbfcdea0255442 ]

there is only one SDMA engine in SDMA 6.0.1, the sdma_hqd_mask has to be
zeroed for the 2nd engine, otherwise MES scheduler will consider 2nd
engine exists and map/unmap SDMA queues to the non-existent engine.

Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
Reviewed-by: Tim Huang <Tim.Huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 69a70a0aaed9..6ab062c63da1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -169,6 +169,9 @@ int amdgpu_mes_init(struct amdgpu_device *adev)
 	for (i = 0; i < AMDGPU_MES_MAX_SDMA_PIPES; i++) {
 		if (adev->ip_versions[SDMA0_HWIP][0] < IP_VERSION(6, 0, 0))
 			adev->mes.sdma_hqd_mask[i] = i ? 0 : 0x3fc;
+		/* zero sdma_hqd_mask for non-existent engine */
+		else if (adev->sdma.num_instances == 1)
+			adev->mes.sdma_hqd_mask[i] = i ? 0 : 0xfc;
 		else
 			adev->mes.sdma_hqd_mask[i] = 0xfc;
 	}
-- 
2.35.1

