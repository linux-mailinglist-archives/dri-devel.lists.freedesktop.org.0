Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F0567D1D4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 17:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A3910E948;
	Thu, 26 Jan 2023 16:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E7710E948
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 16:38:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8450A618CF;
 Thu, 26 Jan 2023 16:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB66FC433D2;
 Thu, 26 Jan 2023 16:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674751097;
 bh=6qtgNxbECemucjlcZnysho52hl61i0+xb+1L04Nx6II=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GDHMo0oZscx3hvSa024f66iPJ8KgOweUrlORbRbz4kuAV3jGG03zI0+Rh7a9uh2eK
 2snSerZvJ/fwoQTAP1ZIkxcXe67XQc10Ba4YA3WjK/zdncb8TuMTTtzkK1gcCfr7BN
 GXcUX5N/xLoi/tCDUAD7/8W7bcxaL7OPD2XuJkNyMaI/c1nPYSuFyG4nanzJLgxJyk
 R03PHKS/sF1Yq2GLeCRE1XCI5YlVJrmRJqQWkkDj78WxWAzwtWDTmC7wSqhuiYnYv7
 acpJD2iIggHlvEUWeXbeEvK2GBMMT50jJ8VNvAF/reJaU2Eg2m8RRIdpKnzSpLF64h
 1w/ob8zWBSKqw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 2/2] accel/ivpu: avoid duplciate assignment
Date: Thu, 26 Jan 2023 17:37:55 +0100
Message-Id: <20230126163804.3648051-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126163804.3648051-1-arnd@kernel.org>
References: <20230126163804.3648051-1-arnd@kernel.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

With extra warnings enabled, gcc warns about two assignments
of the same .mmap callback:

In file included from drivers/accel/ivpu/ivpu_drv.c:10:
include/drm/drm_accel.h:31:27: error: initialized field overwritten [-Werror=override-init]
   31 |         .mmap           = drm_gem_mmap
      |                           ^~~~~~~~~~~~
drivers/accel/ivpu/ivpu_drv.c:360:9: note: in expansion of macro 'DRM_ACCEL_FOPS'
  360 |         DRM_ACCEL_FOPS,
      |         ^~~~~~~~~~~~~~

Remove the unused local assignment.

Fixes: 20709aa9435b ("accel: Add .mmap to DRM_ACCEL_FOPS")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/accel/ivpu/ivpu_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 2bc2f1b90671..a29e8ee0dce6 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -356,7 +356,6 @@ int ivpu_shutdown(struct ivpu_device *vdev)
 
 static const struct file_operations ivpu_fops = {
 	.owner		= THIS_MODULE,
-	.mmap           = drm_gem_mmap,
 	DRM_ACCEL_FOPS,
 };
 
-- 
2.39.0

