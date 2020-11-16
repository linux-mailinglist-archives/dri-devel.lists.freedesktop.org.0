Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738602B4E79
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72966E043;
	Mon, 16 Nov 2020 17:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838606EA11
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:53:14 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFCC12227F;
 Mon, 16 Nov 2020 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549194;
 bh=bQ2MzMKcYQ+8bK//MFkMkC019hY2+gnZ279dUo0eK84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cT7WLPG3HS1njwwx9F5NI4hMdviPiBZWNzlu0oO5ZlOgHGgIFR3b4z+uYtjX7TQr5
 yX7vYzzqdF2hI4f2j9bxnqY1q695DgIbRUEkhLMzrDmBU/ZGhS020QKu4YErQZTV08
 tHBxy0UZ2Gji+2Q2rt8oXM3Ft4f06NKMzaPqaPSE=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/ingenic: depend on COMMON_CLK to fix compile tests
Date: Mon, 16 Nov 2020 18:53:01 +0100
Message-Id: <20201116175301.402787-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116175301.402787-1-krzk@kernel.org>
References: <20201116175301.402787-1-krzk@kernel.org>
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Ingenic DRM uses Common Clock Framework thus it cannot be built on
platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: drivers/gpu/drm/ingenic/ingenic-drm-drv.o: in function `ingenic_drm_bind.isra.0':
    ingenic-drm-drv.c:(.text+0x1600): undefined reference to `clk_get_parent'
    /usr/bin/mips-linux-gnu-ld: ingenic-drm-drv.c:(.text+0x16b0): undefined reference to `clk_get_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpu/drm/ingenic/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 477d5387e43e..3b57f8be007c 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -4,6 +4,7 @@ config DRM_INGENIC
 	depends on DRM
 	depends on CMA
 	depends on OF
+	depends on COMMON_CLK
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
