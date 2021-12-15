Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA414760E8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 19:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5114610F59F;
	Wed, 15 Dec 2021 18:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0DE10F57C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 18:42:05 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id A24DF29F678;
 Wed, 15 Dec 2021 18:42:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1639593723; bh=Ex+oonjAkjRO7BKVGJMQUCsWy0qFs8GiqewS6bGPD2Y=;
 h=From:To:Cc:Subject:Date:From;
 b=HW7+rZJ8Yn8neZfbT6oa2wFMC8JM37bBbHy8H0E4YNcol4hBsmHpPe07NUR21MyX4
 qGAbowFhyB9A3uadsad5TxwnwPQBgMBXP/r7vGI7CVjHjBrwO4/QTX4FaOSmB17BWa
 JwSOsxAJ6RWxoyHoO9TjOnAb1N9HpN02MlofU1gPIMOPH2N+yEVU+YFGLp4+3nA7q9
 eogEAbl5zTWjAEeHqvT1x6DWofYLnaS6Ij2Ezvi2XbWanKon1EVLw8Kle/5q5Y9pIk
 eJiI56la7VhkoWekMEJJBAEc0++ex5PsvD4NrxY5mZkJENhIyF/iXwCyXUAaLeLBRD
 GdgxA4GjsZGzQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/vmwgfx: Fix a size_t/long int format specifier
 mismatch
Date: Wed, 15 Dec 2021 13:41:45 -0500
Message-Id: <20211215184147.3688785-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, mombasawalam@vmware.com,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

On i386 size_t is of course 32bits and using long int throws warnings,
trivially fix it by using the dedicated size_t format.

This is enough to fix the following warning found by the kernel test
robot:
   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c: In function 'vmw_bo_print_info':
>> drivers/gpu/drm/vmwgfx/vmwgfx_gem.c:230:33: warning: format '%ld'
expects argument of type 'long int', but argument 4 has type 'size_t'
{aka 'unsigned int'} [-Wformat=]
     230 |  seq_printf(m, "\t\t0x%08x: %12ld bytes %s, type = %s",
         |                             ~~~~^
         |                                 |
         |                                 long int
         |                             %12d
     231 |      id, bo->base.base.size, placement, type);
         |          ~~~~~~~~~~~~~~~~~~
         |                       |

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index c016c434b6cb..ce609e7d758f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -227,7 +227,7 @@ static void vmw_bo_print_info(int id, struct vmw_buffer_object *bo, struct seq_f
 		break;
 	}
 
-	seq_printf(m, "\t\t0x%08x: %12ld bytes %s, type = %s",
+	seq_printf(m, "\t\t0x%08x: %12zu bytes %s, type = %s",
 		   id, bo->base.base.size, placement, type);
 	seq_printf(m, ", priority = %u, pin_count = %u, GEM refs = %d, TTM refs = %d",
 		   bo->base.priority,
-- 
2.32.0

