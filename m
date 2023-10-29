Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7D27DB011
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 00:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D408810E1D1;
	Sun, 29 Oct 2023 23:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B2410E1CE
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 23:02:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AB689CE1273;
 Sun, 29 Oct 2023 23:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5E1C116AF;
 Sun, 29 Oct 2023 23:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698620549;
 bh=dOPID+WAHBe+1C/wlvaKW7GPyApeXN5OKVtbv1qYIlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CyZibTiUniANKWXnrqhPdZpP7yfU/yaRfztNXmRx9IdtRnqF2sid2+HtfkdHEOiMd
 QGpiXMS+HhCxRSK4zZUbGIW+yEfA+u60OSLDcqVLn+nUKXRYgDjUNzGSSinknklYB9
 pLPfhhsgTHiwI3EktPPjGXsqq0aLGxCynRRAzGQh4ZaJQ0ZjBpwJDSvXrkaPn3Dit1
 B/4As/RCtONFfSTjhLA8vrl9TFtYPFDkui+zTbaCroNc0kE7ohLvwaDZL9MpieUBDZ
 +o3ViDBiXSyB25fpe5SwxbHuIjU/DlWYVM4d0PvUrYxyeNrxRuRnuIaIinwg11CgCt
 DicdYcp5lDjEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 08/11] fbdev: core: cfbcopyarea: fix sloppy typing
Date: Sun, 29 Oct 2023 19:01:59 -0400
Message-ID: <20231029230213.793581-8-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029230213.793581-1-sashal@kernel.org>
References: <20231029230213.793581-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.328
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

