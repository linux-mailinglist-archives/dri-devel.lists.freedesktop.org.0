Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A993B3D065A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 03:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7A26E49B;
	Wed, 21 Jul 2021 01:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jul 2021 01:22:44 UTC
Received: from qq.com (smtpbg556.qq.com [183.3.226.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D466E49B;
 Wed, 21 Jul 2021 01:22:44 +0000 (UTC)
X-QQ-mid: bizesmtp32t1626830092tvk0adgn
Received: from localhost.localdomain (unknown [111.207.172.18])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 21 Jul 2021 09:14:50 +0800 (CST)
X-QQ-SSF: 00400000008000209000B00A0000000
X-QQ-FEAT: vVcPbn/qd608TjkLW+lP1vQk+x9mgReMe3lNJie/TUFqAXdwnWFDlL1b/rUzE
 v5UiGTjPaQiKMAhyLt6tDbkWRI3jILrtxhGS4KYE1hHy0+lsiT0/3mFMcrdT8naRg+05Nf+
 ORhRlqb6qcKKXP+yqZ3YTYybTNRyR1zLnZlX59oUkPJYI4AsPH5WZHKJqN4YP23qTpQPxt+
 xSevRrO7x6QU4nACNnnKjvMiBmzrQ/5UcK5Ak6r4wcIiEyYNlN5gcz1elzff/87drG3dkfv
 lrGuFmm6QXalaifafG1PsmQUfJXuInD0zubOBk/vqlpyF2chewaYFpCkCLDpfJu9LXk3Zlz
 FCnrHFa
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drivers/gpu/drm/nouveau/dispnv50/headc57d.c: mark
 headc57d_olut() as static
Date: Wed, 21 Jul 2021 09:14:48 +0800
Message-Id: <20210721011448.24333-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
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
Cc: nouveau@lists.freedesktop.org, zhaoxiao <zhaoxiao@uniontech.com>,
 bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

drivers/gpu/drm/nouveau/dispnv50/headc57d.c:173:1: warning: no previous prototype for ‘headc57d_olut’ [-Wmissing-prototypes]
headc57d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)

And no header file define a prototype for this function, so we should
mark it as static.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index fd51527b56b8..bdcfd240d61c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -169,7 +169,7 @@ headc57d_olut_load(struct drm_color_lut *in, int size, void __iomem *mem)
 	writew(readw(mem - 4), mem + 4);
 }
 
-bool
+static bool
 headc57d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 {
 	if (size != 0 && size != 256 && size != 1024)
-- 
2.20.1



