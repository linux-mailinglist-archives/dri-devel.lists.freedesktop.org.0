Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0CF7D0DB4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5B810E5A0;
	Fri, 20 Oct 2023 10:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C283910E5A6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:44:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8D792F4;
 Fri, 20 Oct 2023 03:45:15 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com
 [10.1.34.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 390923F5A1;
 Fri, 20 Oct 2023 03:44:33 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH] drm/panfrost: Remove incorrect IS_ERR() check
Date: Fri, 20 Oct 2023 11:44:05 +0100
Message-Id: <20231020104405.53992-1-steven.price@arm.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sg_page_iter_page() doesn't return an error code, so the IS_ERR() check
is wrong and the error path will never be executed. This also allows
simplifying the code to remove the local variable 'page'.

CC: Adrián Larumbe <adrian.larumbe@collabora.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/376713ff-9a4f-4ea3-b097-fb5efb685d95@moroto.mountain
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_dump.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.c b/drivers/gpu/drm/panfrost/panfrost_dump.c
index e7942ac449c6..47751302f1bc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_dump.c
+++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
@@ -220,16 +220,8 @@ void panfrost_core_dump(struct panfrost_job *job)
 
 		iter.hdr->bomap.data[0] = bomap - bomap_start;
 
-		for_each_sgtable_page(bo->base.sgt, &page_iter, 0) {
-			struct page *page = sg_page_iter_page(&page_iter);
-
-			if (!IS_ERR(page)) {
-				*bomap++ = page_to_phys(page);
-			} else {
-				dev_err(pfdev->dev, "Panfrost Dump: wrong page\n");
-				*bomap++ = 0;
-			}
-		}
+		for_each_sgtable_page(bo->base.sgt, &page_iter, 0)
+			*bomap++ = page_to_phys(sg_page_iter_page(&page_iter));
 
 		iter.hdr->bomap.iova = mapping->mmnode.start << PAGE_SHIFT;
 
-- 
2.34.1

