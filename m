Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF72A6B0061
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 09:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA6210E59E;
	Wed,  8 Mar 2023 08:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480A210E564
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:53:53 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 q11-20020a056830440b00b00693c1a62101so8094836otv.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 14:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1678229632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pKVqxub/Fk+VY98iPdnTOYqYL+oFSC0KdiMA5tq1zzQ=;
 b=cjO2r2iCTHNkY+LCiq5PTW5GA9posA/IfRrUE3PgSJAgub8XuFtnDujBteNqeBeiKm
 9Ip4gcSwzNtDCsEd0lQUnFbSLel7lraorSoJJuLzPmHLe6gnRl/GmWxScST82K/BYYcs
 kbeFTrZrNY+vkt9r1277I3/M4QvMqWrELhs2q0ld8Sar2C7RacUnJKvyjo6rYTTcPq2c
 AG6ATsN6CORQxMEnklmjPKfe1IKIonNIWc5POfYDTaXqLxS+kI/hFExi1duHiV47je43
 6ZvPcrwL2tRZKisOIWbDfXms4QjxqtVXieaR8w8o06pWGAB+YeEYyQ2ytIp1VPUdiZvW
 pHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678229632;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pKVqxub/Fk+VY98iPdnTOYqYL+oFSC0KdiMA5tq1zzQ=;
 b=QQmOW6rmgdsqMI3cEfz13WpgD8jHoXsAKOr76Bfpn4nF/y2ShN7OgOmBe3yMkFuizd
 lHry2SSBUu9zr2ZGM0pSjlCLDiZoKDA8W3P5dfchbEhU2HxQ9WNyu92CD5JKVBDixapj
 HLc7TFi3t5vC7nNG8kEs0VNcQ0zzAfHk9CdP37tovvESuoCPmKWoPiLZSkf5nIew5hIg
 pGB7/iwj2ROD4hfzkvxibWlR0HUiatRq5aaIKtiRJK3irc1wfQDg9Q3Ivnnk4Y4kinTx
 /osKGZH63j2dGr2j5z39Lto4N8FhbLmuAQojezP03BX6KFD4KGVOfvmhVN23TArp9mz2
 qv1Q==
X-Gm-Message-State: AO0yUKWTvpQgbjkHx/urcg8qcrd3fw/RiY5XfIuNQPEkYYt0iPJwCcwl
 M5Np0TElOv+oBM/Zk6wZUrBYig==
X-Google-Smtp-Source: AK7set9wBHhbtGK0bt/+x7+CPlbUY/sT7o5N4KRvbzNLjC9F9hzn9NTWZpYjpUbJL2xzCAIMknEg8g==
X-Received: by 2002:a05:6830:56c:b0:690:a6b3:a2f6 with SMTP id
 f12-20020a056830056c00b00690a6b3a2f6mr7070475otc.0.1678229632403; 
 Tue, 07 Mar 2023 14:53:52 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:63:8ae3:4d1f:9fc2:9fe6:c88e])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a9d70c3000000b0069451a9274bsm5251208otj.28.2023.03.07.14.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 14:53:51 -0800 (PST)
From: David Tadokoro <davidbtadokoro@usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: remove legacy fields of dc_plane_cap struct
Date: Tue,  7 Mar 2023 19:53:41 -0300
Message-Id: <20230307225341.246596-1-davidbtadokoro@usp.br>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Mar 2023 08:00:29 +0000
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
Cc: David Tadokoro <davidbtadokoro@usp.br>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fields blends_with_above and blends_with_below of struct
dc_plane_cap (defined in dc/dc.h) are boolean and set to true by
default. All instances of a dc_plane_cap maintain the default values of
both. Also, there is only one if statement that checks those fields and
there would be the same effect if it was deleted (assuming that those
fields are always going to be true).

For this reason, considering both fields as legacy ones, this commit
removes them and the aforementioned if statement.

Signed-off-by: David Tadokoro <davidbtadokoro@usp.br>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       | 3 ---
 drivers/gpu/drm/amd/display/dc/dc.h                     | 2 --
 drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 3 ---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c   | 2 --
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c   | 2 --
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c | 2 --
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c   | 2 --
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c   | 2 --
 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c | 2 --
 drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c | 2 --
 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c | 2 --
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c   | 2 --
 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c | 2 --
 drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c | 2 --
 drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c | 2 --
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c   | 2 --
 drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c | 2 --
 17 files changed, 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b472931cb7ca..fdcb375e908a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4354,9 +4354,6 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 		if (plane->type != DC_PLANE_TYPE_DCN_UNIVERSAL)
 			continue;
 
