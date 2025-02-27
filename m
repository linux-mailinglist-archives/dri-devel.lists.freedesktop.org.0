Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDACA49876
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5776710E0E5;
	Fri, 28 Feb 2025 11:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4EF10EBB7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 23:16:58 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Z3nKg0cKkz9t9M;
 Fri, 28 Feb 2025 00:16:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
 s=MBO0001; t=1740698215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FBDZiW19X5cn3cuHGveHbiMlwS0ltwOdMSwNVeMLsVU=;
 b=A5LMf7DHg2J3Jqs6X+r3H3RrTVzijiBxOWa/Sb7yVRo3duj4dObBr9F+BVxg8agsOn030D
 /mqVCxZUkv8QhPj3m17QvSsAFiAEX7uLPBVfABHYxOxr4dNXn/R9La0NQI1CbaCYcM8wAW
 Bx/0Z5wmyS/TU72iT9DDBAjI6epQ+KJhLyqzo2p8b3iNEhjn5GsLL1OC3CWofozBp/l44o
 CCQqU9C01Kv7gFtXthRK8hhFyGdOrUiTgKzOhrE28fWtVeSsqsRKc3x3C4LMhAZ50tFlwx
 cZZ4K/2s6Z534/Yrn9lXspUE5mcLcF3XKPtIoiIWRiSp0uTnuTW25TR5QvvaTQ==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Thu, 27 Feb 2025 18:16:24 -0500
Subject: [PATCH 4/4] drm/amd/display: change kzalloc to kcalloc in
 dml1_validate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-amd-display-v1-4-52a060a78d08@ethancedwards.com>
References: <20250227-amd-display-v1-0-52a060a78d08@ethancedwards.com>
In-Reply-To: <20250227-amd-display-v1-0-52a060a78d08@ethancedwards.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=24YShaBC0pMX9hWdPx8iIgoaysi2N4zb0byElG8tKlw=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeHBCLzRGSlQ1SWVuUytaSnpxOFBUT3laM3Jab2g2RlZVCkVCT1k5L0REd2VXdjcwV3Z2
 cit5bzVTRlFZeUxRVlpNa2VWL2puTGFRODBaQ2p2L3VqVEJ6R0ZsQWhuQ3dNVXAKQUJOWjZjWHd
 UKzJ4VUgvVDJZUVpKUm5sdlh2NDcyaElIWHpGZVV2bm5VL0t5Z1kzNTJzNlVZd01mU2UyUE5xNg
 o4K1F6Z2RDdkMyZk0wakQ3L01oUzZpNkx3M0YrZjJVOXhiZXJ1QUNXTmxFSgo9ZXlXZQotLS0tL
 UVORCBQR1AgTUVTU0FHRS0tLS0tCg==
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-Mailman-Approved-At: Fri, 28 Feb 2025 11:42:15 +0000
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

We are trying to get rid of all multiplications from allocation
functions to prevent integer overflows. Here the multiplication is
probably safe, but using kcalloc() is more appropriate and improves
readability. This patch has no effect on runtime behavior.

Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 664302876019072a77b9330229f7fe8545787396..2a59cc61ed8c918a4b5beb1d90bf3a8f77fcdeb9 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1749,7 +1749,8 @@ static bool dml1_validate(struct dc *dc, struct dc_state *context, bool fast_val
 
 	int vlevel = 0;
 	int pipe_cnt = 0;
-	display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_KERNEL);
+	display_e2e_pipe_params_st *pipes = kcalloc(dc->res_pool->pipe_count,
+			sizeof(display_e2e_pipe_params_st), GFP_KERNEL);
 
 	/* To handle Freesync properly, setting FreeSync DML parameters
 	 * to its default state for the first stage of validation

-- 
2.48.1

