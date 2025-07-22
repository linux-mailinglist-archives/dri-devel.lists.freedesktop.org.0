Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE4DB0D0CE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 06:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6301A10E5E1;
	Tue, 22 Jul 2025 04:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NJ8yVbhm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDE210E5E1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 04:10:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E715601FE;
 Tue, 22 Jul 2025 04:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7038C4CEF1;
 Tue, 22 Jul 2025 04:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753157456;
 bh=FH7yks64NF643MaNnJLEAGnr3ziSpbc76lbP3ZXYW1M=;
 h=From:To:Cc:Subject:Date:From;
 b=NJ8yVbhmwkYdTSvohJFHgXSfMVdYq8MKiRO6iJTgorH4zcdSgIX+1fblApJOPT+pL
 qH/lMGjO4kpCxjjGngKUpCaTTfYnvXucTeNInjG013K7t/e3age9IGaBVqT/IZDuSB
 PCDM/KQKlMbVq/+ckotEdJ2XTwnyaPg2vjffFJ1tO8NeZzmYQZLGBD/c/eJ70dOF6J
 gEPx05Mu5FgkjOkyP6SJXQj0J7k1v2JP5h7N4iAIzS206RdwM8i6nPqkXDUfCqA8w6
 9DjIA5HAdLE2bn7WMzY9zsVxFsADgT60mgARn+POvyeDn8FYdw/nsY0ZUOVEjEXRfS
 TBgTBK6wcnMHg==
From: Mario Limonciello <superm1@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v5 0/2] Alternative approach for boot_display visibility
Date: Mon, 21 Jul 2025 23:10:49 -0500
Message-ID: <20250722041051.3354121-1-superm1@kernel.org>
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

The past few days there have been various discussions about what to do
with the boot_display sysfs file so that it doesn't need to be made so
late in startup.

Bjorn had an aha moment pointing out that there is no reason to "find"
the PCI device using screen_info_pci_dev() because the device is already
known.  Instead we just need to check if it has the screen resources.

This series adjusts the boot_display behavior to use that and then convert
boot_display into a static sysfs file that can be loaded when the device
is created without needing to change visibility.

This is an ALTERNATIVE to moving it to DRM, which is what v4 does [1].
Either solution can be picked up depending upon the collective decision
whether to keep boot_display file in PCI core or DRM core.

Link: https://lore.kernel.org/linux-pci/20250721185726.1264909-1-superm1@kernel.org/T/#me4356b3a172cbdafe83393bedce10f17a86e0da7

Mario Limonciello (2):
  fbcon: Stop using screen_info_pci_dev()
  PCI: Adjust visibility of boot_display attribute instead of creation

 arch/x86/video/video-common.c | 12 ++++++--
 drivers/pci/pci-sysfs.c       | 58 ++++++++++++-----------------------
 2 files changed, 30 insertions(+), 40 deletions(-)

-- 
2.48.1

