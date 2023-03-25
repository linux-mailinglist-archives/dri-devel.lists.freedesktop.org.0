Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A3E6C8E9F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 14:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD83F10E1CD;
	Sat, 25 Mar 2023 13:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D44C10E1CD
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679751909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CA7h/KT6ar6s3WSm/PcPsckHI4JxnLRkTxYhhO4xj4k=;
 b=iBJ2ZOStaDpUVr/JXKQ9l9ywyPPQibQg0as9klu5HnKhtNR96FUoi1jH02uu0THtA5AoJe
 ND3/ocDW99qWkq4pwkTzzwgVTsHkZcSKOOuTsZYhJWEfApbFqJFKdzo4jDQhEbbAgyfnZ0
 918Bxf+dZm9sxguVkWvBqEsIqo6w/3o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-zjr1T_hDOly5fzvNaSG2Yw-1; Sat, 25 Mar 2023 09:45:07 -0400
X-MC-Unique: zjr1T_hDOly5fzvNaSG2Yw-1
Received: by mail-qt1-f200.google.com with SMTP id
 x5-20020a05622a000500b003e259c363f9so2788348qtw.22
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 06:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679751907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CA7h/KT6ar6s3WSm/PcPsckHI4JxnLRkTxYhhO4xj4k=;
 b=MWktQEwDqpiB2ln9OQdglHQ+E+l6XXqVr0NyybiPvXYj04e9sfP6QctGR1Yrv8AItj
 NHeWQHN5ZqB5ZL856x3sXu3KhPsW5JsRuWtE1EH/vjuGyLlMGeGZohOj+w5BgNoUlo/o
 nWno5YywSShM7WWAicJ+MwIDh/no/K8GOcLINyzCTWTJ+xWnP8BaqYci9RvoobD0aPxU
 aasBTOiaDuYTPbgIm8wZAFEqmuguuIs+Y2MsjLENRUp6DUtBw/fi9ILfrPjDDJmq1in/
 LBtDWRwwJ+bSq3WK3PBiZbiQOF9KUeu1I1OglDpghOSj+b0ZWOEgyhxmHCvYxVzA9rSS
 ZfHA==
X-Gm-Message-State: AO0yUKWjOfec/lpPXZH30dnz0TA6OCksU6etrvgkIpzYLcZ/ym695xHs
 hvJq8tZlX67U+M7SeONuttfeHSKkhHrhzjL1BFz93wJE2uRAaE5e/asCm27YUJvXSQak5GYvTKs
 JCeP3JksNnQph3o78CgZPsL2G60j2
X-Received: by 2002:a05:622a:647:b0:3e3:9948:98d1 with SMTP id
 a7-20020a05622a064700b003e3994898d1mr10992023qtb.38.1679751907350; 
 Sat, 25 Mar 2023 06:45:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set9lBadmzaW3R6GBzpZCCcrV/q81u7BWSsClYIuBO79n0CA6GzW3uhjcVgbc5HCJD7hhViJ7VQ==
X-Received: by 2002:a05:622a:647:b0:3e3:9948:98d1 with SMTP id
 a7-20020a05622a064700b003e3994898d1mr10991982qtb.38.1679751907150; 
 Sat, 25 Mar 2023 06:45:07 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 h23-20020ac85497000000b003e3927a2cd8sm2528739qtq.3.2023.03.25.06.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 06:45:06 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, nathan@kernel.org,
 ndesaulniers@google.com, Jun.Lei@amd.com, wenjing.liu@amd.com,
 Jimmy.Kizito@amd.com, Cruise.Hung@amd.com
Subject: [PATCH] drm/amd/display: remove unused matching_stream_ptrs variable
Date: Sat, 25 Mar 2023 09:45:03 -0400
Message-Id: <20230325134503.1335510-1-trix@redhat.com>
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang with W=1 reports
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_enc_cfg.c:625:6: error:
  variable 'matching_stream_ptrs' set but not used [-Werror,-Wunused-but-set-variable]
        int matching_stream_ptrs = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
index 41198c729d90..30c0644d4418 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
@@ -622,7 +622,6 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc_state *state)
 	int i, j;
 	uint8_t valid_count = 0;
 	uint8_t dig_stream_count = 0;
-	int matching_stream_ptrs = 0;
 	int eng_ids_per_ep_id[MAX_PIPES] = {0};
 	int ep_ids_per_eng_id[MAX_PIPES] = {0};
 	int valid_bitmap = 0;
@@ -645,9 +644,7 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc_state *state)
 		struct link_enc_assignment assignment = state->res_ctx.link_enc_cfg_ctx.link_enc_assignments[i];
 
 		if (assignment.valid) {
-			if (assignment.stream == state->streams[i])
-				matching_stream_ptrs++;
-			else
+			if (assignment.stream != state->streams[i])
 				valid_stream_ptrs = false;
 		}
 	}
-- 
2.27.0

