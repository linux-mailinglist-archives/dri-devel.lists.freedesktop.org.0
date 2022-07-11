Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755ED5708FA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54328EF0C;
	Mon, 11 Jul 2022 17:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A77F8F65E;
 Mon, 11 Jul 2022 17:39:45 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ez10so10004502ejc.13;
 Mon, 11 Jul 2022 10:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QbNkUB3NzvVhPi0S7gR2mDTXIn3a0+mT5FVjS17tpYM=;
 b=cci/HmO67hkCe1aQerLGkZvutwCpmz2jr/zobqmZv++apYU0U6z5MkEp4cjONeq/5y
 /xAtoZWzS96LJyvj9DQ9Qs9FWCwCkvmBeN0QtkoZpiUCVQcqrgNNIlI01bwLG0pHJxx2
 aZESWp97X9+6GdfJHJX+MswfoadOWxFdfAxC21N+Z5rjZjZbKnK1V//8PD0QhKB7aIze
 gOAlvjRbPPt+Zl9HtqapBs6XrxcxBhn99//s2IrLldJdrwgFVVKgykcyA+nH9CJDDGSL
 MNG2sU2LTXYLw45+V+W3jlnDLj1ihwWv12lwNhPozYBuDaH0zKsXka5oyoGu5faV/OEg
 8y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QbNkUB3NzvVhPi0S7gR2mDTXIn3a0+mT5FVjS17tpYM=;
 b=5GHQkqcXGHadfGVZoIV+B0tACNOipA8njesmQEpV1xBd9FO/NIYgov6hDV9LIlq6ld
 RhQpq8Jp6Lfeh4//VbhfLbggMHzJFRoW4ZDahnalncHZK29EfMsV1q1isDSu13pws0nT
 9/PossUZS5nT9qGrX3UfwpBRZgXSlbufuM2Cg4EweNizTQ/yRrM6VvoGJGEMPBb/EmY0
 VoVcn6IIwiVqZhUPmApJXIBjr/ZAp4s7IxQIswfSq3KrnvQZbZrl6xChdUIdKVlaAyEq
 kUJDJ63nyltsNKMRMioPyYmqo2ki4yreQ6gEWuSXRAItbdoNQhSr7AbDtYakcRHOowJT
 mgZQ==
X-Gm-Message-State: AJIora/AGArZOZo0sbkrths2nSnG3KyEBvlAhgjf1qqDpAcFLoZqn29+
 tXfpqPqzV6kBi+Gh7/EFZW4LaSmC1zQ=
X-Google-Smtp-Source: AGRyM1s4hO2Swgzw0fZ9nSMxPCGQ3AdrDmS9cvtEGO40YWt6tCytlnI1vvMlL4zVCk71aTC+cVzEfw==
X-Received: by 2002:a17:907:a07c:b0:72a:b390:ee8a with SMTP id
 ia28-20020a170907a07c00b0072ab390ee8amr19212665ejc.96.1657561183659; 
 Mon, 11 Jul 2022 10:39:43 -0700 (PDT)
Received: from groovy.localdomain
 (dynamic-2a01-0c22-d05f-bf00-3e61-137e-625f-8d33.c22.pool.telefonica.de.
 [2a01:c22:d05f:bf00:3e61:137e:625f:8d33])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a50ec09000000b0043a735add09sm4630553edr.21.2022.07.11.10.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 10:39:43 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Only use depth 36 bpp linebuffers on DCN
 display engines.
Date: Mon, 11 Jul 2022 19:39:28 +0200
Message-Id: <20220711173928.3858-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various DCE versions had trouble with 36 bpp lb depth, requiring fixes,
last time in commit 353ca0fa5630 ("drm/amd/display: Fix 10bit 4K display
on CIK GPUs") for DCE-8. So far >= DCE-11.2 was considered ok, but now I
found out that on DCE-11.2 it causes dithering when there shouldn't be
any, so identity pixel passthrough with identity gamma LUTs doesn't work
when it should. This breaks various important neuroscience applications,
as reported to me by scientific users of Polaris cards under Ubuntu 22.04
with Linux 5.15, and confirmed by testing it myself on DCE-11.2.

Lets only use depth 36 for DCN engines, where my testing showed that it
is both necessary for high color precision output, e.g., RGBA16 fb's,
and not harmful, as far as more than one year in real-world use showed.

DCE engines seem to work fine for high precision output at 30 bpp, so
this ("famous last words") depth 30 should hopefully fix all known problems
without introducing new ones.

Successfully retested on DCE-11.2 Polaris and DCN-1.0 Raven Ridge on
top of Linux 5.19.0-rc2 + drm-next.

Fixes: 353ca0fa5630 ("drm/amd/display: Fix 10bit 4K display on CIK GPUs")
Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Tested-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: stable@vger.kernel.org # 5.14.0
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 6774dd8bb53e..3fe3fbac1e63 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1117,12 +1117,13 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 	 * on certain displays, such as the Sharp 4k. 36bpp is needed
 	 * to support SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616 and
 	 * SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616 with actual > 10 bpc
-	 * precision on at least DCN display engines. However, at least
-	 * Carrizo with DCE_VERSION_11_0 does not like 36 bpp lb depth,
-	 * so use only 30 bpp on DCE_VERSION_11_0. Testing with DCE 11.2 and 8.3
-	 * did not show such problems, so this seems to be the exception.
+	 * precision on DCN display engines, but apparently not for DCE, as
+	 * far as testing on DCE-11.2 and DCE-8 showed. Various DCE parts have
+	 * problems: Carrizo with DCE_VERSION_11_0 does not like 36 bpp lb depth,
+	 * neither do DCE-8 at 4k resolution, or DCE-11.2 (broken identify pixel
+	 * passthrough). Therefore only use 36 bpp on DCN where it is actually needed.
 	 */
-	if (plane_state->ctx->dce_version > DCE_VERSION_11_0)
+	if (plane_state->ctx->dce_version > DCE_VERSION_MAX)
 		pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_36BPP;
 	else
 		pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_30BPP;
-- 
2.34.1

