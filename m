Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0331332896E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 18:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A9989DB8;
	Mon,  1 Mar 2021 17:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C85E89DE3;
 Mon,  1 Mar 2021 17:57:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3AD36534A;
 Mon,  1 Mar 2021 17:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614621431;
 bh=3MP58ahElmf28SkJLmVjrVG3eOZ4pl8zoP9WiVrqdyg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q12JkT7YABBUtx7h8W48zO3jyvFjPC9e9x/2CLKadNv16SgpPifNEaPXTguV0VuQ0
 lSExQYQ82xEAp6iDwEI/xLrlAAWH/JblP9wv1775svASPaUB0ipRrgBLB0uspsiLGw
 gLCdtJSHZ86VKr0ZSZlKnhLm+zaK0zGwmpn1Xrdo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.11 513/775] drm/msm/dp: Add a missing semi-colon
Date: Mon,  1 Mar 2021 17:11:21 +0100
Message-Id: <20210301161226.875706220@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301161201.679371205@linuxfoundation.org>
References: <20210301161201.679371205@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stephen Boyd <swboyd@chromium.org>

[ Upstream commit 182b4a2d251305201b6f9cae29067f7112f05835 ]

A missing semicolon here causes my external display to stop working.
Indeed, missing the semicolon on the return statement leads to
dp_panel_update_tu_timings() not existing because the compiler thinks
it's part of the return statement of a void function, so it must not be
important.

  $ ./scripts/bloat-o-meter before.o after.o
  add/remove: 1/1 grow/shrink: 0/1 up/down: 7400/-7540 (-140)
  Function                                     old     new   delta
  dp_panel_update_tu_timings                     -    7400   +7400
  _dp_ctrl_calc_tu.constprop                 18024   17900    -124
  dp_panel_update_tu_timings.constprop        7416       -   -7416
  Total: Before=54440, After=54300, chg -0.26%

Add a semicolon so this function works like it used to.

Cc: Sean Paul <sean@poorly.run>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: Lee Jones <lee.jones@linaro.org>
Fixes: cc9014bf63a4 ("drm/msm/dp/dp_ctrl: Move 'tu' from the stack to the heap")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e3462f5d96d75..6cbe10af0a7af 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -631,7 +631,7 @@ static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
 
 	tu = kzalloc(sizeof(*tu), GFP_KERNEL);
 	if (!tu)
-		return
+		return;
 
 	dp_panel_update_tu_timings(in, tu);
 
-- 
2.27.0



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
