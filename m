Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B7A80EED4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 15:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D8A10E624;
	Tue, 12 Dec 2023 14:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D846B10E624
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702391445; x=1733927445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oUXerigmotIr1wxntYZB0APPtlcZnfypHtwiorKtwRY=;
 b=EG2/NncoBpC51c3WNEO3lldjyOOzPD6b6YhjrxcFg+hZRXukQw5yCE5Q
 LvVEG+mYWfN2iBV9UvO+BXdWro7+AtaeVYS88IBewxL6/lNMNqXbA+w6e
 MmwTFd76/iqx7MlRc9tA7kw/eIPjgeLDRIS7K292WSrNwSzMoaNllZXM4
 +rIClvs95tMZB/G+BGO7zCcK7jT0S7YOk576LX/F4skcT/NvoFGd5OSQo
 YRBnEwQ5o+ujxy7xjHrqp/mhF1HCAYM6tUEp94taypD9F3GIfaQlRaF0v
 Aq6zunS67qDUFrnvUUt1Mby+DLZSKSuUZs9y9atD7/NhuGFgThVSXAwI8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1887484"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1887484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1104923828"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="1104923828"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.49.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:30:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: hdmi-codec: drop drm/drm_edid.h include
Date: Tue, 12 Dec 2023 16:30:38 +0200
Message-Id: <20231212143038.3828691-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: jani.nikula@intel.com, Takashi Iwai <tiwai@suse.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hdmi-codec.h does not appear to need drm/drm_edid.h for anything. Remove
it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

I'm pretty sure I haven't compiled everything that might implicitly
depend on the include. However, the right thing to do is to include
drm_edid.h where needed, not from somewhat random intermediate
headers. I hope this uncovers anything I missed.
---
 include/sound/hdmi-codec.h | 1 -
 1 file changed, 1 deletion(-)

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

