Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F2934275E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 22:03:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDA06EAC1;
	Fri, 19 Mar 2021 21:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408076EAC0;
 Fri, 19 Mar 2021 21:03:52 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id o19so12339850edc.3;
 Fri, 19 Mar 2021 14:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EBlLnctQR13/ABsYWM+pEigkRZlWTWNjqw0shDnfZ3U=;
 b=PW+QzCLnKdiuRLRkwUHgUK7xTNIveKWowqkd7UgxBesdXFnFgd/pPMdpkBh3hAp0gm
 GL/8bf0gW1G3ui+VUB75DobFqBepbqu/bgIlgTtWZSz21Mmw59OlaR1ywZKW8mpvOjTn
 1/JVcBbFcBElRsxerT+9TjWcuaz2O60Hs7SDHW5kQx1JR53AT3hRht1cJAwc6AsAzqLS
 nuvcwcFJ8bat0RxTp8vZTctZijLNK0S0gBjdv2SKCKNi68LLuPwvZ/mRtd1U67b0pWLz
 R0ct/B45HZ5eugAdaTY/669u5HZZKyqSfmaNZ+1Unmztx9g/xe7bh/jfSCzUMSIoZ5/5
 qdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EBlLnctQR13/ABsYWM+pEigkRZlWTWNjqw0shDnfZ3U=;
 b=nilN8dA46n9c9PgVkMXE+Sxup/fY/8yXdOwk062MFh+o7645mirIc3suXEY7Icsp2g
 zEyvLqGTeNGskz8TvDoH2vLqGuvV/NZtH7jdCVlP2v66Fo82Bugu0nDGD4x2gFhBraeL
 rq+BgbkaWPElK1vBp3wXjxeoYRe4y0HfDyij4plDpi/kVXHssNNsv0tUXPJOnDw1deGL
 5HAcjtPJebNhwJQrmmB4l44QA4N06YD8PCi7u9lQA1389CIk7h6SLJus+sF5nhIRySk4
 ayqjsttZLkCd97lo7/jUt4+OaBkvO1ylAAbpLvHDW8RLSXoShsi857naH7Lyk5yxddvr
 dICA==
X-Gm-Message-State: AOAM531qPAhYnw83YFeQoeXGX12nvUeHP6KravKsf47oRlFV5wm+0rLe
 eoQoLnFF3YdjAPypzjbtqmv/gS6fAqg=
X-Google-Smtp-Source: ABdhPJwpsUR8xaXr1nAJ3YIEj9ERud9ADK5pkKG/Hcp+LXqv3jBEWaq0Ag271eMSDw9M+eU+2JVtfg==
X-Received: by 2002:a05:6402:699:: with SMTP id
 f25mr11970188edy.47.1616187830808; 
 Fri, 19 Mar 2021 14:03:50 -0700 (PDT)
Received: from twisty.localdomain
 (dynamic-2a01-0c23-7833-6000-6cbb-50d4-b91e-5b37.c23.pool.telefonica.de.
 [2a01:c23:7833:6000:6cbb:50d4:b91e:5b37])
 by smtp.gmail.com with ESMTPSA id jj15sm4353122ejc.99.2021.03.19.14.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 14:03:50 -0700 (PDT)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/amd/display: Make assert in DCE's
 program_bit_depth_reduction more lenient.
Date: Fri, 19 Mar 2021 22:03:16 +0100
Message-Id: <20210319210317.32369-5-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is needed to avoid warnings with linebuffer depth 36 bpp.
Testing on a Polaris11, DCE-11.2 on a 10 bit HDR-10 monitor
showed no obvious problems, and this 12 bpc limit is consistent
with what other function in the DCE bit depth reduction path use.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
index 92b53a30d954..d9fd4ec60588 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
@@ -794,7 +794,7 @@ static void program_bit_depth_reduction(
 	enum dcp_out_trunc_round_mode trunc_mode;
 	bool spatial_dither_enable;
 
-	ASSERT(depth < COLOR_DEPTH_121212); /* Invalid clamp bit depth */
+	ASSERT(depth <= COLOR_DEPTH_121212); /* Invalid clamp bit depth */
 
 	spatial_dither_enable = bit_depth_params->flags.SPATIAL_DITHER_ENABLED;
 	/* Default to 12 bit truncation without rounding */
@@ -854,7 +854,7 @@ static void dce60_program_bit_depth_reduction(
 	enum dcp_out_trunc_round_mode trunc_mode;
 	bool spatial_dither_enable;
 
-	ASSERT(depth < COLOR_DEPTH_121212); /* Invalid clamp bit depth */
+	ASSERT(depth <= COLOR_DEPTH_121212); /* Invalid clamp bit depth */
 
 	spatial_dither_enable = bit_depth_params->flags.SPATIAL_DITHER_ENABLED;
 	/* Default to 12 bit truncation without rounding */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
