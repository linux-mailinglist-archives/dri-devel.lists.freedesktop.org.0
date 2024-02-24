Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081768624ED
	for <lists+dri-devel@lfdr.de>; Sat, 24 Feb 2024 13:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED73410E145;
	Sat, 24 Feb 2024 12:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JWj5D/Lb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB81E10E0F5;
 Sat, 24 Feb 2024 12:15:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 018A26090C;
 Sat, 24 Feb 2024 12:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5597C433C7;
 Sat, 24 Feb 2024 12:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708776952;
 bh=oP261W1pt6YMYe8qcA9fKGIH4omThSFAKhryuBOrQu8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JWj5D/Lbhnfny8owmLC3lczUAT9S5jtD5sU8TU8QhGT26WP/1weK5cK8AHcWA5qEr
 vw/Vo5aAnO5uho3XszpE2+nui1H5lIahI6iktAdCxtURW4MTgc3+FC47zrxgJpQba4
 H+c9EJ9Y+tW7ixHzdCopIHFqSPERkhYJ0ftNSQwkcoUVYF6PK4IPMVYJBjyiRpwSpP
 T8uzMrHbYhFjn1bgKF4r1bujG3jbzogaatVPGfE2j6OOHe3x0KCtdpnIYDzWmOCT2c
 zYLL3n+T6eH/0CWXMh2GovCRMWz1efiHBxRG8DZFfVoPXB1NA7ZXcEeV4d/LN1vZN1
 bjOt1HAejD04g==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Koby Elbaz <kelbaz@habana.ai>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Dave Airlie <airlied@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: [PATCH 2/3] drm/xe/mmio: fix build warning for BAR resize on 32-bit
Date: Sat, 24 Feb 2024 13:15:00 +0100
Message-Id: <20240224121528.1972719-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240224121528.1972719-1-arnd@kernel.org>
References: <20240224121528.1972719-1-arnd@kernel.org>
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

clang complains about a nonsensical test on builds with a 32-bit phys_addr_t,
which means resizing will always fail:

drivers/gpu/drm/xe/xe_mmio.c:109:23: error: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
  109 |                     root_res->start > 0x100000000ull)
      |                     ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~

Previously, BAR resize was always disallowed on 32-bit kernels, but
this apparently changed recently. Since 32-bit machines can in theory
support PAE/LPAE for large address spaces, this may end up useful,
so change the driver to shut up the warning but still work when
phys_addr_t/resource_size_t is 64 bit wide.

Fixes: 9a6e6c14bfde ("drm/xe/mmio: Use non-atomic writeq/readq variant for 32b")
Fixes: ea97a66a2218 ("drm/xe: Disable 32bits build")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xe/xe_mmio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index e3db3a178760..7ba2477452d7 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -106,7 +106,7 @@ static void xe_resize_vram_bar(struct xe_device *xe)
 
 	pci_bus_for_each_resource(root, root_res, i) {
 		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
-		    root_res->start > 0x100000000ull)
+		    (u64)root_res->start > 0x100000000ul)
 			break;
 	}
 
-- 
2.39.2

