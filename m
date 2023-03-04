Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A91D6AAB18
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 17:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067E710E1B9;
	Sat,  4 Mar 2023 16:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD9010E1B3
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677946944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dmotLXem4e3x/uxYnezILl2DZNq6o+kU9ZnW6R95Pzc=;
 b=fktkH2vqk0bEsc7tKIxe76DHQIBzc9bVVRmELnjL6UjY8pzJcvqKKMetsUh9j8dZ3Yo8PU
 XiRmy9VIwo6GS4am0iDdxipDjokqgoOXg+qu+9ZtrFbc7MZErVm5lDXUTCsKRi6yhQ86bM
 pnNrGoAUMgnDoJgWQEvGREl0Id+MYTQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-JavRLJFyNP-QqVWa3Z1eiQ-1; Sat, 04 Mar 2023 11:22:22 -0500
X-MC-Unique: JavRLJFyNP-QqVWa3Z1eiQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 c11-20020ac85a8b000000b003bfdd43ac76so3073857qtc.5
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Mar 2023 08:22:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677946942;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dmotLXem4e3x/uxYnezILl2DZNq6o+kU9ZnW6R95Pzc=;
 b=XWqLZSjjj26iAwu1XANluWBEAl938iI6Fhruw5GCdW3/aE9NUDgoLWZHXTfRs4bloH
 mKF2poZYbwC0qj0GNpEkdUIyRx8dTYvALah5VH0yk7U4R7+kYY6wJct8DiITnPmqXYmu
 /IjiS0hRdLC9B8ShSMF2iQumoedsU+HOenZhaBgo3c42439mJAyTr2d7GU1STn6hoGUd
 WZZCbgsc9ngZko8+WQrS971PNsDH5dJYEMYz0vivWTxP/rJYnG9p/bMW9WtEOBhLx2WX
 7e/2EF9TYHlRpq1LjKqFdnP95V002idZEYkh0BUMjor5d6WbUXchkbynsJQM87Z2A1Oe
 89yw==
X-Gm-Message-State: AO0yUKUrIwPgltThGJtrFw0dCDWfG77oUoHqscZYL6LaTAi0EoFwGVBL
 WoENO/uOYbXlFQRhC2o0cSuyEHuJyaizhdd1UNjVf+yfjUcV9+J0X907OBZF7+2lno2lEHrByxz
 jLY8P1vd/ADm8iijC4VJGj43O9LBC
X-Received: by 2002:a05:6214:f09:b0:577:5b89:577e with SMTP id
 gw9-20020a0562140f0900b005775b89577emr10603079qvb.32.1677946942378; 
 Sat, 04 Mar 2023 08:22:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/JOVgua1W48N5/fE0WY936nqy/GjjBYTH7jYlDd1pCaIPB4j3tzfLMIQGDzqH29BsEliUTcQ==
X-Received: by 2002:a05:6214:f09:b0:577:5b89:577e with SMTP id
 gw9-20020a0562140f0900b005775b89577emr10603032qvb.32.1677946942084; 
 Sat, 04 Mar 2023 08:22:22 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 s144-20020a374596000000b0073bb4312842sm3904539qka.128.2023.03.04.08.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 08:22:21 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, alvin.lee2@amd.com, javierm@redhat.com,
 hamza.mahfooz@amd.com, eric.bernstein@amd.com, roman.li@amd.com,
 wenjing.liu@amd.com, praful.swarnakar@amd.com, tzimmermann@suse.de,
 jiapeng.chong@linux.alibaba.com, Pavle.Kotarac@amd.com,
 hansen.dsouza@amd.com, Charlene.Liu@amd.com, Josip.Pavic@amd.com,
 Jun.Lei@amd.com, chiahsuan.chung@amd.com
Subject: [PATCH] drm/amd/display: change several dcn20 variables
 storage-class-specifier to static
Date: Sat,  4 Mar 2023 11:22:13 -0500
Message-Id: <20230304162213.1939515-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

smatch reports these similar problems in dcn20
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dsc.c:53:24:
  warning: symbol 'dcn20_dsc_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dwb.c:304:25:
  warning: symbol 'dcn20_dwbc_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_mmhubbub.c:300:28:
  warning: symbol 'dcn20_mmhubbub_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_mpc.c:545:24:
  warning: symbol 'dcn20_mpc_funcs' was not declared. Should it be static?

All of these are only used in their definition file, so they should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c      | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c      | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
index 42344aec60d6..5bd698cd6d20 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
@@ -50,7 +50,7 @@ static void dsc2_enable(struct display_stream_compressor *dsc, int opp_pipe);
 static void dsc2_disable(struct display_stream_compressor *dsc);
 static void dsc2_disconnect(struct display_stream_compressor *dsc);
 
-const struct dsc_funcs dcn20_dsc_funcs = {
+static const struct dsc_funcs dcn20_dsc_funcs = {
 	.dsc_get_enc_caps = dsc2_get_enc_caps,
 	.dsc_read_state = dsc2_read_state,
 	.dsc_validate_stream = dsc2_validate_stream,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c
index f1490e97b6ce..f8667be57046 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c
@@ -301,7 +301,7 @@ void dwb2_set_scaler(struct dwbc *dwbc, struct dc_dwb_params *params)
 
 }
 
-const struct dwbc_funcs dcn20_dwbc_funcs = {
+static const struct dwbc_funcs dcn20_dwbc_funcs = {
 	.get_caps		= dwb2_get_caps,
 	.enable			= dwb2_enable,
 	.disable		= dwb2_disable,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c
index ccd91792991b..259a98e4ee2c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c
@@ -297,7 +297,7 @@ void mcifwb2_dump_frame(struct mcif_wb *mcif_wb,
 	dump_info->size		= dest_height * (mcif_params->luma_pitch + mcif_params->chroma_pitch);
 }
 
-const struct mcif_wb_funcs dcn20_mmhubbub_funcs = {
+static const struct mcif_wb_funcs dcn20_mmhubbub_funcs = {
 	.enable_mcif		= mmhubbub2_enable_mcif,
 	.disable_mcif		= mmhubbub2_disable_mcif,
 	.config_mcif_buf	= mmhubbub2_config_mcif_buf,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
index 116f67a0b989..5da6e44f284a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
@@ -542,7 +542,7 @@ static struct mpcc *mpc2_get_mpcc_for_dpp(struct mpc_tree *tree, int dpp_id)
 	return NULL;
 }
 
-const struct mpc_funcs dcn20_mpc_funcs = {
+static const struct mpc_funcs dcn20_mpc_funcs = {
 	.read_mpcc_state = mpc1_read_mpcc_state,
 	.insert_plane = mpc1_insert_plane,
 	.remove_mpcc = mpc1_remove_mpcc,
-- 
2.27.0

