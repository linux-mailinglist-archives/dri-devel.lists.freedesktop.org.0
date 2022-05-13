Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC9525F8E
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 12:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334CA10E4A0;
	Fri, 13 May 2022 10:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0AB10E08A;
 Fri, 13 May 2022 10:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652436535; x=1683972535;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5i3oSmoCYG0z99aFLyfO1/Lffb6G3ID6DMGfB1vnRWE=;
 b=Ow1b4MWRgrwVXXhQocaum0ZojppucjRj9cu1VVyKt9G0a80RncJamK3v
 t8Pncl64FHNdakg6afH+Lq28BtmxXYu00QKQ1JYMftGu6go7Bkv6IUv9u
 VcJ4bh3b1YGrcN1fhWMZ0/ostcnu8aUXEhPP11ImBzQ5npYHBvjNXRbgF
 rQB9/W2c8PhLRq7jvSP+j+kfo7hyd6LX8cqIrcAPj2nMp03qQs6xPRNsX
 jrA+yynIomLoKf+76imCFzk5lnSRotAWHdDfdQFawHFTA4otVTxgTGOtd
 wwKZdv/E1/8uqiAZ6vKOEjbsZPLflO9hbiC2RgsPOL5jcimwyFsffVyKG g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="250170290"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="250170290"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 03:08:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="554167026"
Received: from cpazx-mobl.ger.corp.intel.com (HELO [10.213.209.239])
 ([10.213.209.239])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 03:08:52 -0700
Message-ID: <d7fc4f81-1a04-3633-5d6b-ebc35acb5c4a@linux.intel.com>
Date: Fri, 13 May 2022 11:08:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/i915: Fix CFI violation with show_dynamic_id()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20220512211704.3158759-1-nathan@kernel.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220512211704.3158759-1-nathan@kernel.org>
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
Cc: Kees Cook <keescook@chromium.org>, Tom Rix <trix@redhat.com>,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
 Sami Tolvanen <samitolvanen@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/05/2022 22:17, Nathan Chancellor wrote:
> When an attribute group is created with sysfs_create_group(), the
> ->sysfs_ops() callback is set to kobj_sysfs_ops, which sets the ->show()
> callback to kobj_attr_show(). kobj_attr_show() uses container_of() to
> get the ->show() callback from the attribute it was passed, meaning the
> ->show() callback needs to be the same type as the ->show() callback in
> 'struct kobj_attribute'.
> 
> However, show_dynamic_id() has the type of the ->show() callback in
> 'struct device_attribute', which causes a CFI violation when opening the
> 'id' sysfs node under drm/card0/metrics. This happens to work because
> the layout of 'struct kobj_attribute' and 'struct device_attribute' are
> the same, so the container_of() cast happens to allow the ->show()
> callback to still work.
> 
> Change the type of show_dynamic_id() to match the ->show() callback in
> 'struct kobj_attributes' and update the type of sysfs_metric_id to
> match, which resolves the CFI violation.
> 
> Fixes: f89823c21224 ("drm/i915/perf: Implement I915_PERF_ADD/REMOVE_CONFIG interface")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Merged to drm-intel-gt-next, thanks for the fix and reviews!

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/i915_perf.c       | 4 ++--
>   drivers/gpu/drm/i915/i915_perf_types.h | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 0a9c3fcc09b1..1577ab6754db 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4050,8 +4050,8 @@ static struct i915_oa_reg *alloc_oa_regs(struct i915_perf *perf,
>   	return ERR_PTR(err);
>   }
>   
> -static ssize_t show_dynamic_id(struct device *dev,
> -			       struct device_attribute *attr,
> +static ssize_t show_dynamic_id(struct kobject *kobj,
> +			       struct kobj_attribute *attr,
>   			       char *buf)
>   {
>   	struct i915_oa_config *oa_config =
> diff --git a/drivers/gpu/drm/i915/i915_perf_types.h b/drivers/gpu/drm/i915/i915_perf_types.h
> index 473a3c0544bb..05cb9a335a97 100644
> --- a/drivers/gpu/drm/i915/i915_perf_types.h
> +++ b/drivers/gpu/drm/i915/i915_perf_types.h
> @@ -55,7 +55,7 @@ struct i915_oa_config {
>   
>   	struct attribute_group sysfs_metric;
>   	struct attribute *attrs[2];
> -	struct device_attribute sysfs_metric_id;
> +	struct kobj_attribute sysfs_metric_id;
>   
>   	struct kref ref;
>   	struct rcu_head rcu;
> 
> base-commit: 7ecc3cc8a7b39f08eee9aea7b718187583342a70
