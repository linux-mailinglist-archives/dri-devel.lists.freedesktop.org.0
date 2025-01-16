Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46D9A13762
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 11:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C5E10E927;
	Thu, 16 Jan 2025 10:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 486 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jan 2025 10:05:53 UTC
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A8310E927
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 10:05:53 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4YYdZt01l7z4x4FK
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 10:57:42 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:dc22:1d0d:62b2:39be])
 by albert.telenet-ops.be with cmsmtp
 id 1lwg2E00D038l1s06lwg1x; Thu, 16 Jan 2025 10:56:41 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.97)
 (envelope-from <geert@linux-m68k.org>) id 1tYMc5-0000000D3YR-0Gpj;
 Thu, 16 Jan 2025 10:56:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
 (envelope-from <geert@linux-m68k.org>) id 1tYMcA-00000004hpF-1JRC;
 Thu, 16 Jan 2025 10:56:38 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <dev@lankhorst.se>,
 Friedrich Vock <friedrich.vock@gmx.de>, Tejun Heo <tj@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH next] cgroup/rdma: Drop bogus PAGE_COUNTER select
Date: Thu, 16 Jan 2025 10:56:35 +0100
Message-ID: <b4d462f038a2f895f30ae759928397c8183f6f7e.1737020925.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When adding the Device memory controller (DMEM), "select PAGE_COUNTER"
was added to CGROUP_RDMA, presumably instead of CGROUP_DMEM.
While commit e33b51499a0a6bca ("cgroup/dmem: Select PAGE_COUNTER") added
the missing select to CGROUP_DMEM, the bogus select is still there.
Remove it.

Fixes: b168ed458ddecc17 ("kernel/cgroup: Add "dmem" memory accounting cgroup")
Closes: https://lore.kernel.org/CAMuHMdUmPfahsnZwx2iB5yfh8rjjW25LNcnYujNBgcKotUXBNg@mail.gmail.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Broken commit is in drm/drm-next
Partial fix is in drm-misc/for-linux-next

 init/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 61f50cafa8151ed2..bd7630e75207e8dc 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1128,7 +1128,6 @@ config CGROUP_PIDS
 
 config CGROUP_RDMA
 	bool "RDMA controller"
-	select PAGE_COUNTER
 	help
 	  Provides enforcement of RDMA resources defined by IB stack.
 	  It is fairly easy for consumers to exhaust RDMA resources, which
-- 
2.43.0

