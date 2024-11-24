Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2809D7097
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D27B10E4E4;
	Sun, 24 Nov 2024 13:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FmTP4TzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C23210E4E5;
 Sun, 24 Nov 2024 13:36:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 419275C55D4;
 Sun, 24 Nov 2024 13:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BDAC4CECC;
 Sun, 24 Nov 2024 13:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455402;
 bh=z3R85XMXdBMEexlHujvlKrzPqhHlDK76LHTEer4GGh0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FmTP4TzNa8doY4TBk7xIRtpS/x3Qgcx/xTvU6g3MiCm1vIX6+QBtsf18d2vPm/kdO
 1oi3FgHuPVGT32dAI3av/ComgWJnOP69oTvgM3aC6IEAEdrqkLsu1lnmBbKSUhF+zg
 KbYKjs5CWm9mCxn1TCFmHYIvaVasZ5QIFzpu1B3bhQixR3g3nffY7lwyYTBaN3FBNs
 ai9nZ59czxWw9hOOQA+iVJmyR4gu8+D443+7YbN13RDt+wQlCS73+uxhZQVjajSBKw
 pCSJZiEnwXGfcfT2hR5+Sdo+DjJKagB8EHvGP8T5FrIXGL+BnHxtrq9AzXBJsn7PlR
 0mQ30zxU6ClxQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Prike Liang <Prike.Liang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, mario.limonciello@amd.com, antonio@mandelbit.com,
 Jun.Ma2@amd.com, sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 062/107] drm/amdgpu: Dereference the ATCS ACPI
 buffer
Date: Sun, 24 Nov 2024 08:29:22 -0500
Message-ID: <20241124133301.3341829-62-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Prike Liang <Prike.Liang@amd.com>

[ Upstream commit 32e7ee293ff476c67b51be006e986021967bc525 ]

Need to dereference the atcs acpi buffer after
the method is executed, otherwise it will result in
a memory leak.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 7dd55ed57c1d9..b8d4e07d2043e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -800,6 +800,7 @@ int amdgpu_acpi_power_shift_control(struct amdgpu_device *adev,
 		return -EIO;
 	}
 
+	kfree(info);
 	return 0;
 }
 
-- 
2.43.0

