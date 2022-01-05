Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E68485014
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 10:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E535610E31E;
	Wed,  5 Jan 2022 09:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E85E10E188;
 Wed,  5 Jan 2022 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641375348; x=1672911348;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tJmHer9dQcSfb9MdfsFAwnEjtZkClXsZbspIP/rOk1s=;
 b=ANCXs+Ft2jdcAKAGchMNdfT8Gsg/eK6v909pnReHQx7yWxYxFqlw7HGl
 oq+0SG7HiSb1lmFJBvximc3lizjZHUrUx/7EOi1b2jLEqGUREbv8Y9YfM
 4jsqwmhzz2Gr8CMhMJHn+tI7odDAkBMJPM8onlXw/hMVTqB5NcwXsrh6B
 ZUIqTZ+ugT4BcKuLMpsV8hEHMNyEx0vl9/3CsFAqHlDQNteLAZ05y4vjM
 s7vPHOVF1gFH/KAtPNcVEGSxm85n0PZYiOB3+uF0GdRkodwHFouGigBpA
 /eMCjfsSqNX97bu1Z/oFMB5659Zy7MkeZVRtechTBey0rMELB2t4ejd+6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="328751784"
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; d="scan'208";a="328751784"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 01:35:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; d="scan'208";a="472427837"
Received: from jwebb-mobl1.ger.corp.intel.com (HELO [10.213.202.78])
 ([10.213.202.78])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 01:35:46 -0800
Message-ID: <3ae7e493-4b77-9e87-ca6f-34f85cab4ecb@linux.intel.com>
Date: Wed, 5 Jan 2022 09:35:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Lock timeline mutex directly in
 error path of eb_pin_timeline
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20220104233056.11245-1-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220104233056.11245-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/01/2022 23:30, Matthew Brost wrote:
> Don't use the interruptable version of the timeline mutex lock in the

interruptible

> error path of eb_pin_timeline as the cleanup must always happen.
> 
> v2:
>   (John Harrison)
>    - Don't check for interrupt during mutex lock
> 
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index e9541244027a..e96e133cbb1f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2516,9 +2516,9 @@ static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
>   				      timeout) < 0) {
>   			i915_request_put(rq);
>   
> -			tl = intel_context_timeline_lock(ce);
> +			mutex_lock(&ce->timeline->mutex);

On the other hand it is more user friendly to handle signals (which 
maybe does not matter in this case, not sure any longer how long hold 
time it can have) but there is also a question of consistency within the 
very function you are changing.

Apart from consistency, what about the parent-child magic 
intel_context_timeline_lock does and you wouldn't have here?

And what about the very existence of intel_context_timeline_lock as a 
component boundary separation API, if it is used inconsistently 
throughout i915_gem_execbuffer.c?

Regards,

Tvrtko

>   			intel_context_exit(ce);
> -			intel_context_timeline_unlock(tl);
> +			mutex_unlock(&ce->timeline->mutex);
>   
>   			if (nonblock)
>   				return -EWOULDBLOCK;
> 
