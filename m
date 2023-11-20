Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BB57F1638
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 15:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEF010E025;
	Mon, 20 Nov 2023 14:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com
 [203.205.221.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1333C10E025
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1700491830; bh=PQ1k+3V4iHB1C7jMlUnhhuJyOH3WZvQgYxXwEN4mR1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=iarTj2gIaL+Bvu05MOC5Ym5JuD1IP4bwbGYyPIY+V3DnzL5RcArLHgP6c5kfhv7N2
 NnQljE6j06GjYzEQHCCYj5TWU656KcQk+x4a9XT99hCuXShnkNjGzFM0eTe9nrkr9J
 eNTFPqHl2M9ousHYFhInmleUVGrGMBqPKk6YbYag=
Received: from pek-lxu-l1.wrs.com ([111.198.228.56])
 by newxmesmtplogicsvrszc2-1.qq.com (NewEsmtp) with SMTP
 id A512F0EE; Mon, 20 Nov 2023 22:41:17 +0800
X-QQ-mid: xmsmtpt1700491277tez517o9n
Message-ID: <tencent_DCCE6C78766FE82D816F9C94F0EAC2ED260A@qq.com>
X-QQ-XMAILINFO: MFdGPHhuqhNoFodqOjSvTI9z7IH3aDP7lTxLV4MJtM1B15sEtLq3KRFAkcwwlq
 4CRcWeMWC5OYEbTr4aLomHxOz8L3I2OLy4iCIsgxpQQInm8JspVgzfSX2zaThsgnQla7NZ0wTkKu
 +RfdlBavOKPO5Nvd76UJqs0vO3xTmoKhGhgP/SC1NOfPqmNOQ62bP3KVVCs2s7x6MThz5ayYhDzc
 H2PeiNNMgOGDqk+vsvzDU7gmOQjskEUF8mWlDx5JHEh/L5wSI+jo8uImw29Nk8V9+yVQQHrWjPAb
 CsVWsPutj5rdgCIbA22ywNsi7BHClox+s6GoekqZqGCNxBXm8+q4QkqC/hCVIcszt4UJ6VQwP1G1
 4fPhHqCoMhBIH8Dz+aEcdJ9PLd2AE7/FG42polRVbed7zFDevkaBVAl6kvVCyXNCEG2Wk3CMXL5h
 iMVBIhmMJjfjSXG044l3qt5J2MaOQa1aWHkj1226RhDVP22996sM0E/H485yFtQDqpaLb3oDAXe8
 C/tFBoXwaO+CdD1BdWTxdn9/KRx6x1ElBlYQeciTPMmb1zExViIn2OK89vJSar/e4arb8v9G1X+b
 G1roI8vh5LQC4q4NnnkzixNMRIllmwf5F5DXyc5wOaDEkAKvqnK7sMr7U+rtBAMi0ayI1A8K2V6o
 VdoO+g9jDO2EM9k8jM18sMLt2WTF3ALGbW0+aXRmsbakW5xOWUAZDJjmXharvuTdWYBQ0rHCswyu
 KntybkvxzmFTghpotZ1VdZKM5YthO/MVBgBqlRem0G/T1hwA81GNnO7AYrIrBmxMaBnCrnnz99jY
 FWz3VQucgjW+6UFGlAdtGtYNzQ+h8Vzb5ZR0KrT/3fPHrxrTcgzGBwQFdiNwxTn+Ox4lBwgn6pCO
 eE3cICCBBV6hLVbJ55IdnHLh1FcCm6VM/J1K0ZCGRQM590/8hJY1zRUVde18B6AeW0tIO0DhaXG4
 6d5+ZSx+dPpUQYVBPma1Ty/Ndt8prz
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Edward Adam Davis <eadavis@qq.com>
To: jani.nikula@linux.intel.com
Subject: [PATCH V2] drm/modes: Fix divide error in drm_mode_debug_printmodeline
Date: Mon, 20 Nov 2023 22:41:18 +0800
X-OQ-MSGID: <20231120144117.1981470-2-eadavis@qq.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <875y1wpsp3.fsf@intel.com>
References: <875y1wpsp3.fsf@intel.com>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, eadavis@qq.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mripard@kernel.org, tzimmermann@suse.de,
 daniel.vetter@intel.com, syzkaller-bugs@googlegroups.com,
 syzbot+2e93e6fb36e6fdc56574@syzkaller.appspotmail.com
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
Before multiplying by vscan, first check if their product will overflow. 
If overflow occurs, return 0 and exit the subsequent process.

Reported-and-tested-by: syzbot+2e93e6fb36e6fdc56574@syzkaller.appspotmail.com
Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/gpu/drm/drm_modes.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletion(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index ac9a406250c5..60739d861da2 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -36,6 +36,7 @@
 #include <linux/list.h>
 #include <linux/list_sort.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 
 #include <video/of_display_timing.h>
 #include <video/of_videomode.h>
@@ -1297,8 +1298,10 @@ int drm_mode_vrefresh(const struct drm_display_mode *mode)
 		num *= 2;
 	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
 		den *= 2;
-	if (mode->vscan > 1)
-		den *= mode->vscan;
+	if (mode->vscan > 1) {
+		if (unlikely(check_mul_overflow(den, mode->vscan, &den)))
+			return 0;
+	}
 
 	return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(num, 1000), den);
 }
-- 
2.25.1

