Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F1B75E717
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE7B10E255;
	Mon, 24 Jul 2023 01:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3488010E254;
 Mon, 24 Jul 2023 01:24:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A88B360F1E;
 Mon, 24 Jul 2023 01:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347ADC433C8;
 Mon, 24 Jul 2023 01:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161885;
 bh=T+tujTlYgCr4xKkLoQPAvpKPf5wbbmQ4H/brt6yWGlU=;
 h=From:To:Cc:Subject:Date:From;
 b=NGdGPRXCqSO0T3JdPm6FQ3FbjBkM6vO57jKwvRS876f04jyUwLUx0k0pegznuaLdd
 SvzJBmYqESp5/YV30IXjyjH/ZoJaZpEQFgAHN4t/Aux9wD1q4EugE3hs9jhYVsuTcf
 kZB9L6j6WoVnB79QNmVlpFcQ8QKTpsds9uCSTLarXASsKkf48oPmrOD+IT3ma7eCmJ
 3N+4ntI+lR4F0N/k4l54f3R9UYud1JCGzoYNQzJUejD1RpY96iXiiEKIoMMKETqsKV
 BnyDm3JgY9qytO5A4f7LxZtrV9dFpNZTMX3fSJ/wgL91uNzpEy/D3sDOWQ1Eryp0NW
 7w+npTyv6rxHA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 01/12] drm/radeon: Fix integer overflow in
 radeon_cs_parser_init
Date: Sun, 23 Jul 2023 21:24:19 -0400
Message-Id: <20230724012442.2317868-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.249
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, hackyzh002 <hackyzh002@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: hackyzh002 <hackyzh002@gmail.com>

[ Upstream commit f828b681d0cd566f86351c0b913e6cb6ed8c7b9c ]

The type of size is unsigned, if size is 0x40000000, there will be an
integer overflow, size will be zero after size *= sizeof(uint32_t),
will cause uninitialized memory to be referenced later

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_cs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 7b54606783821..ba64dad1d7c9e 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -271,7 +271,8 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 {
 	struct drm_radeon_cs *cs = data;
 	uint64_t *chunk_array_ptr;
-	unsigned size, i;
+	u64 size;
+	unsigned i;
 	u32 ring = RADEON_CS_RING_GFX;
 	s32 priority = 0;
 
-- 
2.39.2

