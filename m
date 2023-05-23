Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A42970D78C
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BBB10E3E1;
	Tue, 23 May 2023 08:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499AE10E039;
 Tue, 23 May 2023 08:34:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76E0A60C58;
 Tue, 23 May 2023 08:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E437C433EF;
 Tue, 23 May 2023 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684830885;
 bh=uDeBCUkzcBHJ92URNdM9l1Brx4f2zSG2cwz+M+3kjvU=;
 h=From:To:Cc:Subject:Date:From;
 b=f5lHK/UaPZHvvrCbyx8U+aSfrFNlBZeuo6IrZ6le9c3sH92ANJkt14t08Prn4LoOy
 aIuvhhQi/1nO4uzPhjngpWtLDjNIAHBTnqJsqArO9m02ahkOfZ0o6x2n7EXxdnGV2m
 JArBQp54U8gqNVM7fhvgaESODqmOCagh+i9gpqABf4acdG1cHCMkgF5d47NS8GSaeH
 NuZcZuidG6dVplphDurX1sBEP1+zq6fmcbSyP0oLWbV3Ffgpy3H0dEYHU6y0VhTqIT
 pPewrt3Fi0vWXd5EnC+dlICVBF6bDoCqWw05jXwk2xE3JlzAcJYz/fVlZGSXfbPPdB
 M5gyAovdlDcdg==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Tom Chung <chiahsuan.chung@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Saaem Rizvi <syedsaaem.rizvi@amd.com>
Subject: [PATCH] drm/amd/display: avoid calling missing .resync_fifo_dccg_dio()
Date: Tue, 23 May 2023 10:34:30 +0200
Message-Id: <20230523083437.986490-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Charlene Liu <Charlene.Liu@amd.com>, Jingwen Zhu <Jingwen.Zhu@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, "Nagulendran,
 Iswara" <Iswara.Nagulendran@amd.com>, dri-devel@lists.freedesktop.org,
 Wenjing Liu <wenjing.liu@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alvin Lee <Alvin.Lee2@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The .resync_fifo_dccg_dio() callback pointer was added in an #ifdef block,
but is called unconditionally:

drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:2292:31: error: 'struct hwseq_private_funcs' has no member named 'resync_fifo_dccg_dio'

Add the same #ifdef around the caller as well.

Fixes: 6354b0dc3a7a ("drm/amd/display: Trigger DIO FIFO resync on commit streams")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index c6fe2c00aedb..d4cacb8df631 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -2289,8 +2289,10 @@ enum dc_status dce110_apply_ctx_to_hw(
 		if (DC_OK != status)
 			return status;
 
+#ifdef CONFIG_DRM_AMD_DC_FP
 		if (hws->funcs.resync_fifo_dccg_dio)
 			hws->funcs.resync_fifo_dccg_dio(hws, dc, context);
+#endif
 	}
 
 	if (dc->fbc_compressor)
-- 
2.39.2

