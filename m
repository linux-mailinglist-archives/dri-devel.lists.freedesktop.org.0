Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C455C84F587
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 14:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF9E10E29B;
	Fri,  9 Feb 2024 13:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r1nAV0H+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A468910E29B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 13:02:48 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5600c43caddso1136749a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 05:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707483766; x=1708088566; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=30ltjS2465HeE6RDkcYZ7gz3HAH/FfBk4VubamB9xlg=;
 b=r1nAV0H+rWum8h+qfNFwbIP6AFYWyZfpTvF1z/fimsA3SlduyjQZqFqb9aKxr5hHBo
 V8jp3ng0YmeXthcg9u826HueOk0Kpaop6IDtHyPzJZ0xNrom0CGnO5+j+mLYJGvE3vuC
 BXCn2+nTftZTR6MrsvLK5RkbDdvUDm3Lty48xmOsXlS4lNdu3WpDuAg3LPQowqnzmMdA
 GCxUNvA0NWZ9SlJjoJCjGhGrttnXL69wZBiTwjDketbBtDTv/yi8vrjElmZVAYiAo2+l
 vZGeakwnT7ox1pildfWc9PGIfKRZL4ZT6JtOPA5kyngBEIErYXehBgEW9JRoRGMrZNIy
 /BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707483766; x=1708088566;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=30ltjS2465HeE6RDkcYZ7gz3HAH/FfBk4VubamB9xlg=;
 b=pqg1kmsLLnuuPHwEuOXYHDtvgLYQH3omK+O8IpEXwg0zTf9vrUgn9L7qoBApF5lQPx
 gMFXYncPD8FM564ooZptKoqsXmL2Kdadn2x90aJl8wpTkW3FHTCQdpW3S/m6qkrlXwNa
 aNEF/+ff2LS+JMEHoN2HpUwYKXQIRGv5s9JmoU6y8nLPo/K3IZZRJmv+JPHkkUFpMylW
 RdvubdSBzUFNzLL2jS30nuOgElwPZ0evqmveFjjQY+ym8atSIAPFeKxAY4Fo/aLcKYlW
 BPDyK98GZRRFLsoWLbR86tPsABfogYQQVAtIS7kW78/NIsaornqM+/Zq0zsi8t/VhfF4
 tlNQ==
X-Gm-Message-State: AOJu0Yy1Wn/VtiZXqh6B7SZXH9dUWY7p84L1w7s8o5+gCJpRwJUDkdnu
 aHXaE+8Xy/SFOvbim8faODzwU3GTrbK1y+GjZ/17XI5Lqh+TjMP6rUe0OlWWIp8=
X-Google-Smtp-Source: AGHT+IGk3Uy6387987t9ObpRRvhmYrzvpBWmjEfnryXbGtmf7Y8JaQxsRglpq2IGmZTRgLgs84PSXQ==
X-Received: by 2002:a05:6402:12d3:b0:560:8010:b678 with SMTP id
 k19-20020a05640212d300b005608010b678mr1245938edx.30.1707483765418; 
 Fri, 09 Feb 2024 05:02:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXJazRu4iYiKzzQwF/gSh1UE3tl7gDgkJUAgPuN+fxfAMMbbBSuIoh8EztuiqybU5H3TAvB3rAuRntIXddfciGZ+rUYMgNDlht9JOhm2NA+3CFgl2l9oxy4aIY8wvySUkAZeB9P9FAb/HBbbnjQHmztNz3OxAMLak+cio07d1ZC0PQZO0p5LMzPTkdxzIC2ziwdv2ps4BuZTsCm45Ww8aaSimOUhpz3Yhjb73sQrezTbTmLmsAJjWKNUK7vMxAx4jBdiodphI7gxv7h0At4mxCCQFDu3SLht/9EraI+2b3syXQgPXRVCeM1G5bJFCuPcox3Hzw7YhI8e9wu2pIILG6FT2wzXkY27tOtIgiREW/Mgu8TQck8rQg/vZ/gjsBR1CMyS0/VHMMfxc4wrT221jhtRJrR+4EgafsOOI4wMwOhpqov18mn1YUtZmU14hCdb+EjYzT858gki30kdpNXnjAuoQ7bffAM7bdxxv23usQGjZjRntEaufxyQmHtkjCLFWi5khB6Lb+TdKRGy9Y2iNpNBzaUsBqPBpEDpNkuPGcbfHwAiUxYTET57A63nO6NKWJcMxQYtMXZt/zX4Xa0Iqs8DAssfIuTgiSVhLmB9O/5+8A6fL8jqM11vm7DPfpqWru2IuB3XA==
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 e16-20020a50d4d0000000b005605716e755sm806635edj.52.2024.02.09.05.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 05:02:45 -0800 (PST)
Date: Fri, 9 Feb 2024 16:02:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>, Leon Huang <Leon.Huang1@amd.com>,
 Mounika Adhuri <moadhuri@amd.com>,
 Lewis Huang <lewis.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: Fix && vs || typos
Message-ID: <7482be2a-aca1-41dd-bb6e-d547571b9507@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

These ANDs should be ORs or it will lead to a NULL dereference.

Fixes: fb5a3d037082 ("drm/amd/display: Add NULL test for 'timing generator' in 'dcn21_set_pipe()'")
Fixes: 886571d217d7 ("drm/amd/display: Fix 'panel_cntl' could be null in 'dcn21_set_backlight_level()'")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
index 5c7f380a84f9..7252f5f781f0 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
@@ -211,7 +211,7 @@ void dcn21_set_pipe(struct pipe_ctx *pipe_ctx)
 	struct dmcu *dmcu = pipe_ctx->stream->ctx->dc->res_pool->dmcu;
 	uint32_t otg_inst;
 
-	if (!abm && !tg && !panel_cntl)
+	if (!abm || !tg || !panel_cntl)
 		return;
 
 	otg_inst = tg->inst;
@@ -245,7 +245,7 @@ bool dcn21_set_backlight_level(struct pipe_ctx *pipe_ctx,
 	struct panel_cntl *panel_cntl = pipe_ctx->stream->link->panel_cntl;
 	uint32_t otg_inst;
 
-	if (!abm && !tg && !panel_cntl)
+	if (!abm || !tg || !panel_cntl)
 		return false;
 
 	otg_inst = tg->inst;
-- 
2.43.0

