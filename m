Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F2470F65
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 01:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CD010E2B1;
	Sat, 11 Dec 2021 00:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFB810E2B1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 00:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Ggz87hFziXlCZUJuyehYGdwi+FztQdC7fGKcUudu1UU=; b=X3KlkOavsHzhCTs7O+1C+rtoK8
 9TokGztQBeYv6bbbJRKtkTDU2zqQsxZZmzDBEPEZPSH/svGcP10oAqP7LY8av1AbHMYCM17lli0+P
 d3ntRuTZYcKhL+f7yxvJDcQYg5DxfK7+LgL4rmRQYj3HtBx6g2kNnXKlD3FfgwJVh1K3feYUQDsM1
 dUdfpmukVNTdJevYh+OHFDjlqiv92nKOVcVl5cZgaue/JdMFZuvJj0Sfg7h8ifAKpNFtCKhcNHYBj
 ST3wIwd2vP7cDUQH43G41ryhtJTnh/Czk0IkgLg/3W7r3Ti/wBXTOU3MJc1p/zUKP4k0TxzilStLY
 Vk+qZyQQ==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvq9V-004La3-8j; Sat, 11 Dec 2021 00:22:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] drm/vmwgfx: use %zu to print size_t
Date: Fri, 10 Dec 2021 16:22:12 -0800
Message-Id: <20211211002212.31408-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, Martin Krastev <krastevm@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prevent a build format warning by using the correct format specifier
to print size_t data.

Fixes this build warning:

../drivers/gpu/drm/vmwgfx/vmwgfx_gem.c:230:33: warning: format ‘%ld’ expects argument of type ‘long int’, but argument 4 has type ‘size_t {aka unsigned int}’ [-Wformat=]

Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Zack Rusin <zackr@vmware.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Martin Krastev <krastevm@vmware.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- next-2021-1210.orig/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ next-2021-1210/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -227,7 +227,7 @@ static void vmw_bo_print_info(int id, st
 		break;
 	}
 
-	seq_printf(m, "\t\t0x%08x: %12ld bytes %s, type = %s",
+	seq_printf(m, "\t\t0x%08x: %12zu bytes %s, type = %s",
 		   id, bo->base.base.size, placement, type);
 	seq_printf(m, ", priority = %u, pin_count = %u, GEM refs = %d, TTM refs = %d",
 		   bo->base.priority,
