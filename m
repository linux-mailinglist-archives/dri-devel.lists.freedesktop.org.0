Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C2F68D4E4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0BD10E4CF;
	Tue,  7 Feb 2023 10:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7780610E4CF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 10:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675767226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YpJV8tm0DYcHhM8Qa8mC0HmhH2Rd7bi1CQ7vagEag8c=;
 b=BEgAX8AnFQ02YlHXnDV18QgcaC4p0K8Xx0DMNeXt/P9jXmxKpwUme5yJbsCXXUX7V7kRh1
 u3GVnRb6gyAVglxagfYlFJthcslQKgp3/7txCIMfGjQxunrO6qnBI//sznTNUV1elMs9Ah
 lMCqCjk7aR5Mj0akyRNYocDWoLSEoc4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-1iwYo46-Nw2SWTKFqfPRzg-1; Tue, 07 Feb 2023 05:53:43 -0500
X-MC-Unique: 1iwYo46-Nw2SWTKFqfPRzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 314BD101A521;
 Tue,  7 Feb 2023 10:53:43 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0C7540398A0;
 Tue,  7 Feb 2023 10:53:41 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
Subject: [PATCH] drm/ast: Fix start address computation
Date: Tue,  7 Feb 2023 11:53:17 +0100
Message-Id: <20230207105317.224277-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

During the driver conversion to shmem, there is a missing page shift when
computing the start address in GPU memory.
This leads to graphic garbage when connecting to the remote BMC, depending
on the PCI start address.

Tested on a sr645 affected by this bug.

Fixes: f2fa5a99ca81 ("drm/ast: Convert ast to SHMEM")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index c7443317c747..d75e4a7611b3 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -714,7 +714,7 @@ static int ast_primary_plane_init(struct ast_private *ast)
 	struct ast_plane *ast_primary_plane = &ast->primary_plane;
 	struct drm_plane *primary_plane = &ast_primary_plane->base;
 	void __iomem *vaddr = ast->vram;
-	u64 offset = ast->vram_base;
+	u64 offset = ast->vram_base << PAGE_SHIFT;
 	unsigned long cursor_size = roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
 	unsigned long size = ast->vram_fb_available - cursor_size;
 	int ret;
-- 
2.39.1

