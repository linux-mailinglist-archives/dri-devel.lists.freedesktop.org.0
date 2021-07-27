Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DB53D78BF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 16:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631AF6E02E;
	Tue, 27 Jul 2021 14:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66256E02E;
 Tue, 27 Jul 2021 14:44:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="192051835"
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; d="scan'208";a="192051835"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 07:44:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,273,1620716400"; d="scan'208";a="437336219"
Received: from jrgrant-mobl.ger.corp.intel.com (HELO [10.213.245.158])
 ([10.213.245.158])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 07:44:32 -0700
Subject: Re: [PATCH v2 11/11] drm/i915: Extract i915_module.c
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
 <20210727121037.2041102-11-daniel.vetter@ffwll.ch>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <f3b20f36-a76d-032a-3fb7-1a7c3e839478@linux.intel.com>
Date: Tue, 27 Jul 2021 15:44:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727121037.2041102-11-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/07/2021 13:10, Daniel Vetter wrote:
> The module init code is somewhat misplaced in i915_pci.c, since it
> needs to pull in init/exit functions from every part of the driver and
> pollutes the include list a lot.
> 
> Extract an i915_module.c file which pulls all the bits together, and
> allows us to massively trim the include list of i915_pci.c.
> 
> The downside is that have to drop the error path check Jason added to
> catch when we set up the pci driver too early. I think that risk is
> acceptable for this pretty nice include.

i915_module.c is an improvement and the rest for me is not extremely 
objectionable by the end of this incarnation, but I also do not see it 
as an improvement really.

There was a bug to fix relating to mock tests, but that is where the 
exercise should have stopped for now. After that it IMHO spiraled out of 
control, not least the unjustifiably expedited removal of cache 
shrinking. On balance for me it is too churny and boils down to two 
extremely capable people spending time on kind of really unimportant 
side fiddles. And I do not intend to prescribe you what to do, just 
expressing my bewilderment. FWIW... I can only say my opinion as it, not 
that it matters a lot.

Regards,

Tvrtko

> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile      |   1 +
>   drivers/gpu/drm/i915/i915_module.c | 113 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/i915/i915_pci.c    | 117 +----------------------------
>   drivers/gpu/drm/i915/i915_pci.h    |   8 ++
>   4 files changed, 125 insertions(+), 114 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/i915_module.c
>   create mode 100644 drivers/gpu/drm/i915/i915_pci.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 9022dc638ed6..4ebd9f417ddb 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -38,6 +38,7 @@ i915-y += i915_drv.o \
>   	  i915_irq.o \
>   	  i915_getparam.o \
>   	  i915_mitigations.o \
> +	  i915_module.o \
>   	  i915_params.o \
>   	  i915_pci.o \
>   	  i915_scatterlist.o \
> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
> new file mode 100644
> index 000000000000..c578ea8f56a0
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_module.c
> @@ -0,0 +1,113 @@
> +/*
> + * SPDX-License-Identifier: MIT
> + *
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include <linux/console.h>
> +
> +#include "gem/i915_gem_context.h"
> +#include "gem/i915_gem_object.h"
> +#include "i915_active.h"
> +#include "i915_buddy.h"
> +#include "i915_params.h"
> +#include "i915_pci.h"
> +#include "i915_perf.h"
> +#include "i915_request.h"
> +#include "i915_scheduler.h"
> +#include "i915_selftest.h"
> +#include "i915_vma.h"
> +
> +static int i915_check_nomodeset(void)
> +{
> +	bool use_kms = true;
> +
> +	/*
> +	 * Enable KMS by default, unless explicitly overriden by
> +	 * either the i915.modeset prarameter or by the
> +	 * vga_text_mode_force boot option.
> +	 */
> +
> +	if (i915_modparams.modeset == 0)
> +		use_kms = false;
> +
> +	if (vgacon_text_force() && i915_modparams.modeset == -1)
> +		use_kms = false;
> +
> +	if (!use_kms) {
> +		/* Silently fail loading to not upset userspace. */
> +		DRM_DEBUG_DRIVER("KMS disabled.\n");
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct {
> +   int (*init)(void);
> +   void (*exit)(void);
> +} init_funcs[] = {
> +	{ i915_check_nomodeset, NULL },
> +	{ i915_active_module_init, i915_active_module_exit },
> +	{ i915_buddy_module_init, i915_buddy_module_exit },
> +	{ i915_context_module_init, i915_context_module_exit },
> +	{ i915_gem_context_module_init, i915_gem_context_module_exit },
> +	{ i915_objects_module_init, i915_objects_module_exit },
> +	{ i915_request_module_init, i915_request_module_exit },
> +	{ i915_scheduler_module_init, i915_scheduler_module_exit },
> +	{ i915_vma_module_init, i915_vma_module_exit },
> +	{ i915_mock_selftests, NULL },
> +	{ i915_pmu_init, i915_pmu_exit },
> +	{ i915_register_pci_driver, i915_unregister_pci_driver },
> +	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
> +};
> +static int init_progress;
> +
> +static int __init i915_init(void)
> +{
> +	int err, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
> +		err = init_funcs[i].init();
> +		if (err < 0) {
> +			while (i--) {
> +				if (init_funcs[i].exit)
> +					init_funcs[i].exit();
> +			}
> +			return err;
> +		} else if (err > 0) {
> +			/*
> +			 * Early-exit success is reserved for things which
> +			 * don't have an exit() function because we have no
> +			 * idea how far they got or how to partially tear
> +			 * them down.
> +			 */
> +			WARN_ON(init_funcs[i].exit);
> +			break;
> +		}
> +	}
> +
> +	init_progress = i;
> +
> +	return 0;
> +}
> +
> +static void __exit i915_exit(void)
> +{
> +	int i;
> +
> +	for (i = init_progress - 1; i >= 0; i--) {
> +		GEM_BUG_ON(i >= ARRAY_SIZE(init_funcs));
> +		if (init_funcs[i].exit)
> +			init_funcs[i].exit();
> +	}
> +}
> +
> +module_init(i915_init);
> +module_exit(i915_exit);
> +
> +MODULE_AUTHOR("Tungsten Graphics, Inc.");
> +MODULE_AUTHOR("Intel Corporation");
> +
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index b4f5e88aaae6..08651ca03478 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -22,24 +22,13 @@
>    *
>    */
>   
> -#include <linux/console.h>
>   #include <linux/vga_switcheroo.h>
>   
>   #include <drm/drm_drv.h>
>   #include <drm/i915_pciids.h>
>   
> -#include "display/intel_fbdev.h"
> -
> -#include "i915_active.h"
> -#include "i915_buddy.h"
>   #include "i915_drv.h"
> -#include "gem/i915_gem_context.h"
> -#include "gem/i915_gem_object.h"
> -#include "i915_request.h"
> -#include "i915_perf.h"
> -#include "i915_selftest.h"
> -#include "i915_scheduler.h"
> -#include "i915_vma.h"
> +#include "i915_pci.h"
>   
>   #define PLATFORM(x) .platform = (x)
>   #define GEN(x) \
> @@ -1251,31 +1240,6 @@ static void i915_pci_shutdown(struct pci_dev *pdev)
>   	i915_driver_shutdown(i915);
>   }
>   
> -static int i915_check_nomodeset(void)
> -{
> -	bool use_kms = true;
> -
> -	/*
> -	 * Enable KMS by default, unless explicitly overriden by
> -	 * either the i915.modeset prarameter or by the
> -	 * vga_text_mode_force boot option.
> -	 */
> -
> -	if (i915_modparams.modeset == 0)
> -		use_kms = false;
> -
> -	if (vgacon_text_force() && i915_modparams.modeset == -1)
> -		use_kms = false;
> -
> -	if (!use_kms) {
> -		/* Silently fail loading to not upset userspace. */
> -		DRM_DEBUG_DRIVER("KMS disabled.\n");
> -		return 1;
> -	}
> -
> -	return 0;
> -}
> -
>   static struct pci_driver i915_pci_driver = {
>   	.name = DRIVER_NAME,
>   	.id_table = pciidlist,
> @@ -1285,87 +1249,12 @@ static struct pci_driver i915_pci_driver = {
>   	.driver.pm = &i915_pm_ops,
>   };
>   
> -static int i915_register_pci_driver(void)
> +int i915_register_pci_driver(void)
>   {
>   	return pci_register_driver(&i915_pci_driver);
>   }
>   
> -static void i915_unregister_pci_driver(void)
> +void i915_unregister_pci_driver(void)
>   {
>   	pci_unregister_driver(&i915_pci_driver);
>   }
> -
> -static const struct {
> -   int (*init)(void);
> -   void (*exit)(void);
> -} init_funcs[] = {
> -	{ i915_check_nomodeset, NULL },
> -	{ i915_active_module_init, i915_active_module_exit },
> -	{ i915_buddy_module_init, i915_buddy_module_exit },
> -	{ i915_context_module_init, i915_context_module_exit },
> -	{ i915_gem_context_module_init, i915_gem_context_module_exit },
> -	{ i915_objects_module_init, i915_objects_module_exit },
> -	{ i915_request_module_init, i915_request_module_exit },
> -	{ i915_scheduler_module_init, i915_scheduler_module_exit },
> -	{ i915_vma_module_init, i915_vma_module_exit },
> -	{ i915_mock_selftests, NULL },
> -	{ i915_pmu_init, i915_pmu_exit },
> -	{ i915_register_pci_driver, i915_unregister_pci_driver },
> -	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
> -};
> -static int init_progress;
> -
> -static int __init i915_init(void)
> -{
> -	int err, i;
> -
> -	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
> -		err = init_funcs[i].init();
> -		if (err < 0) {
> -			while (i--) {
> -				if (init_funcs[i].exit)
> -					init_funcs[i].exit();
> -			}
> -			return err;
> -		} else if (err > 0) {
> -			/*
> -			 * Early-exit success is reserved for things which
> -			 * don't have an exit() function because we have no
> -			 * idea how far they got or how to partially tear
> -			 * them down.
> -			 */
> -			WARN_ON(init_funcs[i].exit);
> -
> -			/*
> -			 * We don't want to advertise devices with an only
> -			 * partially initialized driver.
> -			 */
> -			WARN_ON(i915_pci_driver.driver.owner);
> -			break;
> -		}
> -	}
> -
> -	init_progress = i;
> -
> -	return 0;
> -}
> -
> -static void __exit i915_exit(void)
> -{
> -	int i;
> -
> -	for (i = init_progress - 1; i >= 0; i--) {
> -		GEM_BUG_ON(i >= ARRAY_SIZE(init_funcs));
> -		if (init_funcs[i].exit)
> -			init_funcs[i].exit();
> -	}
> -}
> -
> -module_init(i915_init);
> -module_exit(i915_exit);
> -
> -MODULE_AUTHOR("Tungsten Graphics, Inc.");
> -MODULE_AUTHOR("Intel Corporation");
> -
> -MODULE_DESCRIPTION(DRIVER_DESC);
> -MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/i915/i915_pci.h b/drivers/gpu/drm/i915/i915_pci.h
> new file mode 100644
> index 000000000000..b386f319f52e
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_pci.h
> @@ -0,0 +1,8 @@
> +/*
> + * SPDX-License-Identifier: MIT
> + *
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +int i915_register_pci_driver(void);
> +void i915_unregister_pci_driver(void);
> 
