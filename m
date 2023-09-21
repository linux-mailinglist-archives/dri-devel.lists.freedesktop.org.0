Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA09E7A9521
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 16:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8749110E5B3;
	Thu, 21 Sep 2023 14:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D6A10E5B0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 14:15:27 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1695305726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nf89mi48+BTDl9P9LgC24tFBtIdB1s51h5vIjiQv4aM=;
 b=nfJnajQm2EfomGeimuqmYKDLizXeJivS+k4dgKb5mHbY+A2J42EWPVgFFt4MrmJVQhdT1T
 01VAKFj7bsGz2SJfb+oeL1anUzjfdCM/NE8Aji8jXMlCfk2jwaynq5No7HC5Dham2aRIxi
 abZ3iQoR1W+TTxJ3I03KrTrSnWlirrjUY0cxjAByjybfYigGilZ31Jq3QOoxZ+WgUmIgGS
 iTQjyZSEr7vowPWotLkrxVbR4m3uouJObGYygKHeAhhTV5IjggswjqMh2wT0FYhkTLXUCY
 4PtAdNzSkDmj1kC2Sns6pEv34qGcO4oVxDWt88MUXykKE5amRr+UZYyad+89Hg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1695305726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nf89mi48+BTDl9P9LgC24tFBtIdB1s51h5vIjiQv4aM=;
 b=vDdumqZ+OuhqqEqPf5tBX4Z38hg1tC9FoJ+b7EXxM+auQmdl0twrEvTK0dwjFvUhccxKDI
 j0SwiWJVTdARuDCw==
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] drm/amd/display: Move the memory allocation out of
 dcn21_validate_bandwidth_fp().
Date: Thu, 21 Sep 2023 16:15:15 +0200
Message-Id: <20230921141516.520471-5-bigeasy@linutronix.de>
In-Reply-To: <20230921141516.520471-1-bigeasy@linutronix.de>
References: <20230921141516.520471-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dcn21_validate_bandwidth_fp() is invoked while FPU access has been
enabled. FPU access requires disabling preemption even on PREEMPT_RT.
It is not possible to allocate memory with disabled preemption even with
GFP_ATOMIC on PREEMPT_RT.

Move the memory allocation before FPU access is enabled.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217928
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 10 +++++++++-
 drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  |  7 ++-----
 drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h  |  5 ++---
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index d1a25fe6c44fa..5674c3450fc36 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -953,9 +953,17 @@ static bool dcn21_validate_bandwidth(struct dc *dc, st=
ruct dc_state *context,
 		bool fast_validate)
 {
 	bool voltage_supported;
+	display_e2e_pipe_params_st *pipes;
+
+	pipes =3D kcalloc(dc->res_pool->pipe_count, sizeof(display_e2e_pipe_param=
s_st), GFP_KERNEL);
+	if (!pipes)
+		return false;
+
 	DC_FP_START();
-	voltage_supported =3D dcn21_validate_bandwidth_fp(dc, context, fast_valid=
ate);
+	voltage_supported =3D dcn21_validate_bandwidth_fp(dc, context, fast_valid=
ate, pipes);
 	DC_FP_END();
+
+	kfree(pipes);
 	return voltage_supported;
 }
=20
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers=
/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index 5805fb02af14e..8b2038162a7e1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -2216,9 +2216,8 @@ static void dcn21_calculate_wm(struct dc *dc, struct =
dc_state *context,
 						&context->bw_ctx.dml, pipes, pipe_cnt);
 }
=20
-bool dcn21_validate_bandwidth_fp(struct dc *dc,
-				 struct dc_state *context,
-				 bool fast_validate)
+bool dcn21_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
+				 bool fast_validate, display_e2e_pipe_params_st *pipes)
 {
 	bool out =3D false;
=20
@@ -2227,7 +2226,6 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc,
 	int vlevel =3D 0;
 	int pipe_split_from[MAX_PIPES];
 	int pipe_cnt =3D 0;
-	display_e2e_pipe_params_st *pipes =3D kzalloc(dc->res_pool->pipe_count * =
sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
 	DC_LOGGER_INIT(dc->ctx->logger);
=20
 	BW_VAL_TRACE_COUNT();
@@ -2267,7 +2265,6 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc,
 	out =3D false;
=20
 validate_out:
-	kfree(pipes);
=20
 	BW_VAL_TRACE_FINISH();
=20
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h b/drivers=
/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
index c51badf7b68a9..a81a0b9e68842 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
@@ -77,9 +77,8 @@ int dcn21_populate_dml_pipes_from_context(struct dc *dc,
 					  struct dc_state *context,
 					  display_e2e_pipe_params_st *pipes,
 					  bool fast_validate);
-bool dcn21_validate_bandwidth_fp(struct dc *dc,
-				 struct dc_state *context,
-				 bool fast_validate);
+bool dcn21_validate_bandwidth_fp(struct dc *dc, struct dc_state *context, =
bool
+				 fast_validate, display_e2e_pipe_params_st *pipes);
 void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_=
params);
=20
 void dcn21_clk_mgr_set_bw_params_wm_table(struct clk_bw_params *bw_params);
--=20
2.40.1

