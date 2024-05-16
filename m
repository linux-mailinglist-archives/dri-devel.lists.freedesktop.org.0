Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474728C724E
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 09:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFFD10E2DA;
	Thu, 16 May 2024 07:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="ZmUYWNCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203C010E292
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 07:57:52 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-34e7a35d5d4so6216935f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 00:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1715846270; x=1716451070;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UcmmRpWXQSvM6XyNJkwwza3bmPQohQEcQZxy4YaVuQc=;
 b=ZmUYWNCN70/03or1HS8bET5yLANUKTn+CSdXIfJkSsEc6/dQ9avQ+kUUbjx46/NVLB
 4aO83Azyxo+YrbkZVEgZ+4DC14pAJws3NX++L55sqqUtAlzwqlTa3CG4FoFhQ2quM8z9
 8McYNR+1RPa9rBEcyFrWffzNmhX5q0FMq9Pow2MHtOe07UX2LuPWT+EV6A3fPXA9H03+
 yvgaHkqDaDZO/W4QwPJqjmyofmPyMIBro16cvdAjybwAM56Z9jJPUPkPnlDyWNZnNl/7
 7MMCSMULUkYMiV1RNzFo6U05NkADL8U19ijP6D/rFtCoZ6/0tglRdRNM/xkErpeTn4hm
 zapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715846270; x=1716451070;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UcmmRpWXQSvM6XyNJkwwza3bmPQohQEcQZxy4YaVuQc=;
 b=QtksRmaB+lTLJVWX/zWJXTe68RTqmIAFuVPxkaO2CZtKY+F8aLs2eAXWz63epvqVRg
 +yvomumFPHwwNSup1JwiQvSBazPYqARLaBA9tTKJ0xRsYuQ8fDaxg7mMD8UFM6mqPVty
 IzCdp8fYzNkoOmwarX+vtJlcZSUxJhEo5kn1SRQJj51Jez26UHGkMV9uBJFz/rrRG/P5
 jDJKp8l0aqqaIHbLU5DpZKgy2nueTkmJIb9d7Wvdt9pewG28t0Kudmo1o+kH+8JWd3Rn
 XNp25FCjndfbOcebRA1gY+jQqesJMRxJVEqFe405HHAAabkyXyHQEHA8mBWQ4SnDrGoh
 Gj4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCqyyIMAvdU4iVwZSNvkd+raiZHYUWF7O//P1ZExyDroUyJCLADiMiZ1uXfGWjJxag/vjYISY2PXbAgCKlSitMU5C1FYHZXP6r4Kgct9Ng
X-Gm-Message-State: AOJu0YyLgOPnGi97FSj13sx7C/97bQ+HZmtU6AG6zbAAsUPlvupdbYcv
 nzfWfzU5BR7nfyPCBRqWCmRAaKbSyabNIZB/iTdcwtmn2e902sCgKTQFCZy8ICM=
X-Google-Smtp-Source: AGHT+IG61apIQhVQ6XV3XX+naCBrfiyiCbr2ehVMVKlz0JQ3th6anPkVoLSlPC3nYjF94GC4l16XQQ==
X-Received: by 2002:adf:e58d:0:b0:351:da14:9368 with SMTP id
 ffacd0b85a97d-351da1494demr516567f8f.40.1715846270049; 
 Thu, 16 May 2024 00:57:50 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bcedsm18175635f8f.19.2024.05.16.00.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 00:57:49 -0700 (PDT)
Message-ID: <9bf21f5a-28a9-4bb6-8467-419889f405a9@ursulin.net>
Date: Thu, 16 May 2024 08:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] drm/xe/client: Print runtime to fdinfo
Content-Language: en-GB
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
 <20240515214258.59209-9-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20240515214258.59209-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/05/2024 22:42, Lucas De Marchi wrote:
