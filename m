Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8D04C1CA2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 20:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A680510E5A5;
	Wed, 23 Feb 2022 19:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B61510E433;
 Wed, 23 Feb 2022 19:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645645918; x=1677181918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NpD0lCeER2ZF++l7t05bIZFosJNn5RXlL2L0xj9m/i8=;
 b=b43gxQ0+kKjIkbCQiKDoMAUEbHxY276tPSF592UgmdujyK05dNN0C5zj
 qFhE32CkP42ihCa06O5lzUwKBNLcB2VZSxYMQ1mkVHm7UYlH5zqwFQpSB
 wiP41RhGSoBTOCwBTOoKX2SwJW8j3DpN2olow2qUIoTuxAeu8UGS4Ps7L
 NV+eyv39esBkmI605h3aFP5wIxpa7tYlXn4DuF0WXfQH4M6AASWkdNrg+
 TSncDeySbVY+rKkfJjJHeoyNn/ssLfjFWfh8gZR9476c4YQH67g6ZY/TO
 m5lN/YMgsriNh0mRxB5EEcZADSc92y/78eM1MuZbXcd9F9ZBQR5zf6enK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="232688804"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="232688804"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 11:51:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="508576550"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 11:51:47 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] hda/i915: split the wait for the component binding
Date: Thu, 24 Feb 2022 01:22:03 +0530
Message-Id: <20220223195203.13708-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220223195203.13708-1-ramalingam.c@intel.com>
References: <20220223195203.13708-1-ramalingam.c@intel.com>
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
Cc: Kai Vehmanen <kai.vehmanen@intel.com>, lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split the wait for component binding from i915 in multiples of
sysctl_hung_task_timeout_secs. This helps to avoid the possible kworker
thread hung detection given below.

<3>[   60.946316] INFO: task kworker/11:1:104 blocked for more than 30
seconds.
<3>[   60.946479]       Tainted: G        W
5.17.0-rc5-CI-CI_DRM_11265+ #1
<3>[   60.946580] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
<6>[   60.946688] task:kworker/11:1    state:D stack:14192 pid:  104
ppid:     2 flags:0x00004000
<6>[   60.946713] Workqueue: events azx_probe_work [snd_hda_intel]
<6>[   60.946740] Call Trace:
<6>[   60.946745]  <TASK>
<6>[   60.946763]  __schedule+0x42c/0xa80
<6>[   60.946797]  schedule+0x3f/0xc0
<6>[   60.946811]  schedule_timeout+0x1be/0x2e0
<6>[   60.946829]  ? del_timer_sync+0xb0/0xb0
<6>[   60.946849]  ? 0xffffffff81000000
<6>[   60.946864]  ? wait_for_completion_timeout+0x79/0x120
<6>[   60.946879]  wait_for_completion_timeout+0xab/0x120
<6>[   60.946906]  snd_hdac_i915_init+0xa5/0xb0 [snd_hda_core]
<6>[   60.946943]  azx_probe_work+0x71/0x84c [snd_hda_intel]
<6>[   60.946974]  process_one_work+0x275/0x5c0
<6>[   60.947010]  worker_thread+0x37/0x370
<6>[   60.947028]  ? process_one_work+0x5c0/0x5c0
<6>[   60.947038]  kthread+0xef/0x120
<6>[   60.947047]  ? kthread_complete_and_exit+0x20/0x20
<6>[   60.947065]  ret_from_fork+0x22/0x30
<6>[   60.947110]  </TASK>

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Kai Vehmanen <kai.vehmanen@intel.com>
cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 sound/hda/hdac_i915.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index d20a450a9a15..daaeebc5099e 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -6,6 +6,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/sched/sysctl.h>
 #include <sound/core.h>
 #include <sound/hdaudio.h>
 #include <sound/hda_i915.h>
@@ -163,7 +164,8 @@ static bool dg1_gfx_present(void)
 int snd_hdac_i915_init(struct hdac_bus *bus)
 {
 	struct drm_audio_component *acomp;
-	int err;
+	unsigned long timeout, ret = 0;
+	int err, i, itr_cnt;
 
 	if (!i915_gfx_present())
 		return -ENODEV;
@@ -182,9 +184,18 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	if (!acomp->ops) {
 		if (!IS_ENABLED(CONFIG_MODULES) ||
 		    !request_module("i915")) {
+			if (!sysctl_hung_task_timeout_secs) {
+				itr_cnt = 1;
+				timeout = msecs_to_jiffies(60 * 1000);
+			} else {
+				itr_cnt = DIV_ROUND_UP(60, sysctl_hung_task_timeout_secs);
+				timeout = msecs_to_jiffies(sysctl_hung_task_timeout_secs * 1000);
+			}
+
 			/* 60s timeout */
-			wait_for_completion_timeout(&acomp->master_bind_complete,
-						    msecs_to_jiffies(30 * 1000));
+			for (i = 0; i < itr_cnt || !ret; i++)
+				ret = wait_for_completion_timeout(&acomp->master_bind_complete,
+								  timeout);
 		}
 	}
 	if (!acomp->ops) {
-- 
2.20.1

