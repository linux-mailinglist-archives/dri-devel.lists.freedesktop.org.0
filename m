Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3A5490553
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 10:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0759B10E889;
	Mon, 17 Jan 2022 09:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3729610E8D4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 09:42:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 973C5101E;
 Mon, 17 Jan 2022 01:42:09 -0800 (PST)
Received: from [10.57.35.210] (unknown [10.57.35.210])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88DD73F766;
 Mon, 17 Jan 2022 01:42:08 -0800 (PST)
Subject: Re: [PATCH v2] drm/panfrost: initial dual core group GPUs support
To: Alexey Sheplyakov <asheplyakov@basealt.ru>, dri-devel@lists.freedesktop.org
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
 <20220115160658.582646-1-asheplyakov@basealt.ru>
From: Steven Price <steven.price@arm.com>
Message-ID: <a508f31b-3a1d-da48-364c-93e6e0eb4dbf@arm.com>
Date: Mon, 17 Jan 2022 09:42:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220115160658.582646-1-asheplyakov@basealt.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/01/2022 16:06, Alexey Sheplyakov wrote:
> On a dual core group GPUs (such as T628) fragment shading can be
> performed over all cores (because a fragment shader job doesn't
> need coherency between threads), however vertex shading requires
> to be run on the same core group as the tiler (which always lives
> in core group 0).
> 
> As a first step to support T628 power on only the first core group
> (so no jobs are scheduled on the second one). This makes T628 look
> like every other Midgard GPU (and throws away up to half the cores).
> 
> With this patch panfrost is able to drive T628 (r1p0) GPU on some
> armv8 SoCs (in particular BE-M1000). Without the patch rendering
> is horriby broken (desktop is completely unusable) and eventually
> the GPU locks up (it takes from a few seconds to a couple of
> minutes).
> 
> Using the second core group requires support in Mesa (and an UABI
> change): the userspace should
> 
> 1) set PANFROST_JD_DOESNT_NEED_COHERENCY_ON_GPU flag to opt-in
>    to allowing the job to run across all cores.
> 2) set PANFROST_RUN_ON_SECOND_CORE_GROUP flag to allow compute
>    jobs to be run on the second core group (at the moment Mesa
>    does not advertise compute support on anything older than
>    Mali T760)

Minor comment: these flags obviously don't exist yet, and I would prefer
some more thought went into the names before we merge a new UABI. I
picked overly verbose names (for the purposes of discussion) in the hope
that it was 'obvious' I hadn't thought about the names, but in hindsight
realise this perhaps wasn't obvious. As well as being too verbose, the
second name is missing the "_JD_" part of the prefix.

> 
> But there's little point adding such flags until someone (myself)
> steps up to do the Mesa work.
> 
> Signed-off-by: Alexey Sheplyakov <asheplyakov@basealt.ru>
> Signed-off-by: Vadim V. Vlasov <vadim.vlasov@elpitech.ru>
> Tested-by: Alexey Sheplyakov <asheplyakov@basealt.ru>

Since I basically wrote the patch you should have included a credit here
for me (see the developer certificate of origin[1]). But thank you for
writing up a detailed commit message.

I'll push to drm-misc-next with a Co-developed-by for me. Thanks for
testing the patch and good luck with the Mesa changes!

Thanks,

Steve

[1] https://developercertificate.org/

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 27 ++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index f8355de6e335..15cec831a99a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -320,19 +320,36 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>  {
>  	int ret;
>  	u32 val;
> +	u64 core_mask = U64_MAX;
>  
>  	panfrost_gpu_init_quirks(pfdev);
>  
> -	/* Just turn on everything for now */
> -	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present);
> +	if (pfdev->features.l2_present != 1) {
> +		/*
> +		 * Only support one core group now.
> +		 * ~(l2_present - 1) unsets all bits in l2_present except
> +		 * the bottom bit. (l2_present - 2) has all the bits in
> +		 * the first core group set. AND them together to generate
> +		 * a mask of cores in the first core group.
> +		 */
> +		core_mask = ~(pfdev->features.l2_present - 1) &
> +			     (pfdev->features.l2_present - 2);
> +		dev_info_once(pfdev->dev, "using only 1st core group (%lu cores from %lu)\n",
> +			      hweight64(core_mask),
> +			      hweight64(pfdev->features.shader_present));
> +	}
> +	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present & core_mask);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
> -		val, val == pfdev->features.l2_present, 100, 20000);
> +		val, val == (pfdev->features.l2_present & core_mask),
> +		100, 20000);
>  	if (ret)
>  		dev_err(pfdev->dev, "error powering up gpu L2");
>  
> -	gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
> +	gpu_write(pfdev, SHADER_PWRON_LO,
> +		  pfdev->features.shader_present & core_mask);
>  	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
> -		val, val == pfdev->features.shader_present, 100, 20000);
> +		val, val == (pfdev->features.shader_present & core_mask),
> +		100, 20000);
>  	if (ret)
>  		dev_err(pfdev->dev, "error powering up gpu shader");
>  
> 

