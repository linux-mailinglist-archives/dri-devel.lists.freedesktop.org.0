Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B764FF494
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 12:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3BB10E34A;
	Wed, 13 Apr 2022 10:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AA410E1B9;
 Wed, 13 Apr 2022 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649845111; x=1681381111;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2Lzx5jk0JTXePgAYgCvddmJ1pcUn+U5GQV3wzqruP10=;
 b=bqeb1+WJcG2KcSCLPmdaeeCYQi+HALiT+x2grNDPjn+RsQDbPXIHDPBt
 d5EKck7v8aYOz2lgh/+WAIPD4jB1YkATj3XPvRW33tHLn0UKvjLvlVEsV
 bTaxPu8uIgakAVanweZmEVu2FAi1xJlHWfrcajDNJiZNvBQu7WlMiWux+
 bLZliYKTcGEbbqmi4DnZLZJ7YDHqfKttQmSAcqYpAvl9d/9pLctrhd7WY
 NcPVPl9m+HS1CvoQveLpGy8G/HC7C8oevIpfeIMJptQHmRi4d89Oq2JeL
 jY3ej2ASv96DpIh8lEeIFde6KL6VTboD1g5ssTnXc+U1iu6Yqj5qOWK0Z g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="261477764"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="261477764"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 03:18:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="573207523"
Received: from psoltysi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.160])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 03:18:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
In-Reply-To: <60f369bf-c631-99e9-4bde-f5d200aa388a@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220407071945.72148-1-zhi.a.wang@intel.com>
 <20220407071945.72148-2-zhi.a.wang@intel.com> <874k35541h.fsf@intel.com>
 <986b8ff0-d0de-437c-8a56-c54aafb6159a@intel.com>
 <87h76xgwis.fsf@intel.com>
 <60f369bf-c631-99e9-4bde-f5d200aa388a@intel.com>
Date: Wed, 13 Apr 2022 13:18:25 +0300
Message-ID: <87czhlguby.fsf@intel.com>
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
Cc: Zhi Wang <zhi.a.wang@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Apr 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
> Hi Jani:
>
> Previously when I sent a pull request, it will be top of a tag in drm-int=
el-next. The following patches move the DMC related registers, which is use=
d by GVT-g into intel_dmc_regs.h and it is not included in the latest tag.=
=20
>
> commit 9c67d9e84c7d4a3a2371a54ee2dddc4699002000
> Author: Jani Nikula <jani.nikula@intel.com>
> Date:   Wed Mar 30 14:34:17 2022 +0300
>
>     drm/i915/dmc: split out dmc registers to a separate file
>=20=20=20=20=20
>     Clean up the massive i915_reg.h a bit with this isolated set of
>     registers.
>=20=20=20=20=20
>     v2: Remove stale comment (Lucas)
>=20=20=20=20=20
>     Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>     Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20220330113417.22=
0964-3-jani.nikula@intel.com
>
> If I still sent the pull request based on the latest tag, after the pull =
got merged, the compiling of the GVT-g module will be broken, as a new head=
er needs to be included.
>
> Can I sent my pull request not based on a tag in drm-intel-next, just the=
 latest drm-intel-next?

Yes.

I think you can also backmerge drm-intel-next to your branch whenever
there's a dependency you need, or otherwise want to sync up. (Please do
*not* backmerge drm-intel-gt-next or drm-next directly.)


BR,
Jani.

