Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44853697347
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 02:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D2310EA06;
	Wed, 15 Feb 2023 01:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 583 seconds by postgrey-1.36 at gabe;
 Wed, 15 Feb 2023 01:14:42 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEC510E9FE;
 Wed, 15 Feb 2023 01:14:42 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
 s=mail; t=1676423095;
 bh=hz5rOKe4VQZ+XqCbUIp+iT5/yaFWTSJ1mdEhNn7uads=;
 h=From:Date:Subject:To:Cc:From;
 b=j6e7xz8esZrFyyqzp3YqfrorvfVq8/wTJDFHOUD0Suq0QHI4osk4+DahvrTf8p/Z8
 W07PTnwHAqI8x41QPYN2jfhbHpY88B28S2uvT/Z5sAJac4AvRY+kMLMqBJFc5yjaT7
 fx1mIWrIUaJx1Tz2b/qqf701zgU77z7htmo8lMFI=
Date: Wed, 15 Feb 2023 01:04:53 +0000
Subject: [PATCH] drm/nouveau/led: explicitly include linux/leds.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230215-power_supply-leds-nouveau-v1-1-ea93bfa0ba7e@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIALQv7GMC/x2NUQqDMBAFryL73YUYlZJepRRJdFMDIQlZYivi3
 bv0cx7MmxOYaiCGR3dCpT1wyEmgv3WwbDa9CcMqDFrpQel+wpI/VGdupcQDI62MKbedbEPvR2M
 mZ9XdjCC+s0zoqk3LJg+pxShjqeTD9x98vq7rB/pdBq+AAAAA
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676423093; l=915;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=hz5rOKe4VQZ+XqCbUIp+iT5/yaFWTSJ1mdEhNn7uads=;
 b=9FEUcn2LW1P/EFojrrV42QmouWuH9qjp5h4UOsPwsruYNHccXUQxgp1tOxCvKWLMsfmArNRdC
 tKbpEdcdZLmDgi5Dxk5sefW/gNBb0Ed3jLUArnwxhx91ZreOyDHwbc6
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of relying on an accidental, transitive inclusion of linux/leds.h
use it directly.

Also drop the forware definition of struct led_classdev that is now
provided by linux/leds.h.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/nouveau/nouveau_led.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_led.h b/drivers/gpu/drm/nouveau/nouveau_led.h
index 21a5775028cc..bc9bc7208da3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_led.h
+++ b/drivers/gpu/drm/nouveau/nouveau_led.h
@@ -27,7 +27,7 @@
 
 #include "nouveau_drv.h"
 
-struct led_classdev;
+#include <linux/leds.h>
 
 struct nouveau_led {
 	struct drm_device *dev;

---
base-commit: e1c04510f521e853019afeca2a5991a5ef8d6a5b
change-id: 20230215-power_supply-leds-nouveau-ff4995ba0794

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

