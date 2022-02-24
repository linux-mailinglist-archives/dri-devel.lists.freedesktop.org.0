Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CCF4C334F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 18:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE0C10EC9E;
	Thu, 24 Feb 2022 17:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3528410EC71;
 Thu, 24 Feb 2022 17:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645722852; x=1677258852;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=esY2teakuXNhtG/Bm7XJCOmpP1zw6bkYpljA2klz7/8=;
 b=OJhJrYzupw2iYMnYLUrk5Va+a5jEyJvhB/0ADCLSm3rwXcZ68cZRMsBX
 MJJ6EzSL1wYNdNh5eZoD3g0ZYFuQpcEZS5Y8VH5jxbF8spRSt52avBisJ
 P3jL//k0nUO2R0qIytWFROlvSZfj1hi1W+gZVLupEcLIMPREdDc5q8Fgx
 5SLgeSeeGyEp8ZlX6ah1V4ZkDAfLoxo+JWTi+6DgpZYtiwLSr/2jk9UiO
 RhjmfXArKLu6JnylEu1gRAy157torhlA91Fen1bq/EoNxiLONjMF7wPO+
 RdjXPObbG2m230Usd4IeKVwj/aZsw9YxGibgA+LnQMvn8LXUIPEHnkhZn A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252023249"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252023249"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 09:13:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="574283983"
Received: from acstuden-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.98.77])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 09:13:58 -0800
Date: Thu, 24 Feb 2022 09:13:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH 2/2] hda/i915: split the wait for the component binding
Message-ID: <20220224171357.oozhif52j6zjksbg@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220223195203.13708-1-ramalingam.c@intel.com>
 <20220223195203.13708-3-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220223195203.13708-3-ramalingam.c@intel.com>
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
Cc: Kai Vehmanen <kai.vehmanen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 01:22:03AM +0530, Ramalingam C wrote:
>Split the wait for component binding from i915 in multiples of
>sysctl_hung_task_timeout_secs. This helps to avoid the possible kworker
>thread hung detection given below.
>
><3>[   60.946316] INFO: task kworker/11:1:104 blocked for more than 30
>seconds.
><3>[   60.946479]       Tainted: G        W
>5.17.0-rc5-CI-CI_DRM_11265+ #1
><3>[   60.946580] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
>disables this message.
><6>[   60.946688] task:kworker/11:1    state:D stack:14192 pid:  104
>ppid:     2 flags:0x00004000
><6>[   60.946713] Workqueue: events azx_probe_work [snd_hda_intel]
><6>[   60.946740] Call Trace:
><6>[   60.946745]  <TASK>
><6>[   60.946763]  __schedule+0x42c/0xa80
><6>[   60.946797]  schedule+0x3f/0xc0
><6>[   60.946811]  schedule_timeout+0x1be/0x2e0
><6>[   60.946829]  ? del_timer_sync+0xb0/0xb0
><6>[   60.946849]  ? 0xffffffff81000000
><6>[   60.946864]  ? wait_for_completion_timeout+0x79/0x120
><6>[   60.946879]  wait_for_completion_timeout+0xab/0x120
><6>[   60.946906]  snd_hdac_i915_init+0xa5/0xb0 [snd_hda_core]
><6>[   60.946943]  azx_probe_work+0x71/0x84c [snd_hda_intel]
><6>[   60.946974]  process_one_work+0x275/0x5c0
><6>[   60.947010]  worker_thread+0x37/0x370
><6>[   60.947028]  ? process_one_work+0x5c0/0x5c0
><6>[   60.947038]  kthread+0xef/0x120
><6>[   60.947047]  ? kthread_complete_and_exit+0x20/0x20
><6>[   60.947065]  ret_from_fork+0x22/0x30
><6>[   60.947110]  </TASK>
>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>cc: Kai Vehmanen <kai.vehmanen@intel.com>
>cc: Lucas De Marchi <lucas.demarchi@intel.com>

some more Cc needed?

$ ./scripts/get_maintainer.pl sound/hda/hdac_i915.c
Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
Lucas De Marchi <lucas.demarchi@intel.com> (commit_signer:2/2=100%)
Rodrigo Vivi <rodrigo.vivi@intel.com> (commit_signer:1/2=50%)
Ramalingam C <ramalingam.c@intel.com> (commit_signer:1/2=50%,authored:1/2=50%,removed_lines:1/1=100%)
Chris Wilson <chris@chris-wilson.co.uk> (authored:1/2=50%,added_lines:23/24=96%)
alsa-devel@alsa-project.org (moderated list:SOUND)
linux-kernel@vger.kernel.org (open list)


>---
> sound/hda/hdac_i915.c | 17 ++++++++++++++---
> 1 file changed, 14 insertions(+), 3 deletions(-)
>
>diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
>index d20a450a9a15..daaeebc5099e 100644
>--- a/sound/hda/hdac_i915.c
>+++ b/sound/hda/hdac_i915.c
>@@ -6,6 +6,7 @@
> #include <linux/init.h>
> #include <linux/module.h>
> #include <linux/pci.h>
>+#include <linux/sched/sysctl.h>
> #include <sound/core.h>
> #include <sound/hdaudio.h>
> #include <sound/hda_i915.h>
>@@ -163,7 +164,8 @@ static bool dg1_gfx_present(void)
> int snd_hdac_i915_init(struct hdac_bus *bus)
> {
> 	struct drm_audio_component *acomp;
>-	int err;
>+	unsigned long timeout, ret = 0;
>+	int err, i, itr_cnt;
>
> 	if (!i915_gfx_present())
> 		return -ENODEV;
>@@ -182,9 +184,18 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
> 	if (!acomp->ops) {
> 		if (!IS_ENABLED(CONFIG_MODULES) ||
> 		    !request_module("i915")) {
>+			if (!sysctl_hung_task_timeout_secs) {
>+				itr_cnt = 1;
>+				timeout = msecs_to_jiffies(60 * 1000);
>+			} else {
>+				itr_cnt = DIV_ROUND_UP(60, sysctl_hung_task_timeout_secs);
>+				timeout = msecs_to_jiffies(sysctl_hung_task_timeout_secs * 1000);
>+			}
>+
> 			/* 60s timeout */
>-			wait_for_completion_timeout(&acomp->master_bind_complete,
>-						    msecs_to_jiffies(30 * 1000));
>+			for (i = 0; i < itr_cnt || !ret; i++)

it will return 0 if a timeout occurs so it's trapped forever here? Did
you mean &&?

Also maybe:

	itr_cnt = DIV_ROUND_UP(60, sysctl_hung_task_timeout_secs ?: 60);

Lucas De Marchi

} while ();

>+				ret = wait_for_completion_timeout(&acomp->master_bind_complete,
>+								  timeout);
> 		}
> 	}
> 	if (!acomp->ops) {
>-- 
>2.20.1
>
