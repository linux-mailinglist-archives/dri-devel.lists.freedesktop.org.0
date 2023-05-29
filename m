Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F20714551
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 09:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69FB10E22E;
	Mon, 29 May 2023 07:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr
 [80.12.242.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEB310E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:19:10 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id 3X9eqYgEzMDzt3X9oq4QNQ; Mon, 29 May 2023 09:19:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1685344748;
 bh=E29VI58F9t8lbiMbudotJ9ysUUBZknzo+5bxInVW578=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=qN2RdXC/1SfqjAN9PDebvToRpP+JJUk8Q6FA4M43mFXtgHgv0S+f9x8BrEfyJZ44v
 mtS4PdX+9TjiYH+BNk64ndNK/Ckh2i5e6HYPe7JvC5eyR7vhJiDCWSCrkLW6IRGsti
 4SbpZPIOkkBBr7xntU7liZnyPVJiF7mWgIksIwA3ms5JM7fsRK4Z5j0IJuIuFPi4rB
 rfVPxOjaTrYe/94URzYk1vwNsONPBvEQ7qOSB8Ik7Tz2YlnOHjqwVnq437SS7RmZeL
 xBlZ05K7U4aOtAjKzaQnJdRGcfQaCyE1b6xVOIiTFfCpG6wSLH9XXT4nbw/XPv1Y+L
 PT7MiJgsJiDfQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 29 May 2023 09:19:08 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/3] drm/amd/display: Simplify get_dmif_switch_time_us()
Date: Mon, 29 May 2023 09:18:55 +0200
Message-Id: <1ab1210048a4b485247cccba6721f1885c986331.1685342739.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e0a2240f863279b65a1fdc7f8c27ede9f8e37893.1685342739.git.christophe.jaillet@wanadoo.fr>
References: <e0a2240f863279b65a1fdc7f8c27ede9f8e37893.1685342739.git.christophe.jaillet@wanadoo.fr>
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

Thanks to the sanity check a few lines above:
    if (!h_total || !v_total || !pix_clk_khz)

and the computation done afterwards on these non 0 values, we know that
'pixels_per_second', 'pixels_per_frame' and 'refresh_rate' are not 0

The code can be simplified accordingly.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
NOT compile tested. Because of some BROKEN in KConfig files.
---
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
index 091f0d68a045..eafe8561e55e 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
@@ -690,21 +690,8 @@ static uint32_t get_dmif_switch_time_us(
 	pixels_per_second = pix_clk_khz * 1000;
 	pixels_per_frame = h_total * v_total;
 
-	if (!pixels_per_second || !pixels_per_frame) {
-		/* avoid division by zero */
-		ASSERT(pixels_per_frame);
-		ASSERT(pixels_per_second);
-		return single_frame_time_multiplier * min_single_frame_time_us;
-	}
-
 	refresh_rate = pixels_per_second / pixels_per_frame;
 
-	if (!refresh_rate) {
-		/* avoid division by zero*/
-		ASSERT(refresh_rate);
-		return single_frame_time_multiplier * min_single_frame_time_us;
-	}
-
 	frame_time = us_in_sec / refresh_rate;
 
 	if (frame_time < min_single_frame_time_us)
-- 
2.34.1

