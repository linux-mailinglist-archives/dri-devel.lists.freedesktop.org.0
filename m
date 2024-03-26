Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36388C5DC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 15:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D10A10EABD;
	Tue, 26 Mar 2024 14:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O7s4j7g+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F5910EABD;
 Tue, 26 Mar 2024 14:52:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA46361007;
 Tue, 26 Mar 2024 14:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD7DC433F1;
 Tue, 26 Mar 2024 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711464768;
 bh=+QNmHJ+DrxUP3Ae2C2ybzUy3wAJstrkccZk3eUunkcQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O7s4j7g+hf00jrCuUCPg5dUwHZQdGcu1Fy2VlNvtZPLtQx55NwqBTGciplojuqlTP
 Vz7fAq8BYbpKi3Rx1Wt39zbMeeHint8AlIov3mYJnPQaBsbRLCg5oyzT93knxGzDUs
 b62vy4vxsJRLIJx777mKK/sqiNoT+oIfTeRqIwoG4wv0//tmMCc6IKBH6UlXNGIL1r
 kIr/jrPIPHVGUm/PP/WEH3CPp7DKTONJ5qWl8+nvgnBUCfmIjEGsaMtGpV8g7CE9GC
 kh46CJzp83yX/NiabyiQ3Uuj8hHGMKhrtsMiJjp+pqmteinvFcpkZOuyGi8lMRbTTo
 lD3pcAoEUjMcA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH 06/12] nouveau: fix function cast warning
Date: Tue, 26 Mar 2024 15:51:31 +0100
Message-Id: <20240326145140.3257163-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240326144741.3094687-1-arnd@kernel.org>
References: <20240326144741.3094687-1-arnd@kernel.org>
MIME-Version: 1.0
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

From: Arnd Bergmann <arnd@arndb.de>

Calling a function through an incompatible pointer type causes breaks
kcfi, so clang warns about the assignment:

drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c:73:10: error: cast from 'void (*)(const void *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
   73 |         .fini = (void(*)(void *))kfree,

Avoid this with a trivial wrapper.

Fixes: c39f472e9f14 ("drm/nouveau: remove symlinks, move core/ to nvkm/ (no code changes)")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c
index 4bf486b57101..0dbcc23305f3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c
@@ -66,11 +66,16 @@ of_init(struct nvkm_bios *bios, const char *name)
 	return ERR_PTR(-EINVAL);
 }
 
+static void of_fini(void *p)
+{
+	return kfree(p);
+}
+
 const struct nvbios_source
 nvbios_of = {
 	.name = "OpenFirmware",
 	.init = of_init,
-	.fini = (void(*)(void *))kfree,
+	.fini = of_fini,
 	.read = of_read,
 	.size = of_size,
 	.rw = false,
-- 
2.39.2

