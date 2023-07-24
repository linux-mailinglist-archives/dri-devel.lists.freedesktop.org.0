Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8981075E69F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAAE10E23E;
	Mon, 24 Jul 2023 01:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2386610E23B;
 Mon, 24 Jul 2023 01:21:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89B1960F38;
 Mon, 24 Jul 2023 01:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0349AC433C7;
 Mon, 24 Jul 2023 01:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161693;
 bh=41akV9aCIbb+q0fXnma+2Q7+GIaQ0GcY2524wd7N22E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OjZw/+nr8hi3liKiDvGCwEoZan/qFk6yZ2I7IWhoJ/4HqkoxqE6S6p2NrrT2XezdD
 zRdJtwJlgngLuF0y3uNGaeDUIPLqYHjV6ofwiZ6PCAxmKkWuR23jcGMGzY+i0S7j1d
 89MvM4AC6P4P2VGxK6P5DOGg7DdpnFXcAK6VEbWp5S/AqHI7HZbTC2AsJxHsUugIFR
 QsvuRQO+jaFK3zRutwl2ZXGMC60bcS1Uw8IzMp8X2/IbJmRLRS5W1jPtD+d4+xVdLr
 tmiTxw1fI/dKc91nB52XeNIPF4bzMuC+DreZmTAz+fYiYkZ5uTH4mLw7gQsxGdLvB5
 0Xfcwa/LgEDqw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 04/41] drm/amdgpu: Fix integer overflow in
 amdgpu_cs_pass1
Date: Sun, 23 Jul 2023 21:20:37 -0400
Message-Id: <20230724012118.2316073-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
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
Cc: Sasha Levin <sashal@kernel.org>, Philip.Yang@amd.com,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dongchenchen2@huawei.com, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 hackyzh002 <hackyzh002@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: hackyzh002 <hackyzh002@gmail.com>

[ Upstream commit 87c2213e85bd81e4a9a4d0880c256568794ae388 ]

The type of size is unsigned int, if size is 0x40000000, there will
be an integer overflow, size will be zero after size *= sizeof(uint32_t),
will cause uninitialized memory to be referenced later.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 365e3fb6a9e5b..34a64493bfe2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -188,7 +188,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 	uint64_t *chunk_array_user;
 	uint64_t *chunk_array;
 	uint32_t uf_offset = 0;
-	unsigned int size;
+	size_t size;
 	int ret;
 	int i;
 
-- 
2.39.2

