Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A1C4390C3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 10:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70F789E1B;
	Mon, 25 Oct 2021 08:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AC589E0D;
 Mon, 25 Oct 2021 08:01:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10147"; a="293057229"
X-IronPort-AV: E=Sophos;i="5.87,179,1631602800"; d="scan'208";a="293057229"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 01:01:17 -0700
X-IronPort-AV: E=Sophos;i="5.87,179,1631602800"; d="scan'208";a="446531190"
Received: from dscaswel-mobl2.ger.corp.intel.com (HELO [10.213.242.254])
 ([10.213.242.254])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 01:01:14 -0700
Subject: Re: [PATCH] drm/i915/selftests: Fix inconsistent IS_ERR and PTR_ERR
To: Kai Song <songkai01@inspur.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: airlied@linux.ie, daniel@ffwll.ch, jason@jlekstrand.net,
 thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211022120655.22173-1-songkai01@inspur.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <f0f66cb7-ce70-b968-2fa2-64c39a87e98c@intel.com>
Date: Mon, 25 Oct 2021 09:01:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211022120655.22173-1-songkai01@inspur.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 22/10/2021 13:06, Kai Song wrote:
> Fix inconsistent IS_ERR and PTR_ERR in i915_gem_dmabuf.c
> 
> Signed-off-by: Kai Song <songkai01@inspur.com>

Pushed to drm-intel-gt-next. Thanks.

> ---
>   drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index 4a6bb64c3a35..3cc74b0fed06 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -102,7 +102,7 @@ static int igt_dmabuf_import_same_driver_lmem(void *arg)
>   	obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &lmem, 1);
>   	if (IS_ERR(obj)) {
>   		pr_err("__i915_gem_object_create_user failed with err=%ld\n",
> -		       PTR_ERR(dmabuf));
> +		       PTR_ERR(obj));
>   		err = PTR_ERR(obj);
>   		goto out_ret;
>   	}
> @@ -158,7 +158,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
>   					    regions, num_regions);
>   	if (IS_ERR(obj)) {
>   		pr_err("__i915_gem_object_create_user failed with err=%ld\n",
> -		       PTR_ERR(dmabuf));
> +		       PTR_ERR(obj));
>   		err = PTR_ERR(obj);
>   		goto out_ret;
>   	}
> 
