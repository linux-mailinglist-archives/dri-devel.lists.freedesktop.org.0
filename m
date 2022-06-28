Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C423355BD7F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7830910EE23;
	Tue, 28 Jun 2022 02:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F059110EE23
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:24:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 691E46172F;
 Tue, 28 Jun 2022 02:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DF4C341CB;
 Tue, 28 Jun 2022 02:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383089;
 bh=ChdpymeB3TsEFGpqxL1k20A2RoBePNdIlStDwn97s5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hOrjheNBZBfgx6pp1aMHeYTsGcaHOegKXOTrTmtcZQXaOKxm54v4F214S5eMn8AME
 wS3usjX90tTJ6bDo83+kE1+tSmjBu3M4TJffB15uk0Sp/+kBNHJDi3SSsJDmuBa6pR
 nBigfb67SAsq+MfIpI11Qe6iSt53LSnAeYXa3Q7SfRYQ1/s0vYhkIPEMO9LUdtTIxz
 z5BIRR+lQ0Prjr8oQ29NKlPfzNPpbr5crYy7w574kYpEkNNvaMwDK3zloNxe4cFmyZ
 /Qq4CAl5QeKuU0wmuiGz3OFLqTcko4n96lTwALkCjIpNH1bQorndKFaRtKuvdN3e+7
 UoC5cBO2G9wxA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 14/27] video: fbdev: simplefb: Check before
 clk_put() not needed
Date: Mon, 27 Jun 2022 22:24:00 -0400
Message-Id: <20220628022413.596341-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022413.596341-1-sashal@kernel.org>
References: <20220628022413.596341-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Yihao Han <hanyihao@vivo.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yihao Han <hanyihao@vivo.com>

[ Upstream commit 5491424d17bdeb7b7852a59367858251783f8398 ]

clk_put() already checks the clk ptr using !clk and IS_ERR()
so there is no need to check it again before calling it.

Signed-off-by: Yihao Han <hanyihao@vivo.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/simplefb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 7dc0105f700d..f03705666983 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -225,8 +225,7 @@ static int simplefb_clocks_get(struct simplefb_par *par,
 		if (IS_ERR(clock)) {
 			if (PTR_ERR(clock) == -EPROBE_DEFER) {
 				while (--i >= 0) {
-					if (par->clks[i])
-						clk_put(par->clks[i]);
+					clk_put(par->clks[i]);
 				}
 				kfree(par->clks);
 				return -EPROBE_DEFER;
-- 
2.35.1

