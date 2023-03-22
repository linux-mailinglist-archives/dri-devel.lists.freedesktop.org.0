Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2A56C55D5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 21:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D813B10EA01;
	Wed, 22 Mar 2023 20:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929EF10EA00
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 20:01:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 309E4B81DE5;
 Wed, 22 Mar 2023 20:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B826C433EF;
 Wed, 22 Mar 2023 20:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515271;
 bh=S459jdWER1xni9Yo2llF8OrfMcVLtymX+EffCGcFIIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NvJWPRjIFyvCIFgU4MORTfrWTsTLNCjaOHbrplC+t4Nx1Y9rqfL07UxhHl0EUU7l6
 9XU2JWQ9tMLfXNMdm9/iu22+eeDQvgkLKYFdvTG8u/95mGSiJlTtKaknnxNWNjKjCK
 g0raIjiHwU6MyPGu/fV2S+ORZvVR9dZK0AGAofsMegTFvn0XUCGia5IoB5CK/UF7bW
 CtNa2Ms5QD9f89AK5rJSLGXpoDDIC9KXaQffPL0+PZJkbfvA3iiZ3C8WXjaONQODjm
 mAzHbRobMNQmyaJAWuCm1KLLr8Y2JPFADy+ZoAjSpsncV97RC/481hIkBPJ6LQr9FU
 IK0gkp7seESKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 29/34] fbdev: intelfb: Fix potential divide by zero
Date: Wed, 22 Mar 2023 15:59:21 -0400
Message-Id: <20230322195926.1996699-29-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195926.1996699-1-sashal@kernel.org>
References: <20230322195926.1996699-1-sashal@kernel.org>
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
 Helge Deller <deller@gmx.de>, mbroemme@libmpq.org,
 dri-devel@lists.freedesktop.org, Wei Chen <harperchen1110@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Chen <harperchen1110@gmail.com>

[ Upstream commit d823685486a3446d061fed7c7d2f80af984f119a ]

Variable var->pixclock is controlled by user and can be assigned
to zero. Without proper check, divide by zero would occur in
intelfbhw_validate_mode and intelfbhw_mode_to_hw.

Error out if var->pixclock is zero.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/intelfb/intelfbdrv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index d4a2891a9a7ac..a93dd531d00df 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -1219,6 +1219,9 @@ static int intelfb_check_var(struct fb_var_screeninfo *var,
 
 	dinfo = GET_DINFO(info);
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	/* update the pitch */
 	if (intelfbhw_validate_mode(dinfo, var) != 0)
 		return -EINVAL;
-- 
2.39.2

