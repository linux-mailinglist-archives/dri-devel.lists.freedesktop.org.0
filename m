Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69559901E15
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E77410E3B6;
	Mon, 10 Jun 2024 09:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBKeZFmH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778E310E060;
 Mon, 10 Jun 2024 09:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718011458; x=1749547458;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cQnD+xQ++NVQiCkP+j2fE1mmSwV3r/cpCWRWu0jZmRo=;
 b=fBKeZFmHu16WD7HXILrBw8mQ1sKCGcbIvVYJy/smIQabypJtkdqVJiRl
 ITsxhp0QNHwnnNUeSclG3XyrG4tCBq7DJx/5DIJfMy3n1oDjoavKRlzMh
 4JEQSXM2pOPTjOPO8oEV1EWi0xD/F+tluKFiBEZtR1mQthehkUKDKiA67
 UU9cpB6NR3iaC8S6bF4MNq8EjZiJT7uwjtnHa38/JjWqNLzBaoo36OISJ
 IzxQjNBf3F7vUgVlm22+tXcjvIja5279F/RoX5FePYDBJnhFsRhky4clo
 HlAY16INX2GsC2s9uIVVU8NKNZQX92PFundtgm+L/m9LZV0glr6m+CjDr g==;
X-CSE-ConnectionGUID: X5xV+WTeQNmeaE6IAVi7ng==
X-CSE-MsgGUID: xXCdKJvVQuyq2Ry0MlwlVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32196247"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="32196247"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 02:24:16 -0700
X-CSE-ConnectionGUID: ejRq6FctQlauRIbha0rOPg==
X-CSE-MsgGUID: SPNur1KHT36y+heWsJchGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="44134700"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.65])
 ([10.246.36.65])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 02:24:15 -0700
Message-ID: <4cc62e14-2775-44f3-9857-eaf9598074a5@linux.intel.com>
Date: Mon, 10 Jun 2024 11:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: debugfs: Evaluate forcewake usage within
 locks
To: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240607145131.217251-1-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240607145131.217251-1-andi.shyti@linux.intel.com>
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

Hi Andi,

On 6/7/2024 4:51 PM, Andi Shyti wrote:
> The forcewake count and domains listing is multi process critical
> and the uncore provides a spinlock for such cases.
>
> Lock the forcewake evaluation section in the fw_domains_show()
> debugfs interface.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

Needs a Fixes tag, below seems to be correct one.


Fixes: 9dd4b065446a ("drm/i915/gt: Move pm debug files into a gt aware 
debugfs")

Cc: <stable@vger.kernel.org> # v5.6+

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


Regards,

Nirmoy


> ---
>   drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 4fcba42cfe34..0437fd8217e0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -71,6 +71,8 @@ static int fw_domains_show(struct seq_file *m, void *data)
>   	struct intel_uncore_forcewake_domain *fw_domain;
>   	unsigned int tmp;
>   
> +	spin_lock_irq(&uncore->lock);
> +
>   	seq_printf(m, "user.bypass_count = %u\n",
>   		   uncore->user_forcewake_count);
>   
> @@ -79,6 +81,8 @@ static int fw_domains_show(struct seq_file *m, void *data)
>   			   intel_uncore_forcewake_domain_to_str(fw_domain->id),
>   			   READ_ONCE(fw_domain->wake_count));
>   
> +	spin_unlock_irq(&uncore->lock);
> +
>   	return 0;
>   }
>   DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(fw_domains);
