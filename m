Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97A17DAF11
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 23:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F0C10E19B;
	Sun, 29 Oct 2023 22:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA50E10E19B
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 22:56:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 48654B80707;
 Sun, 29 Oct 2023 22:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1DB1C433CD;
 Sun, 29 Oct 2023 22:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698620160;
 bh=dOPID+WAHBe+1C/wlvaKW7GPyApeXN5OKVtbv1qYIlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vFuZdiuAz1Hq8npp/tH4kf8nmRYWDbNqDr8r9bk2prj6YiAbQJHyJpvnnxOynheIx
 SzPEAn1xOvL/7UP9N31bTWhq3bikvFR75GDalHPxTgPzsMU8O2PfHpqOOoFvuHyv9g
 fn+p9RwgCLjjzXMhANVh8E/ba8197MGv31Q9b0JL2iBDI2EAYYEMFOOQBX1B+3Dpvy
 TGIcvCQhfxVoTxmkDYsvkuJtbeptWO6QcatVYTLsWX68Va3kXCj5QuMKps97DOfzvS
 1odL9ycYNu1CjjmPLCbbGTyZEy3eCC2Qew7wOALSgZhuJnrW2sFshWsOMEfru1MgrD
 hIYOop/UUk+Lw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 34/52] fbdev: core: cfbcopyarea: fix sloppy typing
Date: Sun, 29 Oct 2023 18:53:21 -0400
Message-ID: <20231029225441.789781-34-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225441.789781-1-sashal@kernel.org>
References: <20231029225441.789781-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.9
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sergey Shtylyov <s.shtylyov@omp.ru>

[ Upstream commit 7f33df94cf0156f64eee9509bd9b4a178990f613 ]

In cfb_copyarea(), the local variable bits_per_line is needlessly typed as
*unsigned long* -- which is a 32-bit type on the 32-bit arches and a 64-bit
type on the 64-bit arches; that variable's value is derived from the __u32
typed fb_fix_screeninfo::line_length field (multiplied by 8u) and a 32-bit
*unsigned int* type should still be enough to store the # of bits per line.

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/cfbcopyarea.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fbdev/core/cfbcopyarea.c
index 6d4bfeecee350..5b80bf3dae504 100644
--- a/drivers/video/fbdev/core/cfbcopyarea.c
+++ b/drivers/video/fbdev/core/cfbcopyarea.c
@@ -382,7 +382,7 @@ void cfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
 {
 	u32 dx = area->dx, dy = area->dy, sx = area->sx, sy = area->sy;
 	u32 height = area->height, width = area->width;
-	unsigned long const bits_per_line = p->fix.line_length*8u;
+	unsigned int const bits_per_line = p->fix.line_length * 8u;
 	unsigned long __iomem *base = NULL;
 	int bits = BITS_PER_LONG, bytes = bits >> 3;
 	unsigned dst_idx = 0, src_idx = 0, rev_copy = 0;
-- 
2.42.0

