Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA372E2162
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 21:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DE489EF7;
	Wed, 23 Dec 2020 20:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F0D89E26
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:35:37 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.194]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MYvoW-1kWEA136Ui-00Ut0Z; Wed, 23 Dec 2020 21:35:33 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH V2 1/4] drm/v3d: Use platform_get_irq_optional() to get
 optional IRQs
Date: Wed, 23 Dec 2020 21:35:11 +0100
Message-Id: <1608755714-18233-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608755714-18233-1-git-send-email-stefan.wahren@i2se.com>
References: <1608755714-18233-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:9nzyeCNrBl4880VD0YJLFgLNLN0yf1j5e9cyw4Bgg58zb9H9gt2
 TeOsVSK5gNMg5PVW72r+H4LhoU45tVt2+I03vfvJthQDCd35EMOjcN+W7TEqQ9addvV+BTP
 DoVBbybbRGaA6qINDSZSCRtvordI+Eg01u7H/12Mn1vvHbdBjyJkWT07Aah6HzT2jtp+fQq
 aO2wM+LCLLA/ZiYlpwAoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LhXh78ok1wk=:mLpuf/aIcU65/IR5dM8XXg
 pCMlEitzg8jrk5tNty6S/tODDdcqUmhvhBKMTqniMewpBA2CDpQxM7+muu0LscwgooVB5bP73
 VIW2ugVvulXAAncy5VyVHi6b8HYbQG5tWjxZ28x/fs83qJwCD6s6WxSxm8bGOmITfZOoRVeWO
 tB9/uFCZNjnfXi7nta2fYfWHluaSqXcqQAYkR3YzHB0GKa0AWtPn10M7vFhgGKBuVzUFDdNsu
 4KU+ExkuxlU9UP+7mBTixLF/D0B00Fe6peKATLzLCW9Vlg93YkwTpcrMDdpJeJtfHWTY0rw/d
 VMuu0kSTxyk4bIYOEr/lw0MOsQa1korwhFsnn8v5ZzRqpSBdVSRKFYFh8vzaqe3EMMJ30RVxc
 Zlz7a1xgZ38wU2Hif0sMO7aC98+Q6tAWkkwCB31kaGSWQ+thOD41ibCOGfGmmi7oD/+qMMfbJ
 lmPKdHr6VQ==
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Aside from being more correct, the non optional version of the function
prints an error when failing to find the IRQ.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
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