-		if (!plane->blends_with_above || !plane->blends_with_below)
-			continue;
-
 		if (!plane->pixel_format_support.argb8888)
 			continue;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index f0a1934ebf8c..ccc27d482640 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -82,8 +82,6 @@ enum det_size {
 
 struct dc_plane_cap {
 	enum dc_plane_type type;
-	uint32_t blends_with_above : 1;
-	uint32_t blends_with_below : 1;
 	uint32_t per_pixel_alpha : 1;
 	struct {
 		uint32_t argb8888 : 1;
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
index f808315b2835..a4a45a6ce61e 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
@@ -401,8 +401,6 @@ static const struct resource_caps stoney_resource_cap = {
 
 static const struct dc_plane_cap plane_cap = {
 		.type = DC_PLANE_TYPE_DCE_RGB,
-		.blends_with_below = true,
-		.blends_with_above = true,
 		.per_pixel_alpha = 1,
 
 		.pixel_format_support = {
@@ -428,7 +426,6 @@ static const struct dc_plane_cap plane_cap = {
 
 static const struct dc_plane_cap underlay_plane_cap = {
 		.type = DC_PLANE_TYPE_DCE_UNDERLAY,
-		.blends_with_above = true,
 		.per_pixel_alpha = 1,
 
 		.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
index 6bfac8088ab0..2bb8e11f26e0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
@@ -504,8 +504,6 @@ static const struct resource_caps rv2_res_cap = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 3af24ef9cb2d..00668df0938e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -670,8 +670,6 @@ static const struct resource_caps res_cap_nv10 = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
index cd46701398d9..6ea70da28aaa 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
@@ -571,8 +571,6 @@ static const struct resource_caps res_cap_dnc201 = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 8f9244fe5c86..3ac8c0282589 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -609,8 +609,6 @@ static const struct resource_caps res_cap_rn_FPGA_2pipe_dsc = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index b5b5320c7bef..d60c17d5a0d8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -680,8 +680,6 @@ static const struct resource_caps res_cap_dcn3 = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
index ee62ae3eb98f..b93b4498dba4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
@@ -651,8 +651,6 @@ static struct resource_caps res_cap_dcn301 = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
index 03ddf4f5f065..6ccad53f1e49 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
@@ -147,8 +147,6 @@ static const struct resource_caps res_cap_dcn302 = {
 
 static const struct dc_plane_cap plane_cap = {
 		.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-		.blends_with_above = true,
-		.blends_with_below = true,
 		.per_pixel_alpha = true,
 		.pixel_format_support = {
 				.argb8888 = true,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
index 727f458f6ee9..5c28f7151d13 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
@@ -126,8 +126,6 @@ static const struct resource_caps res_cap_dcn303 = {
 
 static const struct dc_plane_cap plane_cap = {
 		.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-		.blends_with_above = true,
-		.blends_with_below = true,
 		.per_pixel_alpha = true,
 		.pixel_format_support = {
 				.argb8888 = true,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index d3918a10773a..eaaa2e01f6d0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -827,8 +827,6 @@ static const struct resource_caps res_cap_dcn31 = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
index f9dfbc7407ee..50ed7e09d5ba 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -855,8 +855,6 @@ static const struct resource_caps res_cap_dcn314 = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
index 7887078c5f64..41c972c8eb19 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.c
@@ -824,8 +824,6 @@ static const struct resource_caps res_cap_dcn31 = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
index dc0b49506275..9ead347a33e9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
@@ -824,8 +824,6 @@ static const struct resource_caps res_cap_dcn31 = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index 87f7669e81d7..100b6df33b33 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -657,8 +657,6 @@ static const struct resource_caps res_cap_dcn32 = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
index deaa4769be10..0f477d50e935 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
@@ -655,8 +655,6 @@ static const struct resource_caps res_cap_dcn321 = {
 
 static const struct dc_plane_cap plane_cap = {
 	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
-	.blends_with_above = true,
-	.blends_with_below = true,
 	.per_pixel_alpha = true,
 
 	.pixel_format_support = {
-- 
2.39.2

