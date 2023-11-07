Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87717E3D14
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E330610E56B;
	Tue,  7 Nov 2023 12:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7523E10E56B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 12:25:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 91432CE0F1F;
 Tue,  7 Nov 2023 12:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC76C433CA;
 Tue,  7 Nov 2023 12:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359941;
 bh=eQZAiB8Mo/dLCEBnU+KlwvGcDAnNQIkoGJ//bbUgXE8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HtQrhWzeToQvlq/jP2IyqheJG5O3Vzg2C/1u8th3p16tEQ8ay48M0xJC7LcVfRJyv
 yRxCFNig76AhylWj4mZsLl+V2HixGAXR/kVxXLzC/GBW4pZts1eBYpkauWXhCwsCsR
 FOgMgjZJfo1nNa6WXhD3gNyQ4amaYR+9qqHMC9lBys1sM3ik5HU87k7yQWB8w7I3cu
 qAk60enPfDk1L3LC+XewKNZF7W1ac8nMKzN7t+NpxUN5HLPgbf6CX9PuKsmDoIZhVO
 kZcbD1AVZJhJRoGaakW+Xle/7Xk6xFGoYichGOMpZVhcezSeNN96F0abqRj6nATZ4Z
 uIYNPD0r1FODg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 17/37] drm: vmwgfx_surface.c: copy user-array
 safely
Date: Tue,  7 Nov 2023 07:21:28 -0500
Message-ID: <20231107122407.3760584-17-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122407.3760584-1-sashal@kernel.org>
References: <20231107122407.3760584-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
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
Cc: Sasha Levin <sashal@kernel.org>, Kees Cook <keescook@chromium.org>,
 Philipp Stanner <pstanner@redhat.com>, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philipp Stanner <pstanner@redhat.com>

[ Upstream commit 06ab64a0d836ac430c5f94669710a78aa43942cb ]

Currently, there is no overflow-check with memdup_user().

Use the new function memdup_array_user() instead of memdup_user() for
duplicating the user-space array safely.

Suggested-by: David Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230920123612.16914-7-pstanner@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 3829be282ff00..17463aeeef28f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -774,9 +774,9 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	       sizeof(metadata->mip_levels));
 	metadata->num_sizes = num_sizes;
 	metadata->sizes =
-		memdup_user((struct drm_vmw_size __user *)(unsigned long)
+		memdup_array_user((struct drm_vmw_size __user *)(unsigned long)
 			    req->size_addr,
-			    sizeof(*metadata->sizes) * metadata->num_sizes);
+			    metadata->num_sizes, sizeof(*metadata->sizes));
 	if (IS_ERR(metadata->sizes)) {
 		ret = PTR_ERR(metadata->sizes);
 		goto out_no_sizes;
-- 
2.42.0

