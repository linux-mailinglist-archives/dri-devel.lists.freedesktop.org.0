Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FA3BCBDB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A986E0AA;
	Tue,  6 Jul 2021 11:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901076E0C1;
 Tue,  6 Jul 2021 11:15:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A51FD61C4E;
 Tue,  6 Jul 2021 11:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570141;
 bh=FGDvieCdZUvRXaq+SoPPGIBddDqrEwFMckzntCzx+sA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uGbl7yOH7OOaiMD9lHJ7AS75jWZcdOo7eXmNnGg16SHQ5b7ky8u/+qxma2fZsG8m+
 uYxZhVaySO8nN+M6BUrVbCeZ20MQKlY9c6KwPJk61laJtgrpEksCUoGMrUiUB0XXlZ
 fTW4KKxAzphtCt1ba6jUysVLtZYuWy25T9eKNV2D0Wpch8X7G6XwxYn5xXs4YOdThz
 7I+2Ge+qAKLFEr/6c7MWnyOJXuNIIGtSN4loCH1gWlLwjxCjtzRNTo56S3y567so+t
 OQLJiL7Ig+urNgJW8+bvhSAh4AaLLg1r3P9DYpLMrnfrNrjvTMCXL3MX+ckeGJlPdH
 MVjkxzv+hmz8g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 066/189] drm/amdgpu: fix metadata_size for ubo
 ioctl queries
Date: Tue,  6 Jul 2021 07:12:06 -0400
Message-Id: <20210706111409.2058071-66-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Shiwu Zhang <shiwu.zhang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Shiwu Zhang <shiwu.zhang@amd.com>

[ Upstream commit eba98523724be7ad3539f2c975de1527e0c99dd6 ]

Although the kfd_ioctl_get_dmabuf_info() still fail it will indicate
the caller right metadat_size useful for the same kfd ioctl next time.

Signed-off-by: Shiwu Zhang <shiwu.zhang@amd.com>
Reviewed-by: Nirmoy Das <nirmoy.das@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index f9434bc2f9b2..db00de33caa3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1246,6 +1246,9 @@ int amdgpu_bo_get_metadata(struct amdgpu_bo *bo, void *buffer,
 
 	BUG_ON(bo->tbo.type == ttm_bo_type_kernel);
 	ubo = to_amdgpu_bo_user(bo);
+	if (metadata_size)
+		*metadata_size = ubo->metadata_size;
+
 	if (buffer) {
 		if (buffer_size < ubo->metadata_size)
 			return -EINVAL;
@@ -1254,8 +1257,6 @@ int amdgpu_bo_get_metadata(struct amdgpu_bo *bo, void *buffer,
 			memcpy(buffer, ubo->metadata, ubo->metadata_size);
 	}
 
-	if (metadata_size)
-		*metadata_size = ubo->metadata_size;
 	if (flags)
 		*flags = ubo->metadata_flags;
 
-- 
2.30.2

