Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E5AAA9FE5
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E1410E497;
	Mon,  5 May 2025 22:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h4VXfLA4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2529810E495;
 Mon,  5 May 2025 22:29:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 57C2843691;
 Mon,  5 May 2025 22:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD17C4CEED;
 Mon,  5 May 2025 22:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484162;
 bh=9MDdimvpyVuizF6v+LsY4x+G/eT4yF+NtSq6Tll17AQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h4VXfLA4/2wM53s44F9ev9TJXcCnG3KlRF7VHApDOn8+cNxZqZgZHIyfgh47g17ha
 yJEGJ8I1k3mpT4uDkSFUUCSvB0f0c95etIKGjRhO0Z5MGISScm67C26oWn0dT1Xg5E
 spmRdzZZhXapBPYpLvMIvy+D3iq5NTiAQ0k0egg7OCR34Wyt010I9eariZ7kaQiAKI
 oOx0ukCwshlNTXhbu/wD6AKbaVtfAFVe379C+K+XnxD0OoObHjpPYSRcNrsKKSXUpK
 exjkYMuj7NiDsJ9wPPCwgjPEGmgDvEzeiL8Rg8NoWjaTKua22YkbpiPVRvtf0pTbxl
 +P9jL0Ekc2qbg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lijo Lazar <lijo.lazar@amd.com>, Asad Kamal <asad.kamal@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 kenneth.feng@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sunil.khatri@amd.com, boyuan.zhang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 383/642] drm/amd/pm: Fetch current power limit
 from PMFW
Date: Mon,  5 May 2025 18:09:59 -0400
Message-Id: <20250505221419.2672473-383-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit b2a9e562dfa156bd53e62ce571f3f8f65d243f14 ]

On SMU v13.0.12, always query the firmware to get the current power
limit as it could be updated through other means also.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Asad Kamal <asad.kamal@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index ed9dac00ebfb1..f3f5b7dd15ccc 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -2802,6 +2802,7 @@ int smu_get_power_limit(void *handle,
 			switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
 			case IP_VERSION(13, 0, 2):
 			case IP_VERSION(13, 0, 6):
+			case IP_VERSION(13, 0, 12):
 			case IP_VERSION(13, 0, 14):
 			case IP_VERSION(11, 0, 7):
 			case IP_VERSION(11, 0, 11):
-- 
2.39.5

