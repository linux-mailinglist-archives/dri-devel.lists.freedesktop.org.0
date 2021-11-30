Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 326C146386E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CE76E863;
	Tue, 30 Nov 2021 14:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2B16E47B;
 Tue, 30 Nov 2021 14:58:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="236052492"
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="236052492"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 06:58:22 -0800
X-IronPort-AV: E=Sophos;i="5.87,276,1631602800"; d="scan'208";a="459629860"
Received: from sghadai-mobl.amr.corp.intel.com (HELO [10.213.181.11])
 ([10.213.181.11])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 06:58:20 -0800
Message-ID: <a5f5c675-0a7a-8049-d9d6-185cf4f2d91b@linux.intel.com>
Date: Tue, 30 Nov 2021 14:58:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Fix a NULL pointer dereference
 in igt_request_rewind()
Content-Language: en-US
To: Zhou Qingyang <zhou1615@umn.edu>
References: <20211130141545.153899-1-zhou1615@umn.edu>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20211130141545.153899-1-zhou1615@umn.edu>
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
Cc: David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30/11/2021 14:15, Zhou Qingyang wrote:
> In igt_request_rewind(), mock_context(i915, "A") is assigned to ctx[0]
> and used in i915_gem_context_get_engine(). There is a dereference
> of ctx[0] in i915_gem_context_get_engine(), which could lead to a NULL
> pointer dereference on failure of mock_context(i915, "A") .
> 
> So as mock_context(i915, "B").
> 
> Although this bug is not serious for it belongs to testing code, it is
> better to be fixed to avoid unexpected failure in testing.
> 
> Fix this bugs by adding checks about ctx[0] and ctx[1].
> 
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
> Builds with CONFIG_DRM_I915_SELFTEST=y show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: ca883c304f54 ("drm/i915/selftests: Pass intel_context to mock_request")

I think it is this one instead:

591c0fb85d1c ("drm/i915: Exercise request cancellation using a mock selftest")

Fix looks correct so:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Thanks for the patch!

Regards,

Tvrtko

P.S.
Although Fixes: is probably a bit over the top since it is selftests only so I'll probably drop it while applying.

> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
>   drivers/gpu/drm/i915/selftests/i915_request.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index d67710d10615..d6fc7b892793 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -209,6 +209,10 @@ static int igt_request_rewind(void *arg)
>   	int err = -EINVAL;
>   
>   	ctx[0] = mock_context(i915, "A");
> +	if (!ctx[0]) {
> +		err = -ENOMEM;
> +		goto err_ctx_0;
> +	}
>   
>   	ce = i915_gem_context_get_engine(ctx[0], RCS0);
>   	GEM_BUG_ON(IS_ERR(ce));
> @@ -223,6 +227,10 @@ static int igt_request_rewind(void *arg)
>   	i915_request_add(request);
>   
>   	ctx[1] = mock_context(i915, "B");
> +	if (!ctx[1]) {
> +		err = -ENOMEM;
> +		goto err_ctx_1;
> +	}
>   
>   	ce = i915_gem_context_get_engine(ctx[1], RCS0);
>   	GEM_BUG_ON(IS_ERR(ce));
> @@ -261,9 +269,11 @@ static int igt_request_rewind(void *arg)
>   	i915_request_put(vip);
>   err_context_1:
>   	mock_context_close(ctx[1]);
> +err_ctx_1:
>   	i915_request_put(request);
>   err_context_0:
>   	mock_context_close(ctx[0]);
> +err_ctx_0:
>   	mock_device_flush(i915);
>   	return err;
>   }
> 
