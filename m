Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D483E56AA
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 11:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9503889E36;
	Tue, 10 Aug 2021 09:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368B289E36;
 Tue, 10 Aug 2021 09:20:40 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 lw7-20020a17090b1807b029017881cc80b7so3397946pjb.3; 
 Tue, 10 Aug 2021 02:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=brqLZCbNQX023f2oFBB+a/r7LFx6HehzzWG22oXEkSg=;
 b=JKvzgIiTzcBqwg8ACnj0GipSsgk9xixnD5PD7m2fJsCSnqXajAUG6TDP+uk802rqk4
 +EDD+8PnheygcYpqQpUoZLMzwqMr6yrFIfmFTvMucW7yiDKmlsLOQU4No9g4CtfndePZ
 NC5exEpwNbwhTJtB5gzYqDdnsin1f7qESSCe8hvipdRabxjGIvNTDt2d8gxrFhObVXWv
 j3UhnjFYaYYkEFX5xaDHnSoWV3tHBMQWNmGD6ko2/14NiFjHE+biawe8ZdFJsyv7uFsV
 PGyGXm7SWsBp/UIK92EpieqKRdMj4i22hOjWn1Yc+L89sYocyhMsCOD8ikpapnJspgdc
 EVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=brqLZCbNQX023f2oFBB+a/r7LFx6HehzzWG22oXEkSg=;
 b=STEEbxHIiAMQJNruaTCbgvrpgGIkfDVSker4H2/DzZznF5l0wW1Nsn1dOTv3I5Bab0
 O8Fn13pM37TAsE43YFVplm4nqSLGg0eJMfTKTWGk0xbeEqvReadK0IlLIBmDGF15kcy/
 /Vz0DBRb8W2LlXa7d66pMpXizokxbIQC9vr7xrQbfLYIls9DWqFJl8n1sA2nBb4xbSwa
 30j1/yRE/Q/ArjksYqDHDTPVBNSfaMH4EmwAYCR2mMkUVF6pnOtBw9OT/7SJZ5ohownV
 uKAWw0nSj76ShK7RaGLuf+NkFKpNbHvyI0Ch8hQyRKd8ucGHul260GfUFOomxQkPyzGb
 Hguw==
X-Gm-Message-State: AOAM530V7eTwiHuN3+eANg00i+1rtfLCB9czBT1Ne2Ogv/ewJCRPAMRO
 xB/xexMvep5QRrtyiA9Zz4E=
X-Google-Smtp-Source: ABdhPJzBEbQ2CkfAa8T5PAszGMi9LCPsI0AgIBwtUr+ZQOidrir+eFUOvG1NyFP1en0RzTehqRJkUw==
X-Received: by 2002:a63:6705:: with SMTP id b5mr56600pgc.69.1628587239810;
 Tue, 10 Aug 2021 02:20:39 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.40])
 by smtp.gmail.com with ESMTPSA id k6sm8052139pjj.52.2021.08.10.02.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 02:20:39 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, aric.cyr@amd.com, Jun.Lei@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, alvin.lee2@amd.com, vladimir.stempen@amd.com,
 isabel.zhang@amd.com, sung.lee@amd.com, paul.hsieh@amd.com,
 wyatt.wood@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Tuo Li <islituo@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] drm/display: fix possible null-pointer dereference in
 dcn10_set_clock()
Date: Tue, 10 Aug 2021 02:20:04 -0700
Message-Id: <20210810092004.291429-1-islituo@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable dc->clk_mgr is checked in:
  if (dc->clk_mgr && dc->clk_mgr->funcs->get_clock)

This indicates dc->clk_mgr can be NULL.
However, it is dereferenced in:
  if (!dc->clk_mgr->funcs->get_clock)

To fix this possible null-pointer dereference, check dc->clk_mgr before
dereferencing it.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index c545eddabdcc..3a7c7c7efa68 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -3635,7 +3635,7 @@ enum dc_status dcn10_set_clock(struct dc *dc,
 				dc->clk_mgr->funcs->get_clock(dc->clk_mgr,
 						context, clock_type, &clock_cfg);
 
-	if (!dc->clk_mgr->funcs->get_clock)
+	if (dc->clk_mgr && !dc->clk_mgr->funcs->get_clock)
 		return DC_FAIL_UNSUPPORTED_1;
 
 	if (clk_khz > clock_cfg.max_clock_khz)
-- 
2.25.1

