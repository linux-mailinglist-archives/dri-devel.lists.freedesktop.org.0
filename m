Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C6714553
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 09:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5227410E239;
	Mon, 29 May 2023 07:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr
 [80.12.242.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6EC10E238
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 07:19:17 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id 3X9eqYgEzMDzt3X9vq4QNv; Mon, 29 May 2023 09:19:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1685344755;
 bh=QHA/Y0t0+ZEe+OD0y5zfwImt3ZyVK3OrMC3Z9s2pa1M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=W7r6xtOwhhzprrKfnZGh0T9qW6D98nODcTPYdrrsDy8UKp9fEcacSAXQkx7QVuWsz
 vE44t8MRi8+dK7gLek1AWrWxPl2qATJxc8HrbjAGOwLvfuSOuHMg8DP6xMcVD+Q/hF
 /zkkum9tvQek+TK7Z7XtphlqTNEWEXI55kvwobij7TzAVfmh+PJgyMsTYhyjUXYimY
 Evlsvd/Mq++SUL8fVPRhVdmAdbSLzHn0uzjvyRgyt9LioGM/9JBO4zihT7xxKHZ/If
 NW7ybU0zzERVByEtGA9ueYwMHYxdLYXlp9F7FUWyRqUTynkURq6ySZq3E7kKqkpFHx
 sSecbvRt+wSiw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 29 May 2023 09:19:15 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] drm/amd/display: Use USEC_PER_SEC
Date: Mon, 29 May 2023 09:18:56 +0200
Message-Id: <c168fac9fdde872a4f4d047f12a6a7c19185f47c.1685342739.git.christophe.jaillet@wanadoo.fr>
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

Use USEC_PER_SEC instead of defining an equivalent local 'us_in_sec'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
NOT compile tested. Because of some BROKEN in KConfig files.
Some header may be missing for USEC_PER_SEC!
---
 drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
index eafe8561e55e..9b82ee3e06d0 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
@@ -678,7 +678,6 @@ static uint32_t get_dmif_switch_time_us(
 	uint32_t pixels_per_second;
 	uint32_t pixels_per_frame;
 	uint32_t refresh_rate;
-	const uint32_t us_in_sec = 1000000;
 	const uint32_t min_single_frame_time_us = 30000;
 	/*return double of frame time*/
 	const uint32_t single_frame_time_multiplier = 2;
@@ -691,8 +690,7 @@ static uint32_t get_dmif_switch_time_us(
 	pixels_per_frame = h_total * v_total;
 
 	refresh_rate = pixels_per_second / pixels_per_frame;
-
-	frame_time = us_in_sec / refresh_rate;
+	frame_time = USEC_PER_SEC / refresh_rate;
 
 	if (frame_time < min_single_frame_time_us)
 		frame_time = min_single_frame_time_us;
-- 
2.34.1

