Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B66E53F4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 23:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668A110E614;
	Mon, 17 Apr 2023 21:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr
 [80.12.242.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F5C10E3ED
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 21:35:13 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id oWVBpmySP7JnhoWVBpp7Yo; Mon, 17 Apr 2023 23:35:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
 s=t20230301; t=1681767311;
 bh=exdfx2AQYI+d3tNi/ZWU6Qg32IUD8RC19Z/dcWtgLqs=;
 h=From:To:Cc:Subject:Date;
 b=NdxG2WsGN31gVPGEViY7Gfx6CGXCETw38SsVxY6IMCbDTSfxJfXScMtFpUjcrKaKG
 NVgFyLzcDAenFlcjEu92emWpI0WggHaWsRMRyb1j5k0GqiAzyRgTYoXhNLRHvnRR9C
 k/uxWrNaiTFNq1C8OBkSyax8cLOpnVn5gXA0002el4r+WuB58lXuybGxlgyZQVdbYU
 nnjfp7Zw2UQWmUDflTkQ34Dr3CEm02FFBu8uwmhsaHf/kv586EWgib/eHTjbpLtnDF
 jVSer0ib8ZfQ6hgF0MOUutTWNMqpSOHW6rhUWpXZNwfNO9BecmslqM1kij833b97lQ
 KUlMW8ZxR2/hw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 17 Apr 2023 23:35:11 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Pavle Kotarac <Pavle.Kotarac@amd.com>,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, Aric Cyr <aric.cyr@amd.com>
Subject: [PATCH] drm/amd/display: Fix a test CalculatePrefetchSchedule()
Date: Mon, 17 Apr 2023 23:35:08 +0200
Message-Id: <13ab79d7a6c7ec6292c803ce1e52c8ac12af320f.1681767298.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is likely Height was expected here, instead of Width.

Test the correct variable.

Fixes: 17529ea2acfa ("drm/amd/display: Optimizations for DML math")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index b7c2844d0cbe..f294f2f8c75b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -810,7 +810,7 @@ static bool CalculatePrefetchSchedule(
 			*swath_width_chroma_ub = dml_ceil(SwathWidthY / 2 - 1, myPipe->BlockWidth256BytesC) + myPipe->BlockWidth256BytesC;
 	} else {
 		*swath_width_luma_ub = dml_ceil(SwathWidthY - 1, myPipe->BlockHeight256BytesY) + myPipe->BlockHeight256BytesY;
-		if (myPipe->BlockWidth256BytesC > 0)
+		if (myPipe->BlockHeight256BytesC > 0)
 			*swath_width_chroma_ub = dml_ceil(SwathWidthY / 2 - 1, myPipe->BlockHeight256BytesC) + myPipe->BlockHeight256BytesC;
 	}
 
-- 
2.34.1

