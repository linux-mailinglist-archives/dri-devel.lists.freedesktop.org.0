Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36B36CC033
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 15:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9824810E040;
	Tue, 28 Mar 2023 13:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8126310E040;
 Tue, 28 Mar 2023 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680008934; x=1711544934;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hEsefQeZT5HOexkYp5BwuMTDiULU+5IKf5YZR+PdMrw=;
 b=eHlgsUkimYfD1/R9UQ2WUEE3FK9ksenHwYhnuCvsWqdGiQ2+4vcheCKs
 63RtNymhYZMN4tqcba16kNaavYv5nxwSW0PN7CX+qCZroIT7qaNr6dE7U
 yP0l+FRC3I4W7KMPAPJGUFv5cwWKlB7FKXcaU1OZuqpy5w1NRuPL1g3Cr
 2/DZIdbTcmdlDhLy25O4MKwMFYFYVi0P3kYf3FioXy6JD3955xWzlihKg
 ihSEzWrhCJodur+xAXidOvXJHoVeepIzQylbJu0IV6PFvVNDVUtXhPymg
 EElIeiIGm3UQXghTujdwdG+H8wLSS6Uq0+P8SsCc/SqqfUbglro2zJIwI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="340581920"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="340581920"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 06:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="748396269"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="748396269"
Received: from wheelerj-mobl.ger.corp.intel.com (HELO [10.213.213.242])
 ([10.213.213.242])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 06:08:49 -0700
Message-ID: <e7541f73-f100-3b1f-de80-376fa55f2479@linux.intel.com>
Date: Tue, 28 Mar 2023 14:08:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/1] drm/i915: fix race condition UAF in
 i915_perf_add_config_ioctl
Content-Language: en-US
To: Min Li <lm0963hack@gmail.com>, jani.nikula@linux.intel.com,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
References: <20230328093627.5067-1-lm0963hack@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230328093627.5067-1-lm0963hack@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/03/2023 10:36, Min Li wrote:
> Userspace can guess the id value and try to race oa_config object creation
> with config remove, resulting in a use-after-free if we dereference the
> object after unlocking the metrics_lock.  For that reason, unlocking the
> metrics_lock must be done after we are done dereferencing the object.
> 
> Signed-off-by: Min Li <lm0963hack@gmail.com>

Fixes: f89823c21224 ("drm/i915/perf: Implement I915_PERF_ADD/REMOVE_CONFIG interface")
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: <stable@vger.kernel.org> # v4.14+

> ---
>   drivers/gpu/drm/i915/i915_perf.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 824a34ec0b83..93748ca2c5da 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4634,13 +4634,13 @@ int i915_perf_add_config_ioctl(struct drm_device *dev, void *data,
>   		err = oa_config->id;
>   		goto sysfs_err;
>   	}
> -
> -	mutex_unlock(&perf->metrics_lock);
> +	id = oa_config->id;
>   
>   	drm_dbg(&perf->i915->drm,
>   		"Added config %s id=%i\n", oa_config->uuid, oa_config->id);
> +	mutex_unlock(&perf->metrics_lock);
>   
> -	return oa_config->id;
> +	return id;
>   
>   sysfs_err:
>   	mutex_unlock(&perf->metrics_lock);

LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Umesh or Lionel could you please double check? I can merge if confirmed okay.

Regards,

Tvrtko
