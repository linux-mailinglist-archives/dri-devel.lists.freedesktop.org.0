Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC8E7E3DA1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3EB10E5A3;
	Tue,  7 Nov 2023 12:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E9B10E5AF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 12:30:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BBAF6611E0;
 Tue,  7 Nov 2023 12:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FD0C433C9;
 Tue,  7 Nov 2023 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699360201;
 bh=oEW4teOA0IO0tNyBhZ2GCZBK0Z+6b+0Q+RkNcTqwzwo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lDvPj5tI+kZfWlN8PJHjDRENEuEV+e3KjCG9jgdYU2arLupqalMd3nssTMwO83VlB
 jlNaoIoHJ1uO4nYPEdv1ChylKoHfRQ9TUxtGbmKBJUbP2EPMKf9PJMtifVEZDlMjF7
 RUkimIe7rNyR3DyyIoPCugFBT4OV0v+D3wn9X4E954PYeuhkG+vkklzyB8Xz8ngQNQ
 l/Yl0+sxSdRpRqSrmfbp9BRsp3+yxQVkZJA85NYd4SD+mLKl2T5p11szpBmWXPuL4r
 fYNWD4CuwCDPusz6svqt64I9qZq5yYviu4tC3iyPcmwO6nvGuRYH/cBsllMmNqHXkc
 cbSAnCIHjWjRQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 07/20] drm: vmwgfx_surface.c: copy user-array
 safely
Date: Tue,  7 Nov 2023 07:29:01 -0500
Message-ID: <20231107122940.3762228-7-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122940.3762228-1-sashal@kernel.org>
References: <20231107122940.3762228-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.137
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
index 5d53a5f9d1237..872af7d4b3fc9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -807,9 +807,9 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	metadata->num_sizes = num_sizes;
 	user_srf->size = size;
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

