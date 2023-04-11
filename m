Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CF56DD2CB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 08:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2CA10E4B5;
	Tue, 11 Apr 2023 06:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E0110E4B9;
 Tue, 11 Apr 2023 06:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681194610; x=1712730610;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hJXyQc8Ux6zE5uWjzHqikCNDXfD9NvEam2DDgAfzuP4=;
 b=Or9TcWxY/KY4Qrrfb0moczHu/DSIbjvD9e2Qcqciqq1zB+dWg5D/Fk3E
 MOdHRlzZbx82adsoaS7CdjEisUhzeLLbY9aVcXN2ApazIcxSVXatxZSTk
 Ci4r2p4FJcEJ6feIhISy5/zta6YB93m5PvGiZVtqsRJL6T/L4IqwGiD8c
 FLQk8775wE/i9vDPqV7Zpyqyf27N8I1n0iYxVtzdwsVGtYqDWud0ry5TI
 cQ1poTkt7mnjQvd+b53kzrB5igQ54eXuIjbTjfATi/b6UyYrNbJXjN7kN
 yQluJeYbRaBceVIQsdh3VPinUPEj1exaJEg5+RJpfZtwYzyBCQcn1E7WX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="429826000"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="429826000"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 23:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="757701732"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="757701732"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.55.106])
 ([10.252.55.106])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 23:30:07 -0700
Message-ID: <7fc53d8f-a406-5bed-837c-f8023ed9dedb@linux.intel.com>
Date: Tue, 11 Apr 2023 08:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 2/5] drm/i915/gt: Add intel_context_timeline_is_locked
 helper
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20230308094106.203686-1-andi.shyti@linux.intel.com>
 <20230308094106.203686-3-andi.shyti@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230308094106.203686-3-andi.shyti@linux.intel.com>
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
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/8/2023 10:41 AM, Andi Shyti wrote:
> We have:
>
>   - intel_context_timeline_lock()
>   - intel_context_timeline_unlock()
>
> In the next patches we will also need:
>
>   - intel_context_timeline_is_locked()
>
> Add it.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   drivers/gpu/drm/i915/gt/intel_context.h | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index f919a66cebf5b..87d5e2d60b6db 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -265,6 +265,12 @@ static inline void intel_context_timeline_unlock(struct intel_timeline *tl)
>   	mutex_unlock(&tl->mutex);
>   }
>   
> +static inline void intel_context_assert_timeline_is_locked(struct intel_timeline *tl)
> +	__must_hold(&tl->mutex)
> +{
> +	lockdep_assert_held(&tl->mutex);
> +}
> +
>   int intel_context_prepare_remote_request(struct intel_context *ce,
>   					 struct i915_request *rq);
>   
