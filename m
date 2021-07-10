Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B153C34D9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 16:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAC46EB21;
	Sat, 10 Jul 2021 14:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF586EB21;
 Sat, 10 Jul 2021 14:35:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10041"; a="206816231"
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="206816231"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2021 07:35:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="650186423"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga005.fm.intel.com with ESMTP; 10 Jul 2021 07:35:46 -0700
Received: from [10.249.151.15] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.15])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16AEZik2012980; Sat, 10 Jul 2021 15:35:45 +0100
Subject: Re: [Intel-gfx] [PATCH 04/16] drm/i915/guc/slpc: Lay out slpc
 init/enable/disable/fini
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-5-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <dca4c062-68fb-c525-da44-cbfdd51df326@intel.com>
Date: Sat, 10 Jul 2021 16:35:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710012026.19705-5-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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



On 10.07.2021 03:20, Vinay Belgaumkar wrote:
> Declare header and source files for SLPC, along with init and
> enable/disable function templates.

later you claim that "disable" is not needed

> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile               |  1 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h      |  2 ++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 34 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h | 16 ++++++++++
>  4 files changed, 53 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>  create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index ab7679957623..d8eac4468df9 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -186,6 +186,7 @@ i915-y += gt/uc/intel_uc.o \
>  	  gt/uc/intel_guc_fw.o \
>  	  gt/uc/intel_guc_log.o \
>  	  gt/uc/intel_guc_log_debugfs.o \
> +	  gt/uc/intel_guc_slpc.o \
>  	  gt/uc/intel_guc_submission.o \
>  	  gt/uc/intel_huc.o \
>  	  gt/uc/intel_huc_debugfs.o \
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index e5a456918b88..0dbbd9cf553f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -15,6 +15,7 @@
>  #include "intel_guc_ct.h"
>  #include "intel_guc_log.h"
>  #include "intel_guc_reg.h"
> +#include "intel_guc_slpc.h"
>  #include "intel_uc_fw.h"
>  #include "i915_utils.h"
>  #include "i915_vma.h"
> @@ -30,6 +31,7 @@ struct intel_guc {
>  	struct intel_uc_fw fw;
>  	struct intel_guc_log log;
>  	struct intel_guc_ct ct;
> +	struct intel_guc_slpc slpc;
>  
>  	/* Global engine used to submit requests to GuC */
>  	struct i915_sched_engine *sched_engine;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> new file mode 100644
> index 000000000000..c1f569d2300d
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -0,0 +1,34 @@
> +/*
> + * SPDX-License-Identifier: MIT

SPDX tag shall be in very first line, for .c:

// SPDX-License-Identifier: MIT

> + *
> + * Copyright © 2020 Intel Corporation

2021

> + */
> +
> +#include "intel_guc_slpc.h"
> +
> +int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
> +{
> +	return 0;
> +}
> +
> +/*
> + * intel_guc_slpc_enable() - Start SLPC
> + * @slpc: pointer to intel_guc_slpc.
> + *
> + * SLPC is enabled by setting up the shared data structure and
> + * sending reset event to GuC SLPC. Initial data is setup in
> + * intel_guc_slpc_init. Here we send the reset event. We do
> + * not currently need a slpc_disable since this is taken care
> + * of automatically when a reset/suspend occurs and the guc

s/guc/GuC

> + * channels are destroyed.

you mean CTB ?

> + *
> + * Return: 0 on success, non-zero error code on failure.
> + */
> +int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
> +{
> +	return 0;
> +}
> +
> +void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
> +{
> +}
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> new file mode 100644
> index 000000000000..74fd86769163
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -0,0 +1,16 @@
> +/*
> + * SPDX-License-Identifier: MIT

SPDX tag shall be in very first line, for .h:

/* SPDX-License-Identifier: MIT */

> + *
> + * Copyright © 2020 Intel Corporation

2021

> + */
> +#ifndef _INTEL_GUC_SLPC_H_
> +#define _INTEL_GUC_SLPC_H_
> +
> +struct intel_guc_slpc {
> +};

move all data definitions to intel_guc_slpc_types.h and include it here

> +
> +int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
> +int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
> +void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
> +
> +#endif
> 

and as suggested in comment to 2/14 you should likely move this patch to
the front of the series

Michal

