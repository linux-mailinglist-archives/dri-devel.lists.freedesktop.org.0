Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11778B0CABC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 20:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A7310E2C6;
	Mon, 21 Jul 2025 18:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fkzwoKaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2886310E2C6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 18:57:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B68B144131;
 Mon, 21 Jul 2025 18:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF0DC4CEED;
 Mon, 21 Jul 2025 18:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753124249;
 bh=BhzF/8x7nIu8yKK8Fbml0CqlRTvMR2bpBiH6njen/gQ=;
 h=From:To:Cc:Subject:Date:From;
 b=fkzwoKaXLnW2fevV9ehM53EElfSr7LeO3MKRCqYE38Qp0EUrj3s5u+6ebA26frHRB
 eVH/iVPzPtQqER5FanWl+UdxKbdLIRcXkLjLX3aCOfgBwLz/iUIzJK47O0lIV2CaI/
 dIKkQdkaXj2eZG2T6/dyAFnei8W7ii8PzxDRITLBTj9zVrz8Y/o2mRF/MElGpHit62
 BsZRUzrVGavVtUNoJMpdQ8cI90hTcg2g2la5UO6jq1NtcLiTTNLaY76pEhYZutK8ry
 AbGM4iK3pknj5kSh07xYMyiD0tKpXYlhcj1xRp1TUh048yYe5P9WjXk4AfPJzyFo/s
 /Iw5Bkugy3sZA==
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
Subject: [PATCH v4 0/1] Move `boot_display` from PCI to DRM
Date: Mon, 21 Jul 2025 13:57:25 -0500
Message-ID: <20250721185726.1264909-1-superm1@kernel.org>
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

Shortly after the series for introducing boot_display was merged
Manivannan Sadhasivam suggested that it's better not to introduce
new top level PCI attributes where possible.

He proposed that the boot_display attribute should be provided by DRM
instead and that userspace should look for that.

Change the owner of `boot_display` from the PCI device to the DRM card.
This should also have the side effect that non-PCI DRM drivers can
add support more easily.

NOTE: If acceptable this should be merged through the PCI tree as it
depends upon changes and symbols from the boot_display series.

Mario Limonciello (1):
  PCI: Move boot display attribute to drm

 Documentation/ABI/testing/sysfs-bus-pci |  9 -----
 drivers/gpu/drm/drm_sysfs.c             | 41 ++++++++++++++++++++++
 drivers/pci/pci-sysfs.c                 | 45 -------------------------
 3 files changed, 41 insertions(+), 54 deletions(-)


base-commit: c4f2dc1e5293c4383844d8161d9922adda534e7c
-- 
2.43.0

