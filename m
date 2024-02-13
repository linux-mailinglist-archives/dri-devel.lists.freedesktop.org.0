Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B05285232C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 01:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A75D10E535;
	Tue, 13 Feb 2024 00:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EZR+0XF+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D072010E4C4;
 Tue, 13 Feb 2024 00:20:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E8115CE17DF;
 Tue, 13 Feb 2024 00:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6ABC43390;
 Tue, 13 Feb 2024 00:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707783613;
 bh=I7nRm05Rrc8jVppMcnUrwhVUzVglvFm1ffpXBh29HME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EZR+0XF+yhOfWj/+abX01ertUjH98rgl7Vjj/owQ9YNDS9A8cpRONSDdJDzFPSNoC
 9at7vZKRNXOr8MWr7xPyqOCT0DuCizXExNJD3av9qZQJhsqIsn0IKQiMYYAVwE71lq
 22ogRLQzck/R5sD1qUyj/FozXGYaXn8WoSjJ+Ld6nfjZEnvoF3Z8ROWgf5qAgSvws/
 +IXrw58J6JIcNIGj9n/p0evs2CkaYYB9PAjaSIpC9LbzonqhLmHI49fwrd5TH0YSiJ
 6IrNA8dKd9k/uWxmaAsIaYZMJa52uoUR2L3MrnJ74kv/WhY2xofj8+M+K195I+gOiA
 j9FrDRWXF3NTA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Stanley.Yang" <Stanley.Yang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.7 52/58] drm/amdgpu: Fix shared buff copy to user
Date: Mon, 12 Feb 2024 19:17:58 -0500
Message-ID: <20240213001837.668862-52-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213001837.668862-1-sashal@kernel.org>
References: <20240213001837.668862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.4
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

From: "Stanley.Yang" <Stanley.Yang@amd.com>

[ Upstream commit 2dcf82a8e8dc930655787797ef8a3692b527c7a9 ]

ta if invoke node buffer
|-------- ta type ----------|
|--------  ta id  ----------|
|-------- cmd  id ----------|
|------ shared buf len -----|
|------ shared buffer ------|

ta if invoke node buffer is as above, copy shared buffer data to correct location

Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
index 468a67b302d4..ca5c86e5f7cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c
@@ -362,7 +362,7 @@ static ssize_t ta_if_invoke_debugfs_write(struct file *fp, const char *buf, size
 		}
 	}
 
-	if (copy_to_user((char *)buf, context->mem_context.shared_buf, shared_buf_len))
+	if (copy_to_user((char *)&buf[copy_pos], context->mem_context.shared_buf, shared_buf_len))
 		ret = -EFAULT;
 
 err_free_shared_buf:
-- 
2.43.0

