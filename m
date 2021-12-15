Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7AF475A49
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 15:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F6510ECFF;
	Wed, 15 Dec 2021 14:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE5610ECF8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 14:06:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 056FD618D3;
 Wed, 15 Dec 2021 14:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959A7C34604;
 Wed, 15 Dec 2021 14:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639577157;
 bh=1NuavhntQUo/VcwMMfGjnpaSHV6QBbtUfg21sOkWXoM=;
 h=From:To:Cc:Subject:Date:From;
 b=HiTkbhY7CsTUo50jbkpMqVTBPIqvuxsXgNd1VD6uOEB3qthX27PgoUzer/QZ9dy5r
 g0gzDcoUF+T4WpOwOpKPYCCXuzRbqyyzTCjVWp8bquSrTxHRG6HVNYoo2uqg2jP9lb
 g4tFnIgmw2PYrIWFHtIn7e92c5CGex02DmglizF08OK0HbLKRBN284Nkg6cQranbiU
 uvSIFkp+qmQ59VuiAoTOiIGX9W+5mEfsBLkQ67ImufLJYk58sxBcfxbG9atzkVj0tM
 +W8itCY4AaVhHM6Z+P3MP1XmM8Hus3ZLT3HvDui84JgkQTuw4ei2ZDRV7UNV3mKSjQ
 nOa2kGPo/x1lQ==
From: Arnd Bergmann <arnd@kernel.org>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Martin Krastev <krastevm@vmware.com>
Subject: [PATCH] drm/vmwgfx: fix size_t format string
Date: Wed, 15 Dec 2021 15:05:40 +0100
Message-Id: <20211215140552.581719-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

On architectures with size_t different from 'unsigned long', gcc
prints this warning:

drivers/gpu/drm/vmwgfx/vmwgfx_gem.c: In function 'vmw_bo_print_info':
drivers/gpu/drm/vmwgfx/vmwgfx_gem.c:230:40: error: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
  230 |         seq_printf(m, "\t\t0x%08x: %12ld bytes %s, type = %s",
      |                                    ~~~~^
      |                                        |
      |                                        long int
      |                                    %12d
  231 |                    id, bo->base.base.size, placement, type);
      |                        ~~~~~~~~~~~~~~~~~~
      |                                     |
      |                                     size_t {aka unsigned int}

Use the correct %zd modifier.

Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index c016c434b6cb..3d4d703b20a8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -227,7 +227,7 @@ static void vmw_bo_print_info(int id, struct vmw_buffer_object *bo, struct seq_f
 		break;
 	}
 
-	seq_printf(m, "\t\t0x%08x: %12ld bytes %s, type = %s",
+	seq_printf(m, "\t\t0x%08x: %12zd bytes %s, type = %s",
 		   id, bo->base.base.size, placement, type);
 	seq_printf(m, ", priority = %u, pin_count = %u, GEM refs = %d, TTM refs = %d",
 		   bo->base.priority,
-- 
2.29.2

