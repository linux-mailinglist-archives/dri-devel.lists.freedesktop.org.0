Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167A81B5A3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 13:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C089A10E350;
	Thu, 21 Dec 2023 12:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC6410E0B6;
 Thu, 21 Dec 2023 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703161093; x=1734697093;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SKUk0bv/1HQwzUsvLDDh/3xZoubgUQofsy16/ivK1C8=;
 b=DN9E1H0kLjNtTlzdxRTD27qm8bejmsGzjK2aLbDN7o34COUPKhEzr91S
 JXZ90/slOEB9FiqpdVYjBngWAMZPhtYZ+u73/o+CfVooRRgDg3bFUtutw
 Hm/LyVd+7V0nBAwV6AZ/R7oFXnoBuoR7MLGUkllidFKtA7xu2Uvl1I8im
 AACL5hxCBDNRFigbB3IFYnEOFpNoBXWsQUqNtzWk7q1Gt1wmdyxRI6zfu
 JhHqAbvxm0EROUSEeUmg7pIi9SOKYuWFxb0+YJmKxGeuH7uSQZKZJyYAs
 Sl6DDZ2L2+Dz9bXDgKoKLh7sCvfVTas3+TLitFyVIXZ3tHXjXnz2GRixX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="395693059"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="395693059"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 04:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="726419269"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="726419269"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.32.218])
 ([10.246.32.218])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 04:18:10 -0800
Message-ID: <18b42bf9-c5ac-4387-b796-e90271426884@linux.intel.com>
Date: Thu, 21 Dec 2023 13:18:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/i915/guc: Use the ce_to_guc() wrapper whenever
 possible
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20231206204644.105064-1-andi.shyti@linux.intel.com>
 <20231206204644.105064-5-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20231206204644.105064-5-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/6/2023 9:46 PM, Andi Shyti wrote:
> Get the guc reference from the ce using the ce_to_guc() helper.
> Just a leftover from previous cleanups.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 4f51cc5f1604..3c7821ae9f0d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3513,7 +3513,7 @@ static inline void sub_context_inflight_prio(struct intel_context *ce,
>   
>   static inline void update_context_prio(struct intel_context *ce)
>   {
> -	struct intel_guc *guc = &ce->engine->gt->uc.guc;
> +	struct intel_guc *guc = ce_to_guc(ce);
>   	int i;
>   
>   	BUILD_BUG_ON(GUC_CLIENT_PRIORITY_KMD_HIGH != 0);
