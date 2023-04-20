Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726F26E87CD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 04:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8660210E21C;
	Thu, 20 Apr 2023 02:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4822810E21C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 02:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681956267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3DmHTzBBosn4V3T229BK2WXwwGVza+mxkwM7dlmK1v0=;
 b=AcpGCNeBs8HmPcaLm2aS5WR1lxaKHNtSykqgp6yKajsdhHDN+UEMUrEd7v4il2RPAIl4yW
 pyLi4idewnywlosOEeV7RNaMoP2M5h3NdTq25Ca4Yc3hZ3vRkudwCvxyDQko5ROlHgSr5U
 qD+MdJAYjhPlB48RFSfQmFxzimvJNUI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-BttOXEARMrO2tKYO5DYuHQ-1; Wed, 19 Apr 2023 22:04:26 -0400
X-MC-Unique: BttOXEARMrO2tKYO5DYuHQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-74abf3c979eso29278785a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 19:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681956266; x=1684548266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3DmHTzBBosn4V3T229BK2WXwwGVza+mxkwM7dlmK1v0=;
 b=eVzq+A9avvxVaCvl/0em9TKpw0A/dkoqYnBSvXKQiZSq78CpVUMLDwGyR9MMW0wy+S
 Zg/1r81MHBxrFeNw/xeCL36uJ7Bx5Az6vrAF8cz8l/cTPhZCcy40+K4hmpKr8HEsvi9c
 l9qS+F0Rw8FQBhMHLEuB9RwWZpIxs4XBgO15dnzpVU3gff6vtzE89N2S5vQ+nuPBNWsx
 7w+Blb/qQUwYZis2L9sIAWxK/Rp7crQW2rc1y3o62aQHF1f89u8rIVvVp8qmdJEXsfVR
 07+qgfjWeTenUhnOWh4Tt+NKbUAsNbGxx8Xv2q6NvAaASz6chvQMyNgGi3maHHfzq+r8
 W45Q==
X-Gm-Message-State: AAQBX9efyec1MM9+wwSU6J/YyN7NZpTz8lzXQ/RQH5vf8UdPWncar3Eg
 SzRYaoxud+BSp1+J/D7DJd92EgOhPVryp8wUm4ykDuNedKvD3hgBeLDkL6Ms3Ufb0gHkTGp+/zr
 5t2TCxfv83aYKBogeluNlrbOrBxER
X-Received: by 2002:a05:622a:1a90:b0:3e4:ee15:ad44 with SMTP id
 s16-20020a05622a1a9000b003e4ee15ad44mr1262271qtc.31.1681956266015; 
 Wed, 19 Apr 2023 19:04:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350YeuDz5Dp3h9GRFwpofcuw/paRA8u3EMOKlcRyxTl5AAfb6gcJc36XIOwa+mFTFL6PBsRFbLA==
X-Received: by 2002:a05:622a:1a90:b0:3e4:ee15:ad44 with SMTP id
 s16-20020a05622a1a9000b003e4ee15ad44mr1262228qtc.31.1681956265646; 
 Wed, 19 Apr 2023 19:04:25 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a05620a094e00b0074e21136a77sm69826qkw.127.2023.04.19.19.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 19:04:25 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, qingqing.zhuo@amd.com,
 wenjing.liu@amd.com, Jun.Lei@amd.com, Josip.Pavic@amd.com,
 Leon.Huang1@amd.com, Nicholas.Kazlauskas@amd.com
Subject: [PATCH] drm/amd/display: remove unused variables otg_inst and cmd
Date: Wed, 19 Apr 2023 22:04:22 -0400
Message-Id: <20230420020422.3256782-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gcc reports
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:
  In function ‘dcn21_set_backlight_level’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:18:
  error: unused variable ‘otg_inst’ [-Werror=unused-variable]
  229 |         uint32_t otg_inst = pipe_ctx->stream_res.tg->inst;
      |                  ^~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:27:
  error: unused variable ‘cmd’ [-Werror=unused-variable]
  226 |         union dmub_rb_cmd cmd;
      |                           ^~~

These variables are not used, so remove them.

Fixes: e97cc04fe0fb ("drm/amd/display: refactor dmub commands into single function")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
index 55a464a39529..43463d08f21b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
@@ -223,10 +223,8 @@ bool dcn21_set_backlight_level(struct pipe_ctx *pipe_ctx,
 		uint32_t backlight_pwm_u16_16,
 		uint32_t frame_ramp)
 {
-	union dmub_rb_cmd cmd;
 	struct dc_context *dc = pipe_ctx->stream->ctx;
 	struct abm *abm = pipe_ctx->stream_res.abm;
-	uint32_t otg_inst = pipe_ctx->stream_res.tg->inst;
 	struct panel_cntl *panel_cntl = pipe_ctx->stream->link->panel_cntl;
 
 	if (dc->dc->res_pool->dmcu) {
-- 
2.27.0

