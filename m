Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 900DC6BA143
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 22:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47C410E10D;
	Tue, 14 Mar 2023 21:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A023A10E10D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 21:14:59 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 4F3C8321205;
 Tue, 14 Mar 2023 21:14:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1678828498; bh=6g3ywjkm89D/Y4P1H9D8t5BrhWKco4zaieWt2lv5ovI=;
 h=From:To:Cc:Subject:Date:From;
 b=Y/ZbUsMGZ6dKPVOQp7CojQvXnZ/ubJjIeFHY672RJ8rtedFqzQil6mtuDfuR6qeo/
 uaH8ZSwfdC/CNKTIB7UbwesLFULlbgiM2GpXykJEIJwehQom9zTV7oanpcPWar6BKI
 0YOcdhDfg2h1rHUrSFewGiL1qAHFQrxMd2uVZP3n8db2saJeb4Y1W1tDFDjraxa8lO
 q5exOysYyMWviwoAUJAg27Qrj8m9CIVs9jAoyokjgxInWsNFVHP1QCJHGj/y9GNjg8
 Oqf+QRCcqt000zywJUJN1oT7CP55S+oPqMfjJhqsVWtFz8dEi4Frx/hyKy3VI5pWxL
 dznoCfDgEIl/g==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Fix src/dst_pitch confusion
Date: Tue, 14 Mar 2023 17:14:45 -0400
Message-Id: <20230314211445.1363828-1-zack@kde.org>
X-Mailer: git-send-email 2.38.1
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
Cc: banackm@vmware.com, Nathan Chancellor <nathan@kernel.org>,
 krastevm@vmware.com, iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

The src/dst_pitch got mixed up during the rework of the function, make
sure the offset's refer to the correct one.

Spotted by clang:
Clang warns (or errors with CONFIG_WERROR):

  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:509:29: error: variable 'dst_pitch' is uninitialized when used here [-Werror,-Wuninitialized]
          src_offset = ddirty->top * dst_pitch + ddirty->left * stdu->cpp;
                                     ^~~~~~~~~
  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:492:26: note: initialize the variable 'dst_pitch' to silence this warning
          s32 src_pitch, dst_pitch;
                                  ^
                                   = 0
  1 error generated.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1811
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Dave Airlie <airlied@gmail.com>
Fixes: 39985eea5a6d ("drm/vmwgfx: Abstract placement selection")
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index d79a6eccfaa4..ba0c0e12cfe9 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -506,11 +506,11 @@ static void vmw_stdu_bo_cpu_commit(struct vmw_kms_dirty *dirty)
 	/* Assume we are blitting from Guest (bo) to Host (display_srf) */
 	src_pitch = stdu->display_srf->metadata.base_size.width * stdu->cpp;
 	src_bo = &stdu->display_srf->res.guest_memory_bo->tbo;
-	src_offset = ddirty->top * dst_pitch + ddirty->left * stdu->cpp;
+	src_offset = ddirty->top * src_pitch + ddirty->left * stdu->cpp;
 
 	dst_pitch = ddirty->pitch;
 	dst_bo = &ddirty->buf->tbo;
-	dst_offset = ddirty->fb_top * src_pitch + ddirty->fb_left * stdu->cpp;
+	dst_offset = ddirty->fb_top * dst_pitch + ddirty->fb_left * stdu->cpp;
 
 	(void) vmw_bo_cpu_blit(dst_bo, dst_offset, dst_pitch,
 			       src_bo, src_offset, src_pitch,
-- 
2.38.1

