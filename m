Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163866DBB37
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 15:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740D310E0CE;
	Sat,  8 Apr 2023 13:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE6F10E0F0
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 13:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680961437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cWTGZwUDsK+ArhfUvsnQDdChpakeTyXMHjj4Kv1VcJU=;
 b=KieWFbmq1WnBk97p4I8uENpESW6+/s8uiTVC42y5gP72em1Vn7xFpV6eg5aMaSOKX0liEo
 i9EEIPkb/gWHyyC7RUfWZM7iCJxPwT38ErDCEQzzXmn1raOr/3ajLdAwrhVdx6i+ijkd6q
 y7wYwoSDXp5ajwqIVAcnVBVsq44n2RE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-5nfOKzvFPkG9KZBLUg-7ag-1; Sat, 08 Apr 2023 09:43:54 -0400
X-MC-Unique: 5nfOKzvFPkG9KZBLUg-7ag-1
Received: by mail-qt1-f198.google.com with SMTP id
 t30-20020a05622a181e00b003e37dd114e3so801997qtc.10
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Apr 2023 06:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680961433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cWTGZwUDsK+ArhfUvsnQDdChpakeTyXMHjj4Kv1VcJU=;
 b=JuYLWyPkESZfeEfSvF1mULe1FSstHSXzksMakMcwJ46W88ioJ0UOD2t+4eAz6ApsBW
 3viiL1FcuLX5ilJ23No/ekPZKAKmmRf7fmwiSVQ8rKzLdug4WdH4akKTQMAT6apLyjQ8
 x29TrFdiUGQqWzOOO+aBtmWjwEj2A04PjhGgUQk5NBdqD2N1RF3SsN0QtUFNpPwRYcts
 tN4ZEuWXDmOR0DZQJ/Xn4DLQHQ8TkIEfd/1wrmAvdhAYERzAm0L1iIOtgcEqg00Mthpj
 l0XifJCeR+Qu0pwzDwO5Reopa1xlWPf421UqoeYkS8O55NBm370lCBCvnq7+bic978TT
 EYPg==
X-Gm-Message-State: AAQBX9cRR8tRKGSRW09F7rpRPSHdVipbroa8qc2htisPDUxk+LPwD3mU
 1n2LjaaGCTHL/Gw0qzpcIifi9t/ZcbYoUtZ8F0OTDMbgclOUhbXu3+egWsWBXFFuQdaBsbpfBgl
 n42ilpUqfh7mRy9O4AksG4cdI92G4
X-Received: by 2002:a05:622a:1ba4:b0:3e6:6d82:3fd8 with SMTP id
 bp36-20020a05622a1ba400b003e66d823fd8mr3795522qtb.17.1680961433689; 
 Sat, 08 Apr 2023 06:43:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350YDlN+3ZRDKytX5Na9sWA4wfmdLE+QkD9JBOEgqvZpj+T/K9mAWJXM0MJJelMtg0nudO6TROA==
X-Received: by 2002:a05:622a:1ba4:b0:3e6:6d82:3fd8 with SMTP id
 bp36-20020a05622a1ba400b003e66d823fd8mr3795488qtb.17.1680961433420; 
 Sat, 08 Apr 2023 06:43:53 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 h22-20020ac85056000000b003e302c1f498sm1833122qtm.37.2023.04.08.06.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 06:43:53 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Pavle.Kotarac@amd.com, Jun.Lei@amd.com,
 nicholas.kazlauskas@amd.com, Charlene.Liu@amd.com,
 aurabindo.pillai@amd.com, Dmytro.Laktyushkin@amd.com
Subject: [PATCH] drm/amd/display: set variables dml*_funcs
 storage-class-specifier to static
Date: Sat,  8 Apr 2023 09:43:48 -0400
Message-Id: <20230408134348.2703105-1-trix@redhat.com>
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

