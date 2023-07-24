Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1022C75E7B3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 03:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5633510E25A;
	Mon, 24 Jul 2023 01:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6176910E25A;
 Mon, 24 Jul 2023 01:33:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C452A60F99;
 Mon, 24 Jul 2023 01:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55874C43391;
 Mon, 24 Jul 2023 01:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690162390;
 bh=3qfegOLY+LWipIZ0W3y/6zKcsNnz1UzrM0r5/zgWu5U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iGrn/NAlUD6CDu+yMdGX+SMZVThbEvx+Z4KweORrK0pGMeELSu+AC0F6hngi6R1pj
 dqKv0E6KjmZbJf0j/PF3rmZ9RPDaawYE2NvtzL7bcO6YpCX/6O2vsrWTwkKfFb2RDd
 Yni7MTQ+9wIoHuryh4zT6oZiEE0RLZ26WKaPJrKSPYs5XuwWTWIQZIbWH60J96Cj3a
 QDHqAoEYNatQkPVUVg4L6LrJpglVdpmge/G38ObYyv6Lu2TCUWs4ZQpzRgpn4A9Q6b
 RbYlw5g2SMqFUZu42NThieQ7xRSpHpvTmo8FymOBtJqbO1WWQk1/uvKHZRjv7deyVd
 C9qoClREB5aEQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 23/34] drm/amdgpu: Fix potential fence
 use-after-free v2
Date: Sun, 23 Jul 2023 21:32:26 -0400
Message-Id: <20230724013238.2329166-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013238.2329166-1-sashal@kernel.org>
References: <20230724013238.2329166-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, shanzhulig <shanzhulig@gmail.com>,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: shanzhulig <shanzhulig@gmail.com>

[ Upstream commit 2e54154b9f27262efd0cb4f903cc7d5ad1fe9628 ]

fence Decrements the reference count before exiting.
Avoid Race Vulnerabilities for fence use-after-free.

v2 (chk): actually fix the use after free and not just move it.

Signed-off-by: shanzhulig <shanzhulig@gmail.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 365e3fb6a9e5b..7464054692b7c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1606,15 +1606,15 @@ static int amdgpu_cs_wait_all_fences(struct amdgpu_device *adev,
 			continue;
 
 		r = dma_fence_wait_timeout(fence, true, timeout);
+		if (r > 0 && fence->error)
+			r = fence->error;
+
 		dma_fence_put(fence);
 		if (r < 0)
 			return r;
 
 		if (r == 0)
 			break;
-
-		if (fence->error)
-			return fence->error;
 	}
 
 	memset(wait, 0, sizeof(*wait));
-- 
2.39.2

