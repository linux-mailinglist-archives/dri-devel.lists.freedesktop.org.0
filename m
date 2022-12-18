Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CAE650026
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 17:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7919810E239;
	Sun, 18 Dec 2022 16:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068C810E23A;
 Sun, 18 Dec 2022 16:09:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 998FFB80B43;
 Sun, 18 Dec 2022 16:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9772FC433D2;
 Sun, 18 Dec 2022 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379785;
 bh=I9Gx9m76r4Ac5f8DVvtK63xglKXDOM6E0OjZCYSrZJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rqIb8w3cyTn9mZxuE0gWXseAQl+j97DRoAUltdx73lnSzTIN9yFxA4YlHlWDl80T1
 /eOHmM6pC/9BfKJoVsK1qrboXRRwz0QZ9LvuVzgQOBGAOinRtcqyKPGFxzS5RYIgVs
 DExiurm3ciVtva8Z5ISHJkoFYShY9ls3I7XWZCLo5n5bbByMeG5StU+76/ASnfaOZ5
 OQPzMYPTrYPhahFC1X3HR6X2j91rhV/Lx+US3r5b6qMZB4FL5m7OMPe9sBaqjn9Q8G
 j/6bUGe7/QwkuspmTCwzVM6K93/FCkKIKIavQDtmzyNuG4SL0tfTNopWPSiKyKio5R
 M1sRjFcSRlcig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 32/73] drm/msm: Use drm_mode_copy()
Date: Sun, 18 Dec 2022 11:07:00 -0500
Message-Id: <20221218160741.927862-32-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160741.927862-1-sashal@kernel.org>
References: <20221218160741.927862-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sean Paul <sean@poorly.run>, Sasha Levin <sashal@kernel.org>,
 quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, johan+linaro@kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

[ Upstream commit b2a1c5ca50db22b3677676dd5bad5f6092429acf ]

struct drm_display_mode embeds a list head, so overwriting
the full struct with another one will corrupt the list
(if the destination mode is on a list). Use drm_mode_copy()
instead which explicitly preserves the list head of
the destination mode.

Even if we know the destination mode is not on any list
using drm_mode_copy() seems decent as it sets a good
example. Bad examples of not using it might eventually
get copied into code where preserving the list head
actually matters.

Obviously one case not covered here is when the mode
itself is embedded in a larger structure and the whole
structure is copied. But if we are careful when copying
into modes embedded in structures I think we can be a
little more reassured that bogus list heads haven't been
propagated in.

@is_mode_copy@
@@
drm_mode_copy(...)
{
...
}

@depends on !is_mode_copy@
struct drm_display_mode *mode;
expression E, S;
@@
(
- *mode = E
+ drm_mode_copy(mode, &E)
|
- memcpy(mode, E, S)
+ drm_mode_copy(mode, E)
)

@depends on !is_mode_copy@
struct drm_display_mode mode;
expression E;
@@
(
- mode = E
+ drm_mode_copy(&mode, &E)
|
- memcpy(&mode, E, S)
+ drm_mode_copy(&mode, E)
)

@@
struct drm_display_mode *mode;
@@
- &*mode
+ mode

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20221107192545.9896-5-ville.syrjala@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a49f6dbbe888..c9d9b384ddd0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -857,7 +857,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	dp->panel->dp_mode.drm_mode = mode->drm_mode;
+	drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
 	dp->panel->dp_mode.bpp = mode->bpp;
 	dp->panel->dp_mode.capabilities = mode->capabilities;
 	dp_panel_init_panel_info(dp->panel);
-- 
2.35.1

