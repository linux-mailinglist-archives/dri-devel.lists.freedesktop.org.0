Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BBE404C2E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784106E820;
	Thu,  9 Sep 2021 11:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE926E820
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 11:55:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A920261BFB;
 Thu,  9 Sep 2021 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188521;
 bh=9sqIlj1TMlzStrSfKyBBB4xXAtrh/JOARt+Z0euvc/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T0RGhQjc6KkQGrTKCDehDjxgheyDg+w7Ma4HmKVNgHuMJoGq3o3giHmzB9XLRphCN
 I/N6ICPBU/m0NUgrNbSykVNp5qIizBqoujnVgE7Y0RiOLwP+WcyBlvRNNBpvoJw4gK
 TdfFm6Xb/TnKoMPNEonha1gLlwWpwguTb83nzSO0JmnL9a6vA4fy2jAGTTBsjrs7t7
 rYS8zXJCqc9Fe7Dgm0aCcuZid7vwebVr3XRo+SUFZJ+q4h2QvxbYYZblOGVCrn8h9w
 FHCx52dmXbrpGS7//bR4UjcnIEM1j9ZiQKWKhKfTZdmAZ0NVem6G+ZnyINZ7hiAFcS
 czajDlMBShXBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 011/109] video: fbdev: kyro: fix a DoS bug by
 restricting user input
Date: Thu,  9 Sep 2021 07:53:28 -0400
Message-Id: <20210909115507.147917-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115507.147917-1-sashal@kernel.org>
References: <20210909115507.147917-1-sashal@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zheyu Ma <zheyuma97@gmail.com>

[ Upstream commit 98a65439172dc69cb16834e62e852afc2adb83ed ]

The user can pass in any value to the driver through the 'ioctl'
interface. The driver dost not check, which may cause DoS bugs.

The following log reveals it:

divide error: 0000 [#1] PREEMPT SMP KASAN PTI
RIP: 0010:SetOverlayViewPort+0x133/0x5f0 drivers/video/fbdev/kyro/STG4000OverlayDevice.c:476
Call Trace:
 kyro_dev_overlay_viewport_set drivers/video/fbdev/kyro/fbdev.c:378 [inline]
 kyrofb_ioctl+0x2eb/0x330 drivers/video/fbdev/kyro/fbdev.c:603
 do_fb_ioctl+0x1f3/0x700 drivers/video/fbdev/core/fbmem.c:1171
 fb_ioctl+0xeb/0x130 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x19b/0x220 fs/ioctl.c:739
 do_syscall_64+0x32/0x80 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/1626235762-2590-1-git-send-email-zheyuma97@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/kyro/fbdev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index a7bd9f25911b..d7aa431e6846 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -372,6 +372,11 @@ static int kyro_dev_overlay_viewport_set(u32 x, u32 y, u32 ulWidth, u32 ulHeight
 		/* probably haven't called CreateOverlay yet */
 		return -EINVAL;
 
+	if (ulWidth == 0 || ulWidth == 0xffffffff ||
+	    ulHeight == 0 || ulHeight == 0xffffffff ||
+	    (x < 2 && ulWidth + 2 == 0))
+		return -EINVAL;
+
 	/* Stop Ramdac Output */
 	DisableRamdacOutput(deviceInfo.pSTGReg);
 
-- 
2.30.2

