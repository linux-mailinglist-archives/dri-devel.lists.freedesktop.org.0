Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E7D7FC0D0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 18:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45C510E31D;
	Tue, 28 Nov 2023 17:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2BE10E2FE;
 Tue, 28 Nov 2023 17:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SMKsWWEGfr4trzX+JRITiuYYa9v9fb6z+7R9LdpqZzE=; b=rkLi+WT2u94jjrCdIvoh7eCtO+
 CA3jq9kr/qgJct6ZwT8mXJkp1QtVcu+i6W2TWnU6r8iOuy98TZIZPGHeX1fjv5UOyqqjD3ahAcIvF
 9zfJjKz2nl500gLQOOLiOwtUH/zmEqssFrCE5Dj3do7Ph0szr9JaEzVu7XSW/yxqVrmRTF/Paa5xm
 9kXBH4exBpIFJdnc5MGJm7JcEOKey6uPwhm2J2ka6A4U5C86x0/xkONQC9K7cd7VDwqlexQGDLvDZ
 Y17zyODMSAtAGP/3VcxpAnn+p4kS26B6KCQkmrvcIkL2XuW3Fg7RpS20dGHfuxuPBzA6x4V6iTHdW
 3/eYxfvA==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r82Jw-0087Bf-8t; Tue, 28 Nov 2023 18:56:28 +0100
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>, sunpeng.li@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 1/9] drm/amd/display: decouple color state from hw state log
Date: Tue, 28 Nov 2023 16:52:49 -0100
Message-ID: <20231128175623.121356-2-mwen@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128175623.121356-1-mwen@igalia.com>
References: <20231128175623.121356-1-mwen@igalia.com>
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
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare to hook up color state log according to the DCN version.

v3:
- put functions in single line (Siqueira)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 26 +++++++++++++------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index 2b8b8366538e..9b801488eb9d 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -282,19 +282,13 @@ static void dcn10_log_hubp_states(struct dc *dc, void *log_ctx)
 	DTN_INFO("\n");
 }
 
-void dcn10_log_hw_state(struct dc *dc,
-	struct dc_log_buffer_ctx *log_ctx)
+static void dcn10_log_color_state(struct dc *dc,
+				  struct dc_log_buffer_ctx *log_ctx)
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
@@ -351,6 +345,22 @@ void dcn10_log_hw_state(struct dc *dc,
 				s.idle);
 	}
 	DTN_INFO("\n");
+}
+
+void dcn10_log_hw_state(struct dc *dc,
+			struct dc_log_buffer_ctx *log_ctx)
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
2.42.0

