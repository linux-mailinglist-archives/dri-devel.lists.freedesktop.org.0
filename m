Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057CA2A3856
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 02:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647306E073;
	Tue,  3 Nov 2020 01:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3536E073
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 01:18:51 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D5E122243;
 Tue,  3 Nov 2020 01:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604366330;
 bh=p8CcsK59HrgvsonMBNa8Vf9L18kH0ZWkC9V7dQBVWYI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IYOpetrqVFuyRPe5y1MiXTZHmm95JsyLXC9E/I09ljktre9r8fOwdwSzU74hUogrV
 oO+SBWku4uuTW+yzTZIzVwyIouVQcpReCjtdMLxpbo4D3ASjp1Al5bx3svT391HfGu
 3hE7jXAYQa+PLMjp1xxP9zelmFaY7/bc0bbVJpVE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 07/35] hyperv_fb: Update screen_info after
 removing old framebuffer
Date: Mon,  2 Nov 2020 20:18:12 -0500
Message-Id: <20201103011840.182814-7-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103011840.182814-1-sashal@kernel.org>
References: <20201103011840.182814-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Wei Hu <weh@microsoft.com>, Kairui Song <kasong@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jake Oshins <jakeo@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kairui Song <kasong@redhat.com>

[ Upstream commit 3cb73bc3fa2a3cb80b88aa63b48409939e0d996b ]

On gen2 HyperV VM, hyperv_fb will remove the old framebuffer, and the
new allocated framebuffer address could be at a differnt location,
and it might be no longer a VGA framebuffer.

Update screen_info so that after kexec the kernel won't try to reuse
the old invalid/stale framebuffer address as VGA, corrupting memory.

[ mingo: Tidied up the changelog. ]

Signed-off-by: Kairui Song <kasong@redhat.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Jake Oshins <jakeo@microsoft.com>
Cc: Wei Hu <weh@microsoft.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Link: https://lore.kernel.org/r/20201014092429.1415040-3-kasong@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/hyperv_fb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 02411d89cb462..e36fb1a0ecdbd 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1114,8 +1114,15 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 getmem_done:
 	remove_conflicting_framebuffers(info->apertures,
 					KBUILD_MODNAME, false);
-	if (!gen2vm)
+
+	if (gen2vm) {
+		/* framebuffer is reallocated, clear screen_info to avoid misuse from kexec */
+		screen_info.lfb_size = 0;
+		screen_info.lfb_base = 0;
+		screen_info.orig_video_isVGA = 0;
+	} else {
 		pci_dev_put(pdev);
+	}
 	kfree(info->apertures);
 
 	return 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
