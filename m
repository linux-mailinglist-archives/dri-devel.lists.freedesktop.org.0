Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13626902FA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881A110E974;
	Thu,  9 Feb 2023 09:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8754C10E974
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675933988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4BaRmrGSF/qFjbxs/IBlMySBy+L22UaSVRpR0Q8agi0=;
 b=g8kk1BzyCq27qX8Tn5BE5zIvWTgNFj0egNssm+1soyun9DBnBysAyXkUCVU555J1Docz4v
 NRcJAENImfvVFcQbzPyKqykrcZCctWAjuLz5nShNkasieacBQOduDdBg5XobXP41sBqVjm
 xPGZWxiBJQttxvQtH7urLqa3taIiAqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-RaYTQPGyPim6nmm52Y9hLw-1; Thu, 09 Feb 2023 04:13:05 -0500
X-MC-Unique: RaYTQPGyPim6nmm52Y9hLw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF304101AA78;
 Thu,  9 Feb 2023 09:13:04 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B75D4140EBF6;
 Thu,  9 Feb 2023 09:13:03 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
Subject: [PATCH v2] drm/ast: Fix start address computation
Date: Thu,  9 Feb 2023 10:12:54 +0100
Message-Id: <20230209091254.15455-1-jfalempe@redhat.com>
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

Tested on a sr645 affected by this bug.

Fixes: f2fa5a99ca81 ("drm/ast: Convert ast to SHMEM")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index c7443317c747..54deb29bfeb3 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -681,7 +681,8 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	if (!old_fb || old_fb->pitches[0] != fb->pitches[0])
 		ast_set_offset_reg(ast, fb);
 	if (!old_fb) {
-		ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
+		/* with shmem, the primary plane is always at offset 0 */
+		ast_set_start_address_crt1(ast, 0);
 		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
 	}
 }
-- 
2.39.1

