Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0E999D268
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 17:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE0610E477;
	Mon, 14 Oct 2024 15:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t1zaARpt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A9310E477
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 15:25:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 96CDFA41A81;
 Mon, 14 Oct 2024 15:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC87C4CEC3;
 Mon, 14 Oct 2024 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728919516;
 bh=hS0sb+6oNOgPc3WYv1Lobl2azHFyEHVXBQuVnWLPR4Q=;
 h=From:To:Cc:Subject:Date:From;
 b=t1zaARptC5NRLY/+fKGIXj9iAHaQQz/c4v/7SJqxoqub1Zgp1RR+kTOafxwsQ0xHU
 yCL4yR9N/zz4snk7z6MZETr/0kSCfiTj5Rorh9XKifRNcE8CahiRnp1W9EJUMg2z3m
 7+XCDjifVXzyLI6fuYxBT3bCbf/GaqyGCPf2gcMrUhfAoX5f0IgRSo+0Ee+F4XJJHt
 7PoUcRgzUNiBZESfOPCcMq8bpxvSzKBcYzinE0/Nbod8AYA5GT1NylZ+hlenHiscku
 /DldY+fZYSyfIzdawFiHHgMIc0jBY2AZJfWLkwMms87F07s6do6lYeCrkY66BdClJ3
 DA/FeU0W/0SgA==
From: Mario Limonciello <superm1@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 linux-kernel@vger.kernel.org (open list), dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Luke D . Jones" <luke@ljones.dev>
Subject: [PATCH] PCI/VGA: Don't assume only VGA device found is the boot VGA
 device
Date: Mon, 14 Oct 2024 10:25:02 -0500
Message-ID: <20241014152502.1477809-1-superm1@kernel.org>
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

From: Mario Limonciello <mario.limonciello@amd.com>

The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display device.

```
65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeForce RTX 4070 Max-Q / Mobile] (rev a1)
66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Strix [Radeon 880M / 890M] (rev c1)
```

The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU as the
boot VGA device, but really the eDP is connected to the AMD PCI display
device.

Drop this case to avoid marking the NVIDIA dGPU as the boot VGA device.

Suggested-by: Alex Deucher <alexander.deucher@amd.com>
Reported-by: Luke D. Jones <luke@ljones.dev>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pci/vgaarb.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 78748e8d2dba..05ac2b672d4b 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
 		return true;
 	}
 
-	/*
-	 * Vgadev has neither IO nor MEM enabled.  If we haven't found any
-	 * other VGA devices, it is the best candidate so far.
-	 */
-	if (!boot_vga)
-		return true;
-
 	return false;
 }
 
-- 
2.43.0

