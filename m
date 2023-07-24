Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ABC75E60E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F29010E21C;
	Mon, 24 Jul 2023 01:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5CF10E21B;
 Mon, 24 Jul 2023 01:14:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E98F560EFC;
 Mon, 24 Jul 2023 01:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D8FC433C8;
 Mon, 24 Jul 2023 01:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161239;
 bh=VP7xfuHDmq0OQ+Wm2bMJRWf/CZ8k3F9XkTXxs9Z2R3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g7QiEpW7Y/mG3sF3R0g3ad/KjghsgZip87VJQhLChaEs67CpUO6yOadLnE/gQ6KIA
 N6Njr4lgb9ohQX29LMe6Cps4De5wJZFvTyY4NkzgBRoZxQPEiq/Ibl5h5nrCs8ILVw
 qfWKKXWGPCawL7KIlzONUAl0ZFQvBsNjjLHuVbn/AOOINhruK12bXNMW7r2NUiursg
 lyCkx6wqcWaJXuhfxMTQOs/GYQtvwlRoVjcr6ZOR/M1evLs3ZVXNPdohCJzxI6dOjc
 BeLHExOXd5JzVmSBSN3YBp9h8okfnVzJCO7Qm0OMnLPWlDrV50fHDEzirioAwrHJrL
 dQxmDekkJmgww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 06/58] drm/amdgpu: Fix integer overflow in
 amdgpu_cs_pass1
Date: Sun, 23 Jul 2023 21:12:34 -0400
Message-Id: <20230724011338.2298062-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724011338.2298062-1-sashal@kernel.org>
References: <20230724011338.2298062-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
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
Cc: Sasha Levin <sashal@kernel.org>, Philip.Yang@amd.com, guchun.chen@amd.com,
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
index 2eb2c66843a88..d3b7148a4e30f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -192,7 +192,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 	uint64_t *chunk_array_user;
 	uint64_t *chunk_array;
 	uint32_t uf_offset = 0;
-	unsigned int size;
+	size_t size;
 	int ret;
 	int i;
 
-- 
2.39.2

