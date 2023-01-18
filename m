Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD386671BA0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 13:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2E210E6CF;
	Wed, 18 Jan 2023 12:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A9E10E628;
 Wed, 18 Jan 2023 10:11:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id n7so7314502wrx.5;
 Wed, 18 Jan 2023 02:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X9erqJru4XPgjOURANw2ncUgTgC8yFwhYsbY0uUOyl8=;
 b=aetc572Jkz81PofCbQdsfwcHdm8KluXPcZ6+I3ifpv1I/B3j4TBDMH2yjxmIxMAS9R
 JPeU2+G7hMcQXLsi07akridWxfeGElEi5Yxty1YIXhnbocYaQvn7ClpsEsdS8wjILVAF
 EmzEdq8u1Pn2LB939plEC4a7yRmCG79QXq2eOeWlz3N9stVyj8iCv6HTbJfdvmTptLvF
 1FtOpZ78FLu30c5aPtEeXTTTtgO03BDjT3U+RRrof24v8ktVT/+Q8AvdOMkKpjehrrug
 +Cr3mbbMIi7LMfR5p0WTyE5dEKPBAVNfh1syL1wW6rd9WoiJtVdoFfWe5kHYFGzHpGBQ
 axtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X9erqJru4XPgjOURANw2ncUgTgC8yFwhYsbY0uUOyl8=;
 b=bHKQTJmDJLLAWX7D4w4L5v5D7m1aDx74IregDjm6M6bvpbRw+NLcWihtW4nVN9rFvs
 XJzvx3iREH34H/JjHwaJQ0tqk32Vl8RDdBn+3WSoPErlkJBMbu/kk2M9RJ6hibmDAmb7
 w8xpFixd3MQjiQevfLua3xofj2c7jTXEkxWbax21Gbf1w/ChAxlLk6ZKc2ZtUFJ+XRsy
 81bSkJEw1D22+4u9d/esQQk+79SPAAbgxShbzwAE8sZIjzLim9OT1BjVOK8aulW3NOgR
 xNO01gfBaXkt0p2I20XBaEsTH6mnxeEijA7dJSI32ANqpEg2r6Xw/4gq71slKal96/wo
 qqrQ==
X-Gm-Message-State: AFqh2krdYy2j16kB8+9KKtC3rz11+UIoKz0Xp/LHDGoPwlkN1zoEHzam
 RSDyeiXb82nynhJrXIso0S0=
X-Google-Smtp-Source: AMrXdXs/tYTCR9qwFQpShs1CcYyu71qYkTmhz7D33Q/9wLUaLCCGuYZGvTol6zaRTTnGbS8z7gCe9g==
X-Received: by 2002:a5d:5608:0:b0:2b6:daf8:52ad with SMTP id
 l8-20020a5d5608000000b002b6daf852admr1567589wrv.52.1674036701073; 
 Wed, 18 Jan 2023 02:11:41 -0800 (PST)
Received: from localhost.localdomain ([93.119.166.152])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d6152000000b002425be3c9e2sm30323113wrt.60.2023.01.18.02.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 02:11:40 -0800 (PST)
From: Nicu Borta <nicuborta123@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] amd/dcn20: Fix high mem clock with multiple displays
Date: Wed, 18 Jan 2023 12:11:08 +0200
Message-Id: <20230118101107.10173-1-nicuborta123@gmail.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Jan 2023 12:12:42 +0000
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
Cc: Nicu Borta <nicuborta123@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On RX5000 series GPUs, using a high refresh rate monitor causes the VRAM to
always stay at the highest clock (according to AMD, this is done to prevent
flickering).

However, when using 2 monitors (e.g. one at 165Hz and another at 60Hz), then
disconnecting the high refresh monitor, before this patch the VRAM clock didn't
decrease like it should.

This patch fixes that bug, and now, when disconnecting the high refresh rate
monitor, the VRAM clock jumps to the minimum.

Tested for a few months, I haven't noticed any visual artifacts or other errors
(RX5700XT).

Signed-off-by: Nicu Borta <nicuborta123@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 8a0dd0d7134b..481a15b02126 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -714,7 +714,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 		.timing_trace = false,
 		.clock_trace = true,
 		.disable_pplib_clock_request = true,
-		.pipe_split_policy = MPC_SPLIT_AVOID_MULT_DISP,
+		.pipe_split_policy = MPC_SPLIT_DYNAMIC,
 		.force_single_disp_pipe_split = false,
 		.disable_dcc = DCC_ENABLE,
 		.vsr_support = true,
-- 
2.38.2

