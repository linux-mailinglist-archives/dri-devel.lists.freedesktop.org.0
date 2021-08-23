Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCDE3F4E20
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 18:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537E689B7B;
	Mon, 23 Aug 2021 16:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAB989AF3;
 Mon, 23 Aug 2021 16:15:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="214005036"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="214005036"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 09:15:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; d="scan'208";a="526121098"
Received: from todonova-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.249.44.47])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 09:15:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2 11/11] drm/i915: Extract i915_module.c
In-Reply-To: <20210823152223.GA1135259@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
 <20210727121037.2041102-11-daniel.vetter@ffwll.ch>
 <20210823152223.GA1135259@roeck-us.net>
Date: Mon, 23 Aug 2021 19:15:42 +0300
Message-ID: <874kbggms1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 23 Aug 2021, Guenter Roeck <linux@roeck-us.net> wrote:
> On Tue, Jul 27, 2021 at 02:10:37PM +0200, Daniel Vetter wrote:
>> The module init code is somewhat misplaced in i915_pci.c, since it
>> needs to pull in init/exit functions from every part of the driver and
>> pollutes the include list a lot.
>>=20
>> Extract an i915_module.c file which pulls all the bits together, and
>> allows us to massively trim the include list of i915_pci.c.
>>=20
>> The downside is that have to drop the error path check Jason added to
>> catch when we set up the pci driver too early. I think that risk is
>> acceptable for this pretty nice include.
>>=20
>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
>
> With gcc and CONFIG_GCC_PLUGIN_RANDSTRUCT=3Dy, this patch results
> in:
>
> drivers/gpu/drm/i915/i915_module.c:50:11: error:
> 	positional initialization of field in 'struct' declared with 'designated=
_init' attribute
>
> This is seen for each of the initializers.

https://patchwork.freedesktop.org/patch/msgid/20210817233357.2379455-1-kees=
cook@chromium.org

BR,
Jani.

