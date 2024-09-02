Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE24968378
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D1310E0CC;
	Mon,  2 Sep 2024 09:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="eG7RNFJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2.math.uni-bielefeld.de (smtp2.math.uni-bielefeld.de
 [129.70.45.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7FF10E279;
 Mon,  2 Sep 2024 09:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=math.uni-bielefeld.de; s=default; t=1725270082;
 bh=+zKyfDeG1O93W2ZvWeGRXFBv0Meg5VnoIPBsky28Bpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eG7RNFJfRcvxTzXfiBR69eBsQBRQpchcrbMGUvo7uolU4X4ENc9XiqQUU/QU8UBuq
 PZ40uwkYSb3qM8MxqTSUoAA+EybrFX4fUhzCpxDgTKMt9VXl+qaWOaChiOUeBKWCeH
 krdHfGdRFKfMJm24J15ZC1ophquN/uXLsOfN/UbF4JYPM+qv64GQr4m8FLB+RGu14D
 YUNr/AMrIHtruT2UlH3OmBTpQ8ZtguwabV6UNgjD5fewzmCBYnO8xe1DWL+y2VveB8
 QBPihzqzlSOwtAZqih89mVVCfQ2vjfFfoTx3upaZnHYQaEgddIM6DPwbRIlxQWD/Ld
 S/a9wc9B04oWA==
Received: from localhost (dslb-088-074-203-146.088.074.pools.vodafone-ip.de
 [88.74.203.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id 4CB9B206F4;
 Mon,  2 Sep 2024 11:41:22 +0200 (CEST)
From: tjakobi@math.uni-bielefeld.de
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/amd/display: Avoid race between dcn10_set_drr() and
 dc_state_destruct()
Date: Mon,  2 Sep 2024 11:40:26 +0200
Message-ID: <7b9dbbbb1e6a3aa6d7a4d9367d44d18ddd947158.1725269643.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <cover.1725269643.git.tjakobi@math.uni-bielefeld.de>
References: <cover.1725269643.git.tjakobi@math.uni-bielefeld.de>
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

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

dc_state_destruct() nulls the resource context of the DC state. The pipe
context passed to dcn10_set_drr() is a member of this resource context.

If dc_state_destruct() is called parallel to the IRQ processing (which
calls dcn10_set_drr() at some point), we can end up using already nulled
function callback fields of struct stream_resource.

The logic in dcn10_set_drr() already tries to avoid this, by checking tg
against NULL. But if the nulling happens exactly after the NULL check and
before the next access, then we get a race.

Avoid this by copying tg first to a local variable, and then use this
variable for all the operations. This should work, as long as nobody
frees the resource pool where the timing generators live.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3142
Fixes: 06ad7e164256 ("drm/amd/display: Destroy DC context while keeping DML and DML2")
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index 3306684e805a..da8f2cb3c5db 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -3223,15 +3223,19 @@ void dcn10_set_drr(struct pipe_ctx **pipe_ctx,
 	 * as well.
 	 */
 	for (i = 0; i < num_pipes; i++) {
-		if ((pipe_ctx[i]->stream_res.tg != NULL) && pipe_ctx[i]->stream_res.tg->funcs) {
-			if (pipe_ctx[i]->stream_res.tg->funcs->set_drr)
-				pipe_ctx[i]->stream_res.tg->funcs->set_drr(
-					pipe_ctx[i]->stream_res.tg, &params);
+		/* dc_state_destruct() might null the stream resources, so fetch tg
+		 * here first to avoid a race condition. The lifetime of the pointee
+		 * itself (the timing_generator object) is not a problem here.
+		 */
+		struct timing_generator *tg = pipe_ctx[i]->stream_res.tg;
+
+		if ((tg != NULL) && tg->funcs) {
+			if (tg->funcs->set_drr)
+				tg->funcs->set_drr(tg, &params);
 			if (adjust.v_total_max != 0 && adjust.v_total_min != 0)
-				if (pipe_ctx[i]->stream_res.tg->funcs->set_static_screen_control)
-					pipe_ctx[i]->stream_res.tg->funcs->set_static_screen_control(
-						pipe_ctx[i]->stream_res.tg,
-						event_triggers, num_frames);
+				if (tg->funcs->set_static_screen_control)
+					tg->funcs->set_static_screen_control(
+						tg, event_triggers, num_frames);
 		}
 	}
 }
-- 
2.44.2

