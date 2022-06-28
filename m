Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B632955BDA0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D08910F31F;
	Tue, 28 Jun 2022 02:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF93010F2FF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:27:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5DBCC6192A;
 Tue, 28 Jun 2022 02:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C07FC341CC;
 Tue, 28 Jun 2022 02:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383237;
 bh=L8RVp5OXmyoqFtSIWnGjdQGw8DF4M9iNlVUBWEbtTUc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VNv4z620WaUhDEAGaplGZQWvRi5v3vofozSJE2/DxDRmPIPRQ4TbrE1IriXcOEoxM
 Vn+YM6hJ7mZvDO55WNeQXL8oGfNIKZPv0+SDZgajnMioqPsn4cRnwdf5t2BAstQ/KE
 nFK5eofNuiCYmJTFKnaFD4MgEbqSns7fmNRpAyquZy+yGbJz12LgOWDB8rJ7s54z0C
 uCbmoYfBi/GmX8CqhbZjQVpwj1w4fhGZubWeKyv0tp5UrjLlobgPQxJkRZr5ltTCXu
 COva5BZtmHVJEqC4bnPYEpJsL5YfWs7pen7ixj3e44QEzpNiTE6fDtpE934OiU7/Gx
 E51Pil8NtCFvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 08/13] video: fbdev: simplefb: Check before
 clk_put() not needed
Date: Mon, 27 Jun 2022 22:26:52 -0400
Message-Id: <20220628022657.597208-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022657.597208-1-sashal@kernel.org>
References: <20220628022657.597208-1-sashal@kernel.org>
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
index 61f799a515dc..1efdbbc20f99 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -231,8 +231,7 @@ static int simplefb_clocks_init(struct simplefb_par *par,
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

