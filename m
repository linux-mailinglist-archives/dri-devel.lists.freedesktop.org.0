Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E567A85DD9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA72110EBA3;
	Fri, 11 Apr 2025 12:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BO8//cLj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6E110EBA2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 12:56:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59E8F68461;
 Fri, 11 Apr 2025 12:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7C9C4CEE2;
 Fri, 11 Apr 2025 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744376159;
 bh=J8M4JFYmx01LcRK9HJDdbXvbwf2HzJiX3Z3XXtkSQr8=;
 h=From:To:Cc:Subject:Date:From;
 b=BO8//cLjkefWqDPBaOYYzaBs71e92+rxyxiFbhI/6h3L9sOghR9Txdhd+SmP5Xt+u
 d+F5LUAM1gllmAdwOTybG7XaOggqi+Sd6r2IvfkdL4qny08kF/+5SU9OQ05jNl5WTt
 BtdaIjXaLNC0xv53CxHRDBWZ/4xPPxah3fktyXJV5NuJQ1ESzbJHh7zdJGdf1BnhEm
 S+GaK3iBO3zLyezJdKzE74bOZailuhsriasp+sPbRZrWW3REfwmvXSECP0Yr1avZf8
 0t8Vl/elrc7yWxWD8NgEDXBZKT4r+0VWP0lN+ZHlSL2mrLcP414MQtzuFqbqqHmbx8
 ZlI+SAN9h7M0g==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: [PATCH] drm/efidrm: ensure screen_base is initialized
Date: Fri, 11 Apr 2025 14:55:47 +0200
Message-Id: <20250411125554.1453825-1-arnd@kernel.org>
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

clang points out that there is a code path that leads to undefined behavior:

drivers/gpu/drm/sysfb/efidrm.c:353:11: error: variable 'screen_base' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
  353 |         else if (mem_flags & EFI_MEMORY_WB)
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~

Add the missing initialization.

Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/sysfb/efidrm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index af90064a4c04..85fc37c1e87a 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -353,6 +353,9 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 	else if (mem_flags & EFI_MEMORY_WB)
 		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
 					    MEMREMAP_WB);
+	else
+		screen_base = NULL;
+
 	if (!screen_base)
 		return ERR_PTR(-ENOMEM);
 	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
-- 
2.39.5

