Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FB4562380
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532FE12AED5;
	Thu, 30 Jun 2022 19:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7533212AEDB;
 Thu, 30 Jun 2022 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656618681; x=1688154681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IOsqNAPdvxxmapBj6P4re73SuHAYHc+8ZAPR3O4fu8Q=;
 b=Hw6GrUcVMepAlLJQXPA1DLmFBPlJxhgoyf/qxpBCEe1/9eXFAbWVULui
 bv2yPLlUDVvs4R4GcZ2WXPRF5dhCqRY8vS1utfW5miskyxPTpN3hPg8yB
 6L95pgBVTlzXr+eox9xVvd5fO3L58AueIArRqrbaIc/dVmTvsw06t/JaT
 kInnwrLYv5eflOXzxvBwAXjqAj11x6z41g9Ok9ar7FMDW87+JGvarDb4G
 TzaNR3j+0r4BluK9FnGhBK0FzZViPAXgeiG/D2Y//cLE+wxpUbNTqP1Xb
 RQhhinp41rIKfstsJPld7RxnODO5wqFEGK/SrPswO3dIwrRdOiT29MZq1 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="262251818"
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="262251818"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 12:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; d="scan'208";a="681110587"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.161])
 by FMSMGA003.fm.intel.com with SMTP; 30 Jun 2022 12:51:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 30 Jun 2022 22:51:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/vmwgfx: Stop using 'TRUE'
Date: Thu, 30 Jun 2022 22:51:11 +0300
Message-Id: <20220630195114.17407-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630195114.17407-1-ville.syrjala@linux.intel.com>
References: <20220630195114.17407-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jani Nikula <jani.nikula@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Stop using the 'TRUE' define. This ultimately gets defined by
acpi/actypes.h that gets included here via a convoluted chain of
other headers. drm_crtc.h is part of that chain, and I'm trying
to eliminate all unnecessary includes from it to avoid pointless
rebuilds.

v2: Split out from the bigger patch

Cc: Zack Rusin <zackr@vmware.com>
Cc: VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 693028c31b6b..ff2f735bbe7a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -252,7 +252,7 @@ static void vmw_cursor_update_position(struct vmw_private *dev_priv,
 		vmw_write(dev_priv, SVGA_REG_CURSOR4_Y, y);
 		vmw_write(dev_priv, SVGA_REG_CURSOR4_SCREEN_ID, SVGA3D_INVALID_ID);
 		vmw_write(dev_priv, SVGA_REG_CURSOR4_ON, svga_cursor_on);
-		vmw_write(dev_priv, SVGA_REG_CURSOR4_SUBMIT, TRUE);
+		vmw_write(dev_priv, SVGA_REG_CURSOR4_SUBMIT, 1);
 	} else if (vmw_is_cursor_bypass3_enabled(dev_priv)) {
 		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_ON, svga_cursor_on);
 		vmw_fifo_mem_write(dev_priv, SVGA_FIFO_CURSOR_X, x);
-- 
2.35.1

