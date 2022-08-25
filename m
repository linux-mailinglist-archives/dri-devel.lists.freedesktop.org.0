Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A4A5A0638
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDBED0D85;
	Thu, 25 Aug 2022 01:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC43BD0C9A;
 Thu, 25 Aug 2022 01:38:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8803061AF2;
 Thu, 25 Aug 2022 01:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5673BC433D6;
 Thu, 25 Aug 2022 01:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391481;
 bh=CBbnhCg1r7UfbDv4vlNLCZTRgRNAqhTKzIzp++8xy9o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P7rKZ7frNNKdXyrsZm6rO7TqZfcVslFi+UTar901cRX6G0+ZGebzoFSt2aoOd/MmW
 NLPBwv3TqSAhkpScV8bN0EO5wlXHRV6LXldSyp7DaXpEZVjXCnSIOOGby/D6rp9q5j
 vxCVy/hs82XTykV/fdz3tcxeHe1mej3EsfaYVZg9mUFdR5m4L92DarsnIVAj8GCV15
 G7Ud6TSqQxVzdWoqOq2mn4cRUHFk6zmXWbLGjH+a08CzcdcS7npuCPS8rIFUD/Dnie
 p8Q7lqJyTst1W+s5LHkIDvljO8JfZOaqivsOckApAW/4eaE76pSPo9UhH1Kg9eXLEj
 4fITTfid/5x3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 12/20] drm/amd/display: Fix pixel clock
 programming
Date: Wed, 24 Aug 2022 21:37:04 -0400
Message-Id: <20220825013713.22656-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013713.22656-1-sashal@kernel.org>
References: <20220825013713.22656-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: HaoPing.Liu@amd.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>, Brian Chang <Brian.Chang@amd.com>,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, alex.hung@amd.com,
 michael.strauss@amd.com, Ilya Bakoulin <Ilya.Bakoulin@amd.com>,
 Charlene.Liu@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, dillon.varone@amd.com,
 Hansen.Dsouza@amd.com, David.Galiffi@amd.com, Xinhui.Pan@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ilya Bakoulin <Ilya.Bakoulin@amd.com>

[ Upstream commit 04fb918bf421b299feaee1006e82921d7d381f18 ]

[Why]
Some pixel clock values could cause HDMI TMDS SSCPs to be misaligned
between different HDMI lanes when using YCbCr420 10-bit pixel format.

BIOS functions for transmitter/encoder control take pixel clock in kHz
increments, whereas the function for setting the pixel clock is in 100Hz
increments. Setting pixel clock to a value that is not on a kHz boundary
will cause the issue.

[How]
Round pixel clock down to nearest kHz in 10/12-bpc cases.

Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Brian Chang <Brian.Chang@amd.com>
Signed-off-by: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
index 054823d12403..5f1b735da506 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
@@ -545,9 +545,11 @@ static void dce112_get_pix_clk_dividers_helper (
 		switch (pix_clk_params->color_depth) {
 		case COLOR_DEPTH_101010:
 			actual_pixel_clock_100hz = (actual_pixel_clock_100hz * 5) >> 2;
+			actual_pixel_clock_100hz -= actual_pixel_clock_100hz % 10;
 			break;
 		case COLOR_DEPTH_121212:
 			actual_pixel_clock_100hz = (actual_pixel_clock_100hz * 6) >> 2;
+			actual_pixel_clock_100hz -= actual_pixel_clock_100hz % 10;
 			break;
 		case COLOR_DEPTH_161616:
 			actual_pixel_clock_100hz = actual_pixel_clock_100hz * 2;
-- 
2.35.1