> Print the accumulated runtime for client when printing fdinfo.
> Each time a query is done it first does 2 things:
> 
> 1) loop through all the exec queues for the current client and
>     accumulate the runtime, per engine class. CTX_TIMESTAMP is used for
>     that, being read from the context image.
> 
> 2) Read a "GPU timestamp" that can be used for considering "how much GPU
>     time has passed" and that has the same unit/refclock as the one
>     recording the runtime. RING_TIMESTAMP is used for that via MMIO.
> 
> Since for all current platforms RING_TIMESTAMP follows the same
> refclock, just read it once, using any first engine available.
> 
> This is exported to userspace as 2 numbers in fdinfo:
> 
> 	drm-cycles-<class>: <RUNTIME>
> 	drm-total-cycles-<class>: <TIMESTAMP>
> 
> Userspace is expected to collect at least 2 samples, which allows to
> know the client engine busyness as per:
> 
> 		    RUNTIME1 - RUNTIME0
> 	busyness = ---------------------
> 			  T1 - T0
> 
> Since drm-cycles-<class> always starts at 0, it's also possible to know
> if and engine was ever used by a client.
> 
> It's expected that userspace will read any 2 samples every few seconds.
> Given the update frequency of the counters involved and that
> CTX_TIMESTAMP is 32-bits, the counter for each exec_queue can wrap
> around (assuming 100% utilization) after ~200s. The wraparound is not
> perceived by userspace since it's just accumulated for all the
> exec_queues in a 64-bit counter) but the measurement will not be
> accurate if the samples are too far apart.
> 
> This could be mitigated by adding a workqueue to accumulate the counters
> every so often, but it's additional complexity for something that is
> done already by userspace every few seconds in tools like gputop (from
> igt), htop, nvtop, etc, with none of them really defaulting to 1 sample
> per minute or more.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   Documentation/gpu/drm-usage-stats.rst       |  21 +++-
>   Documentation/gpu/xe/index.rst              |   1 +
>   Documentation/gpu/xe/xe-drm-usage-stats.rst |  10 ++
>   drivers/gpu/drm/xe/xe_drm_client.c          | 121 +++++++++++++++++++-
>   4 files changed, 150 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 6dc299343b48..a80f95ca1b2f 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -112,6 +112,19 @@ larger value within a reasonable period. Upon observing a value lower than what
>   was previously read, userspace is expected to stay with that larger previous
>   value until a monotonic update is seen.
>   
> +- drm-total-cycles-<keystr>: <uint>
> +
> +Engine identifier string must be the same as the one specified in the
> +drm-cycles-<keystr> tag and shall contain the total number cycles for the given
> +engine.
> +
> +This is a timestamp in GPU unspecified unit that matches the update rate
> +of drm-cycles-<keystr>. For drivers that implement this interface, the engine
> +utilization can be calculated entirely on the GPU clock domain, without
> +considering the CPU sleep time between 2 samples.
> +
> +A driver may implement either this key or drm-maxfreq-<keystr>, but not both.
> +
>   - drm-maxfreq-<keystr>: <uint> [Hz|MHz|KHz]
>   
>   Engine identifier string must be the same as the one specified in the
> @@ -121,6 +134,9 @@ percentage utilization of the engine, whereas drm-engine-<keystr> only reflects
>   time active without considering what frequency the engine is operating as a
>   percentage of its maximum frequency.
>   
> +A driver may implement either this key or drm-total-cycles-<keystr>, but not
> +both.
> +

For the spec part:

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Some minor comments and questions below.

