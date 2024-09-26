Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1AF98735E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 14:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999CD10E0A6;
	Thu, 26 Sep 2024 12:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="JThb5KHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id E759610EAEA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 12:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=F5vYX
 8/opjvE5wTUAnPujK6sAT6th5nnz2xNAH+qpyg=; b=JThb5KHBs/mXH7Jj2s7YN
 8Ko3Rp8ib5v4XzMqqrZM82an+1xVXRI8iasLBGXrV94khdTXPTVLCkvouxvtPvkG
 D/sOYSDQKvZxxtCvbEMU8DvsQfSo1ISNs34YeATgRordApnZ3AtuLmpDRiCsg9W3
 qu03wgAISnxHl4aEQ3qmqY=
Received: from thinkpad.. (unknown [60.168.209.67])
 by gzga-smtp-mta-g3-5 (Coremail) with SMTP id _____wCnK6aZTPVmuaNDPA--.52970S2;
 Thu, 26 Sep 2024 19:59:21 +0800 (CST)
From: Qianqiang Liu <qianqiang.liu@163.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Qianqiang Liu <qianqiang.liu@163.com>
Subject: [PATCH] fbcon: break earlier in search_fb_in_map and
 search_for_mapped_con
Date: Thu, 26 Sep 2024 19:59:11 +0800
Message-Id: <20240926115911.620624-1-qianqiang.liu@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnK6aZTPVmuaNDPA--.52970S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw4xGw4UAr45tryfJF48Crg_yoWfurc_GF
 1vvF95CayDtFy8Kr1rK3W3A34Yva1jva45WasrtF9Iy342q3yrXr4fZFn5XrWrWa1rZFWq
 vF1kJrn3Za4rCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUJ5rDUUUUU==
X-Originating-IP: [60.168.209.67]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiLxxmamb1RZ5vGAAAsA
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

Break the for loop immediately upon finding the target, making the
process more efficient.

Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 drivers/video/fbdev/core/fbcon.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index d9abae2516d8..e8b4e8c119b5 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -512,8 +512,10 @@ static int search_fb_in_map(int idx)
 	int i, retval = 0;
 
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
-		if (con2fb_map[i] == idx)
+		if (con2fb_map[i] == idx) {
 			retval = 1;
+			break;
+		}
 	}
 	return retval;
 }
@@ -523,8 +525,10 @@ static int search_for_mapped_con(void)
 	int i, retval = 0;
 
 	for (i = first_fb_vc; i <= last_fb_vc; i++) {
-		if (con2fb_map[i] != -1)
+		if (con2fb_map[i] != -1) {
 			retval = 1;
+			break;
+		}
 	}
 	return retval;
 }
-- 
2.34.1

