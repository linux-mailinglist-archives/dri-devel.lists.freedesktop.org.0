Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD6F792376
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 16:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1C010E532;
	Tue,  5 Sep 2023 14:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CF210E530;
 Tue,  5 Sep 2023 14:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z/KycroXB/4cpJZUPCKT02X0i8FbehvhLdSmtqNV8Vw=; b=d2AtzVxCZRmjPV9yGAHvps3L/6
 wsP/UBBtuXJqK0eD80xvWAegvrL2TefIXxTM4RhJbENuIYmfz43SIbd9p9oyr1fyHCEFKTVuxEoAW
 9Ad0QBUWlcVBebpTJKg570mMoc+bA+pM7PcLO4GsvebJ/oU+1J03/Cbz0hwiVNfVwjPXTWjcHeT+C
 7JanWNNFVJ5DRNW2l3bnympbB6cNjEikkdkDp28LDM65w6WnuhA0aNEy3Mv9AMbk5MxCsqDOuWUQO
 IToqvNL+7LLD1xxraQ775ePQCXaZtrHsWDCnjMj7ogPgWg4GL+kdep7VIwTtgLsnXkWloDZhev9i4
 O5boMktg==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdX01-002cXU-5s; Tue, 05 Sep 2023 16:25:49 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH 1/5] drm/amd/display: detach color state from hw state
 logging
Date: Tue,  5 Sep 2023 13:25:41 -0100
Message-Id: <20230905142545.451153-2-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230905142545.451153-1-mwen@igalia.com>
References: <20230905142545.451153-1-mwen@igalia.com>
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare to hook color state logging according to DCN version.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c | 27 +++++++++++++------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 9834b75f1837..d82e49045fbc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -278,19 +278,14 @@ static void dcn10_log_hubp_states(struct dc *dc, void *log_ctx)
 	DTN_INFO("\n");
 }
 
-void dcn10_log_hw_state(struct dc *dc,
-	struct dc_log_buffer_ctx *log_ctx)
+static void
+dcn10_log_color_state(struct dc *dc,
+		      struct dc_log_buffer_ctx *log_ctx)
 {
 	struct dc_context *dc_ctx = dc->ctx;
 	struct resource_pool *pool = dc->res_pool;
 	int i;
 
-	DTN_INFO_BEGIN();
-
-	dcn10_log_hubbub_state(dc, log_ctx);
-
-	dcn10_log_hubp_states(dc, log_ctx);
-
 	DTN_INFO("DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode"
 			"  GAMUT mode  C11 C12   C13 C14   C21 C22   C23 C24   "
 			"C31 C32   C33 C34\n");
@@ -347,6 +342,22 @@ void dcn10_log_hw_state(struct dc *dc,
 				s.idle);
 	}
 	DTN_INFO("\n");
+}
+
+void dcn10_log_hw_state(struct dc *dc,
+	struct dc_log_buffer_ctx *log_ctx)
+{
+	struct dc_context *dc_ctx = dc->ctx;
+	struct resource_pool *pool = dc->res_pool;
+	int i;
+
+	DTN_INFO_BEGIN();
+
+	dcn10_log_hubbub_state(dc, log_ctx);
+
+	dcn10_log_hubp_states(dc, log_ctx);
+
+	dcn10_log_color_state(dc, log_ctx);
 
 	DTN_INFO("OTG:  v_bs  v_be  v_ss  v_se  vpol  vmax  vmin  vmax_sel  vmin_sel  h_bs  h_be  h_ss  h_se  hpol  htot  vtot  underflow blank_en\n");
 
-- 
2.40.1