>   Memory
>   ^^^^^^
>   
> @@ -168,5 +184,6 @@ be documented above and where possible, aligned with other drivers.
>   Driver specific implementations
>   -------------------------------
>   
> -:ref:`i915-usage-stats`
> -:ref:`panfrost-usage-stats`
> +* :ref:`i915-usage-stats`
> +* :ref:`panfrost-usage-stats`
> +* :ref:`xe-usage-stats`
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index c224ecaee81e..3f07aa3b5432 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -23,3 +23,4 @@ DG2, etc is provided to prototype the driver.
>      xe_firmware
>      xe_tile
>      xe_debugging
> +   xe-drm-usage-stats.rst
> diff --git a/Documentation/gpu/xe/xe-drm-usage-stats.rst b/Documentation/gpu/xe/xe-drm-usage-stats.rst
> new file mode 100644
> index 000000000000..482d503ae68a
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe-drm-usage-stats.rst
> @@ -0,0 +1,10 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +.. _xe-usage-stats:
> +
> +========================================
> +Xe DRM client usage stats implementation
> +========================================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_drm_client.c
> +   :doc: DRM Client usage stats
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 08f0b7c95901..952b0cc87708 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -2,6 +2,7 @@
>   /*
>    * Copyright © 2023 Intel Corporation
>    */
> +#include "xe_drm_client.h"
>   
>   #include <drm/drm_print.h>
>   #include <drm/xe_drm.h>
> @@ -12,9 +13,66 @@
>   #include "xe_bo.h"
>   #include "xe_bo_types.h"
>   #include "xe_device_types.h"
> -#include "xe_drm_client.h"
> +#include "xe_exec_queue.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt.h"
> +#include "xe_hw_engine.h"
> +#include "xe_pm.h"
>   #include "xe_trace.h"
>   
> +/**
> + * DOC: DRM Client usage stats
> + *
> + * The drm/xe driver implements the DRM client usage stats specification as
> + * documented in :ref:`drm-client-usage-stats`.
> + *
> + * Example of the output showing the implemented key value pairs and entirety of
> + * the currently possible format options:
> + *
> + * ::
> + *
> + * 	pos:    0
> + * 	flags:  0100002
> + * 	mnt_id: 26
> + * 	ino:    685
> + * 	drm-driver:     xe
> + * 	drm-client-id:  3
> + * 	drm-pdev:       0000:03:00.0
> + * 	drm-total-system:       0
> + * 	drm-shared-system:      0
> + * 	drm-active-system:      0
> + * 	drm-resident-system:    0
> + * 	drm-purgeable-system:   0
> + * 	drm-total-gtt:  192 KiB
> + * 	drm-shared-gtt: 0
> + * 	drm-active-gtt: 0
> + * 	drm-resident-gtt:       192 KiB
> + * 	drm-total-vram0:        23992 KiB
> + * 	drm-shared-vram0:       16 MiB
> + * 	drm-active-vram0:       0
> + * 	drm-resident-vram0:     23992 KiB
> + * 	drm-total-stolen:       0
> + * 	drm-shared-stolen:      0
> + * 	drm-active-stolen:      0
> + * 	drm-resident-stolen:    0
> + * 	drm-cycles-rcs: 28257900
> + * 	drm-total-cycles-rcs:   7655183225
> + * 	drm-cycles-bcs: 0
> + * 	drm-total-cycles-bcs:   7655183225
> + * 	drm-cycles-vcs: 0
> + * 	drm-total-cycles-vcs:   7655183225
> + * 	drm-engine-capacity-vcs:        2
> + * 	drm-cycles-vecs:        0
> + * 	drm-total-cycles-vecs:  7655183225
> + * 	drm-engine-capacity-vecs:       2
> + * 	drm-cycles-ccs: 0
> + * 	drm-total-cycles-ccs:   7655183225
> + * 	drm-engine-capacity-ccs:        4
> + *
> + * Possible `drm-cycles-` key names are: `rcs`, `ccs`, `bcs`, `vcs`, `vecs` and
> + * "other".
> + */
> +
>   /**
>    * xe_drm_client_alloc() - Allocate drm client
>    * @void: No arg
> @@ -179,6 +237,66 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>   	}
>   }
>   
> +static void show_runtime(struct drm_printer *p, struct drm_file *file)
> +{
> +	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };

Why long? But it doesn't matter really, at least on the architectures I 
know.

> +	struct xe_file *xef = file->driver_priv;
> +	struct xe_device *xe = xef->xe;
> +	struct xe_gt *gt;
> +	struct xe_hw_engine *hwe;
> +	struct xe_exec_queue *q;
> +	u64 gpu_timestamp;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	/* Accumulate all the exec queues from this client */
> +	mutex_lock(&xef->exec_queue.lock);
> +	xa_for_each(&xef->exec_queue.xa, i, q)
> +		xe_exec_queue_update_runtime(q);
> +	mutex_unlock(&xef->exec_queue.lock);
> +
> +	/* Get the total GPU cycles */
> +	for_each_gt(gt, xe, gt_id) {
> +		hwe = xe_gt_any_hw_engine(gt);
> +		if (!hwe)
> +			continue;
> +
> +		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
> +		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		break;
> +	}

Runtime pm get/put could be just around this block, right?

But overall now it reads super clean, thanks for accomodating my ideas!

Regards,

Tvrtko

> +
> +	if (unlikely(!hwe))
> +		return;
> +
> +	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
> +		const char *class_name;
> +
> +		for_each_gt(gt, xe, gt_id)
> +			capacity[class] += gt->user_engines.instances_per_class[class];
> +
> +		/*
> +		 * Engines may be fused off or not exposed to userspace. Don't
> +		 * return anything if this entire class is not available
> +		 */
> +		if (!capacity[class])
> +			continue;
> +
> +		class_name = xe_hw_engine_class_to_str(class);
> +		drm_printf(p, "drm-cycles-%s:\t%llu\n",
> +			   class_name, xef->runtime[class]);
> +		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
> +			   class_name, gpu_timestamp);
> +
> +		if (capacity[class] > 1)
> +			drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
> +				   class_name, capacity[class]);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
>   /**
>    * xe_drm_client_fdinfo() - Callback for fdinfo interface
>    * @p: The drm_printer ptr
> @@ -192,5 +310,6 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>   void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>   {
>   	show_meminfo(p, file);
> +	show_runtime(p, file);
>   }
>   #endif
