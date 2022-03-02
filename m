Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5397A4CA255
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0C210F497;
	Wed,  2 Mar 2022 10:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D6310F497;
 Wed,  2 Mar 2022 10:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646217445; x=1677753445;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bl/kn8wsyMQAPxCRMAmGszNM18vXJanwFRfFFWl+vmE=;
 b=UUZot5DqM/XNrUVDN0xMDbbUEkkTow5tJqrIjsMos9SBRSxFu7FrnoMq
 ee512Tgb6Q1tSb2GCbLdqq3fZpexkvZEoOwTURz6bVWgp2FO84CsTeuPd
 AobIbCfHPl24t3AFv2QED7oTFWdueQWNTXR4NoxV6iCxNOX/efLJtfqLl
 fFwRANRVhsDujoQKg/sO/Zp0sDQQm+iXbGuA3MOchd7KJEWX4Q5A90ges
 AeaXnaRlBrHxIDbIwWfG2COsY59eM1NHVi07pfFnvigCBaLWZWJSrRf4x
 rxYckU481ZWdoPgz4UF9ByZCjttIwosGPEXnNg6OHxuyL50Q8YKc5UQhg A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233336939"
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="233336939"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 02:37:24 -0800
X-IronPort-AV: E=Sophos;i="5.90,148,1643702400"; d="scan'208";a="641652498"
Received: from jbuller-mobl1.ger.corp.intel.com (HELO [10.213.194.231])
 ([10.213.194.231])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 02:37:21 -0800
Message-ID: <9586bba7-ffb8-945f-eb30-88629e34737d@linux.intel.com>
Date: Wed, 2 Mar 2022 10:37:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915/gt: Handle errors for i915_gem_object_trylock
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, radhakrishna.sripada@intel.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, jose.souza@intel.com,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20220302061946.46630-1-jiasheng@iscas.ac.cn>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220302061946.46630-1-jiasheng@iscas.ac.cn>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


+ Thomas, Matt

On 02/03/2022 06:19, Jiasheng Jiang wrote:
> As the potential failure of the i915_gem_object_trylock(),
> it should be better to check it and return error if fails.
> 
> Fixes: 94ce0d65076c ("drm/i915/gt: Setup a default migration context on the GT")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/i915/gt/selftest_migrate.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> index fa4293d2944f..79c6c68f7316 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -465,7 +465,11 @@ create_init_lmem_internal(struct intel_gt *gt, size_t sz, bool try_lmem)
>   			return obj;
>   	}
>   
> -	i915_gem_object_trylock(obj, NULL);

Guys why is this a trylock to start with? (Since being added in 
94ce0d65076c ("drm/i915/gt: Setup a default migration context on the GT").

Surely it can't ever fail since the object has just been created.

Regards,

Tvrtko

> +	if (!i915_gem_object_trylock(obj, NULL)) {
> +		i915_gem_object_put(obj);
> +		return ERR_PTR(-EBUSY);
> +	}
> +
>   	err = i915_gem_object_pin_pages(obj);
>   	if (err) {
>   		i915_gem_object_unlock(obj);
