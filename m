Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E834FF3A0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E02510E44A;
	Wed, 13 Apr 2022 09:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E61F10E138;
 Wed, 13 Apr 2022 09:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649842537; x=1681378537;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=MT1Kf7edS218qgu1PUr9mXSGIu5bS3fCzq8ZJBUhQT4=;
 b=Lhnk/ynlFZSwPdOUratlwLW0vcSUsxEr3YpRFIXMAev668XfIWLJGgXb
 Kh5iVYwzhw4/lisJ1I2N2lyf00LcHWd3v+EIapo2Y04ZUTZ8l9EcIZhco
 OGRu4kencH+Y3bWrLqkcEaPsis15MNfvBKIgBI2PHJbcyXpBEyuCchGTb
 ZUbTYo31WFeC1B6rBYq15J7u3ee1mv+2W3QsztjZl9kfiCId9J1+zYAx9
 iptko6a1bajFKC8eIX0iEEoERjh4m5pGZp0pbM7aYtcoJZ80SRJGVKviT
 ongPZinGqwub/nL6bQgFdBHV33Y04LgMGASMsM9DfJsduPIKQIKD/kISF g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="323067113"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="323067113"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 02:31:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="573192674"
Received: from psoltysi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.160])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 02:31:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>, Zhi Wang
 <zhi.wang.linux@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>
Subject: Re: [PATCH v9 1/3] i915/gvt: Separate the MMIO tracking table from
 GVT-g
In-Reply-To: <986b8ff0-d0de-437c-8a56-c54aafb6159a@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220407071945.72148-1-zhi.a.wang@intel.com>
 <20220407071945.72148-2-zhi.a.wang@intel.com> <874k35541h.fsf@intel.com>
 <986b8ff0-d0de-437c-8a56-c54aafb6159a@intel.com>
Date: Wed, 13 Apr 2022 12:31:07 +0300
Message-ID: <87h76xgwis.fsf@intel.com>
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

On Fri, 08 Apr 2022, "Wang, Zhi A" <zhi.a.wang@intel.com> wrote:
> Hi Jani:
>
> Thanks so much for the help. Can you generate a new tag on
> drm-intel-next? I noticed that there was one patch moving the DMC
> related registers into display/intel_dmc_regs.h, which is not included
> in the latest tag on drm-intel-next.

Sorry, I'm not sure what you're asking exactly. We do tags when we
create pull requests for drm-next, but I don't see the connection to
gvt.

BR,
Jani.

>
> Guess it would be better that I can change this patch according to it
> when checking in. This would prevent a conflict in future.
>
> Thanks,
> Zhi.
>
> On 4/7/22 3:03 PM, Jani Nikula wrote:
>> On Thu, 07 Apr 2022, Zhi Wang <zhi.wang.linux@gmail.com> wrote:
>>> diff --git a/drivers/gpu/drm/i915/intel_gvt.h b/drivers/gpu/drm/i915/in=
tel_gvt.h
>>> index d7d3fb6186fd..7665d7cf0bdd 100644
>>> --- a/drivers/gpu/drm/i915/intel_gvt.h
>>> +++ b/drivers/gpu/drm/i915/intel_gvt.h
>>> @@ -26,7 +26,17 @@
>>>=20=20
>>>  struct drm_i915_private;
>>>=20=20
>>> +#include <linux/kernel.h>
>>=20
>> You only need <linux/types.h>. Please add it before the forward
>> declaration above.
>>=20
>>> +
>>>  #ifdef CONFIG_DRM_I915_GVT
>>> +
>>> +struct intel_gvt_mmio_table_iter {
>>> +	struct drm_i915_private *i915;
>>> +	void *data;
>>> +	int (*handle_mmio_cb)(struct intel_gvt_mmio_table_iter *iter,
>>> +			      u32 offset, u32 size);
>>> +};
>>> +
>>>  int intel_gvt_init(struct drm_i915_private *dev_priv);
>>>  void intel_gvt_driver_remove(struct drm_i915_private *dev_priv);
>>>  int intel_gvt_init_device(struct drm_i915_private *dev_priv);
>>> @@ -34,6 +44,7 @@ void intel_gvt_clean_device(struct drm_i915_private *=
dev_priv);
>>>  int intel_gvt_init_host(void);
>>>  void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv);
>>>  void intel_gvt_resume(struct drm_i915_private *dev_priv);
>>> +int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *ite=
r);
>>>  #else
>>>  static inline int intel_gvt_init(struct drm_i915_private *dev_priv)
>>>  {
>>> @@ -51,6 +62,16 @@ static inline void intel_gvt_sanitize_options(struct=
 drm_i915_private *dev_priv)
>>>  static inline void intel_gvt_resume(struct drm_i915_private *dev_priv)
>>>  {
>>>  }
>>> +
>>> +unsigned long intel_gvt_get_device_type(struct drm_i915_private *i915)
>>> +{
>>> +	return 0;
>>> +}
>>=20
>> The CONFIG_DRM_I915_GVT=3Dy counterpart for this is in mmio.h. Should be
>> both in the same header.
>>=20
>>> +
>>> +int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *ite=
r)
>>> +{
>>> +	return 0;
>>> +}
>>>  #endif
>>>=20=20
>>>  #endif /* _INTEL_GVT_H_ */
>>> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/=
drm/i915/intel_gvt_mmio_table.c
>>> new file mode 100644
>>> index 000000000000..d29491a6d209
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
>>> @@ -0,0 +1,1290 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright =C2=A9 2020 Intel Corporation
>>> + */
>>> +
>>> +#include "i915_drv.h"
>>> +#include "i915_reg.h"
>>> +#include "display/vlv_dsi_pll_regs.h"
>>> +#include "gt/intel_gt_regs.h"
>>> +#include "intel_mchbar_regs.h"
>>> +#include "i915_pvinfo.h"
>>> +#include "intel_gvt.h"
>>> +#include "gvt/gvt.h"
>>=20
>> Generally we have the include lists sorted.
>>=20
>> Other than the nitpicks above, the series is
>>=20
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>

--=20
Jani Nikula, Intel Open Source Graphics Center
