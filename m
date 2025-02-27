Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E924A49874
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE55310EC71;
	Fri, 28 Feb 2025 11:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234AB10EBB4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 23:16:52 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Z3nKX23KVz9scS;
 Fri, 28 Feb 2025 00:16:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
 s=MBO0001; t=1740698208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfrIERDSLZU397qOA/JWnUat3PPhKFnmrvFYp1l2KP0=;
 b=tJ6hnfQLISYQEdd8MyptdSleD2L7nLHcIH+WmU9+75rNs6cmweOwCE+C8Gt7hfdUDfuRcb
 /Jq6t7nijBqfK+cWm95AY9kiv7UMV8076202zFlTl5fWOhvhsZ6C7/GQJtONEBDKFWPld8
 XhkGtk7kpCSbWfvbR45NPzyf4zRHrAn7vVAZ7crJcWEyj6wZ/D5jzUhDre8RBMOi2KR+Hp
 gOAhY0vidViwuPCskr7PgzArpH3dYyqklgXGNreTFiGNHt7sD/Y3aRxlm04Lzd7zqzzjVp
 7e9ednbaNwq+1Ylkr1DNQJW/71TTEuWSBAu49T6furLB46WSzcgalbuXPqbptA==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Thu, 27 Feb 2025 18:16:22 -0500
Subject: [PATCH 2/4] drm/amd/display: change kzalloc to kcalloc in
 dcn31_validate_bandwidth()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-amd-display-v1-2-52a060a78d08@ethancedwards.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=cAV7WBwuMNIg8mUstqxd2CG6goEQdSkmSbHl1v/E+LM=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeHBCLzRGUFRwdnFQMnRmaHpSeFk1TVcwdzdWMjUvV0JzCnlqYysrZTFacXU5V2JWajJ4
 SEo3UnlrTGd4Z1hnNnlZSXN2L0hPVzBoNW96RkhiK2RXbUNtY1BLQkRLRWdZdFQKQUNZaU9ZR1I
 0ZGZXbzk3VmJHcS85Z3VXbXo0WE9WRy8vK0p0eWN6eis4K0hDVGszM3BVOGRKZmhyMGl6NHZIMw
 oweTEwV2xvVG1jcGNObVJrK1p5ZDFzYmJJUDNWUUYvUVZQQW5Hd0MwMmszZAo9TFU0MgotLS0tL
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
 drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
index 3c42ba8566cf8b79106de25c9e0aad4a70898ea6..dddddbfef85f8f65a6f76c86cbb6db59d608a74b 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
@@ -1768,7 +1768,8 @@ bool dcn31_validate_bandwidth(struct dc *dc,
 
 	int vlevel = 0;
 	int pipe_cnt = 0;
-	display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_KERNEL);
+	display_e2e_pipe_params_st *pipes = kcalloc(dc->res_pool->pipe_count,
+			sizeof(display_e2e_pipe_params_st), GFP_KERNEL);
 	DC_LOGGER_INIT(dc->ctx->logger);
 
 	BW_VAL_TRACE_COUNT();

-- 
2.48.1

