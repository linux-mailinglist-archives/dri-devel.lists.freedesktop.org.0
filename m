Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8995C6BE804
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 12:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FB310EEE0;
	Fri, 17 Mar 2023 11:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B299510EEE0;
 Fri, 17 Mar 2023 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679052389; x=1710588389;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vqMsTPk8plhoUiz1iEOFJveBEBB0w1qDxqF4BnaM46U=;
 b=PKNZ8+QLhr8PjLGg5v5/blBUfTcm652GuGwjwcnOG4vtewtf7v0elplt
 KoIdO6DMm34kiRWDcNhWD7qPLSbwpdyGd1xudwUW/X8VZ8CDnAIDco7mY
 TRL3BIOquxlJ8+Ao//JYPmUKhb0b5d1oUJa6UOzyzm6L1THsUNUjUqeDf
 zKwdA6skYCwFUxVkVYhnro3oQrXnZfpsGvkxKbQAUPQjb30cJT6AaVsjo
 yyrhZtdvjvaohZVF/LJ/v1x/rtNqhklv7DWqWCcs6BVD/ZCOkLSRuB8d+
 uJQbdzkef0/rOCBU28wEHs/jSzjElPfzivbLsAK+neuZmrnrsZxL+hsgV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="326599955"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="326599955"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 04:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854415167"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="854415167"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.63.160])
 ([10.252.63.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 04:26:27 -0700
Message-ID: <48d8ef01-f766-94c7-5035-54d91c797106@linux.intel.com>
Date: Fri, 17 Mar 2023 12:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] drm/i915/debugfs: Enable upper layer interfaces to
 act on all gt's
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20230301110258.2140955-1-andi.shyti@linux.intel.com>
 <20230301110258.2140955-3-andi.shyti@linux.intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230301110258.2140955-3-andi.shyti@linux.intel.com>
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
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/1/2023 12:02 PM, Andi Shyti wrote:
> The commit 82a149a62b6b5 ('drm/i915/gt: move remaining debugfs
> interfaces into gt') moved gt-related debugfs files in the gtX/
> directories to operate on individual gt's.
>
> However, the original files were only functioning on the root
> tile (tile 0) and have been left in the same location to maintain
> compatibility with userspace users.
>
> Add multiplexing functionality to the higher directories' files.
> This enables the operations to be performed on all the tiles with
> a single write. In the case of reads, the files provide an or'ed
> value across all the tiles.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>


Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/i915/i915_debugfs.c | 38 ++++++++++++++++++++++++++---
>   1 file changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 45773ce1deac2..90663f251fd10 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -575,14 +575,36 @@ static int i915_wa_registers(struct seq_file *m, void *unused)
>   static int i915_wedged_get(void *data, u64 *val)
>   {
>   	struct drm_i915_private *i915 = data;
> +	struct intel_gt *gt;
> +	unsigned int i;
>   
> -	return intel_gt_debugfs_reset_show(to_gt(i915), val);
> +	*val = 0;
> +
> +	for_each_gt(gt, i915, i) {
> +		int ret;
> +		u64 v;
> +
> +		ret = intel_gt_debugfs_reset_show(gt, &v);
> +		if (ret)
> +			return ret;
> +
> +		/* at least one tile should be wedged */
> +		*val |= !!v;
> +		if (*val)
> +			break;
> +	}
> +
> +	return 0;
>   }
>   
>   static int i915_wedged_set(void *data, u64 val)
>   {
>   	struct drm_i915_private *i915 = data;
> -	intel_gt_debugfs_reset_store(to_gt(i915), val);
> +	struct intel_gt *gt;
> +	unsigned int i;
> +
> +	for_each_gt(gt, i915, i)
> +		intel_gt_debugfs_reset_store(gt, val);
>   
>   	return 0;
>   }
> @@ -733,7 +755,11 @@ static int i915_sseu_status(struct seq_file *m, void *unused)
>   static int i915_forcewake_open(struct inode *inode, struct file *file)
>   {
>   	struct drm_i915_private *i915 = inode->i_private;
> -	intel_gt_pm_debugfs_forcewake_user_open(to_gt(i915));
> +	struct intel_gt *gt;
> +	unsigned int i;
> +
> +	for_each_gt(gt, i915, i)
> +		intel_gt_pm_debugfs_forcewake_user_open(gt);
>   
>   	return 0;
>   }
> @@ -741,7 +767,11 @@ static int i915_forcewake_open(struct inode *inode, struct file *file)
>   static int i915_forcewake_release(struct inode *inode, struct file *file)
>   {
>   	struct drm_i915_private *i915 = inode->i_private;
> -	intel_gt_pm_debugfs_forcewake_user_release(to_gt(i915));
> +	struct intel_gt *gt;
> +	unsigned int i;
> +
> +	for_each_gt(gt, i915, i)
> +		intel_gt_pm_debugfs_forcewake_user_release(gt);
>   
>   	return 0;
>   }
