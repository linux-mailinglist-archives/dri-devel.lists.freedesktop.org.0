Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274F69439F1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F72C10E6D0;
	Thu,  1 Aug 2024 00:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rCWbA8v2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F321910E6A6;
 Thu,  1 Aug 2024 00:08:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5D7E66265B;
 Thu,  1 Aug 2024 00:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E21FC4AF0F;
 Thu,  1 Aug 2024 00:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722470930;
 bh=iUrRRL7mz7ujbO+O1A61PnTruGlIHpHZ+70IF0VySGU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rCWbA8v2+rjZ6gLQ8CXZ9bLvXqTC/z1Rt3G+HBzeA9ehEtMR5NkgSTxmwMZ8QgvBr
 BpqJIQOxUiXYGuhATXKT0v9i2ac/cvjP/nCIsJpqUe4R2UrKIVCUt5vruDh5ojbId3
 xwkVNuWQY8nUSzpf89/0ORarP/gmZJDwDjgRLxxjTh/DgfumvTw4w/VmHxLMY3UAKU
 2zRoiyZta3iQzzsU3aUcwSbo1S8YqxSTSIQ6rHjZCKkTNogsD5IPsGdOQvX3JobNwO
 0XlrjR77FEYOWC73cBlR7/ZtbZaZ4fgQlLZfUxN3XxSlExeUIYDv5WSG4u3uNUqFAZ
 sF55z2ZJ83JGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tim Huang <Tim.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Jun.Ma2@amd.com, vitaly.prosyak@amd.com,
 hannes@cmpxchg.org, friedrich.vock@gmx.de, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 003/121] drm/amdgpu: fix overflowed array index
 read warning
Date: Wed, 31 Jul 2024 19:59:01 -0400
Message-ID: <20240801000834.3930818-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Tim Huang <Tim.Huang@amd.com>

[ Upstream commit ebbc2ada5c636a6a63d8316a3408753768f5aa9f ]

Clear overflowed array index read warning by cast operation.

Signed-off-by: Tim Huang <Tim.Huang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 06f0a6534a94f..15c2406564700 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -473,8 +473,9 @@ static ssize_t amdgpu_debugfs_ring_read(struct file *f, char __user *buf,
 					size_t size, loff_t *pos)
 {
 	struct amdgpu_ring *ring = file_inode(f)->i_private;
-	int r, i;
 	uint32_t value, result, early[3];
+	loff_t i;
+	int r;
 
 	if (*pos & 3 || size & 3)
 		return -EINVAL;
-- 
2.43.0

