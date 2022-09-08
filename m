Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A25B17B4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 10:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9A810E9BC;
	Thu,  8 Sep 2022 08:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4AF10E9BA
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662627095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yE6pLp5leFMoYWecHizspk2Fu+jK+/W7ym/2OW+JgHs=;
 b=TJwJaMAHd6dXX0ri6EacQEgNiuJHo4xs9Oh+S+7dLJtjhrbBXiUih8rdWhSZeacEhVsGkn
 pk+0KEmdVP1EQ8kEKTHoVDQdzHtMysj6moc4Qo57tcOo1Pn4AzwciLEo2sFpkTXeEsw8pR
 s6h6zHVuic66KjPa4sQ9HRKe70NIKkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-W0URJJUqPkW1CUuL1Xsc_g-1; Thu, 08 Sep 2022 04:51:32 -0400
X-MC-Unique: W0URJJUqPkW1CUuL1Xsc_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6706C80029D;
 Thu,  8 Sep 2022 08:51:32 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 757A540CF8F0;
 Thu,  8 Sep 2022 08:51:31 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: amd-gfx@lists.freedesktop.org, Ethan.Wellenreiter@amd.com,
 alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: Remove var declaration in
 dcn32_full_validate_bw_helper()
Date: Thu,  8 Sep 2022 10:50:22 +0200
Message-Id: <20220908085022.1263639-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable i is already declared as uint32_t in the same function.

This fixes the following error, when compiling this code on older kernel:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c: In function 'dcn32_full_validate_bw_helper':
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:1018:3: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
   for (int i = 0; i < dc->res_pool->pipe_count; i++) {
   ^~~
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:1018:3: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:982:11: error: unused variable 'i' [-Werror=unused-variable]
  uint32_t i = 0;

Fixes: f5b9c1ffabce ("drm/amd/display: Re-initialize viewport after pipe merge")

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 8e4c9d0887ce..56f02b1ea808 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -1015,7 +1015,7 @@ static void dcn32_full_validate_bw_helper(struct dc *dc,
 
 		dcn32_merge_pipes_for_subvp(dc, context);
 		// to re-initialize viewport after the pipe merge
-		for (int i = 0; i < dc->res_pool->pipe_count; i++) {
+		for (i = 0; i < dc->res_pool->pipe_count; i++) {
 			struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
 
 			if (!pipe_ctx->plane_state || !pipe_ctx->stream)
-- 
2.37.3

