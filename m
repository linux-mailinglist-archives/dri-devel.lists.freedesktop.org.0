Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93174AA4E77
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904AD10E7AE;
	Wed, 30 Apr 2025 14:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mB2imhpw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C235C10E753;
 Wed, 30 Apr 2025 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SEFL4EFtteGyjsUH28kZ7pvKFqe/62p/vDNsanYf0lA=; b=mB2imhpwRX7vGwT8wMJI1kO8b4
 o81CfNXtme7JXWF8xL5lPncGfzvTJiS+t80SFod4wk532Amig1s+fR+m/sJOODWusIQEUtP09N6UR
 efQ+kEQDX/HsByF9ec6DJVP8ug6ty0ryOI49e2lLeU6AAnx1JERCcbuAKubjIEBhsIVH3HeZYssto
 hqgev7re4Vy4oMO2KJXDCeIPEsoHCFj1c8PvZIaDkP/CBut5qGry43gMfrRQcmRq/CNxnEPBggX3r
 f7RtPP8PZVjEI/uxw6yTTmWqK5QSnqjlHFL24xtzccczlgkBn3tmEw07TMESvjYL1YkViw/htX+JG
 BMIj7IIw==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uA8Mz-000vo2-Ae; Wed, 30 Apr 2025 16:25:59 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH 1/5] drm/amd/display: add hook for program_tg
Date: Wed, 30 Apr 2025 11:20:07 -0300
Message-ID: <20250430142549.829861-2-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430142549.829861-1-mwen@igalia.com>
References: <20250430142549.829861-1-mwen@igalia.com>
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

The only actual difference between dcn20_program_pipe and
dcn401_program_pipe is the way they program global sync.  Create a hook
to enable hw-family function calls, so that we can reuse
dcn20_program_pipe, avoid code duplication and prevent future partial
fixes for the same portion of code.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 11 ++++++++---
 drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h    |  4 ++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 5e78b553adbd..1be9be74564e 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -1925,9 +1925,14 @@ static void dcn20_program_pipe(
 	}
 
 	/* Only update TG on top pipe */
-	if (pipe_ctx->update_flags.bits.global_sync && !pipe_ctx->top_pipe
-		&& !pipe_ctx->prev_odm_pipe)
-		dcn20_program_tg(dc, pipe_ctx, context, hws);
+	if (pipe_ctx->update_flags.bits.global_sync &&
+	    !pipe_ctx->top_pipe &&
+	    !pipe_ctx->prev_odm_pipe) {
+		if(dc->hwss.program_tg)
+			dc->hwss.program_tg(dc, pipe_ctx, context, hws);
+		else
+			dcn20_program_tg(dc, pipe_ctx, context, hws);
+	}
 
 	if (pipe_ctx->update_flags.bits.odm)
 		hws->funcs.update_odm(dc, context, pipe_ctx);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
index 3a0795045bc6..86ffc7818df7 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h
@@ -467,6 +467,10 @@ struct hw_sequencer_funcs {
 			struct dc_state *new_state,
 			struct pipe_ctx *old_pipe,
 			struct pipe_ctx *new_pipe);
+	void (*program_tg)(struct dc *dc,
+			   struct pipe_ctx *pipe_ctx,
+			   struct dc_state *context,
+			   struct dce_hwseq *hws);
 	void (*enable_plane)(struct dc *dc,
 			struct pipe_ctx *pipe_ctx,
 			struct dc_state *context);
-- 
2.47.2

