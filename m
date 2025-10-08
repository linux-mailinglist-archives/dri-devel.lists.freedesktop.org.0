Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2918BC370D
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 08:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CBB10E0BB;
	Wed,  8 Oct 2025 06:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oUt7p4Yr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED51F10E0BB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 06:10:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 854E644231;
 Wed,  8 Oct 2025 06:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A64FC4CEF4;
 Wed,  8 Oct 2025 06:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759903833;
 bh=Dc569KT1YS0VQ3qzLz5ms49L7ZBR3t8zH8folwCiWa8=;
 h=From:To:Cc:Subject:Date:From;
 b=oUt7p4YrY+IuLquT8CkeUy70jH9EPO23jENfxHkTIYmyBQQBC1rqAL69/ljqsWt9T
 1eVRGYfHCByz90XkdQ+Pd/nAVHKIM15vHMK/PFOubWNLj0yb/8s4uQRxuDkPugWX2Z
 DjgzVpIT9G9qI/f0KYfmN2S9+ij0yOdy2JLOzVdB8+N0o8Smeic5WcB+GdLXD/MmN1
 tkKktcAsOGY/jufEVMVbeIKoh3jLf9vJlDfdY19w5/0gJjiLc2AROIQ360/YAMAsxc
 tgyzRovP9z048Kz8m6BXCrsHMfoMuS2ORyO2e3ScMMiZ5WutaLzQagV8oq7pq2yTqG
 bog/slmI6n8AQ==
From: Kees Cook <kees@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
 syzbot+a9391462075ffb9f77c6@syzkaller.appspotmail.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH] dma-buf: use SB_I_NOEXEC and SB_I_NODEV
Date: Tue,  7 Oct 2025 23:10:32 -0700
Message-Id: <20251008061027.work.515-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929; i=kees@kernel.org;
 h=from:subject:message-id; bh=Dc569KT1YS0VQ3qzLz5ms49L7ZBR3t8zH8folwCiWa8=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDBnPGMIvvjnZz8Y1Y7b5isuyJ5568nE21L+vtb9k+Mkn9
 nO/9D7jjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgInMi2b4wxP2aK6KqInRk67H
 1z88+XNBde6Mi7VnVB6ZdK6/8uWSkQEjw6MdiyfJ2D0vu2v/Rdj6+JqlDRMy1/x4X3TiiVZdzfz
 G59wA
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

The dma-buf pseudo-filesystem should never have executable mappings nor
device nodes. Set SB_I_NOEXEC and SB_I_NODEV on the superblock to enforce
this at the filesystem level, similar to secretmem, commit 98f99394a104
("secretmem: use SB_I_NOEXEC").

Fix the syzbot-reported warning from the exec code to enforce this
requirement:

> WARNING: CPU: 1 PID: 6000 at fs/exec.c:119 path_noexec+0x1af/0x200 fs/exec.c:118
> Modules linked in:
> CPU: 1 UID: 0 PID: 6000 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full)
> RIP: 0010:path_noexec+0x1af/0x200 fs/exec.c:118
> Call Trace:
>  <TASK>
>  do_mmap+0xa43/0x10d0 mm/mmap.c:469
>  vm_mmap_pgoff+0x2a6/0x4d0 mm/util.c:580
>  ksys_mmap_pgoff+0x51f/0x760 mm/mmap.c:604
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported-by: syzbot+a9391462075ffb9f77c6@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/68dc3ade.a70a0220.10c4b.015b.GAE@google.com/
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Christian Brauner <brauner@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: syzbot+a9391462075ffb9f77c6@syzkaller.appspotmail.com
Cc: <linux-media@vger.kernel.org>
Cc: <dri-devel@lists.freedesktop.org>
Cc: <linaro-mm-sig@lists.linaro.org>
---
 drivers/dma-buf/dma-buf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 2bcf9ceca997..6e2ab1a4560d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -189,6 +189,8 @@ static int dma_buf_fs_init_context(struct fs_context *fc)
 {
 	struct pseudo_fs_context *ctx;
 
+	fc->s_iflags |= SB_I_NOEXEC;
+	fc->s_iflags |= SB_I_NODEV;
 	ctx = init_pseudo(fc, DMA_BUF_MAGIC);
 	if (!ctx)
 		return -ENOMEM;
-- 
2.34.1

