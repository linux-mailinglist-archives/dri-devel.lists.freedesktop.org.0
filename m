Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D269040E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B1810E148;
	Thu,  9 Feb 2023 09:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D1C10E0EB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675935868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ivyRedCODwQ3UXF109vN07cTt7TY50DWth+trokSXto=;
 b=PTTSoXdgqQAmjuklgoYUy04nm78Dzv6LYPsrELaRI16xgB2Nb7niPlI1YGZF3K6pS1LoPC
 MDkANUwOnkayOcwpc1nCFwmk1zjrO2LoK4LK2HEU0l++zA0iQs9PSEC6+dBFyrdc1uwc20
 xwxkDsi19f3TcQOAhKeVz9ETeg709DA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-HQcDXoiiPVW1UGJ0UBX9gw-1; Thu, 09 Feb 2023 04:44:25 -0500
X-MC-Unique: HQcDXoiiPVW1UGJ0UBX9gw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6B67802D2A;
 Thu,  9 Feb 2023 09:44:24 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58FA7140EBF6;
 Thu,  9 Feb 2023 09:44:23 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
Subject: [PATCH v3] drm/ast: Fix start address computation
Date: Thu,  9 Feb 2023 10:44:17 +0100
Message-Id: <20230209094417.21630-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During the driver conversion to shmem, the start address for the
scanout buffer was set to the base PCI address.
In most cases it works because only the lower 24bits are used, and
due to alignment it was almost always 0.
But on some unlucky hardware, it's not the case, and some unitilized
memory is displayed on the BMC.
With shmem, the primary plane is always at offset 0 in GPU memory.

 * v2: rewrite the patch to set the offset to 0. (Thomas Zimmermann)
 * v3: move the change to plane_init() and also fix the cursor plane.
       (Jammy Huang)

Tested on a sr645 affected by this bug.

Fixes: f2fa5a99ca81 ("drm/ast: Convert ast to SHMEM")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index c7443317c747..66a4a41c3fe9 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -714,7 +714,7 @@ static int ast_primary_plane_init(struct ast_private *ast)
 	struct ast_plane *ast_primary_plane = &ast->primary_plane;
 	struct drm_plane *primary_plane = &ast_primary_plane->base;
 	void __iomem *vaddr = ast->vram;
-	u64 offset = ast->vram_base;
+	u64 offset = 0; /* with shmem, the primary plane is always at offset 0 */
 	unsigned long cursor_size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
 	unsigned long size = ast->vram_fb_available - cursor_size;
 	int ret;
@@ -972,7 +972,7 @@ static int ast_cursor_plane_init(struct ast_private *ast)
 		return -ENOMEM;
 
 	vaddr = ast->vram + ast->vram_fb_available - size;
-	offset = ast->vram_base + ast->vram_fb_available - size;
+	offset = ast->vram_fb_available - size;
 
 	ret = ast_plane_init(dev, ast_cursor_plane, vaddr, offset, size,
 			     0x01, &ast_cursor_plane_funcs,
-- 
2.39.1

