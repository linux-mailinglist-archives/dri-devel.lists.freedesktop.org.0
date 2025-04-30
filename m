Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3AAAA4E29
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42D110E2A3;
	Wed, 30 Apr 2025 14:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="esh8rwrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D88F10E2A1;
 Wed, 30 Apr 2025 14:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8NkAPdsDA+GAai+dpOUrcWSplZWq+eaxInVZJvEG6rw=; b=esh8rwrYGMmMw97lEnnQQw7pqn
 WllfVfW5lTH2G2yF+WffXccNjYkX0ROtncE1rmemdt0V/bKcBkO0Y11Ar1urTSPtYCKG8DYmB2Kuh
 0RYYivmNpbId3Jve007i0XJOwQHM9QSVng+d+SILPpo6gDZpxNX3qDbLKgt2k1sE9V72y9HQELZ88
 Xlg6huiXXW03X5e3wiDyzKKIY+5s/3pO0e2Vo6bRKKyw183HSv2A9zZaVAytfAxGWdSfhpNoy2PGW
 JxDsfxGbL7oMcplQePMhDbjQbJzbSzLOFRQMr/CRKlcN2GL8y026cP6jgjTJ8Yx6CXiNuitp6mlg6
 FH9WIrcg==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uA89W-000vTV-4q; Wed, 30 Apr 2025 16:12:03 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 rostrows@amd.com, chiahsuan.chung@amd.com, dillon.varone@amd.com,
 austin.zheng@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH] drm/amd/display: Fix null check of pipe_ctx->plane_state for
 update_dchubp_dpp
Date: Wed, 30 Apr 2025 11:11:47 -0300
Message-ID: <20250430141156.827763-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to commit 6a057072ddd1 ("drm/amd/display: Fix null check for
pipe_ctx->plane_state in dcn20_program_pipe") that addresses a null
pointer dereference on dcn20_update_dchubp_dpp. This is the same
function hooked for update_dchubp_dpp in dcn401, with the same issue.
Fix possible null pointer deference on dcn401_program_pipe too.

Fixes: 63ab80d9ac0ad ("drm/amd/display: DML2.1 Post-Si Cleanup")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 8611eb9607df..c8c8a17ff183 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -2259,9 +2259,9 @@ void dcn401_program_pipe(
 				dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->hubp_regs.det_size);
 	}
 
-	if (pipe_ctx->update_flags.raw ||
-		(pipe_ctx->plane_state && pipe_ctx->plane_state->update_flags.raw) ||
-		pipe_ctx->stream->update_flags.raw)
+	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.raw ||
+	    pipe_ctx->plane_state->update_flags.raw ||
+	    pipe_ctx->stream->update_flags.raw))
 		dc->hwss.update_dchubp_dpp(dc, pipe_ctx, context);
 
 	if (pipe_ctx->plane_state && (pipe_ctx->update_flags.bits.enable ||
-- 
2.47.2

