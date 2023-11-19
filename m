Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF677F041F
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 03:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2858F10E0A4;
	Sun, 19 Nov 2023 02:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Sun, 19 Nov 2023 02:30:43 UTC
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com
 [203.205.221.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F8610E0A4
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1700361040; bh=ZVdiuEYuuu49uVrKmE6rVWGMvAZoQesB66fFoisHd1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EeFhOtwUdRXQQFuJE0BGWA/KawTy995HZnxBlMT1vtGCkEIRLkrataQPnjLQPGNme
 wKc5O13SYyN1bDOiVPwn+FCc5CRZvvXiUe58G3xz0zzzdAT/9duPh44fatd/flgpXz
 Gl8HAgKQdrzcnU9VkJGv6hk/3j5XtDekIxFkoRFI=
Received: from pek-lxu-l1.wrs.com ([111.198.228.56])
 by newxmesmtplogicsvrszc2-1.qq.com (NewEsmtp) with SMTP
 id 6102DE19; Sun, 19 Nov 2023 10:24:16 +0800
X-QQ-mid: xmsmtpt1700360656tiukap0ki
Message-ID: <tencent_F6C990AEE12ED34C8467CBC6FBD2F4467F06@qq.com>
X-QQ-XMAILINFO: N0opbxSOYLeWA68wZZ1YuBlYNPk6aTxzr1s5ZxOrUQ6k20yE8Lc5WDnEZ0yQgr
 q+TwUKKbW+bUYDYVFvKz5wtnJZZ5eLk3K4Xz6WLelmsHGgQY04q+4dOrBJNa9xAQHhsohyLoLRvN
 VNJHhyosMdW0AX/qcul+H2JI+upkYAyKsNS7gsl9TsWMp0yV355cPhM8cKTHAVzDV/8jDOhGCIaa
 dmUVZh2ASeC2yD6Eb0Dwa2rpM2EvE6bAXkfllElk1exWON+GXXRhXs+r1jCVs4KclV03xEK8cBZw
 pfhpfTrnMa5ij5bK4TRNLcTtVmdvOznqzdeBjSmQdRWeuEF0qTE42sFclUIZLL++h1bEdnQmZsgo
 i31wwIwF6jUscVLwKjplegrimqdveyfiY69v5XMl0+H4ObzT0sewMBwmnW3KSu/kdMd2yWUUARfZ
 RVP403qsV5LDLmP1TN3MRwGWf/kFDLjPRNZWM5OCXID0OFDkxtA8kp3qx9UvgADFG5sk+I3sSjaK
 /ZodXrcKZoK1EdJRf+BxQbuMcwKz2ZfLSnaloZkBoQmZkHaaU4TnPNepAPdkO/zz3Gqyd2pBCX5G
 a6t7Y0FpDHPJQaYBJ4gD9XoggmbpGcCl+oYZkwYiJya2u1px2CseIDEEWjSJ/c4qGdpN0I/qahXv
 wVgvE54Jw7pG7r89e6Zd28bJs9oxyxTA6cVCOpFEkT0QkMd5ylJskDsRALXsOe+CoBvdr3ZM7vsj
 UEpRr+ToRcxNbk3x0w11G6+fn3prPHLayFVMMh4J/n190Oi+/nn46IQAo8qdfCPsEwgJksphZkfc
 o/HaUmpsphRmBoH2h2JViEXps8uo2UkWak206bQxwvd6ywi7NHKY7+Ge+AlCrcnKNhfrrGYdrBhA
 DsCCsqSdEcR+ui/O3jxXEJC28zYmlC00HslPUk47Jev0CCGQjgOgCq16SorwCN/5C8YPkp0Yc+dK
 iJxqBzdKc=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+2e93e6fb36e6fdc56574@syzkaller.appspotmail.com
Subject: [PATCH] drm/modes: Fix divide error in drm_mode_debug_printmodeline
Date: Sun, 19 Nov 2023 10:24:16 +0800
X-OQ-MSGID: <20231119022415.166533-2-eadavis@qq.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <000000000000bf0b1f060a2d9bea@google.com>
References: <000000000000bf0b1f060a2d9bea@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Nov 2023 02:50:51 +0000
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
Cc: tzimmermann@suse.de, airlied@linux.ie, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mripard@kernel.org, daniel.vetter@intel.com,
 syzkaller-bugs@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Syz Log]
divide error: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 5068 Comm: syz-executor357 Not tainted 6.6.0-syzkaller-16039-gac347a0655db #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/09/2023
RIP: 0010:drm_mode_vrefresh drivers/gpu/drm/drm_modes.c:1303 [inline]
RIP: 0010:drm_mode_debug_printmodeline+0x118/0x4e0 drivers/gpu/drm/drm_modes.c:60
Code: 00 41 0f b7 07 66 83 f8 02 b9 01 00 00 00 0f 43 c8 0f b7 c1 0f af e8 44 89 f0 48 69 c8 e8 03 00 00 89 e8 d1 e8 48 01 c8 31 d2 <48> f7 f5 49 89 c6 eb 0c e8 fb 07 66 fc eb 05 e8 f4 07 66 fc 48 89
RSP: 0018:ffffc9000391f8d0 EFLAGS: 00010246
RAX: 000000000001f400 RBX: ffff888025045000 RCX: 000000000001f400
RDX: 0000000000000000 RSI: 0000000000008000 RDI: ffff888025045018
RBP: 0000000000000000 R08: ffffffff8528b9af R09: 0000000000000000
R10: ffffc9000391f8a0 R11: fffff52000723f17 R12: 0000000000000080
R13: dffffc0000000000 R14: 0000000000000080 R15: ffff888025045016
FS:  0000555556932380(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000005fdeb8 CR3: 000000007fcff000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 drm_mode_setcrtc+0x83b/0x1880 drivers/gpu/drm/drm_crtc.c:794
 drm_ioctl_kernel+0x362/0x500 drivers/gpu/drm/drm_ioctl.c:792
 drm_ioctl+0x636/0xb00 drivers/gpu/drm/drm_ioctl.c:895
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:871 [inline]
 __se_sys_ioctl+0xf8/0x170 fs/ioctl.c:857
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x44/0x110 arch/x86/entry/common.c:82
 entry_SYSCALL_64_after_hwframe+0x63/0x6b

[Analysis]
When calculating den in drm_mode_vrefresh(), if the vscan value is too large, 
there is a probability of unsigned integer overflow.

[Fix]
Before multiplying by vscan, first determine their ilog2. When their total 
exceeds 32, return -EINVAL and exit the subsequent calculation.

Reported-and-tested-by: syzbot+2e93e6fb36e6fdc56574@syzkaller.appspotmail.com
Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/gpu/drm/drm_modes.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ac9a406250c5..c7ec1ab041f8 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -36,6 +36,7 @@
 #include <linux/list.h>
 #include <linux/list_sort.h>
 #include <linux/of.h>
+#include <linux/log2.h>
 
 #include <video/of_display_timing.h>
 #include <video/of_videomode.h>
@@ -1297,8 +1298,11 @@ int drm_mode_vrefresh(const struct drm_display_mode *mode)
 		num *= 2;
 	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
 		den *= 2;
-	if (mode->vscan > 1)
+	if (mode->vscan > 1) {
+		if (ilog2(den) + ilog2(mode->vscan) >= 32)
+			return -EINVAL;
 		den *= mode->vscan;
+	}
 
 	return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(num, 1000), den);
 }
-- 
2.25.1

