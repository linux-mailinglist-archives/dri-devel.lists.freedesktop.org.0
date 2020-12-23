Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31172E216C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 21:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17356E894;
	Wed, 23 Dec 2020 20:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0436D89EF7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:37:02 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.194]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MRmo8-1kTS3U0i30-00TCnc; Wed, 23 Dec 2020 21:27:54 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 3/4] drm/v3d: Don't clear MMU control bits on exception
Date: Wed, 23 Dec 2020 21:27:24 +0100
Message-Id: <1608755245-18069-4-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
References: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:0tOEdDp6fR0bZbqYWT127G8PNcCAxolyfkayHeulx2DS57jbIDQ
 XlgCEGoOcHZIlmdGZG19UAOC3Q5kKIAhbXO8PxpaqyQwJzvnjDa5DG34KzCDO/LWNboNs8o
 45M4mEJ3jiN/nOzDUKkiewC/zJ7Jv9vcrxAWL5UN4L9GDbhqY37XCKp02eQ6Tq3HeWdflqw
 r4e61G4wyZpYGuPvX0pWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8hey41wj3hA=:0ABkvrN8Sne3osctNhuVMi
 TwgG5unABreBslKwOtIbBUKTHh/gj6+bq4aqIHNOjxprTXx4psldci2rvajNMAjdzFMxYhV9I
 jS/7icG2durygwaADCcLSPLpZtIuG/qSXJQenNaZYM4uPvQO4zau2JDjNrxo0I987EwB3ie9K
 nRpHvVF7TUOxRezTIwQyR1CW46+RaOAfqAOGDI7+tDNDxAWLCxETz5UbCGZFme7WWBYn44mIb
 R7aIhWX41EeqikVuoZhyHqvkSpqaUsqYiyP/FN1gi2KpWTF3FLQnkkcGYyr01nxORYFKtZkx1
 CQPjdMG3QZEk3KaIymI3nc1bgHpSC3+/UZHBozla7Fng0gBiy3JfBDtjFWirpQV5rK8OIZM1p
 5pbBsKREiDQQl0PNmYGrIb47RJGXRePXuohXEiL5PDz2rv6tfdIPy/jV62sYuPEqWc27iQe5N
 vWK2u4tYJA==
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
Cc: devicetree@vger.kernel.org, Phil Elwell <phil@raspberrypi.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Phil Elwell <phil@raspberrypi.org>

MMU exception conditions are reported in the V3D_MMU_CTRL register as
write-1-to-clear (W1C) bits. The MMU interrupt handling code clears any
exceptions, but does so by masking out any other bits and writing the
result back. There are some important control bits in that register,
including MMU_ENABLE, so a safer approach is to simply write back the
value just read unaltered.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 drivers/gpu/drm/v3d/v3d_irq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 0be2eb7..e714d53 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -178,10 +178,7 @@ v3d_hub_irq(int irq, void *arg)
 		};
 		const char *client = "?";
 
-		V3D_WRITE(V3D_MMU_CTL,
-			  V3D_READ(V3D_MMU_CTL) & (V3D_MMU_CTL_CAP_EXCEEDED |
-						   V3D_MMU_CTL_PT_INVALID |
-						   V3D_MMU_CTL_WRITE_VIOLATION));
+		V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL));
 
 		if (v3d->ver >= 41) {
 			axi_id = axi_id >> 5;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
