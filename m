Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8F1F23F7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CDF6E0D7;
	Mon,  8 Jun 2020 23:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10B66E0D7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 23:18:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0181820884;
 Mon,  8 Jun 2020 23:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658301;
 bh=REob3D4KrzEOuSUejg/+T6cuJbK+qyQovHToXrnAMuw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FP7ylJb9IWoacBFuQgnoiL1KkJ80FJyx33uS8KixIh8OWf26tdp5BGJry1jM6j6gB
 Z6uc7yIU1V418LtOBHHVnQamPhGflSE6aMjNA2Xr0hUIkW33jJ5CNqrPFLtPW7f1H2
 YJR4FMCD2gHL83h1Dt/LW22a7XqPEUTMrcMwowPs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 304/606] gpu/drm: ingenic: Fix bogus
 crtc_atomic_check callback
Date: Mon,  8 Jun 2020 19:07:09 -0400
Message-Id: <20200608231211.3363633-304-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Paul Cercueil <paul@crapouillou.net>, Sasha Levin <sashal@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Cercueil <paul@crapouillou.net>

[ Upstream commit a53bcc19876498bdd3b4ef796c787295dcc498b4 ]

The code was comparing the SoC's maximum height with the mode's width,
and vice-versa. D'oh.

Cc: stable@vger.kernel.org # v5.6
Fixes: a7c909b7c037 ("gpu/drm: ingenic: Check for display size in CRTC atomic check")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Link: https://patchwork.freedesktop.org/patch/msgid/20200516215057.392609-4-paul@crapouillou.net
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index bcba2f024842..8f5077370a52 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -328,8 +328,8 @@ static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
 	if (!drm_atomic_crtc_needs_modeset(state))
 		return 0;
 
-	if (state->mode.hdisplay > priv->soc_info->max_height ||
-	    state->mode.vdisplay > priv->soc_info->max_width)
+	if (state->mode.hdisplay > priv->soc_info->max_width ||
+	    state->mode.vdisplay > priv->soc_info->max_height)
 		return -EINVAL;
 
 	rate = clk_round_rate(priv->pix_clk,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
