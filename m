Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE83349F54B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1AA11239F;
	Fri, 28 Jan 2022 08:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE97111237F;
 Fri, 28 Jan 2022 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358978; x=1674894978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iO+haOX/HriPY5mGFnFrVkJP9AcE1VrjEmXI0QRiNEQ=;
 b=XPTuhxBTgImQrpY/yRYtJYf1A8Q/RR0lZSbCfei/SsVFHG+UDJtpjQjt
 BDMTy+Cw8nmjJAm+V6LGtvR8lMOAwXzWH5dB29GjWmSpBGJ9ELuFspjpk
 r39zvzcKTA0+WsDTEvwrwCu+YNMqBxZ5gN+NYZsPNBiqbwmUHzxI94iPf
 Y4D+lASC7VXGkph5tB3++rJcK45Om+3SfeLUKWpxNcdfd6TvZNYa0UBq0
 MpbCIJa52/D6EpQAwU8oOJnWG87LfC3MCB4oKTC2dFnGUHy0j6zIRvipC
 RNo4jaAOkFJs46stXtEInYDs4Hg0x1X5gp+wSZ8W6nUOqLIRBnvWGXwc0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="333430486"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="333430486"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788754"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/14] drm/nouveau: Replace dma-buf-map with iosys-map
Date: Fri, 28 Jan 2022 00:36:21 -0800
Message-Id: <20220128083626.3012259-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128083626.3012259-1-lucas.demarchi@intel.com>
References: <20220128083626.3012259-1-lucas.demarchi@intel.com>
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 srinivas.kandagatla@linaro.org, tzimmermann@suse.de,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

iosys-map is the new name for dma-buf-map and will gain new
capabitilities. Replace with the new API in nouveau.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 9416bee92141..ad0527bdaadf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -24,6 +24,8 @@
  *
  */
 
+#include <linux/iosys-map.h>
+
 #include <drm/drm_gem_ttm_helper.h>
 
 #include "nouveau_drv.h"
-- 
2.35.0

