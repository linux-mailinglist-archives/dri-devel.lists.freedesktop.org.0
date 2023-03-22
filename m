Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1DA6C560E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 21:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167EE10EA16;
	Wed, 22 Mar 2023 20:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0DA10EA16
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 20:02:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73BDCB81DED;
 Wed, 22 Mar 2023 20:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24940C433EF;
 Wed, 22 Mar 2023 20:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679515377;
 bh=6rJG97ZzxVmIyk1bTkmXt1OfZk0tUqXxGyQT7Wn+4hM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CuWjr3IWgd5Qn6+rkTgw4vBhI2+14VZDEV9GmTBvRNcIpS/lKvJWsauNfwKHGfzyQ
 TLM5Fa769G4ff6Zjz7TOTUwP3Vu6xk8Kz2NU3OpW5dJ1DTT0iRFQKJugcHRJ5qJZrf
 3ipAoxXFj5QD335Yv5UXlr+K9oc5LvyPXkGLddqQkZreIK890kgqss086Lv/UvVOY0
 SBQTRSlptm7aGYTwO5qxA5p4Jk1RiFd3kSbjKA38lpwdsk4ONe9JuXoo7dFWsDp6TP
 IsXwyjy5DnNRjrbitvrTO9FtQqyo2Li9RgMLnmUY84qRqiyTNhRcNRck8HKL1inQKC
 cL3f93tlO3m3w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 4/9] fbdev: tgafb: Fix potential divide by zero
Date: Wed, 22 Mar 2023 16:02:36 -0400
Message-Id: <20230322200242.1997527-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322200242.1997527-1-sashal@kernel.org>
References: <20230322200242.1997527-1-sashal@kernel.org>
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
 Helge Deller <deller@gmx.de>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Wei Chen <harperchen1110@gmail.com>,
 wsa+renesas@sang-engineering.com, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wei Chen <harperchen1110@gmail.com>

[ Upstream commit f90bd245de82c095187d8c2cabb8b488a39eaecc ]

fb_set_var would by called when user invokes ioctl with cmd
FBIOPUT_VSCREENINFO. User-provided data would finally reach
tgafb_check_var. In case var->pixclock is assigned to zero,
divide by zero would occur when checking whether reciprocal
of var->pixclock is too high.

Similar crashes have happened in other fbdev drivers. There
is no check and modification on var->pixclock along the call
chain to tgafb_check_var. We believe it could also be triggered
in driver tgafb from user site.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/tgafb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 286b2371c7dd3..eab2b4f87d68f 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -166,6 +166,9 @@ tgafb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
 	struct tga_par *par = (struct tga_par *)info->par;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	if (par->tga_type == TGA_TYPE_8PLANE) {
 		if (var->bits_per_pixel != 8)
 			return -EINVAL;
-- 
2.39.2

