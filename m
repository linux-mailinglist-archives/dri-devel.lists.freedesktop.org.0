Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A2BB0774A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 15:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0634810E7C4;
	Wed, 16 Jul 2025 13:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KAo5FcRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5486510E7C4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 13:47:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D65F15C54B9;
 Wed, 16 Jul 2025 13:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2563FC4CEF4;
 Wed, 16 Jul 2025 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752673659;
 bh=N/5vs2O/O/RBR2chqPpw/Dxeb040MtYLeUEhMQ9qX5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KAo5FcRN3PXz9NMNZbBrnh5FsWvEZAldcGzxToXaPCn9L6QZ1G2PxLG1TtSbFXbD+
 UCO91ePfKzLoJS6NAPQelNjTppFvVUpX14k19rb7VUlHKFufBDBg59xFG/kbL01O/c
 bvf3EIbrQfFOjM911H5/xI6MK6hSDm+BiJmFlto/wAPgGAnXI6//3Cb4HHILwc5EcC
 qvcilSKvD5kefx3BaY6EI3g72PRLRi/QKW6iQHt4geq4m+noGkFtc8yZp+jwyZIQC6
 bqafS29hdEf1WK0HVBn1wfigpzm8PvmAx2tDNsuW9hEOBhvNrv2MRgGmnT3A+VDMeT
 J9wzrSTL6uL3w==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michael Walle <mwalle@kernel.org>
Subject: [RFC PATCH 2/3] drm/imagination: fix clock control on the J722S
Date: Wed, 16 Jul 2025 15:47:16 +0200
Message-Id: <20250716134717.4085567-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716134717.4085567-1-mwalle@kernel.org>
References: <20250716134717.4085567-1-mwalle@kernel.org>
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

The J722S won't let you set the clock frequency if there is no device
using it. Thus, the assigned-clocks property won't work per se.

As a workaround, set the clock again during the probing of the driver.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/imagination/pvr_device.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8b9ba4983c4c..e7a7cc1bdf93 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -16,6 +16,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/clk/clk-conf.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
 #include <linux/dma-mapping.h>
@@ -641,6 +642,14 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
+	/* Set any 'assigned-clocks' properties again. This is a workaround for
+	 * the clock handling on k3 platforms. There, one cannot set the clock
+	 * frequency until there is at least one (enabled) user if it.
+	 */
+	err = of_clk_set_defaults(drm_dev->dev->of_node, true);
+	if (err)
+		return err;
+
 	/* Map the control registers into memory. */
 	err = pvr_device_reg_init(pvr_dev);
 	if (err)
-- 
2.39.5

