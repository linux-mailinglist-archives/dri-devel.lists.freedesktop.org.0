Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F767972C9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 15:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EFF10E040;
	Thu,  7 Sep 2023 13:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A9310E040
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 13:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694092566; x=1725628566;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4Zc2NSQczgzpNCTjAeZ+vgoDDV24z7zZmEzSqmTWoV8=;
 b=I1aOH/t85N/zY0htXS/ZjLmH03ZnMxbmxNJH7OYYwHraznREh0IVdT0L
 4q/A+62s742fIT2Rhx9fPCXGYwYJAfFmKhkIpBEliLSJp9jjXFkQ1kCb5
 dJ18RZ6cuFioYh7YFkgsy2xe8GU51afPynHA3aVOGuRCH2PC6SOjFo4l7
 TJTyxTTjlI32cIfQBTH86y5hQ1YtWoRsqpXH3vUoC+/Bbfl9DOaujWUD6
 BZ4fS1Y8D8qzj99uRq5ewgwAeVZ95F2NBtuaH0MBx4muVo2mQfPEEcAEu
 0Vfu00mgbbbcpDdeaxEPxJIIzH8ND7l08PEAz7HEndN5q7OA1F273vBVT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356825426"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="356825426"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 06:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691782245"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; d="scan'208";a="691782245"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 06:16:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Donald Robson <Donald.Robson@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Sarah
 Walker <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH v6 02/20] drm/gpuva_mgr: Helper to get range of unmap
 from a remap op.
In-Reply-To: <5b7f431f26eea296193d9e49ea85e0377e6ebcf0.camel@imgtec.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
 <20230906095542.3280699-3-sarah.walker@imgtec.com>
 <87a5tygoyx.fsf@intel.com>
 <5b7f431f26eea296193d9e49ea85e0377e6ebcf0.camel@imgtec.com>
Date: Thu, 07 Sep 2023 16:15:57 +0300
Message-ID: <877cp2gm42.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "hns@goldelico.com" <hns@goldelico.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>, "afd@ti.com" <afd@ti.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Matt Coster <Matt.Coster@imgtec.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Sep 2023, Donald Robson <Donald.Robson@imgtec.com> wrote:
> On Thu, 2023-09-07 at 15:14 +0300, Jani Nikula wrote:
>> On Wed, 06 Sep 2023, Sarah Walker <sarah.walker@imgtec.com> wrote:
>> > From: Donald Robson <donald.robson@imgtec.com>
>> > 
>> > Signed-off-by: Donald Robson <donald.robson@imgtec.com>
>> > ---
>> >  include/drm/drm_gpuva_mgr.h | 27 +++++++++++++++++++++++++++
>> >  1 file changed, 27 insertions(+)
>> > 
>> > diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
>> > index ed8d50200cc3..be7b3a6d7e67 100644
>> > --- a/include/drm/drm_gpuva_mgr.h
>> > +++ b/include/drm/drm_gpuva_mgr.h
>> > @@ -703,4 +703,31 @@ void drm_gpuva_remap(struct drm_gpuva *prev,
>> >  
>> >  void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
>> >  
>> > +/**
>> > + * drm_gpuva_op_remap_get_unmap_range() - Helper to get the start and range of
>> > + * the unmap stage of a remap op.
>> > + * @op: Remap op.
>> > + * @start_addr: Output pointer for the start of the required unmap.
>> > + * @range: Output pointer for the length of the required unmap.
>> > + *
>> > + * These parameters can then be used by the caller to unmap memory pages that
>> > + * are no longer required.
>> > + */
>> > +static __always_inline void
>> 
>> IMO __always_inline *always* requires a justification in the commit
>> message.
>> 
>> BR,
>> Jani.
>
> Hi Jani,
> I went with __always_inline because I can't see this being used more than once per driver.
> I can add that to the commit message, but is that suitable justification? I could move
> it to the source file or make it a macro if you prefer.

My personal opinion is that static inlines in general should always have
a performance justification. If there isn't one, it should be a regular
function. Static inlines leak the abstractions and often make the header
dependencies worse.

Not everyone agrees, of course.

More than anything I was looking for justification on __always_inline
rather than just inline, though.


BR,
Jani.



> Thanks,
> Donald
>> 
>> 
>> > +drm_gpuva_op_remap_get_unmap_range(const struct drm_gpuva_op_remap *op,
>> > +				   u64 *start_addr, u64 *range)
>> > +{
>> > +	const u64 va_start = op->prev ?
>> > +			     op->prev->va.addr + op->prev->va.range :
>> > +			     op->unmap->va->va.addr;
>> > +	const u64 va_end = op->next ?
>> > +			   op->next->va.addr :
>> > +			   op->unmap->va->va.addr + op->unmap->va->va.range;
>> > +
>> > +	if (start_addr)
>> > +		*start_addr = va_start;
>> > +	if (range)
>> > +		*range = va_end - va_start;
>> > +}
>> > +
>> >  #endif /* __DRM_GPUVA_MGR_H__ */

-- 
Jani Nikula, Intel Open Source Graphics Center