>
> Thanks,
> Zhi.
>
> On 4/13/22 9:31 AM, Jani Nikula wrote:
>> On Fri, 08 Apr 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
>>> Hi Jani:
>>>
>>> Thanks so much for the help. Can you generate a new tag on
>>> drm-intel-next? I noticed that there was one patch moving the DMC
>>> related registers into display/intel_dmc_regs.h, which is not included
>>> in the latest tag on drm-intel-next.
>>=20
>> Sorry, I'm not sure what you're asking exactly. We do tags when we
>> create pull requests for drm-next, but I don't see the connection to
>> gvt.
>>=20
>> BR,
>> Jani.
>>=20
>>>
>>> Guess it would be better that I can change this patch according to it
>>> when checking in. This would prevent a conflict in future.
>>>
>>> Thanks,
>>> Zhi.
>>>
>>> On 4/7/22 3:03 PM, Jani Nikula wrote:
>>>> On Thu, 07 Apr 2022, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
>>>>> diff --git a/drivers/gpu/drm/i915/intel_gvt.h b/drivers/gpu/drm/i915/=
intel_gvt.h
>>>>> index d7d3fb6186fd..7665d7cf0bdd 100644
>>>>> --- a/drivers/gpu/drm/i915/intel_gvt.h
>>>>> +++ b/drivers/gpu/drm/i915/intel_gvt.h
>>>>> @@ -26,7 +26,17 @@
>>>>>=20=20
>>>>>  struct drm_i915_private;
>>>>>=20=20
>>>>> +#include <linux/kernel.h>
>>>>
>>>> You only need <linux/types.h>. Please add it before the forward
>>>> declaration above.
>>>>
>>>>> +
>>>>>  #ifdef CONFIG_DRM_I915_GVT
>>>>> +
>>>>> +struct intel_gvt_mmio_table_iter {
>>>>> +	struct drm_i915_private *i915;
>>>>> +	void *data;
>>>>> +	int (*handle_mmio_cb)(struct intel_gvt_mmio_table_iter *iter,
>>>>> +			      u32 offset, u32 size);
>>>>> +};
>>>>> +
>>>>>  int intel_gvt_init(struct drm_i915_private *dev_priv);
>>>>>  void intel_gvt_driver_remove(struct drm_i915_private *dev_priv);
>>>>>  int intel_gvt_init_device(struct drm_i915_private *dev_priv);
>>>>> @@ -34,6 +44,7 @@ void intel_gvt_clean_device(struct drm_i915_private=
 *dev_priv);
>>>>>  int intel_gvt_init_host(void);
>>>>>  void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv);
>>>>>  void intel_gvt_resume(struct drm_i915_private *dev_priv);
>>>>> +int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *i=
ter);
>>>>>  #else
>>>>>  static inline int intel_gvt_init(struct drm_i915_private *dev_priv)
>>>>>  {
>>>>> @@ -51,6 +62,16 @@ static inline void intel_gvt_sanitize_options(stru=
ct drm_i915_private *dev_priv)
>>>>>  static inline void intel_gvt_resume(struct drm_i915_private *dev_pri=
v)
>>>>>  {
>>>>>  }
>>>>> +
>>>>> +unsigned long intel_gvt_get_device_type(struct drm_i915_private *i91=
5)
>>>>> +{
>>>>> +	return 0;
>>>>> +}
>>>>
>>>> The CONFIG_DRM_I915_GVT=3Dy counterpart for this is in mmio.h. Should =
be
>>>> both in the same header.
>>>>
>>>>> +
>>>>> +int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *i=
ter)
>>>>> +{
>>>>> +	return 0;
>>>>> +}
>>>>>  #endif
>>>>>=20=20
>>>>>  #endif /* _INTEL_GVT_H_ */
>>>>> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gp=
u/drm/i915/intel_gvt_mmio_table.c
>>>>> new file mode 100644
>>>>> index 000000000000..d29491a6d209
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
>>>>> @@ -0,0 +1,1290 @@
>>>>> +// SPDX-License-Identifier: MIT
>>>>> +/*
>>>>> + * Copyright =C2=A9 2020 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#include "i915_drv.h"
>>>>> +#include "i915_reg.h"
>>>>> +#include "display/vlv_dsi_pll_regs.h"
>>>>> +#include "gt/intel_gt_regs.h"
>>>>> +#include "intel_mchbar_regs.h"
>>>>> +#include "i915_pvinfo.h"
>>>>> +#include "intel_gvt.h"
>>>>> +#include "gvt/gvt.h"
>>>>
>>>> Generally we have the include lists sorted.
>>>>
>>>> Other than the nitpicks above, the series is
>>>>
>>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>>>
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>
>>>
>>=20
>

--=20
Jani Nikula, Intel Open Source Graphics Center
