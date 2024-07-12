Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B0692FE66
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 18:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578C710E198;
	Fri, 12 Jul 2024 16:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R6aBcdcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E2E10E198;
 Fri, 12 Jul 2024 16:23:59 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-367b8a60b60so1237380f8f.2; 
 Fri, 12 Jul 2024 09:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720801437; x=1721406237; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hn+GixGy3/wqCNmbaVUdcuRjiIfqGnrOXg+l5ek8FFw=;
 b=R6aBcdcqmkavoufOA752poB3w96JIIuXy+jhpNK44ibEXzrJEYCagj4apnelEgWg2i
 kMr1Z/pNQHxD9et7Lkoj5r1K7ykdEYcMq9gA0up6k2mX3Ai2KXRqMgShZh64WgxhrWRR
 +7Z5B0cLQJYsFrVy74cE/g/FOkWBdBiftLDkRcQ1gel8sWAs6J+lK/+Df/PwzvKGollh
 +jc9mE0b4bCChIh48u9OjXqXD33hJvKw86HihPUufLadGqASiO+EBmBp2NJ5C3YZV69B
 7qRTabFtUMbCu1aymmtQkGELdWY8jfMdyuhYvp8xc0Wf3tsezYaundqetoBCqcEk1ZTr
 n3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720801437; x=1721406237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hn+GixGy3/wqCNmbaVUdcuRjiIfqGnrOXg+l5ek8FFw=;
 b=R7J/hfGSvDTMVJUU00aj17tfkQpVIiqDTZj2gz8tSazdbm7YP3t9R1VP4UkNLeEwlK
 Ef0i5tXwR/pCCiwFbjBelsIvRI5lboJ9GKFnk8l53U6zN5/luo38YQ6h1LnU/B+eIoyF
 IP+P1yUDJWIN+Y9fNOfYlEF2X0hLKb3XUHxQyaFZFENJf+kU4q98K9RK1ObiUlwJB4GX
 tNahXWQ6MyN+oUaeo6x9Ibq/k6tPj1onVfCeZX50ipfwKWQ5Uvnv1Bbb+DH3WJO0phlw
 YXedVUF84fWit05aniljRPggKuYCCiPMFbydmCbZWcjW3OepeuJTEWWe3sA+tYxkB3Ge
 R4Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Eqrp1YPw5QBg6jJDDLpyuE1hsoUBIH1CtaE4c/n1oRDBeqFceJOxWBqZgdPaUDzVvhY7DuObO49yd78IoBf1uXeZhyUy9EceFLxn+kUgeP017IPNTrAYVZxNVsZNZFMK1nA5khnQxa6Um5R0LA==
X-Gm-Message-State: AOJu0YxtXTphAFnUw2iOew5+ChrrOIbM+V0zFKt1F907AWI31ned17HS
 HA2MblgaIQuuNga9vWFuqoVW1gd1q90wL3Ii47n5jIKcLFovB2xT
X-Google-Smtp-Source: AGHT+IFXRaZUXZvr3FGsTkx2MEPXnjbLliZ4mKa0YckpBF5gChle14p/17QJAUoUUg7mT8NHlqYVcw==
X-Received: by 2002:a5d:60c5:0:b0:367:4dbb:ed4e with SMTP id
 ffacd0b85a97d-367ce5de7c8mr8005771f8f.0.1720801437223; 
 Fri, 12 Jul 2024 09:23:57 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde848e7sm10458852f8f.44.2024.07.12.09.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:23:56 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: harry.wentland@amd.com
Cc: Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] drm/amd/display: Implement bounds check for stream encoder
 creation
