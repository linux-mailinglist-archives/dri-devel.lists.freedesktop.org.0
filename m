Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CE04C31B7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 17:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D3010E792;
	Thu, 24 Feb 2022 16:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2569410E792;
 Thu, 24 Feb 2022 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645721026; x=1677257026;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=EMCZNMUc0kI1FH4qkYC1Tq3BMWomB4NhwTkNeaMC3iQ=;
 b=Uf/IGQN4Dws4/kykKMSNSOLihtbbM5ODwCdEKpweEcQKO5vDC81u4r7r
 q/U+M1IxlXhzrefa0Q88yz0dSJEDlV6NlynXPQDjGEGl4S85zWoGl3qYD
 q86dPzcxvhhZd/35UlqeCUWm4thw95dMxtWBBgoQwqb8Unt6AjEKM+0Ra
 f8PWADM0Xq3iZiV15shsfc5tP9FfXVy8c9weWv2LfFMHpx6rALVu8rPx8
 KBmrcufDSyBcF+Tx0x2DfgHMoPksErSGvIZzS/PDuwJwVnxguYWmOsG7E
 kFBEEY3/dNoqzrqlvIrWjiiKs04BFKeFk+skhz1uy7F2fcMTKIdv6wmGT g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="338716484"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="338716484"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 08:43:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="548823918"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 08:43:43 -0800
Date: Thu, 24 Feb 2022 18:34:54 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] hda/i915: split the wait for the component
 binding
In-Reply-To: <20220223195203.13708-3-ramalingam.c@intel.com>
Message-ID: <alpine.DEB.2.22.394.2202241820490.3088432@eliteleevi.tm.intel.com>
References: <20220223195203.13708-1-ramalingam.c@intel.com>
 <20220223195203.13708-3-ramalingam.c@intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, lucas.demarchi@intel.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 24 Feb 2022, Ramalingam C wrote:

> Split the wait for component binding from i915 in multiples of
> sysctl_hung_task_timeout_secs. This helps to avoid the possible kworker
> thread hung detection given below.

while I understand the problem, I'm not sure whether a simpler option
should be chosen. Maybe just split the wait_for_completion_timeout()
into small 5sec iterations, without consulting value of hung_task_timeout.
This would seem unligned with more mainstream use of 
wait_for_completion_timeout() in kernel and still do the job.

I'll loop in Takashi here as well. Basicly the 60 sec timeout in 
hda/hdac_i915.c is getting caught by hung_task_detection logic in builds
where the hung_task_timeout is below 60secs.

I have a patch that tries to avoid hitting the timeout in some of the more 
common cases:
"ALSA: hda/i915 - skip acomp init if no matching display"
https://lists.freedesktop.org/archives/intel-gfx-trybot/2022-February/128278.html
... but we'll still be stuck with some configurations where the timeout 
will be hit. And above needs careful testing.

One logic comment below as well, but I'll quote the whole patch to give
context to Takashi.
 
> <3>[   60.946316] INFO: task kworker/11:1:104 blocked for more than 30
> seconds.
> <3>[   60.946479]       Tainted: G        W
> 5.17.0-rc5-CI-CI_DRM_11265+ #1
> <3>[   60.946580] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> <6>[   60.946688] task:kworker/11:1    state:D stack:14192 pid:  104
> ppid:     2 flags:0x00004000
> <6>[   60.946713] Workqueue: events azx_probe_work [snd_hda_intel]
> <6>[   60.946740] Call Trace:
> <6>[   60.946745]  <TASK>
> <6>[   60.946763]  __schedule+0x42c/0xa80
> <6>[   60.946797]  schedule+0x3f/0xc0
> <6>[   60.946811]  schedule_timeout+0x1be/0x2e0
> <6>[   60.946829]  ? del_timer_sync+0xb0/0xb0
> <6>[   60.946849]  ? 0xffffffff81000000
> <6>[   60.946864]  ? wait_for_completion_timeout+0x79/0x120
> <6>[   60.946879]  wait_for_completion_timeout+0xab/0x120
> <6>[   60.946906]  snd_hdac_i915_init+0xa5/0xb0 [snd_hda_core]
> <6>[   60.946943]  azx_probe_work+0x71/0x84c [snd_hda_intel]
> <6>[   60.946974]  process_one_work+0x275/0x5c0
> <6>[   60.947010]  worker_thread+0x37/0x370
> <6>[   60.947028]  ? process_one_work+0x5c0/0x5c0
> <6>[   60.947038]  kthread+0xef/0x120
> <6>[   60.947047]  ? kthread_complete_and_exit+0x20/0x20
> <6>[   60.947065]  ret_from_fork+0x22/0x30
> <6>[   60.947110]  </TASK>
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Kai Vehmanen <kai.vehmanen@intel.com>
> cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  sound/hda/hdac_i915.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index d20a450a9a15..daaeebc5099e 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -6,6 +6,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/sched/sysctl.h>
>  #include <sound/core.h>
>  #include <sound/hdaudio.h>
>  #include <sound/hda_i915.h>
> @@ -163,7 +164,8 @@ static bool dg1_gfx_present(void)
>  int snd_hdac_i915_init(struct hdac_bus *bus)
>  {
>  	struct drm_audio_component *acomp;
> -	int err;
> +	unsigned long timeout, ret = 0;
> +	int err, i, itr_cnt;
>  
>  	if (!i915_gfx_present())
>  		return -ENODEV;
> @@ -182,9 +184,18 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
>  	if (!acomp->ops) {
>  		if (!IS_ENABLED(CONFIG_MODULES) ||
>  		    !request_module("i915")) {
5~> +			if (!sysctl_hung_task_timeout_secs) {
> +				itr_cnt = 1;
> +				timeout = msecs_to_jiffies(60 * 1000);
> +			} else {
> +				itr_cnt = DIV_ROUND_UP(60, sysctl_hung_task_timeout_secs);
> +				timeout = msecs_to_jiffies(sysctl_hung_task_timeout_secs * 1000);
> +			}
> +
>  			/* 60s timeout */
> -			wait_for_completion_timeout(&acomp->master_bind_complete,
> -						    msecs_to_jiffies(30 * 1000));
> +			for (i = 0; i < itr_cnt || !ret; i++)
> +				ret = wait_for_completion_timeout(&acomp->master_bind_complete,
> +								  timeout);

I think that should be 'i < itr_cnt && !ret'. If wait_for_completion
returns with a positive value, we should stop waiting as the completion
has been signalled.

>  		}
>  	}
>  	if (!acomp->ops) {
> -- 

Br, Kai
