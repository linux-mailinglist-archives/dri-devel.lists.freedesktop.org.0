Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918054DB7A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4718D10E565;
	Thu, 16 Jun 2022 07:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038F010E2B8;
 Thu, 16 Jun 2022 07:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655364350; x=1686900350;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=laArYtF8mBOjJYoElswvAL3XNiFY/jmqVMM9+bukyLs=;
 b=N/D9J/pRNpjfivPeL0XRUtwuRrdTUTBvGwng7+95D1hxuMMSyMFTcqHj
 pwIStyJZr1OzPQqqIWbzLGfu1XbYofxqNhDp0mo7cC9dnjUPyxrZKOHEY
 PU4kt0/i+6tVRnou2FTqCkjBx/PbYca+16ORrOmdg/uNEmd7bKkBOK9f2
 85JyWc9/7B8FSdeVpn3+dSpjuND0WYgckAXl2mbMyDjxfetZgRm9ReFe+
 dZjd7uEQjqK9LEqUxVCL2nt9qcurlY/KODYNDmNnNljJDXXlRIH1OghnA
 RvHkWhyNXw5/Ue+/p81eIp0g6CxvAFJ2MrS+UsAgl3PLPOWmCR3NivfF1 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="280221417"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="280221417"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 00:25:49 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="912045889"
Received: from mstokes1-mobl.ger.corp.intel.com (HELO [10.213.198.82])
 ([10.213.198.82])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 00:25:44 -0700
Message-ID: <fb554850-e8f2-f136-fe80-4664719f8312@linux.intel.com>
Date: Thu, 16 Jun 2022 08:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/6] drm/i915/gt: Skip TLB invalidations once wedged
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1655306128.git.mchehab@kernel.org>
 <9d9e663ca8e97becf04e1d4c8cb8a9a1f397a5f1.1655306128.git.mchehab@kernel.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <9d9e663ca8e97becf04e1d4c8cb8a9a1f397a5f1.1655306128.git.mchehab@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Fei Yang <fei.yang@intel.com>, Chris Wilson <chris.p.wilson@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, mauro.chehab@linux.intel.com,
 =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/06/2022 16:27, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Skip all further TLB invalidations once the device is wedged and
> had been reset, as, on such cases, it can no longer process instructions
> on the GPU and the user no longer has access to the TLB's in each engine.
> 
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")

Are there any real problems fixed or it's just a logical thing to do? 
Not much harm tagging it as fixes in terms of process since it is tiny 
but, again, wanting a clear picture.

Regards,

Tvrtko

> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: stable@vger.kernel.org
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> See [PATCH 0/6] at: https://lore.kernel.org/all/cover.1655306128.git.mchehab@kernel.org/
> 
>   drivers/gpu/drm/i915/gt/intel_gt.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 61b7ec5118f9..fb4fd5273ca4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1226,6 +1226,9 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>   	if (I915_SELFTEST_ONLY(gt->awake == -ENODEV))
>   		return;
>   
> +	if (intel_gt_is_wedged(gt))
> +		return;
> +
>   	if (GRAPHICS_VER(i915) == 12) {
>   		regs = gen12_regs;
>   		num = ARRAY_SIZE(gen12_regs);
