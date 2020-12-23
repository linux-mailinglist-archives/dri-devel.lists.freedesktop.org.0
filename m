Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA62E2168
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 21:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7905F89E26;
	Wed, 23 Dec 2020 20:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 542 seconds by postgrey-1.36 at gabe;
 Wed, 23 Dec 2020 20:37:01 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3A589E26
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:37:01 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.194]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N6svJ-1jzMda1QVT-018INl; Wed, 23 Dec 2020 21:27:53 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 1/4] drm/v3d: Use platform_get_irq_optional() to get optional
 IRQs
Date: Wed, 23 Dec 2020 21:27:22 +0100
Message-Id: <1608755245-18069-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
References: <1608755245-18069-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:UmY82BR7rIwpmorUyFeWjROyE6WY47qOwlB8r+JVH4RCPmQCUcf
 /JAGJRQ1tV8xmoYrFUuafXTqdVrjQ9cCxvPb4ZSUL/Mq42AN8lqRPE4Sx65leZXNTl+2pbu
 QQmcwUxOscziTZqGaYEjMAodD1vdQ6GbqkTIBJKxxQGAzh55CkCcFgPE9TsM90GsXXxo0KW
 SehPGRQ+7K4fvJFfyJReg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:24XSKgx8VDU=:cLAAdMmC1H5YB4vOqbohi3
 w3emJHW6Y+fx7wbmlJibE+NKfp+P3DfebOpDnLKZu4Mnw0T3wytVzofkZxmyqVqbWb71TymLR
 VwK7GMAMo0h5sXgtan9FhYHV/MHS7MqdeZTry69Ixi1BNLu03GUaqy1hXMe+2xhnh60aGKcSm
 jiJ8F5rZJ2mpNTwbspYvXAE0BzkisDhnwRDY1KzFFYfkqpENh1IMfVIM8ooKtX6c/zwv6T5ng
 Rg2StjtvjF+TB8EIsAFCX15riS2tj9+HtzqPP/49AaYCq7BYo/UkSRv3X1Xv0p85QXVZwzmah
 bvhRcgkZpt2mO3K8WROg5nL5mhYjTHl8DimRl6TVot0X5JUS9Erw6+9E1AX+72p8NatRYb3ik
 QVt70AxCn1m8eHBGsEgkgm1rujbisTy6Ksv9ZhcpuwPQKAhXi3ta3yuiGrsWgvsp+C8ANIMP1
 T4hIazfesw==
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Aside from being more correct, the non optional version of the function
prints an error when failing to find the IRQ.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/gpu/drm/v3d/v3d_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index c886864..0be2eb7 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -217,7 +217,7 @@ v3d_irq_init(struct v3d_dev *v3d)
 		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS);
 	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS);
 
-	irq1 = platform_get_irq(v3d_to_pdev(v3d), 1);
+	irq1 = platform_get_irq_optional(v3d_to_pdev(v3d), 1);
 	if (irq1 == -EPROBE_DEFER)
 		return irq1;
 	if (irq1 > 0) {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
