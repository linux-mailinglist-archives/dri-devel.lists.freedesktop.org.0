Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94C2B32400
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 23:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652A810EBBF;
	Fri, 22 Aug 2025 21:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PD2f6B+n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F341310EBBF;
 Fri, 22 Aug 2025 21:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EFZDMCG2WSSDF5Bi0UXQwoQyWQFrzk5n8lXLsIfoAZg=; b=PD2f6B+nDr0Ierxzvkpv6wJeF+
 N2UsZzWQydYsGKaGsyAIaALgdq85RE9ypfG6kzNvsZPHnRpfaGM0mGu09yjx35MRC3AIqo8QmWYVf
 7/jHaUQBbetOZJJy0W/WnnR8B50i/X7UdrgeNg0DWgKD0/27qMPFg5khfwntPaUIu09HzfYTZ7Dyk
 90/UWVS6Wo+MAg4i/yY4sEYkunpX1b3nuV8vA0f4puXQTFGOIJOtrXoPoGZuvqS/BIm3zo/GogJDB
 cKCvFf23aSpNq8+l6Cv0Xnn8qtPHHvXUndQ63CxLi39ZW9oIqDPO0ELE1Fk6wbHrhnS+rpewi6yi3
 Zi2qmLSA==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1upZ7E-000Hyz-Kj; Fri, 22 Aug 2025 23:16:05 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Xaver Hugl <xaver.hugl@gmail.com>, Christopher Snowhill <kode54@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH 1/2] Revert "drm/amd/display: program output tf when required"
Date: Fri, 22 Aug 2025 18:14:07 -0300
Message-ID: <20250822211552.1472375-2-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822211552.1472375-1-mwen@igalia.com>
References: <20250822211552.1472375-1-mwen@igalia.com>
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

This reverts commit bb622e0c004404b6131633faa6bd8c4939b1df42.

There are two issues in this commit:

1. Since commit a4056c2a6344, the output_tf_change bit of the stream
   update flags is not handled anywhere in the driver and only changes
   values in case of an UPDATE_TYPE_FULL, which sets
   update_flags.raw = 0xFFFFFFFF.  However, this bit still conditions
   `.set_output_transfer_func` calls in the DCN2+ and DCN3+ hardware
   sequence.

2. Every time the plane state changes, the driver updates the output
   gamma LUT from empty data, since the color management has not changed
   and no new gamma LUT data has been passed, but the plane_changed bit
   calls set_output_transfer_func using only the initial/default value of
   the output TF, regardless of the user space request.

Due to these unexpected calls to set output TF with empty data, regamma
settings are lost even if color management has not been changed, as
reported by Linux KDE/Plasma users.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4444
Reported-by: Xaver Hugl <xaver.hugl@gmail.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 7d24fa1517bf..226424ffcb08 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -1982,10 +1982,7 @@ static void dcn20_program_pipe(
 	 * updating on slave planes
 	 */
 	if (pipe_ctx->update_flags.bits.enable ||
-		pipe_ctx->update_flags.bits.plane_changed ||
-		pipe_ctx->stream->update_flags.bits.out_tf ||
-		(pipe_ctx->plane_state &&
-			pipe_ctx->plane_state->update_flags.bits.output_tf_change))
+	    pipe_ctx->stream->update_flags.bits.out_tf)
 		hws->funcs.set_output_transfer_func(dc, pipe_ctx, pipe_ctx->stream);
 
 	/* If the pipe has been enabled or has a different opp, we
-- 
2.47.2

