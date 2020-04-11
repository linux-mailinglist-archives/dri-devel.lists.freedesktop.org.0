Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8711A54DC
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9376E357;
	Sat, 11 Apr 2020 23:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7BB6E357
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 23:08:17 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37ADA215A4;
 Sat, 11 Apr 2020 23:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646497;
 bh=hxSLI/Wp+FzU1WI/4USn63xVTDunb7/+FM/8EFyhj7o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wCs9K7bbA7dmFsIgvLqUPFkpe6Q7aCFeJ1gEzjSBWkcmNBOJ67lGfoGjvI1XxCkE0
 R+qDwZoHwyj9Id1c6Cm6CVvg1fjXLA3h09HG4y+dDWeIG0W+Cg9UZCOy+PFohkGfZa
 cbGi1JM4Qov9o7JREj5mx10qExpk0FqdHeNIF7SY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 059/121] drm/stm: ltdc: check crtc state before
 enabling LIE
Date: Sat, 11 Apr 2020 19:06:04 -0400
Message-Id: <20200411230706.23855-59-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230706.23855-1-sashal@kernel.org>
References: <20200411230706.23855-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yannick Fertre <yannick.fertre@st.com>

[ Upstream commit a6bd58c51ac43083f3977057a7ad668def55812f ]

Following investigations of a hardware bug, the LIE interrupt
can occur while the display controller is not activated.
LIE interrupt (vblank) don't have to be set if the CRTC is not
enabled.

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
Acked-by: Philippe Cornu <philippe.cornu@st.com>
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Link: https://patchwork.freedesktop.org/patch/msgid/1579601650-7055-1-git-send-email-yannick.fertre@st.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/stm/ltdc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 5b51298921cf1..cf899cff7610a 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -654,9 +654,14 @@ static const struct drm_crtc_helper_funcs ltdc_crtc_helper_funcs = {
 static int ltdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
+	struct drm_crtc_state *state = crtc->state;
 
 	DRM_DEBUG_DRIVER("\n");
-	reg_set(ldev->regs, LTDC_IER, IER_LIE);
+
+	if (state->enable)
+		reg_set(ldev->regs, LTDC_IER, IER_LIE);
+	else
+		return -EPERM;
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
