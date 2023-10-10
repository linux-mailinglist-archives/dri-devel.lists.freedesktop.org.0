Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370007C41B9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 22:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6C910E3E4;
	Tue, 10 Oct 2023 20:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D56C710E3B1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 17:47:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9AE7C15;
 Tue, 10 Oct 2023 10:47:41 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com
 [10.1.197.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59DCB3F5A1;
 Tue, 10 Oct 2023 10:47:00 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/tiny: correctly print `struct resource *` on error
Date: Tue, 10 Oct 2023 18:46:52 +0100
Message-Id: <20231010174652.2439513-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Oct 2023 20:42:56 +0000
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
Cc: tzimmermann@suse.de, javierm@redhat.com, joey.gouly@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `res` variable is already a `struct resource *`, don't take the address of it.

Fixes incorrect output:

	simple-framebuffer 9e20dc000.framebuffer: [drm] *ERROR* could not acquire memory range [??? 0xffff4be88a387d00-0xfffffefffde0a240 flags 0x0]: -16

To be correct:

	simple-framebuffer 9e20dc000.framebuffer: [drm] *ERROR* could not acquire memory range [mem 0x9e20dc000-0x9e307bfff flags 0x200]: -16

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index ff86ba1ae1b8..8ea120eb8674 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -745,7 +745,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 
 		ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
 		if (ret) {
-			drm_err(dev, "could not acquire memory range %pr: %d\n", &res, ret);
+			drm_err(dev, "could not acquire memory range %pr: %d\n", res, ret);
 			return ERR_PTR(ret);
 		}
 
-- 
2.25.1

