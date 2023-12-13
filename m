Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0253810DB2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 10:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5241B10E730;
	Wed, 13 Dec 2023 09:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F3910E730
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 09:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702461036; x=1733997036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WSNjhf6+NOvKNhbkz0t8UQYThMGcCwC7Ahj7dZyAh5k=;
 b=l1nNiEFj3yCKu/dlzLsegeYtLt/DHMCtH2489IB5n7ffAZNbceBtSIjW
 piiVXDrr/noCnCekJwilzY/WZFBm42Q5KQa8cPEwtuRH3eZiJumdXRQ1+
 4Iy1kHucNa6+9g019pFr5Wt7BjRMtQ21dP+72z2D2uz/9nyNVrpnb7m6e
 TlkUIdhEX0Opi1RcJpzwr1Z8GVbxpqwfHfKdpzl5if11Rk7FojU7bfm7g
 O1+Y7BRaC7LO9AJV/UbSN2dQiKc3pMXlsuS0om4G872LcjZzJoViIYBl9
 P4UjddevkfzEe4tSQZulNua1NdvuL7c8pG25lfniE7fawdIbGSOKa7ac1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="375093398"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="375093398"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 01:50:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="808095897"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; d="scan'208";a="808095897"
Received: from oostoia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.15])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 01:50:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ASoC: hdmi-codec: drop drm/drm_edid.h include
Date: Wed, 13 Dec 2023 11:50:23 +0200
Message-Id: <20231213095023.3928703-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212143038.3828691-1-jani.nikula@intel.com>
References: <20231212143038.3828691-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: linux-arm-msm@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hdmi-codec.h does not appear to directly need drm/drm_edid.h for
anything. Remove it.

There are some files that get drm/edid.h by proxy; include it where
needed.

v2: Fix build (kernel test robot <lkp@intel.com>)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

I'm pretty sure I haven't compiled everything that might implicitly
depend on the include. However, the right thing to do is to include
drm_edid.h where needed, not from somewhat random intermediate
headers. I hope this uncovers anything I missed.
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 1 +
 include/sound/hdmi-codec.h          | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1b88fb52726f..766c8d01e6b3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -11,6 +11,7 @@
 #include <linux/of_irq.h>
 #include <linux/delay.h>
 #include <drm/display/drm_dp_aux_bus.h>
+#include <drm/drm_edid.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 25c9c71256d3..d35d8a531cfc 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -35,6 +35,7 @@
 #include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 9b162ac1e08e..5e1a9eafd10f 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -12,7 +12,6 @@
 
 #include <linux/of_graph.h>
 #include <linux/hdmi.h>
-#include <drm/drm_edid.h>
 #include <sound/asoundef.h>
 #include <sound/soc.h>
 #include <uapi/sound/asound.h>
-- 
2.39.2

