Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221F84F986D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 16:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497D210E4E1;
	Fri,  8 Apr 2022 14:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE80910E4E1;
 Fri,  8 Apr 2022 14:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649429013; x=1680965013;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TCl1CspgK2LcHmm3anNHycopIsR+mS7B2MMDGG152y8=;
 b=ky2AZhh6iUWIUL1w36mSoBSs6fDspgkOzfBL7dX7zr3NRGzqWsUk3GcF
 c1Jt3c0Y9uCc/WWfZ6sF2/GzAubb6YgCqLQlWUfnka1K+Ovf2i+RSjqJp
 la6eLDyxdsRgdR9hHhiRkfGqp/iO1o25vrcTonOG16ldnzbp+Ff1+JSaQ
 sFMwoa33p8JXiey/EtIf56PXOke3qgGq39zuKA2TLfxxmirw//v6E7ctT
 7HBZDgVLSnwO+gHPMprakYoPRdp3lvNB7eC3y/hH/sWjiE+umU3cqsy6o
 fzGQ0xeLZV//R1PeypkeNF0vz9K8or1thnFcH9Y953iPylNsXz1PUDCGy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="348044574"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="348044574"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 07:43:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="571508951"
Received: from khupperx-mobl2.ger.corp.intel.com (HELO [10.249.254.37])
 ([10.249.254.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 07:43:31 -0700
Message-ID: <bfd342f3-1b00-27be-b41f-c01418f31129@linux.intel.com>
Date: Fri, 8 Apr 2022 16:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/selftest: Always cancel
 semaphore on error
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220314182005.17071-1-ramalingam.c@intel.com>
 <20220314182005.17071-5-ramalingam.c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220314182005.17071-5-ramalingam.c@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/14/22 19:20, Ramalingam C wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
>
> Ensure that we always signal the semaphore when timing out, so that if it
> happens to be stuck waiting for the semaphore we will quickly recover
> without having to wait for a reset.
>
> Reported-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: CQ Tang <cq.tang@intel.com>
> cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gt/selftest_lrc.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index b9cc89de01bf..ae16668dd9d4 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -1435,18 +1435,17 @@ static int __lrc_isolation(struct intel_engine_cs *engine, u32 poison)
>   	}
>   
>   	err = poison_registers(B, poison, sema);
> -	if (err) {
> -		WRITE_ONCE(*sema, -1);
> -		i915_request_put(rq);
> -		goto err_result1;
> -	}
> -
> -	if (i915_request_wait(rq, 0, HZ / 2) < 0) {
> -		i915_request_put(rq);
> +	if (err == 0 && i915_request_wait(rq, 0, HZ / 2) < 0) {
> +		pr_err("%s(%s): wait for results timed out\n",
> +		       __func__, engine->name);
>   		err = -ETIME;
> -		goto err_result1;
>   	}
> +
> +	/* Always cancel the semaphore wait, just in case the GPU gets stuck */
> +	WRITE_ONCE(*sema, -1);
>   	i915_request_put(rq);
> +	if (err)
> +		goto err_result1;
>   
>   	err = compare_isolation(engine, ref, result, A, poison);
>   
