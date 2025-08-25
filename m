Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B3B355EE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 09:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311C610E5E9;
	Tue, 26 Aug 2025 07:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.b="Ova68O9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 497 seconds by postgrey-1.36 at gabe;
 Mon, 25 Aug 2025 09:02:14 UTC
Received: from xry111.site (xry111.site [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985E810E35C;
 Mon, 25 Aug 2025 09:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
 s=default; t=1756112035;
 bh=sOPq0KUHy/zQLje3GwBSgWl+bHBkFOh2egvfb2ycGo8=;
 h=From:To:Cc:Subject:Date:From;
 b=Ova68O9tx5wsT1T5lnawE/wIbds2ux/wGsvhdCqJx0V+doE3+h7RoJ7ZLMIPyDWcQ
 F79keAPA2U1sQGlUz8pvfjVP0Tf1qQ5cfagVJfBbNcKiIBHJk66655E2aT4dqplmdV
 5BH93m72ceDJZRKXzw0TwczJxa7rC9+QiCjvpbuo=
Received: from stargazer (unknown [IPv6:2409:874d:200:3037::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (Client did not present a certificate)
 (Authenticated sender: xry111@xry111.site)
 by xry111.site (Postfix) with ESMTPSA id 5925D66B28;
 Mon, 25 Aug 2025 04:53:50 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Mingcong Bai <jeffbai@aosc.io>,
 dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xi Ruoyao <xry111@xry111.site>,
 Asiacn <710187964@qq.com>
Subject: [PATCH] drm/amd/display/dml2: Guard
 dml21_map_dc_state_into_dml_display_cfg with DC_FP_START
Date: Mon, 25 Aug 2025 16:52:11 +0800
Message-ID: <20250825085211.34396-1-xry111@xry111.site>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Aug 2025 07:42:42 +0000
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

dml21_map_dc_state_into_dml_display_cfg calls (the call is usually
inlined by the compiler) populate_dml21_surface_config_from_plane_state
and populate_dml21_plane_config_from_plane_state which may use FPU.  In
a x86-64 build:

    $ objdump --disassemble=dml21_map_dc_state_into_dml_display_cfg \
    > drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.o |
    > grep %xmm -c
    63

Thus it needs to be guarded with DC_FP_START.  But we must note that the
current code quality of the in-kernel FPU use in AMD dml2 is very much
problematic: we are actually calling DC_FP_START in dml21_wrapper.c
here, and this translation unit is built with CC_FLAGS_FPU.  Strictly
speaking this does not make any sense: with CC_FLAGS_FPU the compiler is
allowed to generate FPU uses anywhere in the translated code, perhaps
out of the DC_FP_START guard.  This problematic pattern also occurs in
at least dml2_wrapper.c, dcn35_fpu.c, and dcn351_fpu.c.  Thus we really
need a careful audit and refactor for the in-kernel FPU uses, and this
patch is simply whacking a mole.  However per the reporter, whacking
this mole is enough to make a 9060XT "just work."

Reported-by: Asiacn <710187964@qq.com>
Link: https://github.com/loongson-community/discussions/issues/102
Tested-by: Asiacn <710187964@qq.com>
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index 03de3cf06ae5..059ede6ff256 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -224,7 +224,9 @@ static bool dml21_mode_check_and_programming(const struct dc *in_dc, struct dc_s
 	dml_ctx->config.svp_pstate.callbacks.release_phantom_streams_and_planes(in_dc, context);
 
 	/* Populate stream, plane mappings and other fields in display config. */
+	DC_FP_START();
 	result = dml21_map_dc_state_into_dml_display_cfg(in_dc, context, dml_ctx);
+	DC_FP_END();
 	if (!result)
 		return false;
 
@@ -279,7 +281,9 @@ static bool dml21_check_mode_support(const struct dc *in_dc, struct dc_state *co
 	dml_ctx->config.svp_pstate.callbacks.release_phantom_streams_and_planes(in_dc, context);
 
 	mode_support->dml2_instance = dml_init->dml2_instance;
+	DC_FP_START();
 	dml21_map_dc_state_into_dml_display_cfg(in_dc, context, dml_ctx);
+	DC_FP_END();
 	dml_ctx->v21.mode_programming.dml2_instance->scratch.build_mode_programming_locals.mode_programming_params.programming = dml_ctx->v21.mode_programming.programming;
 	DC_FP_START();
 	is_supported = dml2_check_mode_supported(mode_support);
-- 
2.51.0

