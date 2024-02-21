Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF34285D774
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 12:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5568810E701;
	Wed, 21 Feb 2024 11:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzsreXqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DDC10E24B;
 Wed, 21 Feb 2024 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708516348; x=1740052348;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YvfC8llTMCAcGE8Q1JeSDTobXs1jGFgVKKodKwCRVSg=;
 b=BzsreXqAW6u6UOjo7k/epP6L5vawcyQWkCb5KmVy7jsrk4U8DuLLfGL4
 cDl3HcCzDz69KohYuy1/N8VVdetPojAaVogOdIOWnl4eBauA3JGZKVtww
 HkCO7zPha5Hw/PhjBd4sJMY9oAWB+3VVmrXHfUrJoSjbG77BoAqqjkh80
 nYl6QEuViTFWlTyEe6m9AJ5ygKv/o1Y/0zL/esUzI7NPlR35dsuY8hgg5
 dt4vUvmQTXwR8E3HdiaSrdedPJpuPprLtKX0PrezrvtK79+C97QTC3uBZ
 YIgeg0rx/bdwSZrl2Aqydgtd6Cfa006Zen1HidcZ4CDMHYs+KW205zdbG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13371305"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="13371305"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 03:52:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="42589042"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.249])
 ([10.246.50.249])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 03:52:26 -0800
Message-ID: <3c1a25f9-b1ee-4832-a89c-68813cc72416@linux.intel.com>
Date: Wed, 21 Feb 2024 12:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: check before removing mm notifier
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 Shawn Lee <shawn.c.lee@intel.com>
References: <20240219125047.28906-1-nirmoy.das@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240219125047.28906-1-nirmoy.das@intel.com>
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

Merged it to drm-intel-gt-next with s/check/Check

On 2/19/2024 1:50 PM, Nirmoy Das wrote:
> Error in mmu_interval_notifier_insert() can leave a NULL
> notifier.mm pointer. Catch that and return early.
>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Shawn Lee <shawn.c.lee@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> index 0e21ce9d3e5a..61abfb505766 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -349,6 +349,9 @@ i915_gem_userptr_release(struct drm_i915_gem_object *obj)
>   {
>   	GEM_WARN_ON(obj->userptr.page_ref);
>   
> +	if (!obj->userptr.notifier.mm)
> +		return;
> +
>   	mmu_interval_notifier_remove(&obj->userptr.notifier);
>   	obj->userptr.notifier.mm = NULL;
>   }
