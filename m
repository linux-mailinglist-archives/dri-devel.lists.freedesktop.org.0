Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C656AD3211
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 11:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AD710E4CA;
	Tue, 10 Jun 2025 09:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oDj5OPeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBA710E4C8;
 Tue, 10 Jun 2025 09:31:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 92536A50FD2;
 Tue, 10 Jun 2025 09:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CD7C4CEED;
 Tue, 10 Jun 2025 09:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749547891;
 bh=BO97OAsXfqwgbvY0qB23trz3Pz5fZ7baV/z18Q+sb08=;
 h=From:To:Cc:Subject:Date:From;
 b=oDj5OPeLTOFcf0lt91d44gt25Q8AcRpd+Oo2/BmAXQb43RYIF4uNEcTO/0xyOd14q
 k/+5qVX72XAzp/PF9G5XWDmCydbl/O3Y4GQhyvKaJnYdSwVN6/q/zX+BJhQ69MIOBa
 gygex0aNnTwmLcCjJb/2K89AQouE6PZWuUFBErR1gD4G6O99Cn2v3bUobGtRs+aaYD
 so3eoflcorpSX7m+phyhHlWDm3/6AncLav0598+QJ/crj/KGaMVIY7G/23EV5e9H5I
 T8ayfw6e2DaY7nRCofVNM2tdsr+mUUrAaLA3xfsfmgoFoN4vqLDoAH7I7cutS4iGBd
 aT2VH3LnWqQDQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: [PATCH] drm/radeon: reduce stack frame size for radeon_cs_ioctl
Date: Tue, 10 Jun 2025 11:31:20 +0200
Message-Id: <20250610093125.2645138-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

Clang inlines radeon_cs_parser_relocs() into radeon_cs_ioctl(), and
since both of these use a lot of stack space, the sum of them can
make it exceed a limit of 1280 bytes:

drivers/gpu/drm/radeon/radeon_cs.c:669:5: error: stack frame size (1328) exceeds limit (1280) in 'radeon_cs_ioctl' [-Werror,-Wframe-larger-than]
  669 | int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
      |     ^

Mark radeon_cs_parser_relocs as noinline_for_stack, so clang and gcc
both behave in a consistent way. Calling into radeon_cs_parser_relocs()
still uses a lot of stack space here, but this is not any worse than it
already was, and the other code paths are better now.

Fixes: c9b76548899c ("drm/radeon: validate relocations in the order determined by userspace v3")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/radeon/radeon_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index b8e6202f1d5b..220a9b107b15 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -78,7 +78,7 @@ static void radeon_cs_buckets_get_list(struct radeon_cs_buckets *b,
 	}
 }
 
-static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
+static noinline_for_stack int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
 {
 	struct radeon_cs_chunk *chunk;
 	struct radeon_cs_buckets buckets;
-- 
2.39.5

