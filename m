Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E9BA4E0CF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3152B10E5F1;
	Tue,  4 Mar 2025 14:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EjG16xKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190EE10E602
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:27:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8F44BA45615;
 Tue,  4 Mar 2025 14:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80CCC4CEE5;
 Tue,  4 Mar 2025 14:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741098436;
 bh=2Au5twRhQNpRl3N3lvaKrD+Ua/A/kyLQZmS2YDyTLdw=;
 h=From:To:Cc:Subject:Date:From;
 b=EjG16xKn/AtxzKmrjZqFjYiTeT+NW1IrqUNWbmmj5F9aiEttvCAs7ZflsW94exvRP
 OvBxc7Nuwmd6AKeP35DIIVZGnN+kUTZDP+txloWvPinT7WOdwK/aMJ4v8H3X4zNveJ
 5XR4ghZMQunpy/7CPsuMkVLM89dTrvuI+36HQ5lMAbhaLKd92il9joVMsTZMeO/Awp
 z0v388Y1QD1IezObGWxCekSXEKtStXDDV4mGUsqON43FA/A2LXDYp7otz1uQiPwQIm
 FmA0IOZM0MFveO8iduOODA9LIdr9kccea4MWHrFFxiVfgp9jOKl/o811jLGh2Aslht
 y1Up8kdrAFavA==
From: Arnd Bergmann <arnd@kernel.org>
To: Aun-Ali Zaidi <admin@kodeit.net>, Aditya Garg <gargaditya08@live.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Atharva Tiwari <evepolonium@gmail.com>,
 Kerem Karabay <kekrby@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tiny: fix printk format string for 32-bit
Date: Tue,  4 Mar 2025 15:27:02 +0100
Message-Id: <20250304142711.621330-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

A size_t must be printed with the %z modifier instead of %l:

In file included from include/linux/device.h:15,
                 from include/linux/usb.h:19,
                 from drivers/gpu/drm/tiny/appletbdrm.c:19:
drivers/gpu/drm/tiny/appletbdrm.c: In function 'appletbdrm_send_request':
include/drm/drm_print.h:589:54: error: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
drivers/gpu/drm/tiny/appletbdrm.c:170:17: note: in expansion of macro 'drm_err'
  170 |                 drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
      |                 ^~~~~~~
drivers/gpu/drm/tiny/appletbdrm.c: In function 'appletbdrm_read_response':
include/drm/drm_print.h:589:54: error: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
drivers/gpu/drm/tiny/appletbdrm.c:211:17: note: in expansion of macro 'drm_err'
  211 |                 drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
      |                 ^~~~~~~

Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Macs")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tiny/appletbdrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
index f5d177e234e4..394c8f9bd41a 100644
--- a/drivers/gpu/drm/tiny/appletbdrm.c
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -167,7 +167,7 @@ static int appletbdrm_send_request(struct appletbdrm_device *adev,
 	}
 
 	if (actual_size != size) {
-		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%zu)\n",
 			actual_size, size);
 		return -EIO;
 	}
@@ -208,7 +208,7 @@ static int appletbdrm_read_response(struct appletbdrm_device *adev,
 	}
 
 	if (actual_size != size) {
-		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%zu)\n",
 			actual_size, size);
 		return -EBADMSG;
 	}
-- 
2.39.5

