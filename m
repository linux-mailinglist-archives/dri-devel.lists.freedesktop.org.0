Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6826613C599
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 15:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9FF6E9FD;
	Wed, 15 Jan 2020 14:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5BB6E9FD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 14:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 8729E3F53F;
 Wed, 15 Jan 2020 15:15:47 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=HKoB5nYO; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o--5bJm1gjP6; Wed, 15 Jan 2020 15:15:46 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 351163F462;
 Wed, 15 Jan 2020 15:15:44 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 48ABC360315;
 Wed, 15 Jan 2020 15:15:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579097744; bh=xouYrhGGt+sbB4F2j/bQU9tm6EbEYYEXMviV1lMl2VA=;
 h=From:To:Cc:Subject:Date:From;
 b=HKoB5nYOs5pu7x5cyYWIJpsA4OGI/zQNn4Dg9rkA98WI3/JpL+Ib0IUgGJPhFCCFa
 7sYWLnBXbqYAvqjmFniTZsg3dvYU+x8CFcDlnzdqC/Jp03u6ZwrYknkw+yGS/Q4DK0
 MJONQgcKPtEp7WHLwAITEOJhw75s9jWZmE6k8wQg=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vmwgfx: Use VM_PFNMAP instead of VM_MIXEDMAP when possible
Date: Wed, 15 Jan 2020 15:15:36 +0100
Message-Id: <20200115141536.2819-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Hellstrom <thellstrom@vmware.com>

For shared, and read-only private mappings of graphics memory, use
VM_PFNMAP instead of VM_MIXEDMAP. This means less accounting overhead
when inserting and removing page-table entries. TTM doesn't do this
by default, since there was a performance problem with book-keeping of
write-combined mappings. Since vmwgfx solely uses cached mappings, that's
not a problem and now that the TTM vm has largely been turned into
helpers, we can use VM_PFNMAP on a per-driver basis

Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
Reviewed-by: Roland Scheidegger <sroland@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index ce288756531b..aa7e50f63b94 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -45,6 +45,10 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 
 	vma->vm_ops = &vmw_vm_ops;
 
+	/* Use VM_PFNMAP rather than VM_MIXEDMAP if not a COW mapping */
+	if ((vma->vm_flags & (VM_SHARED | VM_MAYWRITE)) != VM_MAYWRITE)
+		vma->vm_flags = (vma->vm_flags & ~VM_MIXEDMAP) | VM_PFNMAP;
+
 	return 0;
 }
 
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