smatch reports
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:44:24: warning: symbol
  'dml20_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:51:24: warning: symbol
  'dml20v2_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:58:24: warning: symbol
  'dml21_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:65:24: warning: symbol
  'dml30_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:72:24: warning: symbol
  'dml31_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:79:24: warning: symbol
  'dml314_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.c:86:24: warning: symbol
  'dml32_funcs' was not declared. Should it be static?

These variables are only used in one file so should be static.
Cleanup whitespace, use tabs consistently for indents.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../drm/amd/display/dc/dml/display_mode_lib.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
index 4125d3d111d1..bdf3ac6cadd5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_lib.c
@@ -41,51 +41,51 @@
 #include "dcn32/display_rq_dlg_calc_32.h"
 #include "dml_logger.h"
 
-const struct dml_funcs dml20_funcs = {
+static const struct dml_funcs dml20_funcs = {
 	.validate = dml20_ModeSupportAndSystemConfigurationFull,
 	.recalculate = dml20_recalculate,
 	.rq_dlg_get_dlg_reg = dml20_rq_dlg_get_dlg_reg,
 	.rq_dlg_get_rq_reg = dml20_rq_dlg_get_rq_reg
 };
 
-const struct dml_funcs dml20v2_funcs = {
+static const struct dml_funcs dml20v2_funcs = {
 	.validate = dml20v2_ModeSupportAndSystemConfigurationFull,
 	.recalculate = dml20v2_recalculate,
 	.rq_dlg_get_dlg_reg = dml20v2_rq_dlg_get_dlg_reg,
 	.rq_dlg_get_rq_reg = dml20v2_rq_dlg_get_rq_reg
 };
 
-const struct dml_funcs dml21_funcs = {
-        .validate = dml21_ModeSupportAndSystemConfigurationFull,
-        .recalculate = dml21_recalculate,
-        .rq_dlg_get_dlg_reg = dml21_rq_dlg_get_dlg_reg,
-        .rq_dlg_get_rq_reg = dml21_rq_dlg_get_rq_reg
+static const struct dml_funcs dml21_funcs = {
+	.validate = dml21_ModeSupportAndSystemConfigurationFull,
+	.recalculate = dml21_recalculate,
+	.rq_dlg_get_dlg_reg = dml21_rq_dlg_get_dlg_reg,
+	.rq_dlg_get_rq_reg = dml21_rq_dlg_get_rq_reg
 };
 
-const struct dml_funcs dml30_funcs = {
+static const struct dml_funcs dml30_funcs = {
 	.validate = dml30_ModeSupportAndSystemConfigurationFull,
 	.recalculate = dml30_recalculate,
 	.rq_dlg_get_dlg_reg = dml30_rq_dlg_get_dlg_reg,
 	.rq_dlg_get_rq_reg = dml30_rq_dlg_get_rq_reg
 };
 
-const struct dml_funcs dml31_funcs = {
+static const struct dml_funcs dml31_funcs = {
 	.validate = dml31_ModeSupportAndSystemConfigurationFull,
 	.recalculate = dml31_recalculate,
 	.rq_dlg_get_dlg_reg = dml31_rq_dlg_get_dlg_reg,
 	.rq_dlg_get_rq_reg = dml31_rq_dlg_get_rq_reg
 };
 
-const struct dml_funcs dml314_funcs = {
+static const struct dml_funcs dml314_funcs = {
 	.validate = dml314_ModeSupportAndSystemConfigurationFull,
 	.recalculate = dml314_recalculate,
 	.rq_dlg_get_dlg_reg = dml314_rq_dlg_get_dlg_reg,
 	.rq_dlg_get_rq_reg = dml314_rq_dlg_get_rq_reg
 };
 
-const struct dml_funcs dml32_funcs = {
+static const struct dml_funcs dml32_funcs = {
 	.validate = dml32_ModeSupportAndSystemConfigurationFull,
-    .recalculate = dml32_recalculate,
+	.recalculate = dml32_recalculate,
 	.rq_dlg_get_dlg_reg_v2 = dml32_rq_dlg_get_dlg_reg,
 	.rq_dlg_get_rq_reg_v2 = dml32_rq_dlg_get_rq_reg
 };
-- 
2.27.0