>
> Guenter
>
>> ---
>>  drivers/gpu/drm/i915/Makefile      |   1 +
>>  drivers/gpu/drm/i915/i915_module.c | 113 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/i915/i915_pci.c    | 117 +----------------------------
>>  drivers/gpu/drm/i915/i915_pci.h    |   8 ++
>>  4 files changed, 125 insertions(+), 114 deletions(-)
>>  create mode 100644 drivers/gpu/drm/i915/i915_module.c
>>  create mode 100644 drivers/gpu/drm/i915/i915_pci.h
>>=20
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefi=
le
>> index 9022dc638ed6..4ebd9f417ddb 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -38,6 +38,7 @@ i915-y +=3D i915_drv.o \
>>  	  i915_irq.o \
>>  	  i915_getparam.o \
>>  	  i915_mitigations.o \
>> +	  i915_module.o \
>>  	  i915_params.o \
>>  	  i915_pci.o \
>>  	  i915_scatterlist.o \
>> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i=
915_module.c
>> new file mode 100644
>> index 000000000000..c578ea8f56a0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/i915_module.c
>> @@ -0,0 +1,113 @@
>> +/*
>> + * SPDX-License-Identifier: MIT
>> + *
>> + * Copyright =C2=A9 2021 Intel Corporation
>> + */
>> +
>> +#include <linux/console.h>
>> +
>> +#include "gem/i915_gem_context.h"
>> +#include "gem/i915_gem_object.h"
>> +#include "i915_active.h"
>> +#include "i915_buddy.h"
>> +#include "i915_params.h"
>> +#include "i915_pci.h"
>> +#include "i915_perf.h"
>> +#include "i915_request.h"
>> +#include "i915_scheduler.h"
>> +#include "i915_selftest.h"
>> +#include "i915_vma.h"
>> +
>> +static int i915_check_nomodeset(void)
>> +{
>> +	bool use_kms =3D true;
>> +
>> +	/*
>> +	 * Enable KMS by default, unless explicitly overriden by
>> +	 * either the i915.modeset prarameter or by the
>> +	 * vga_text_mode_force boot option.
>> +	 */
>> +
>> +	if (i915_modparams.modeset =3D=3D 0)
>> +		use_kms =3D false;
>> +
>> +	if (vgacon_text_force() && i915_modparams.modeset =3D=3D -1)
>> +		use_kms =3D false;
>> +
>> +	if (!use_kms) {
>> +		/* Silently fail loading to not upset userspace. */
>> +		DRM_DEBUG_DRIVER("KMS disabled.\n");
>> +		return 1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct {
>> +   int (*init)(void);
>> +   void (*exit)(void);
>> +} init_funcs[] =3D {
>> +	{ i915_check_nomodeset, NULL },
>> +	{ i915_active_module_init, i915_active_module_exit },
>> +	{ i915_buddy_module_init, i915_buddy_module_exit },
>> +	{ i915_context_module_init, i915_context_module_exit },
>> +	{ i915_gem_context_module_init, i915_gem_context_module_exit },
>> +	{ i915_objects_module_init, i915_objects_module_exit },
>> +	{ i915_request_module_init, i915_request_module_exit },
>> +	{ i915_scheduler_module_init, i915_scheduler_module_exit },
>> +	{ i915_vma_module_init, i915_vma_module_exit },
>> +	{ i915_mock_selftests, NULL },
>> +	{ i915_pmu_init, i915_pmu_exit },
>> +	{ i915_register_pci_driver, i915_unregister_pci_driver },
>> +	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
>> +};
>> +static int init_progress;
>> +
>> +static int __init i915_init(void)
>> +{
>> +	int err, i;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(init_funcs); i++) {
>> +		err =3D init_funcs[i].init();
>> +		if (err < 0) {
>> +			while (i--) {
>> +				if (init_funcs[i].exit)
>> +					init_funcs[i].exit();
>> +			}
>> +			return err;
>> +		} else if (err > 0) {
>> +			/*
>> +			 * Early-exit success is reserved for things which
>> +			 * don't have an exit() function because we have no
>> +			 * idea how far they got or how to partially tear
>> +			 * them down.
>> +			 */
>> +			WARN_ON(init_funcs[i].exit);
>> +			break;
>> +		}
>> +	}
>> +
>> +	init_progress =3D i;
>> +
>> +	return 0;
>> +}
>> +
>> +static void __exit i915_exit(void)
>> +{
>> +	int i;
>> +
>> +	for (i =3D init_progress - 1; i >=3D 0; i--) {
>> +		GEM_BUG_ON(i >=3D ARRAY_SIZE(init_funcs));
>> +		if (init_funcs[i].exit)
>> +			init_funcs[i].exit();
>> +	}
>> +}
>> +
>> +module_init(i915_init);
>> +module_exit(i915_exit);
>> +
>> +MODULE_AUTHOR("Tungsten Graphics, Inc.");
>> +MODULE_AUTHOR("Intel Corporation");
>> +
>> +MODULE_DESCRIPTION(DRIVER_DESC);
>> +MODULE_LICENSE("GPL and additional rights");
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915=
_pci.c
>> index b4f5e88aaae6..08651ca03478 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -22,24 +22,13 @@
>>   *
>>   */
>>=20=20
>> -#include <linux/console.h>
>>  #include <linux/vga_switcheroo.h>
>>=20=20
>>  #include <drm/drm_drv.h>
>>  #include <drm/i915_pciids.h>
>>=20=20
>> -#include "display/intel_fbdev.h"
>> -
>> -#include "i915_active.h"
>> -#include "i915_buddy.h"
>>  #include "i915_drv.h"
>> -#include "gem/i915_gem_context.h"
>> -#include "gem/i915_gem_object.h"
>> -#include "i915_request.h"
>> -#include "i915_perf.h"
>> -#include "i915_selftest.h"
>> -#include "i915_scheduler.h"
>> -#include "i915_vma.h"
>> +#include "i915_pci.h"
>>=20=20
>>  #define PLATFORM(x) .platform =3D (x)
>>  #define GEN(x) \
>> @@ -1251,31 +1240,6 @@ static void i915_pci_shutdown(struct pci_dev *pde=
v)
>>  	i915_driver_shutdown(i915);
>>  }
>>=20=20
>> -static int i915_check_nomodeset(void)
>> -{
>> -	bool use_kms =3D true;
>> -
>> -	/*
>> -	 * Enable KMS by default, unless explicitly overriden by
>> -	 * either the i915.modeset prarameter or by the
>> -	 * vga_text_mode_force boot option.
>> -	 */
>> -
>> -	if (i915_modparams.modeset =3D=3D 0)
>> -		use_kms =3D false;
>> -
>> -	if (vgacon_text_force() && i915_modparams.modeset =3D=3D -1)
>> -		use_kms =3D false;
>> -
>> -	if (!use_kms) {
>> -		/* Silently fail loading to not upset userspace. */
>> -		DRM_DEBUG_DRIVER("KMS disabled.\n");
>> -		return 1;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>>  static struct pci_driver i915_pci_driver =3D {
>>  	.name =3D DRIVER_NAME,
>>  	.id_table =3D pciidlist,
>> @@ -1285,87 +1249,12 @@ static struct pci_driver i915_pci_driver =3D {
>>  	.driver.pm =3D &i915_pm_ops,
>>  };
>>=20=20
>> -static int i915_register_pci_driver(void)
>> +int i915_register_pci_driver(void)
>>  {
>>  	return pci_register_driver(&i915_pci_driver);
>>  }
>>=20=20
>> -static void i915_unregister_pci_driver(void)
>> +void i915_unregister_pci_driver(void)
>>  {
>>  	pci_unregister_driver(&i915_pci_driver);
>>  }
>> -
>> -static const struct {
>> -   int (*init)(void);
>> -   void (*exit)(void);
>> -} init_funcs[] =3D {
>> -	{ i915_check_nomodeset, NULL },
>> -	{ i915_active_module_init, i915_active_module_exit },
>> -	{ i915_buddy_module_init, i915_buddy_module_exit },
>> -	{ i915_context_module_init, i915_context_module_exit },
>> -	{ i915_gem_context_module_init, i915_gem_context_module_exit },
>> -	{ i915_objects_module_init, i915_objects_module_exit },
>> -	{ i915_request_module_init, i915_request_module_exit },
>> -	{ i915_scheduler_module_init, i915_scheduler_module_exit },
>> -	{ i915_vma_module_init, i915_vma_module_exit },
>> -	{ i915_mock_selftests, NULL },
>> -	{ i915_pmu_init, i915_pmu_exit },
>> -	{ i915_register_pci_driver, i915_unregister_pci_driver },
>> -	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
>> -};
>> -static int init_progress;
>> -
>> -static int __init i915_init(void)
>> -{
>> -	int err, i;
>> -
>> -	for (i =3D 0; i < ARRAY_SIZE(init_funcs); i++) {
>> -		err =3D init_funcs[i].init();
>> -		if (err < 0) {
>> -			while (i--) {
>> -				if (init_funcs[i].exit)
>> -					init_funcs[i].exit();
>> -			}
>> -			return err;
>> -		} else if (err > 0) {
>> -			/*
>> -			 * Early-exit success is reserved for things which
>> -			 * don't have an exit() function because we have no
>> -			 * idea how far they got or how to partially tear
>> -			 * them down.
>> -			 */
>> -			WARN_ON(init_funcs[i].exit);
>> -
>> -			/*
>> -			 * We don't want to advertise devices with an only
>> -			 * partially initialized driver.
>> -			 */
>> -			WARN_ON(i915_pci_driver.driver.owner);
>> -			break;
>> -		}
>> -	}
>> -
>> -	init_progress =3D i;
>> -
>> -	return 0;
>> -}
>> -
>> -static void __exit i915_exit(void)
>> -{
>> -	int i;
>> -
>> -	for (i =3D init_progress - 1; i >=3D 0; i--) {
>> -		GEM_BUG_ON(i >=3D ARRAY_SIZE(init_funcs));
>> -		if (init_funcs[i].exit)
>> -			init_funcs[i].exit();
>> -	}
>> -}
>> -
>> -module_init(i915_init);
>> -module_exit(i915_exit);
>> -
>> -MODULE_AUTHOR("Tungsten Graphics, Inc.");
>> -MODULE_AUTHOR("Intel Corporation");
>> -
>> -MODULE_DESCRIPTION(DRIVER_DESC);
>> -MODULE_LICENSE("GPL and additional rights");
>> diff --git a/drivers/gpu/drm/i915/i915_pci.h b/drivers/gpu/drm/i915/i915=
_pci.h
>> new file mode 100644
>> index 000000000000..b386f319f52e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/i915_pci.h
>> @@ -0,0 +1,8 @@
>> +/*
>> + * SPDX-License-Identifier: MIT
>> + *
>> + * Copyright =C2=A9 2021 Intel Corporation
>> + */
>> +
>> +int i915_register_pci_driver(void);
>> +void i915_unregister_pci_driver(void);

--=20
Jani Nikula, Intel Open Source Graphics Center
