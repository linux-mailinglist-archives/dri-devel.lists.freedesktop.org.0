Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E7B7B7D84
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 12:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB0210E0F9;
	Wed,  4 Oct 2023 10:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8966B10E0F9;
 Wed,  4 Oct 2023 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696416600; x=1727952600;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6UAhSoaUjDzm+Zbx1bJUFW59xwnISO0PKjJwLgQMqZY=;
 b=dvA4P9smn7fI6N+MSZtT/MgcHqimnzxfPXdrsr2VR73BOtwaAUpETHpI
 pZ4GBuwWwvN2UPZelDp2XmVBSUgC8knraFEcd4/nZP9Ggiz/a6OZBbafN
 Mc6/8a6JCDYzwIsfaWuaOYJOKCYrXEpxIQG3zETYX0sUFpIBod4iwo96n
 fA+vfMx62klpR7jjmU4paApEZkp2KBj8486Q+S8A4VGCP/0maARfrWkzR
 IN/ii+h6altkE+09OcAfXp2SmdzjGc0QCLbxxqy+BU7eQsU6cFvB8LrNO
 rMv7GK3ObJDoEBtVS8RhC7SquHsGiqwsjcbC5ucYGeCwsDKaVQKFSHtsi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="380408304"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="380408304"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 03:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="727952010"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="727952010"
Received: from mridgewa-mobl.ger.corp.intel.com (HELO [10.213.209.90])
 ([10.213.209.90])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 03:49:50 -0700
Message-ID: <eefc8c62-1ac5-6604-2ee5-576ca87c2be5@linux.intel.com>
Date: Wed, 4 Oct 2023 11:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [RFC PATCH] drm/i915/gt: Do not treat MCR locking
 timeouts as errors
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20231004094357.634895-1-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20231004094357.634895-1-andi.shyti@linux.intel.com>
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
Cc: gregory.f.germano@intel.com, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/10/2023 10:43, Andi Shyti wrote:
> The MCR steering semaphore is a shared lock entry between i915
> and various firmware components.
> 
> Getting the lock might sinchronize on some shared resources.
> Sometimes though, it might happen that the firmware forgets to
> unlock causing unnecessary noise in the driver which keeps doing
> what was supposed to do, ignoring the problem.
> 
> Do not consider this failure as an error, but just print a debug
> message stating that the MCR locking has been skipped.
> 
> On the driver side we still have spinlocks that make sure that
> the access to the resources is serialized.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index 326c2ed1d99b..51eb693df39b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -395,10 +395,8 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>   	 * would indicate some hardware/firmware is misbehaving and not
>   	 * releasing it properly.
>   	 */
> -	if (err == -ETIMEDOUT) {
> -		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
> -		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
> -	}
> +	if (err == -ETIMEDOUT)
> +		gt_dbg(gt, "hardware MCR steering semaphore timed out");
>   }
>   
>   /**

Are we sure this does not warrant a level higher than dbg, such as 
notice/warn? Because how can we be sure the two entities will not stomp 
on each other toes if we failed to obtain lock? (How can we be sure 
about "forgot to unlock" vs "in prolonged active use"? Or if we can be 
sure, can we force unlock and take the lock for the driver explicitly?)

Regards,

Tvrtko
