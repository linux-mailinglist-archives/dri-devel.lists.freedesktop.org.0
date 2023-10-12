Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722AC7C6AE1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 12:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB7E10E4A6;
	Thu, 12 Oct 2023 10:21:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDE810E4B5;
 Thu, 12 Oct 2023 10:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697106112; x=1728642112;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bIeryaFFXXqt7Z8m1hS0O8SIIr6EhuU+6Mco7+bFbtM=;
 b=UvYi1UN5deJfIiEHHT88r//nVEEaxgsz8H2C+mNa1bGHbNw3VyvX/7kh
 YuxjK0O4g5W23poc6WN8OWaPVVKyrowNk58NIjolDq2NDpdQqIIEUhvpU
 7IxZq9/CUNIpwfDtfIIwaz5jvwJbCn1mcpeSSR6ukPEyBzpIM/wpCjZPp
 gG3n+2dMq0teKgqklsWBiSHGB6RD/A5T4zH3B3XfR8KEzQLUC7yEjQ4DY
 Hx/FgK2z3nWAnb/LX81aFsyNRo2ZSR1BcfhlEdiNL6En1DOWwK6Do6zzJ
 zlqgJlLmcf31omV3NMk8DWLqYP4EYYH2w4ATj0oWTiGp5fSYdfsRuQM9P w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471144762"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="471144762"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844945996"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="844945996"
Received: from maloneyj-mobl.ger.corp.intel.com (HELO [10.213.239.225])
 ([10.213.239.225])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:21:50 -0700
Message-ID: <a13a3cc3-3aca-3a67-637c-01f46f1173a5@linux.intel.com>
Date: Thu, 12 Oct 2023 11:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Suppress 'ignoring reset
 notification' message
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230921182033.135448-1-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230921182033.135448-1-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/09/2023 19:20, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> If an active context has been banned (e.g. Ctrl+C killed) then it is
> likely to be reset as part of evicting it from the hardware. That
> results in a 'ignoring context reset notification: banned = 1'
> message at info level. This confuses/concerns people and makes them
> thing something has gone wrong when it hasn't.

Noticed the "confuses/concerns people" part while preparing the 6.7 pull 
request, and the fact there is no Fixes: tag. Is this something that 
would be worth sending to stable (manually and if yes could you do that 
please? If there were actual user bugs filed I guess.

Regards,

Tvrtko

> There is already a debug level message with essentially the same
> information. So drop the 'ignore' info level one and just add the
> 'ignore' flag to the debug level one instead (which will therefore not
> appear by default but will still show up in CI runs).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index cabdc645fcddb..da7331346df1f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4770,19 +4770,19 @@ static void guc_context_replay(struct intel_context *ce)
>   static void guc_handle_context_reset(struct intel_guc *guc,
>   				     struct intel_context *ce)
>   {
> +	bool capture = intel_context_is_schedulable(ce);
> +
>   	trace_intel_context_reset(ce);
>   
> -	guc_dbg(guc, "Got context reset notification: 0x%04X on %s, exiting = %s, banned = %s\n",
> +	guc_dbg(guc, "%s context reset notification: 0x%04X on %s, exiting = %s, banned = %s\n",
> +		capture ? "Got" : "Ignoring",
>   		ce->guc_id.id, ce->engine->name,
>   		str_yes_no(intel_context_is_exiting(ce)),
>   		str_yes_no(intel_context_is_banned(ce)));
>   
> -	if (likely(intel_context_is_schedulable(ce))) {
> +	if (capture) {
>   		capture_error_state(guc, ce);
>   		guc_context_replay(ce);
> -	} else {
> -		guc_info(guc, "Ignoring context reset notification of exiting context 0x%04X on %s",
> -			 ce->guc_id.id, ce->engine->name);
>   	}
>   }
>   
