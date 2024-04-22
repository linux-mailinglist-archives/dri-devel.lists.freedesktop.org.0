Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985548AD970
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 01:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7455010FBFA;
	Mon, 22 Apr 2024 23:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iE5aiybu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0639110F94C;
 Mon, 22 Apr 2024 23:54:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BAD2C611EB;
 Mon, 22 Apr 2024 23:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF78DC113CC;
 Mon, 22 Apr 2024 23:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713830070;
 bh=ZRTOCKMpkWvx3OoM+8EFdF+tjxpKDAQCkOieDMhcp0c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iE5aiybuhHaCpnF0AJgY+OS/eXFH2ekSFNcTgyXwDgFPr6tr+2c10n8o7CZu7Zxr3
 FQeyND3QQmO/ZV6vrFgQwg0iKyPANHtwiIW5FqKJUNWWCv/2zqxypftNT3f8JcLGLp
 yuaxG7bbGKLaeAJ+I75zp2x82roHw3AfDelB7rmdlWhGNAry2C3/Glj9+C9E/ZyUx3
 WIfoiGtkbpejTeADYiE/4SXcOcYDKTduI+DGxWuc3hwjQdFd/iSHBrk/ORZYqwXm+W
 Me0aMPM0sDjyKxQQ2xC+0OakKnVPGqIreIsAS0CkNSf2+GlvHrAnwH7a4/sO5s5qaZ
 rG1gzcrj0jfdA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Danilo Krummrich <dakr@redhat.com>,
 Sasha Levin <sashal@kernel.org>, kherbst@redhat.com, lyude@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, airlied@redhat.com, bskeggs@redhat.com,
 ttabi@nvidia.com, dan.carpenter@linaro.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 13/43] nouveau/gsp: Avoid addressing beyond end of
 rpc->entries
Date: Mon, 22 Apr 2024 19:13:59 -0400
Message-ID: <20240422231521.1592991-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231521.1592991-1-sashal@kernel.org>
References: <20240422231521.1592991-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.7
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

From: Kees Cook <keescook@chromium.org>

[ Upstream commit 838ae9f45c4e43b4633d8b0ad1fbedff9ecf177d ]

Using the end of rpc->entries[] for addressing runs into both compile-time
and run-time detection of accessing beyond the end of the array. Use the
base pointer instead, since was allocated with the additional bytes for
storing the strings. Avoids the following warning in future GCC releases
with support for __counted_by:

In function 'fortify_memcpy_chk',
    inlined from 'r535_gsp_rpc_set_registry' at ../drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1123:3:
../include/linux/fortify-string.h:553:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
  553 |                         __write_overflow_field(p_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

for this code:

	strings = (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
	...
                memcpy(strings, r535_registry_entries[i].name, name_len);

Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240330141159.work.063-kees@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index a73a5b5897904..dcafbb2004ca2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1112,7 +1112,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 	rpc->numEntries = NV_GSP_REG_NUM_ENTRIES;
 
 	str_offset = offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
-	strings = (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
+	strings = (char *)rpc + str_offset;
 	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
 		int name_len = strlen(r535_registry_entries[i].name) + 1;
 
-- 
2.43.0

