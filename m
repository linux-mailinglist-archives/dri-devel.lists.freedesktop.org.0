Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85000371A69
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90509892D5;
	Mon,  3 May 2021 16:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A543892D5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 16:39:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B75D56161E;
 Mon,  3 May 2021 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059952;
 bh=+8Ak/gQ7R3xd2xD7Jm1k0nim9o8CSWY+VD9ZmUUgU00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R6bx7hAS1C1a3pP+xUIlnUhzYM8f2tGhy3cO6DfWAvqVxGIalL8ouDl5q1bPj2HGL
 rOST2gT1rCyjSOydLH3+ktLBdikg50vnvAvFtrVwbaYfi50AMnFV7DcvtoQ5IUkH2J
 8v0dsq45z9MkSA3eh6EZgVgdjTcSe339lsPZzPomTrsNv8mzBItxO18VUl8lv6RU2D
 ON6IA9CvJIyc4+k7EaJOn1Avv0SOL4oTarcQ7py6+6dkvfePX5GB+Kr9HVJI1ZcgkB
 30M/T1JNOH8p43iKypgiABmgzJfxGoEtxb3KfSsg06peDylYxt6hXxeX/yesZdthaj
 rJpBY/xbkfrYw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 028/100] backlight: qcom-wled: Use sink_addr for
 sync toggle
Date: Mon,  3 May 2021 12:37:17 -0400
Message-Id: <20210503163829.2852775-28-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163829.2852775-1-sashal@kernel.org>
References: <20210503163829.2852775-1-sashal@kernel.org>
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Obeida Shamoun <oshmoun100@googlemail.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Obeida Shamoun <oshmoun100@googlemail.com>

[ Upstream commit cdfd4c689e2a52c313b35ddfc1852ff274f91acb ]

WLED3_SINK_REG_SYNC is, as the name implies, a sink register offset.
Therefore, use the sink address as base instead of the ctrl address.

This fixes the sync toggle on wled4, which can be observed by the fact
that adjusting brightness now works.

It has no effect on wled3 because sink and ctrl base addresses are the
same.  This allows adjusting the brightness without having to disable
then reenable the module.

Signed-off-by: Obeida Shamoun <oshmoun100@googlemail.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Acked-by: Kiran Gunda <kgunda@codeaurora.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/backlight/qcom-wled.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 3bc7800eb0a9..83a187fdaa1d 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -336,13 +336,13 @@ static int wled3_sync_toggle(struct wled *wled)
 	unsigned int mask = GENMASK(wled->max_string_count - 1, 0);
 
 	rc = regmap_update_bits(wled->regmap,
-				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
+				wled->sink_addr + WLED3_SINK_REG_SYNC,
 				mask, mask);
 	if (rc < 0)
 		return rc;
 
 	rc = regmap_update_bits(wled->regmap,
-				wled->ctrl_addr + WLED3_SINK_REG_SYNC,
+				wled->sink_addr + WLED3_SINK_REG_SYNC,
 				mask, WLED3_SINK_REG_SYNC_CLEAR);
 
 	return rc;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
