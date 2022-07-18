Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4209578427
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 15:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82441112E31;
	Mon, 18 Jul 2022 13:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC3C112E79;
 Mon, 18 Jul 2022 13:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658151928; x=1689687928;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lWXZGlmG3SNmi4VM7l9EBpLyUGbO7uiW4f5tn6p4HqY=;
 b=E5RxZE5aWk2mGtLAZh3R0bdZs4Lh4cwqJ0hWVrbRO/AogLiv8ugBcnu8
 u4qILb9Ge7i+CBHb8QUo4WeyecGVgE4JK/3TFAdxt+Crjc8xgZfCOR0hb
 gclBmLQ3VQkNV8IQBqs//PepE6RPdSHWR6YDagpfBIyDAETBo0Jx2YtPn
 7uIZKQPlw9Rjh8xaj/bUNZMQDXAtOaHP0GMv/tFkDYoMDbGDRhQ7HCzjM
 +bNXVgfcWkXkIzEBiJX4vmL1Gc6EwLMSi2dPWseTQHTr13GTTTHdXYlQ4
 GuEpfPPzpga0uN2aXVHlZs1Qw91Yt1AIAD3kAVUcfTzt3gMByfD7p7VcS g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="286963666"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="286963666"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 06:45:27 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="686739692"
Received: from smyint-mobl1.amr.corp.intel.com (HELO [10.212.107.15])
 ([10.212.107.15])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 06:45:24 -0700
Message-ID: <d51882e0-6864-7a49-ae16-f7213dc716c4@linux.intel.com>
Date: Mon, 18 Jul 2022 14:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 05/21] drm/i915/gt: Skip TLB invalidations once wedged
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1657800199.git.mchehab@kernel.org>
 <f20bd21c94610dae59824b8040e5a9400de6f963.1657800199.git.mchehab@kernel.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f20bd21c94610dae59824b8040e5a9400de6f963.1657800199.git.mchehab@kernel.org>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Fei Yang <fei.yang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/07/2022 13:06, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Skip all further TLB invalidations once the device is wedged and
> had been reset, as, on such cases, it can no longer process instructions
> on the GPU and the user no longer has access to the TLB's in each engine.
> 
> That helps to reduce the performance regression introduced by TLB
> invalidate logic.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")

Is the claim of a performance regression this solved based on a wedged 
GPU which does not work any more to the extend where mmio tlb 
invalidation requests keep timing out? If so please clarify in the 
commit text and then it looks good to me. Even if it is IMO a very 
borderline situation to declare something a fix.

Regards,

Tvrtko

> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/21] at: https://lore.kernel.org/all/cover.1657800199.git.mchehab@kernel.org/
> 
>   drivers/gpu/drm/i915/gt/intel_gt.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 1d84418e8676..5c55a90672f4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -934,6 +934,9 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>   	if (I915_SELFTEST_ONLY(gt->awake == -ENODEV))
>   		return;
>   
> +	if (intel_gt_is_wedged(gt))
> +		return;
> +
>   	if (GRAPHICS_VER(i915) == 12) {
>   		regs = gen12_regs;
>   		num = ARRAY_SIZE(gen12_regs);