Date: Fri, 12 Jul 2024 18:23:53 +0200
Message-ID: <20240712162353.10220-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The same pattern fixed by commit 15dba12c5659 ("drm/amd/display:
Implement bounds check for stream encoder creation in DCN301") was used
in other create_stream_encoder() functions.

Apply the same fix.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c    | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c    | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c    | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c  | 2 +-
 .../gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c    | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
index f35cc307830b..c8a538a6ea76 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
@@ -1029,7 +1029,7 @@ static struct stream_encoder *dcn30_stream_encoder_create(enum engine_id eng_id,
 	vpg = dcn30_vpg_create(ctx, vpg_inst);
 	afmt = dcn30_afmt_create(ctx, afmt_inst);
 
-	if (!enc1 || !vpg || !afmt) {
+	if (!enc1 || !vpg || !afmt || eng_id >= ARRAY_SIZE(stream_enc_regs)) {
 		kfree(enc1);
 		kfree(vpg);
 		kfree(afmt);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
index 5791b5cc2875..a12d880da586 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn302/dcn302_resource.c
@@ -407,7 +407,7 @@ static struct stream_encoder *dcn302_stream_encoder_create(enum engine_id eng_id
 	vpg = dcn302_vpg_create(ctx, vpg_inst);
 	afmt = dcn302_afmt_create(ctx, afmt_inst);
 
-	if (!enc1 || !vpg || !afmt) {
+	if (!enc1 || !vpg || !afmt || eng_id >= ARRAY_SIZE(stream_enc_regs)) {
 		kfree(enc1);
 		kfree(vpg);
 		kfree(afmt);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
index 8bc1bcaeaa47..75481c6d99b5 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn303/dcn303_resource.c
@@ -394,7 +394,7 @@ static struct stream_encoder *dcn303_stream_encoder_create(enum engine_id eng_id
 	vpg = dcn303_vpg_create(ctx, vpg_inst);
 	afmt = dcn303_afmt_create(ctx, afmt_inst);
 
-	if (!enc1 || !vpg || !afmt) {
+	if (!enc1 || !vpg || !afmt || eng_id >= ARRAY_SIZE(stream_enc_regs)) {
 		kfree(enc1);
 		kfree(vpg);
 		kfree(afmt);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
index d4c3e2754f51..3fd172788581 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
@@ -1237,7 +1237,7 @@ static struct stream_encoder *dcn31_stream_encoder_create(
 	vpg = dcn31_vpg_create(ctx, vpg_inst);
 	afmt = dcn31_afmt_create(ctx, afmt_inst);
 
-	if (!enc1 || !vpg || !afmt) {
+	if (!enc1 || !vpg || !afmt || eng_id >= ARRAY_SIZE(stream_enc_regs)) {
 		kfree(enc1);
 		kfree(vpg);
 		kfree(afmt);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
index ff50f43e4c00..83ad7a7d3fd7 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
@@ -1293,7 +1293,7 @@ static struct stream_encoder *dcn314_stream_encoder_create(
 	vpg = dcn31_vpg_create(ctx, vpg_inst);
 	afmt = dcn31_afmt_create(ctx, afmt_inst);
 
-	if (!enc1 || !vpg || !afmt) {
+	if (!enc1 || !vpg || !afmt || eng_id >= ARRAY_SIZE(stream_enc_regs)) {
 		kfree(enc1);
 		kfree(vpg);
 		kfree(afmt);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
index 4ce0f4bf1d9b..cd6471eb01b2 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
@@ -1236,7 +1236,7 @@ static struct stream_encoder *dcn315_stream_encoder_create(
 	vpg = dcn31_vpg_create(ctx, vpg_inst);
 	afmt = dcn31_afmt_create(ctx, afmt_inst);
 
-	if (!enc1 || !vpg || !afmt) {
+	if (!enc1 || !vpg || !afmt || eng_id >= ARRAY_SIZE(stream_enc_regs)) {
 		kfree(enc1);
 		kfree(vpg);
 		kfree(afmt);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
index 5fd52c5fcee4..1f40e150a478 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
@@ -1231,7 +1231,7 @@ static struct stream_encoder *dcn316_stream_encoder_create(
 	vpg = dcn31_vpg_create(ctx, vpg_inst);
 	afmt = dcn31_afmt_create(ctx, afmt_inst);
 
-	if (!enc1 || !vpg || !afmt) {
+	if (!enc1 || !vpg || !afmt || eng_id >= ARRAY_SIZE(stream_enc_regs)) {
 		kfree(enc1);
 		kfree(vpg);
 		kfree(afmt);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index abd76345d1e4..39cef0018dae 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1216,7 +1216,7 @@ static struct stream_encoder *dcn32_stream_encoder_create(
 	vpg = dcn32_vpg_create(ctx, vpg_inst);
 	afmt = dcn32_afmt_create(ctx, afmt_inst);
 
-	if (!enc1 || !vpg || !afmt) {
+	if (!enc1 || !vpg || !afmt || eng_id >= ARRAY_SIZE(stream_enc_regs)) {
 		kfree(enc1);
 		kfree(vpg);
 		kfree(afmt);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index e4b360d89b3b..1ed1c93f8e72 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -1200,7 +1200,7 @@ static struct stream_encoder *dcn321_stream_encoder_create(
 	vpg = dcn321_vpg_create(ctx, vpg_inst);
 	afmt = dcn321_afmt_create(ctx, afmt_inst);
 
-	if (!enc1 || !vpg || !afmt) {
+	if (!enc1 || !vpg || !afmt || eng_id >= ARRAY_SIZE(stream_enc_regs)) {
 		kfree(enc1);
 		kfree(vpg);
 		kfree(afmt);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 2df8a742516c..ed1c9cd1c30c 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1280,7 +1280,7 @@ static struct stream_encoder *dcn35_stream_encoder_create(
 	vpg = dcn31_vpg_create(ctx, vpg_inst);
 	afmt = dcn31_afmt_create(ctx, afmt_inst);
 
-	if (!enc1 || !vpg || !afmt) {
+	if (!enc1 || !vpg || !afmt || eng_id >= ARRAY_SIZE(stream_enc_regs)) {
 		kfree(enc1);
 		kfree(vpg);
 		kfree(afmt);
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index ddf9560ab772..35dbb8641ed6 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1260,7 +1260,7 @@ static struct stream_encoder *dcn35_stream_encoder_create(
 	vpg = dcn31_vpg_create(ctx, vpg_inst);
 	afmt = dcn31_afmt_create(ctx, afmt_inst);
 
-	if (!enc1 || !vpg || !afmt) {
+	if (!enc1 || !vpg || !afmt || eng_id >= ARRAY_SIZE(stream_enc_regs)) {
 		kfree(enc1);
 		kfree(vpg);
 		kfree(afmt);
-- 
2.45.2

