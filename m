Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1002B7A9523
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 16:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E68210E5B5;
	Thu, 21 Sep 2023 14:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B68A10E5AF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 14:15:30 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1695305726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QKfJEY1uLi87VIrjkLudvRExB2VG8jcVhhoK+qWqrU=;
 b=zE/czbZ4vhjGgipLwIvYHBCSOwaXOsr2FHzPwUl12r9qkPAilJqqhw04tSHieJiqr+nrjB
 HFV+3rx8nqby67Q8tVSb5ihXER9ip/f9Yn8kp4Pf0/l8r9CWmCESe9y0ebW3Gjwp9lVTNV
 Zq7HP6jFjUvpfI+2bXsGtgFsBu+a3vi5G+LqoxybmlCAe58GPgb6FN2Rh/vhU/ToULLgRX
 9CSRWlAt8Gj4urqYo75pU0daqpFK5SbyFhXaPZQI7PURhYyZKZWBGDxCiPiKnnzUIMzTjj
 HMrGBErt3D49XlwnZRM/Pl+/mnm9UPBT3CKvGCXMaEj5sz5MYBQFMvXkO55I6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1695305726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3QKfJEY1uLi87VIrjkLudvRExB2VG8jcVhhoK+qWqrU=;
 b=DZ/H+yLvkKfU6D2WwvKVS0fxhhgMN7NtQ3+NP/OLmnyTklcdRT0JyqBbvhMrSqxDJY9QEV
 72CINHkotZEzKEAw==
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/amd/display: Move the memory allocation out of
 dcn20_validate_bandwidth_fp().
Date: Thu, 21 Sep 2023 16:15:16 +0200
Message-Id: <20230921141516.520471-6-bigeasy@linutronix.de>
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

dcn20_validate_bandwidth_fp() is invoked while FPU access has been
enabled. FPU access requires disabling preemption even on PREEMPT_RT.
It is not possible to allocate memory with disabled preemption even with
GFP_ATOMIC on PREEMPT_RT.

Move the memory allocation before FPU access is enabled.
To preserve previous "clean" state of "pipes" add a memset() before the
second invocation of dcn20_validate_bandwidth_internal() where the
variable is used.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 .../drm/amd/display/dc/dcn20/dcn20_resource.c    | 10 +++++++++-
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c | 16 +++++++---------
 .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h |  5 ++---
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index d587f807dfd7c..5036a3e608324 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2141,9 +2141,17 @@ bool dcn20_validate_bandwidth(struct dc *dc, struct =
dc_state *context,
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
-	voltage_supported =3D dcn20_validate_bandwidth_fp(dc, context, fast_valid=
ate);
+	voltage_supported =3D dcn20_validate_bandwidth_fp(dc, context, fast_valid=
ate, pipes);
 	DC_FP_END();
+
+	kfree(pipes);
 	return voltage_supported;
 }
=20
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers=
/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index 8b2038162a7e1..2ad92497b9bf2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -1923,7 +1923,7 @@ void dcn20_patch_bounding_box(struct dc *dc, struct _=
vcs_dpi_soc_bounding_box_st
 }
=20
 static bool dcn20_validate_bandwidth_internal(struct dc *dc, struct dc_sta=
te *context,
-		bool fast_validate)
+		bool fast_validate, display_e2e_pipe_params_st *pipes)
 {
 	bool out =3D false;
=20
@@ -1932,7 +1932,6 @@ static bool dcn20_validate_bandwidth_internal(struct =
dc *dc, struct dc_state *co
 	int vlevel =3D 0;
 	int pipe_split_from[MAX_PIPES];
 	int pipe_cnt =3D 0;
-	display_e2e_pipe_params_st *pipes =3D kzalloc(dc->res_pool->pipe_count * =
sizeof(display_e2e_pipe_params_st), GFP_ATOMIC);
 	DC_LOGGER_INIT(dc->ctx->logger);
=20
 	BW_VAL_TRACE_COUNT();
@@ -1967,16 +1966,14 @@ static bool dcn20_validate_bandwidth_internal(struc=
t dc *dc, struct dc_state *co
 	out =3D false;
=20
 validate_out:
-	kfree(pipes);
=20
 	BW_VAL_TRACE_FINISH();
=20
 	return out;
 }
=20
-bool dcn20_validate_bandwidth_fp(struct dc *dc,
-				 struct dc_state *context,
-				 bool fast_validate)
+bool dcn20_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
+				 bool fast_validate, display_e2e_pipe_params_st *pipes)
 {
 	bool voltage_supported =3D false;
 	bool full_pstate_supported =3D false;
@@ -1995,11 +1992,11 @@ bool dcn20_validate_bandwidth_fp(struct dc *dc,
 	ASSERT(context !=3D dc->current_state);
=20
 	if (fast_validate) {
-		return dcn20_validate_bandwidth_internal(dc, context, true);
+		return dcn20_validate_bandwidth_internal(dc, context, true, pipes);
 	}
=20
 	// Best case, we support full UCLK switch latency
-	voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context, fals=
e);
+	voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context, fals=
e, pipes);
 	full_pstate_supported =3D context->bw_ctx.bw.dcn.clk.p_state_change_suppo=
rt;
=20
 	if (context->bw_ctx.dml.soc.dummy_pstate_latency_us =3D=3D 0 ||
@@ -2011,7 +2008,8 @@ bool dcn20_validate_bandwidth_fp(struct dc *dc,
 	// Fallback: Try to only support G6 temperature read latency
 	context->bw_ctx.dml.soc.dram_clock_change_latency_us =3D context->bw_ctx.=
dml.soc.dummy_pstate_latency_us;
=20
-	voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context, fals=
e);
+	memset(pipes, 0, dc->res_pool->pipe_count * sizeof(display_e2e_pipe_param=
s_st));
+	voltage_supported =3D dcn20_validate_bandwidth_internal(dc, context, fals=
e, pipes);
 	dummy_pstate_supported =3D context->bw_ctx.bw.dcn.clk.p_state_change_supp=
ort;
=20
 	if (voltage_supported && (dummy_pstate_supported || !(context->stream_cou=
nt))) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h b/drivers=
/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
index a81a0b9e68842..b6c34198ddc86 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.h
@@ -61,9 +61,8 @@ void dcn20_update_bounding_box(struct dc *dc,
 			       unsigned int num_states);
 void dcn20_patch_bounding_box(struct dc *dc,
 			      struct _vcs_dpi_soc_bounding_box_st *bb);
-bool dcn20_validate_bandwidth_fp(struct dc *dc,
-				 struct dc_state *context,
-				 bool fast_validate);
+bool dcn20_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
+				 bool fast_validate, display_e2e_pipe_params_st *pipes);
 void dcn20_fpu_set_wm_ranges(int i,
 			     struct pp_smu_wm_range_sets *ranges,
 			     struct _vcs_dpi_soc_bounding_box_st *loaded_bb);
--=20
2.40.1

