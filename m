Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2658A9182A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 11:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C8B10EA7F;
	Thu, 17 Apr 2025 09:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="umGet/Ui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E2C10E1A3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 09:40:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EBAE9A4B282;
 Thu, 17 Apr 2025 09:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE450C4CEE4;
 Thu, 17 Apr 2025 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744882829;
 bh=xVWJwK7dduWtiwYoiIb/scMBtR0de7McYRps8TtEQ2U=;
 h=From:To:Cc:Subject:Date:From;
 b=umGet/Ui/9PCBXwRwBEw3wqvFN7JZ2eo/gJ2V5LztwFpWtvOgNB4TggLi9KntCeBJ
 zY9q2n9mBB2T3zkyyYIiAlQRxEelNXG6FzyvinLU0d1He9TxH/mqGJejF18KkiWaCw
 8tWUlsNswGJ55H10KDYBoZCBaatBvXZjR/IFkcpxRLkZSPrKy9zL/KjSVNfHzx2JSZ
 DHgJ08nhH5rz2nGLCSAQqAF/e8iY9x8bKPM7lXs1hiAShKaAuV7vU95AWYWXuWkJKI
 b82wmIP6EBKZ0KDWH9/V5qlNe07HXdXgKmEMsXMUoMsCgf78B/XyLYl2lKa7DLavBk
 DmPVeXcM1g2Zw==
From: Philipp Stanner <phasta@kernel.org>
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Arnd Bergmann <arnd@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Philipp Stanner <phasta@kernel.org>
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/cirrus: Use non-hybrid PCI devres API
Date: Thu, 17 Apr 2025 11:40:10 +0200
Message-ID: <20250417094009.29297-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
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

cirrus enables its PCI device with pcim_enable_device(). This,
implicitly, switches the function pci_request_regions() into managed
mode, where it becomes a devres function.

The PCI subsystem wants to remove this hybrid nature from its
interfaces. To do so, users of the aforementioned combination of
functions must be ported to non-hybrid functions.

Replace the call to sometimes-managed pci_request_regions() with one to
the always-managed pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/tiny/cirrus-qemu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/cirrus-qemu.c b/drivers/gpu/drm/tiny/cirrus-qemu.c
index 52ec1e4ea9e5..1ff678e26aa1 100644
--- a/drivers/gpu/drm/tiny/cirrus-qemu.c
+++ b/drivers/gpu/drm/tiny/cirrus-qemu.c
@@ -681,7 +681,7 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	ret = pci_request_regions(pdev, DRIVER_NAME);
+	ret = pcim_request_all_regions(pdev, DRIVER_NAME);
 	if (ret)
 		return ret;
 
-- 
2.48.1

