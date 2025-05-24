Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF88AC307F
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 18:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9841710E0BC;
	Sat, 24 May 2025 16:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="bJC+f2Y0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr
 [80.12.242.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AA110E0BC
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 16:51:46 +0000 (UTC)
Received: from localhost.localdomain
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
 by smtp.orange.fr with ESMTPA
 id Is60uQbGt1n9nIs60uXgae; Sat, 24 May 2025 18:51:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1748105501;
 bh=3/m2btaSoyNeCIlV4H3OiW8YIofhGOiWjmetp7MzqjU=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=bJC+f2Y0+Km6Z52inhkP0hqQakFaXaHQchhVmoPPNindPDUK+LsBDzXhOItzj0wng
 lGXs0kgZaXgwVES2xLYHqAy35/IF+ezFHaQQMgE10IrqNCdL+N6GabyxUKX1RmqYEK
 wNRrX0brLSDDQRHV99QvAzKTpkWD5qzL7kem7Fwjtv8iRFbtZxIz3VqXwKWOQQaPX2
 lLWdfNJhBpmN9iXAwr+9EduLgncABqi8rinBjp9Q+3QcLneykVebwR38VJE7TRFavm
 NvkpcP4qUS4N2IKu8G3C7ph8agoraaUu3oY7z+qgzo1oBzbhVyTq9yWVdpLrM+22O6
 EK14idepQesOg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 24 May 2025 18:51:41 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Constify struct timing_generator_funcs
Date: Sat, 24 May 2025 18:51:25 +0200
Message-ID: <7dd73263342c1093f3e86ae5841a53c1e3739b5e.1748105447.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
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

'struct timing_generator_funcs' are not modified in these drivers.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This is NOT compile tested, because apparently some .h files are missing on
my system ("reg_helper.h")

However, I've checked how these struct timing_generator_funcs are used.
They end in "struct optc->base.funcs" which is a
"const struct timing_generator_funcs", so evething should be fine.
---
 drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c   | 2 +-
 drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c | 2 +-
 drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c   | 2 +-
 drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c | 2 +-
 drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c   | 2 +-
 drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c | 2 +-
 drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c   | 2 +-
 drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c   | 2 +-
 drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
index 81857ce6d68d..e7a90a437fff 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
@@ -502,7 +502,7 @@ void optc2_get_last_used_drr_vtotal(struct timing_generator *optc, uint32_t *ref
 	REG_GET(OTG_DRR_CONTROL, OTG_V_TOTAL_LAST_USED_BY_DRR, refresh_rate);
 }
 
-static struct timing_generator_funcs dcn20_tg_funcs = {
+static const struct timing_generator_funcs dcn20_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
 		.program_timing = optc1_program_timing,
 		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
index f2415eebdc09..772a8bfb949c 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
@@ -129,7 +129,7 @@ static void optc201_get_optc_source(struct timing_generator *optc,
 	*num_of_src_opp = 1;
 }
 
-static struct timing_generator_funcs dcn201_tg_funcs = {
+static const struct timing_generator_funcs dcn201_tg_funcs = {
 		.validate_timing = optc201_validate_timing,
 		.program_timing = optc1_program_timing,
 		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
index 78b58a449fa4..ee4665aa49e9 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
@@ -357,7 +357,7 @@ void optc3_tg_init(struct timing_generator *optc)
 	optc1_clear_optc_underflow(optc);
 }
 
-static struct timing_generator_funcs dcn30_tg_funcs = {
+static const struct timing_generator_funcs dcn30_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
 		.program_timing = optc1_program_timing,
 		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c
index 65e9089b7f31..38f85bc2681a 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c
@@ -109,7 +109,7 @@ void optc301_setup_manual_trigger(struct timing_generator *optc)
 			OTG_TRIGA_CLEAR, 1);
 }
 
-static struct timing_generator_funcs dcn30_tg_funcs = {
+static const struct timing_generator_funcs dcn30_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
 		.program_timing = optc1_program_timing,
 		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
index ef536f37b4ed..4f1830ba619f 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
@@ -315,7 +315,7 @@ void optc31_read_otg_state(struct timing_generator *optc,
 	s->otg_double_buffer_control = REG_READ(OTG_DOUBLE_BUFFER_CONTROL);
 }
 
-static struct timing_generator_funcs dcn31_tg_funcs = {
+static const struct timing_generator_funcs dcn31_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
 		.program_timing = optc1_program_timing,
 		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c
index 0e603bad0d12..4a2caca37255 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c
@@ -192,7 +192,7 @@ static void optc314_set_h_timing_div_manual_mode(struct timing_generator *optc,
 }
 
 
-static struct timing_generator_funcs dcn314_tg_funcs = {
+static const struct timing_generator_funcs dcn314_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
 		.program_timing = optc1_program_timing,
 		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
index 2cdd19ba634b..b2b226bcd871 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
@@ -297,7 +297,7 @@ static void optc32_set_drr(
 	optc32_setup_manual_trigger(optc);
 }
 
-static struct timing_generator_funcs dcn32_tg_funcs = {
+static const struct timing_generator_funcs dcn32_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
 		.program_timing = optc1_program_timing,
 		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
index 4cfc6c0fa147..72bff94cb57d 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
@@ -428,7 +428,7 @@ static void optc35_set_long_vtotal(
 	}
 }
 
-static struct timing_generator_funcs dcn35_tg_funcs = {
+static const struct timing_generator_funcs dcn35_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
 		.program_timing = optc1_program_timing,
 		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
index 382ac18e7854..ff79c38287df 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
@@ -459,7 +459,7 @@ bool optc401_wait_update_lock_status(struct timing_generator *tg, bool locked)
 	return true;
 }
 
-static struct timing_generator_funcs dcn401_tg_funcs = {
+static const struct timing_generator_funcs dcn401_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
 		.program_timing = optc1_program_timing,
 		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
-- 
2.49.0

