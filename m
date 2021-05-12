Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8D037B8C7
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 11:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4D16EB71;
	Wed, 12 May 2021 09:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B15F6E067
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 09:02:52 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R591e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UYdpVrJ_1620810169; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UYdpVrJ_1620810169) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 12 May 2021 17:02:50 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: bernie@plugable.com
Subject: [PATCH] video: fbdev: udlfb: Remove redundant initialization of 
Date: Wed, 12 May 2021 17:02:47 +0800
Message-Id: <1620810167-89132-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: linux-fbdev@vger.kernel.org, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, clang-built-linux@googlegroups.com,
 Yang Li <yang.lee@linux.alibaba.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Integer variable 'identical' is being initialized however
this value is never read as 'identical' is assigned the result
of 'start + (width - end)'. Remove the redundant assignment.
At the same time, adjust the declarations order of variables
to keep the "upside-down x-mas tree" look of them.

Clean up clang warning:

drivers/video/fbdev/udlfb.c:370:6: warning: Value stored to 'identical'
during its initialization is never read
[clang-analyzer-deadcode.DeadStores]

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/video/fbdev/udlfb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index b9cdd02..f40dd6d8 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -363,13 +363,13 @@ static int dlfb_ops_mmap(struct fb_info *info, struct vm_area_struct *vma)
  */
 static int dlfb_trim_hline(const u8 *bback, const u8 **bfront, int *width_bytes)
 {
-	int j, k;
-	const unsigned long *back = (const unsigned long *) bback;
 	const unsigned long *front = (const unsigned long *) *bfront;
+	const unsigned long *back = (const unsigned long *) bback;
 	const int width = *width_bytes / sizeof(unsigned long);
-	int identical = width;
 	int start = width;
 	int end = width;
+	int identical;
+	int j, k;
 
 	for (j = 0; j < width; j++) {
 		if (back[j] != front[j]) {
-- 
1.8.3.1

