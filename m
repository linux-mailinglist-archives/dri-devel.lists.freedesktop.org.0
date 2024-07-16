Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AE793289B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 16:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E99A10E748;
	Tue, 16 Jul 2024 14:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FbEIkrD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE7710E746;
 Tue, 16 Jul 2024 14:28:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73F2D60F80;
 Tue, 16 Jul 2024 14:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1870EC4AF0D;
 Tue, 16 Jul 2024 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721140138;
 bh=whL7mCH91MoYnM/lgeCnr4BW103X7PUAJfCwdrpcwho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FbEIkrD9g1BnlxA1fy861MzyVF7H/VrzAovirZVu3wUpArFOJq3LXwAjXX9VCsGs8
 2vwF3TOfY0Lx9GiRAKumzS7hy/gLW9+jI+tqKHEY3nehE3ZiQAEVhw2JjZ6GGtavah
 CKvvbzqJiHdiFNjlKF77V9ryg/msn48Zg/oLSRl/RjhkPhB75Fm8BR6Wl4X3SCapuE
 HEkT5Tgwv8TX3bcff3U7VjAZ6K+bNPfX8VCMN+yXX+UZtx9bqZidOG9yW4aZyBWltO
 Xfdq3UkYgN25Xkd06fR85FOArSoRWXdwRzyupZEp8IQumY9HTrnFMrx5o6mcNWVAWd
 gxncLWP5OJMvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 11/15] drm/radeon: check bo_va->bo is non-NULL
 before using it
Date: Tue, 16 Jul 2024 10:28:08 -0400
Message-ID: <20240716142825.2713416-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716142825.2713416-1-sashal@kernel.org>
References: <20240716142825.2713416-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.99
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

From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

[ Upstream commit 6fb15dcbcf4f212930350eaee174bb60ed40a536 ]

The call to radeon_vm_clear_freed might clear bo_va->bo, so
we have to check it before dereferencing it.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 75d79c3110389..3388a3d21d2c0 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -657,7 +657,7 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
 	if (r)
 		goto error_unlock;
 
-	if (bo_va->it.start)
+	if (bo_va->it.start && bo_va->bo)
 		r = radeon_vm_bo_update(rdev, bo_va, bo_va->bo->tbo.resource);
 
 error_unlock:
-- 
2.43.0

