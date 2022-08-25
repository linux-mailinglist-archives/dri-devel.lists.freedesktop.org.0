Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA75A0645
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C214BD0F9D;
	Thu, 25 Aug 2022 01:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58127D0F32;
 Thu, 25 Aug 2022 01:39:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A12DCB826E2;
 Thu, 25 Aug 2022 01:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC650C433D6;
 Thu, 25 Aug 2022 01:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391551;
 bh=o1QrfKF+i/qmQHWMO+c3wU6n2YSPND9HqGjnyLoHgw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L8mdDao6RLi9YEcrnLMuafLqxkaNItL3Z1KZiszR+QXdX8k+JGSjCewznFYoWXnqM
 ZktiBnsPn/4YPseDPMyxenS96r/QfedmieEVaG963hbPZNVd/qhCK8rMNIqcNCzhUz
 I59KEQahe15kSQD7YrAM9BUmICQCQ9uGiRB670ky3CW6W3YbynqcgqvBPGoGf6Ajkf
 3yrpJ87OmwATAYMtR8kcODjVjLQmqSGM6oHF9mbi38h8zEb5bzFVnMIIiLaCWGmny7
 pKIsJoAETstp2dBP9rqyx0Pm8/BScllToiVWq5eFbRvcsw6m6fHnhID7PnY87K+g7S
 gT57zikPeY37A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 07/11] drm/amd/display: Fix pixel clock
 programming
Date: Wed, 24 Aug 2022 21:38:28 -0400
Message-Id: <20220825013836.23205-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013836.23205-1-sashal@kernel.org>
References: <20220825013836.23205-1-sashal@kernel.org>
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
 baihaowen@meizu.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 alex.hung@amd.com, michael.strauss@amd.com,
 Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Charlene.Liu@amd.com,
 sunpeng.li@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 dillon.varone@amd.com, Hansen.Dsouza@amd.com, Xinhui.Pan@amd.com,
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
index bae3a146b2cc..89cc852cb27c 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
@@ -546,9 +546,11 @@ static void dce112_get_pix_clk_dividers_helper (
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

