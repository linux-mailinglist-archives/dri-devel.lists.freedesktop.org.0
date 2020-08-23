Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114FB24EF5D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 21:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D686E55E;
	Sun, 23 Aug 2020 19:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BE46E55E;
 Sun, 23 Aug 2020 19:09:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g75so6266435wme.4;
 Sun, 23 Aug 2020 12:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wQ+CnNuzNhRBq+zv3kVwnG0+uKFYAUvodng53ugnSig=;
 b=nPSPj5TthHlE1mdhBzN6g1SzM+oRRF26ni2J2rkJQMZ6QzTYEhvGMmGWUD1MxBRV6Y
 dlyNq6ZCRCLGJUUy8qulogWP7BzPRLleiAqk5VX536rSz7BXeiSrJclnAaQSiokBRJuX
 NMRU1CemThazOyZdpzyMR2VtktIyR6fQNtDLQkzG2c1+d1gPY508Rnc10Eok1HiLhd/e
 8ENkMYsldu89AvtyVCn3xGeHVQdYZOng5BvO/mDpyRSR1AQri8PT0jyILfWD0fJ4DNm+
 m4nyu5JdrLjFEGt6d7oL6qSE4uejuQ7hdRzO7lw74C0m4ySI+P98P0WfFwcRDZE1ZZMH
 uShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wQ+CnNuzNhRBq+zv3kVwnG0+uKFYAUvodng53ugnSig=;
 b=Z/YMFiR9WAaE35dnvj3tmcuGpZ/xPYGMN12BdyEhZfcvoQgeiuZjMrvw/ljHO1DEhJ
 l0vmdUwx1nCiuDOb/zXW/3N8QWyviJll7LGCRrhIAGUjw2c57a4uOMF+Se0uOX1sPnCs
 LMKTdLFme8ZxxsCw76w+s+xQFEahJBZvDpQLkUeh5Yp1t86SWQzcK6HI2t7QFyascp8k
 lfoQZEmdnumlHbA+xNd0I5D0uxHOehcWhsk5URKV20EtHau9ctzHDTDkP/fBB2IsCy3W
 EUMFbogI9aZTOynevYUMPDKispQq5qjG+sxmdfIbNIQ+vR41dGxnT2DiHIsuaQaPjlT1
 mbNQ==
X-Gm-Message-State: AOAM533se5e+8XpCJtK41K55iMWNd4hXodqd6T0wrdA6baOejBpWCjKw
 qcLD7z2v9C0HnpiLqeOW7r8=
X-Google-Smtp-Source: ABdhPJyMY0WTUtxfY5wI/V78Ldqxp3MbuqiBh5rA0eDmJ7njyqdnN7HZh47DPCP/z7RSpVjuRPEeMw==
X-Received: by 2002:a1c:544f:: with SMTP id p15mr2464254wmi.147.1598209768349; 
 Sun, 23 Aug 2020 12:09:28 -0700 (PDT)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id z66sm19704128wme.16.2020.08.23.12.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 12:09:27 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/etnaviv: fix external abort seen on GC600 rev 0x19
Date: Sun, 23 Aug 2020 21:09:22 +0200
Message-Id: <20200823190924.6437-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, josua.mayer@jm0.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like that this GPU core triggers an abort when
reading VIVS_HI_CHIP_PRODUCT_ID and/or VIVS_HI_CHIP_ECO_ID.

I looked at different versions of Vivante's kernel driver and did
not found anything about this issue or what feature flag can be
used. So go the simplest route and do not read these two registers
on the affected GPU core.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Reported-by: Josua Mayer <josua.mayer@jm0.eu>
Fixes: 815e45bbd4d3 ("drm/etnaviv: determine product, customer and eco id")
Cc: stable@vger.kernel.org
---
Changelog:

V2:
 - use correct register for conditional reads.

---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index d5a4cd85a0f6..c6404b8d067f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -337,9 +337,16 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 
 		gpu->identity.model = gpu_read(gpu, VIVS_HI_CHIP_MODEL);
 		gpu->identity.revision = gpu_read(gpu, VIVS_HI_CHIP_REV);
-		gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
 		gpu->identity.customer_id = gpu_read(gpu, VIVS_HI_CHIP_CUSTOMER_ID);
-		gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
+
+		/*
+		 * Reading these two registers on GC600 rev 0x19 result in a
+		 * unhandled fault: external abort on non-linefetch
+		 */
+		if (!etnaviv_is_model_rev(gpu, GC600, 0x19)) {
+			gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
+			gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
+		}
 
 		/*
 		 * !!!! HACK ALERT !!!!
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
