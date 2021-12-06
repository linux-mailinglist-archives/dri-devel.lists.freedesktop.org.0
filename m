Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66446A99F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 22:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF53F72F2A;
	Mon,  6 Dec 2021 21:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C33372F2A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 21:15:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D8B06B810D5;
 Mon,  6 Dec 2021 21:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4619CC341C6;
 Mon,  6 Dec 2021 21:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638825330;
 bh=Sa+KGCq2/sHFHnova0dYBBp7RPzJf/V7LKGoUhjeFd0=;
 h=From:To:Cc:Subject:Date:From;
 b=X1LIr+6hycVxaRBH2OTHNbb4VIEbr1hOXOXeBWkFtKq5RC1nrkfeOLMiUieKVbrW+
 Xz9lImeGp7aai3340OS4dWtOmpni56Vvc8aMxEXsRXxqFZPJC2xJvduY0zH1PUeA6S
 ldkyCyWSSU3dPPw7SGVPLi6/FThChYyHpAyiOUjsQ+synEPsDkHlfzapOzb62B3QER
 vM0cVGjfQGJ5gbJydrBTRm7fw1GrM/oV0CjEUfVCdfQ8DUVUltEPDUXRHcM046rJnc
 NyyqnnUGmiRAwUw86JP30z6pwOcAb+BiB7J0mLRcypwo7UgC7lYpD6uQ+Tu1Wi1gra
 RztVXPOkDLI8g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 01/15] drm/msm/dsi: set default num_data_lanes
Date: Mon,  6 Dec 2021 16:15:01 -0500
Message-Id: <20211206211520.1660478-1-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 Philip Chen <philipchen@chromium.org>, dri-devel@lists.freedesktop.org,
 jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 jesszhan@codeaurora.org, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, abhinavk@codeaurora.org,
 Stephen Boyd <swboyd@chromium.org>, tiny.windzz@gmail.com, vulab@iscas.ac.cn,
 dmitry.baryshkov@linaro.org, bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Chen <philipchen@chromium.org>

[ Upstream commit cd92cc187c053ab010a1570e2d61d68394a5c725 ]

If "data_lanes" property of the dsi output endpoint is missing in
the DT, num_data_lanes would be 0 by default, which could cause
dsi_host_attach() to fail if dsi->lanes is set to a non-zero value
by the bridge driver.

According to the binding document of msm dsi controller, the
input/output endpoint of the controller is expected to have 4 lanes.
So let's set num_data_lanes to 4 by default.

Signed-off-by: Philip Chen <philipchen@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 96b5dcf8e4540..64454a63bbacf 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1692,6 +1692,8 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	if (!prop) {
 		DRM_DEV_DEBUG(dev,
 			"failed to find data lane mapping, using default\n");
+		/* Set the number of date lanes to 4 by default. */
+		msm_host->num_data_lanes = 4;
 		return 0;
 	}
 
-- 
2.33.0

