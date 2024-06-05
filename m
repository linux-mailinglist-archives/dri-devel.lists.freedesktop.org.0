Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8302E8FCB87
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 14:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F381210E332;
	Wed,  5 Jun 2024 12:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lpoiUwcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703C210E332;
 Wed,  5 Jun 2024 12:02:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B7E1061879;
 Wed,  5 Jun 2024 12:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A11C4AF0C;
 Wed,  5 Jun 2024 12:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717588948;
 bh=FgrilCR7PCWlydzFzxiRwvpWlP3ziGuP2hn1K1zPjP4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lpoiUwcEd3QeCvbo8sxWtAv5NfjYRdhX9HvmGnZFBcOETw0+xrXYG378UOpv342/g
 z4KsaYyQknH5rt4W4Q1H8ze8jfFcQV5nl/jP4UORQWKD6VQMEbrqGnm8P9FDoZGOSn
 2pF05AolCec/aqAuAvSUHnBSkoNb9DcJRbYUH4myZBbkx/dvEOHy1Ge8f7N9owrse2
 mHGGs0CulGFg0+hO1KLU3+GmMMKEupZKw1QUybQkoQ683fYNuhFEHc5qyqr/FzroNW
 zvwq+3elyqSUGfpeEa9WWgo8lvn1bTVjs12llcycK6bwr4GM3hzkGDScP+mW45/R+I
 a444d9XOfAzSQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, YiPeng.Chai@amd.com, kevinyang.wang@amd.com,
 lijo.lazar@amd.com, lee@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.9 03/23] drm/amdgpu: correct hbm field in boot status
Date: Wed,  5 Jun 2024 08:01:46 -0400
Message-ID: <20240605120220.2966127-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605120220.2966127-1-sashal@kernel.org>
References: <20240605120220.2966127-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.3
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

From: Hawking Zhang <Hawking.Zhang@amd.com>

[ Upstream commit ec58991054e899c9d86f7e3c8a96cb602d4b5938 ]

hbm filed takes bit 13 and bit 14 in boot status.

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
index e0f8ce9d84406..db9cb2b4e9823 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -43,7 +43,7 @@ struct amdgpu_iv_entry;
 #define AMDGPU_RAS_GPU_ERR_HBM_BIST_TEST(x)		AMDGPU_GET_REG_FIELD(x, 7, 7)
 #define AMDGPU_RAS_GPU_ERR_SOCKET_ID(x)			AMDGPU_GET_REG_FIELD(x, 10, 8)
 #define AMDGPU_RAS_GPU_ERR_AID_ID(x)			AMDGPU_GET_REG_FIELD(x, 12, 11)
-#define AMDGPU_RAS_GPU_ERR_HBM_ID(x)			AMDGPU_GET_REG_FIELD(x, 13, 13)
+#define AMDGPU_RAS_GPU_ERR_HBM_ID(x)			AMDGPU_GET_REG_FIELD(x, 14, 13)
 #define AMDGPU_RAS_GPU_ERR_BOOT_STATUS(x)		AMDGPU_GET_REG_FIELD(x, 31, 31)
 
 #define AMDGPU_RAS_BOOT_STATUS_POLLING_LIMIT	1000
-- 
2.43.0

