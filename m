Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9C95A69EA
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4035610E27F;
	Tue, 30 Aug 2022 17:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471BB10E27F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:24:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E42ADB81D19;
 Tue, 30 Aug 2022 17:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E15C433C1;
 Tue, 30 Aug 2022 17:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880263;
 bh=kUrZhZopLYc41rgNuZ0oBSix0hPLFs3SNFxYJUMGocM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C2gFsWaCyaRlgyXBX8NhULU2axPou0+iqJUlz6FRSHvkVgrTOZ+Vy8nMaKP6IJuyg
 dkeS7DNoKETwuJGlaoUeXDcmsNV7EQBV1uAxw6zeU7kuEjdJV8nvuhThhAhF5+AqbW
 DGAEtJEoi8Wp6Oygy9sHdrSGiPkyiwpKywEtkdNIbBrflTaSrc4I5SUWFdLc/1m1kv
 HVV87yxFOr7V3/c1pJID/T9YUwsNCXSASCMHyVTBmTQN0lBfeW/TOiam6TTjys45Ps
 YdmpueP9VrjYUu3xgrAOV76RLMr3RvsKrS7jS4O+uzcImhLiItl3Vd+u3bQlDUPKrj
 gbjaHNbSgEdCg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 14/16] fbdev: fb_pm2fb: Avoid potential divide by
 zero error
Date: Tue, 30 Aug 2022 13:23:15 -0400
Message-Id: <20220830172317.581397-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172317.581397-1-sashal@kernel.org>
References: <20220830172317.581397-1-sashal@kernel.org>
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
 Letu Ren <fantasquex@gmail.com>, baihaowen@meizu.com,
 Helge Deller <deller@gmx.de>, Zheyu Ma <zheyuma97@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Letu Ren <fantasquex@gmail.com>

[ Upstream commit 19f953e7435644b81332dd632ba1b2d80b1e37af ]

In `do_fb_ioctl()` of fbmem.c, if cmd is FBIOPUT_VSCREENINFO, var will be
copied from user, then go through `fb_set_var()` and
`info->fbops->fb_check_var()` which could may be `pm2fb_check_var()`.
Along the path, `var->pixclock` won't be modified. This function checks
whether reciprocal of `var->pixclock` is too high. If `var->pixclock` is
zero, there will be a divide by zero error. So, it is necessary to check
whether denominator is zero to avoid crash. As this bug is found by
Syzkaller, logs are listed below.

divide error in pm2fb_check_var
Call Trace:
 <TASK>
 fb_set_var+0x367/0xeb0 drivers/video/fbdev/core/fbmem.c:1015
 do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1110
 fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1189

Reported-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Letu Ren <fantasquex@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/pm2fb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index 0642555289e06..c12d46e283598 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -616,6 +616,11 @@ static int pm2fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 		return -EINVAL;
 	}
 
+	if (!var->pixclock) {
+		DPRINTK("pixclock is zero\n");
+		return -EINVAL;
+	}
+
 	if (PICOS2KHZ(var->pixclock) > PM2_MAX_PIXCLOCK) {
 		DPRINTK("pixclock too high (%ldKHz)\n",
 			PICOS2KHZ(var->pixclock));
-- 
2.35.1

