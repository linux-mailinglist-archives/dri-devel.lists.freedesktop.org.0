Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5990054B1E5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 15:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DBE10F802;
	Tue, 14 Jun 2022 13:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 667D810F802
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:04:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDC0B1650;
 Tue, 14 Jun 2022 06:04:50 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5FFC3F73B;
 Tue, 14 Jun 2022 06:04:49 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: liviu.dudau@arm.com
Subject: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
Date: Tue, 14 Jun 2022 14:04:37 +0100
Message-Id: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Arm Juno board EDK2 port has provided an EFI GOP display via HDLCD0
for some time now, which works nicely as an early framebuffer. However,
once the HDLCD driver probes and takes over the hardware, it should
take over the logical framebuffer as well, otherwise the now-defunct GOP
device hangs about and virtual console output inevitably disappears into
the wrong place most of the time.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index af59077a5481..a5d04884658b 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -331,6 +331,8 @@ static int hdlcd_drm_bind(struct device *dev)
 		goto err_vblank;
 	}
 
+	drm_fb_helper_remove_conflicting_framebuffers(NULL, "hdlcd", false);
+
 	drm_mode_config_reset(drm);
 	drm_kms_helper_poll_init(drm);
 
-- 
2.36.1.dirty

