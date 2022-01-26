Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FC549C687
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 10:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7180D10E888;
	Wed, 26 Jan 2022 09:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F7A10E7DA;
 Wed, 26 Jan 2022 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643189973; x=1674725973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=85iCTNId4lPzWBpzYMS8JCGZJAAJPSmPWs4cBOEUnho=;
 b=Q+KC9+N1tzq/B1olfaYHSgpWT+VV4e8j4vPT2Cr4xbjbNnTgiy6rIWS1
 ZdYJURry8tH8/HZ5UFHQrDd2CtRMlNjA2On9VLt4qqYEFPFdM6jWHM9tu
 i1bBuFWpteic2NiyAHzMirAOPhqLwYCmmBNuY9BWi4eBVopBJz+uG6ID/
 7Z/wNywRpbi4MeNCnqDSJMijQcVF9/mzAGfIu+tcjASX9hJEf7w/o6cP1
 GsLlxAJ0lG1E0zCKGMfKR4ECvaUGN+x7XJSHN1jSraZzNGM/BbDt6ZUVl
 TruEoRlg2rumfuxZtKzJSMyR8TW72QwhBOfCaq5raTwLBp7MCeNyWQ8GM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309830637"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="309830637"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="477433100"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-security-module@vger.kernel.org, nouveau@lists.freedesktop.org,
 netdev@vger.kernel.org
Subject: [PATCH v2 07/11] drm/amd/display: Use str_yes_no()
Date: Wed, 26 Jan 2022 01:39:47 -0800
Message-Id: <20220126093951.1470898-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126093951.1470898-1-lucas.demarchi@intel.com>
References: <20220126093951.1470898-1-lucas.demarchi@intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Raju Rangoju <rajur@chelsio.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the local yesno() implementation and adopt the str_yes_no() from
linux/string_helpers.h.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 26719efa5396..5ff1076b9130 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -23,6 +23,7 @@
  *
  */
 
+#include <linux/string_helpers.h>
 #include <linux/uaccess.h>
 
 #include "dc.h"
@@ -49,11 +50,6 @@ struct dmub_debugfs_trace_entry {
 	uint32_t param1;
 };
 
-static inline const char *yesno(bool v)
-{
-	return v ? "yes" : "no";
-}
-
 /* parse_write_buffer_into_params - Helper function to parse debugfs write buffer into an array
  *
  * Function takes in attributes passed to debugfs write entry
@@ -853,12 +849,12 @@ static int psr_capability_show(struct seq_file *m, void *data)
 	if (!(link->connector_signal & SIGNAL_TYPE_EDP))
 		return -ENODEV;
 
-	seq_printf(m, "Sink support: %s", yesno(link->dpcd_caps.psr_caps.psr_version != 0));
+	seq_printf(m, "Sink support: %s", str_yes_no(link->dpcd_caps.psr_caps.psr_version != 0));
 	if (link->dpcd_caps.psr_caps.psr_version)
 		seq_printf(m, " [0x%02x]", link->dpcd_caps.psr_caps.psr_version);
 	seq_puts(m, "\n");
 
-	seq_printf(m, "Driver support: %s", yesno(link->psr_settings.psr_feature_enabled));
+	seq_printf(m, "Driver support: %s", str_yes_no(link->psr_settings.psr_feature_enabled));
 	if (link->psr_settings.psr_version)
 		seq_printf(m, " [0x%02x]", link->psr_settings.psr_version);
 	seq_puts(m, "\n");
@@ -1207,8 +1203,8 @@ static int dp_dsc_fec_support_show(struct seq_file *m, void *data)
 	drm_modeset_drop_locks(&ctx);
 	drm_modeset_acquire_fini(&ctx);
 
-	seq_printf(m, "FEC_Sink_Support: %s\n", yesno(is_fec_supported));
-	seq_printf(m, "DSC_Sink_Support: %s\n", yesno(is_dsc_supported));
+	seq_printf(m, "FEC_Sink_Support: %s\n", str_yes_no(is_fec_supported));
+	seq_printf(m, "DSC_Sink_Support: %s\n", str_yes_no(is_dsc_supported));
 
 	return ret;
 }
-- 
2.34.1

