Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA6D5BAD40
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 14:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE62810ED1A;
	Fri, 16 Sep 2022 12:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F38710E41E;
 Fri, 16 Sep 2022 12:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663330740; x=1694866740;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rd+h64dIN3XFnpvE7OP/VvvgUrKcz8F8vCa/r6qf1z8=;
 b=YpcDzW5g7Th2o5dGhJmxnfo9unfUIUkQxfxob4H8k9FMVKG7lDsmM1Y3
 rdkyRHvNThkAvFmVOJdHTOuxGg9cBBdpStgGgt52PpbjZgci6tV1TfZuT
 8aWGIkd+wbcy8amSLsbjhPnedFXrbNAjIxefNbp+8cLqFoZdMbFR47NNg
 MeT7FY28Cbn5ADRE3qI0cfKgWtqNpK/sk5O5W78+xOnyqe0Udcnsxhz6s
 WIT75UFx+JsGGKU6CCRlcUN0+V1dOHDSkRBJ7lZW6OdXyBgOhcKPqmpAm
 ulebmi/Dy7IwaW8wIW90N91/ImYYMvr3YNHGb6yE3oHQSpYAEq+7XlG7t g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="298972565"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="298972565"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 05:18:59 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="595232786"
Received: from agiridha-mobl1.ger.corp.intel.com (HELO [10.213.204.25])
 ([10.213.204.25])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 05:18:57 -0700
Message-ID: <06d12020-66f0-74a6-b55e-cfe8f4ae3fe9@linux.intel.com>
Date: Fri, 16 Sep 2022 13:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/3] drm/etnaviv: export client GPU usage statistics via
 fdinfo
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220908181013.3214205-1-l.stach@pengutronix.de>
 <20220908181013.3214205-3-l.stach@pengutronix.de>
 <3a9627c5-498c-c749-77cd-f273f10e474e@linux.intel.com>
 <dab8a4227d7c9aa09c5d630f61f9659b427d8349.camel@pengutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <dab8a4227d7c9aa09c5d630f61f9659b427d8349.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/09/2022 10:50, Lucas Stach wrote:
> Hi Tvrtko,
> 
> Am Freitag, dem 16.09.2022 um 10:31 +0100 schrieb Tvrtko Ursulin:
>> Hi Lucas,
>>
>> On 08/09/2022 19:10, Lucas Stach wrote:
>>> This exposes a accumulated GPU active time per client via the
>>> fdinfo infrastructure.
>>>
>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>> ---
>>>    drivers/gpu/drm/etnaviv/etnaviv_drv.c | 38 ++++++++++++++++++++++++++-
>>>    1 file changed, 37 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>> index b69edb40ae2a..11b1f11fcb58 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
>>> @@ -22,6 +22,7 @@
>>>    #include "etnaviv_gem.h"
>>>    #include "etnaviv_mmu.h"
>>>    #include "etnaviv_perfmon.h"
>>> +#include "common.xml.h"
>>>    
>>>    /*
>>>     * DRM operations:
>>> @@ -471,7 +472,42 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
>>>    	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
>>>    };
>>>    
>>> -DEFINE_DRM_GEM_FOPS(fops);
>>> +static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
>>> +{
>>> +	struct drm_file *file = f->private_data;
>>> +	struct drm_device *dev = file->minor->dev;
>>> +	struct etnaviv_drm_private *priv = dev->dev_private;
>>> +	struct etnaviv_file_private *ctx = file->driver_priv;
>>> +	struct drm_printer p = drm_seq_file_printer(m);
>>
>> Any specific reason not to use seq_printf directly? (May be my ignorance.)
>>
> Not really, I just followed what msm was doing here.

Right, no strong feelings either way I just did not see the need to wrap 
it for this use case.

>>> +	int i;
>>> +
>>> +	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
>>> +	drm_printf(&p, "drm-client-id:\t%u\n", ctx->id);
>>> +
>>> +	for (i = 0; i < ETNA_MAX_PIPES; i++) {
>>> +                struct etnaviv_gpu *gpu = priv->gpu[i];
>>> +		char engine[8];
>>> +		int cur = 0;
>>
>> Alignment renders odd in my client.
> 
> I'll check that, might have messed up here.
>>
>>> +
>>> +		if (!gpu)
>>> +			continue;
>>
>> I'd stick a comment in here to the effect of "For text output format
>> description please see drm-usage-stats.rst!".
>>
>> Just to leave a breadcrumb putting some restraint on adding vendor
>> specific things which may be already covered by the common spec. To help
>> with common tools in the future as much as possible.
> 
> Yea, it was pretty to clear to me that we want the common format as
> much as possible when writing the patches, but it's a good idea to add
> a pointer for the future reader.

Thanks!

>>> +
>>> +		if (gpu->identity.features & chipFeatures_PIPE_2D)
>>> +			cur = snprintf(engine, sizeof(engine), "2D");
>>> +		if (gpu->identity.features & chipFeatures_PIPE_3D)
>>> +			cur = snprintf(engine + cur, sizeof(engine) - cur,
>>> +				       "%s3D", cur ? "/" : "");
>>> +
>>> +		drm_printf(&p, "drm-engine-%s:\t%llu ns\n", engine,
>>> +			   ctx->sched_entity[i].elapsed_ns);
>>
>> Two questions:
>>
>> 1)
>> So you have max four pipes, each can be either only 2d, 3d, or 2d/3d?
>> Can you have multiple of the same like 2x 3D? If you do, have you
>> considered exporting one drm-engine-% together with drm-engine-capacity-
>> for it?
>>
> The four pipes is a arbitrary driver limit. Etnaviv is a bit special in
> that it collects all Vivante GPUs present in a system into a single DRM
> device, each of those GPUs can be either 2D, 3D or a combined core with
> both 2D and 3D capabilities. In theory there could be multiple GPUs of
> each kind, but for now all real SoC designs we've come across only had
> a single one of each kind.
> 
> When we add support for a SoC that has multiple GPUs of one kind, I
> think exposing drm-engine-capacity, together with hooking them up to
> the load balancing in the scheduler is the right thing to do.
> 
>> 2)
>> Have you tried my, yet unmerged, vendor agnostic gputop tool with your
>> changes?
>>
>> https://patchwork.freedesktop.org/series/102175/
>>
>> It would be interesting to know if it works.
>>
> Yes, I did when working on this series. I had some crashes related to
> (I believe) double frees in the DRM client discovery, which I hadn't
> had time to investigate further. Seems there is a race, as I couldn't
> reproduce the crash when running with valgrind.
> 
> Other than that, the tool works for exposing the per-client GPU load on
> etnaviv.

Cool, at least some success.

Out of curiosity what is the planned consumer in etnaviv landscape?

Regards,

Tvrtko
