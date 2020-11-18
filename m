Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F372B8D59
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC49B6E560;
	Thu, 19 Nov 2020 08:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191C16E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 11:13:38 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 276954E1771;
 Wed, 18 Nov 2020 19:13:34 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: use min_t to replace min
Date: Wed, 18 Nov 2020 03:13:27 -0800
Message-Id: <20201118111327.105071-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQ0tMHk0dQx5CQhhNVkpNS05NQkNLSk9PT0tVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Phg6MSo5Tz8tLw4vPxMYVh4O
 PzIaFC9VSlVKTUtOTUJDS0pOS0tLVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSUtDSjcG
X-HM-Tid: 0a75db0f4c5b9376kuws276954e1771
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use min_t to replace min, min_t is a bit fast because min use
twice typeof.
This patch also fix check_patch.pl warning:
WARNING: min() should probably be min_t(unsigned long, num_pages,
VMW_PPN_PER_REMAP)
+unsigned long nr = min(num_pages, (unsigned long)
VMW_PPN_PER_REMAP);

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c
index 83c0d5a3e4fd..b8f6fe1a71e6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c
@@ -72,7 +72,7 @@ static int vmw_gmr2_bind(struct vmw_private *dev_priv,
 		SVGA_REMAP_GMR2_PPN64 : SVGA_REMAP_GMR2_PPN32;
 
 	while (num_pages > 0) {
-		unsigned long nr = min(num_pages, (unsigned long)VMW_PPN_PER_REMAP);
+		unsigned long nr = min_t((unsigned long), num_pages, VMW_PPN_PER_REMAP);
 
 		remap_cmd.offsetPages = remap_pos;
 		remap_cmd.numPages = nr;
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
