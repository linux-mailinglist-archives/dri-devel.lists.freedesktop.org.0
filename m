Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717EA62C2F6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C54210E121;
	Wed, 16 Nov 2022 15:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE2710E121;
 Wed, 16 Nov 2022 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668613730; x=1700149730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cXKiGN/336RYbji5xQiFDbRsHaeyoTDt9IhbUIbCZM8=;
 b=BlSf3lKPj+DrsRo6AcZ32EQKZYoIaae3rorLRS9p+5QvoucFm8zHlxpF
 ffA7CHzYfu36iPbO8cKzvLHutHx+Dbrqz6TbehO0NSlAHb3w/lrY7TW25
 zKgZaaPo6Jb7fygDAYfisJ1nnaL6XeVNDR3sbj0+PAXVtccAVrmAwqX1q
 BrI1VAyg3VDi6sM50IvhXrlAItpPcTUXuISpyIokxZ+RUeQGVP+MjxrLR
 XN58+C3RcJ8KO0LkxwfZlzBhgxA0og9l279Be/ODpZGpsoRFNqC29QCBm
 mRu2zROFpdRc7laGv5OFF+QW43oT1a4R3dNdv7TSqyVF+oN8qqpzYIKdM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="398863091"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="398863091"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 07:48:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="814126155"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="814126155"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.12.208])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 07:48:44 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Never return 0 if request wait
 succeeds
Date: Wed, 16 Nov 2022 16:48:41 +0100
Message-ID: <5878741.lOV4Wx5bFT@jkrzyszt-mobl1.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <cd0c8e1e-743c-f3d7-5e2e-91f7a8144c7d@intel.com>
References: <20221116112532.36253-1-janusz.krzysztofik@linux.intel.com>
 <20221116112532.36253-4-janusz.krzysztofik@linux.intel.com>
 <cd0c8e1e-743c-f3d7-5e2e-91f7a8144c7d@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 16 November 2022 15:42:46 CET Andrzej Hajda wrote:
> On 16.11.2022 12:25, Janusz Krzysztofik wrote:
> > According to the docs of i915_request_wait_timeout(), its return value
> > "may be zero if the request is unfinished after the timeout expires."
> > However, 0 is also returned when the request is found finished right
> > after the timeout has expired.
> > 
> > Since the docs also state: "If the timeout is 0, it will return 1 if the
> > fence is signaled.", return 1 also when the fence is found signaled after
> > non-zero timeout has expired.
> 
> As I understand the patch "drm/i915: Fix i915_request fence wait 
> semantics", and the docs "timeout is 0" means the initial value of 
> timeout argument and this is handled already on the beginning of the 
> function.
> In case initial timeout is greater than zero and then it expires, 
> function should return 0 regardless of fence state. This is what I have 
> understood from reading docs and implementation of 
> dma_fence_default_wait [1], which should be the best source of info 
> about "dma_fence wait semantic".
> 
> As I said already, mixing remaining time and bool in return value of 
> dma_fence_wait* functions is very confusing, but changing it would 
> require major rework of the framework.

OK, let's drop this controversial patch.  The corner case it touches should 
already be handled correctly by intel_gt_retire_requests_timeout(), which this 
series is about, after 1/3 and 2/3 are applied.

Thanks,
Janusz

> 
> [1]: 
> https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-fence.c#L753
> 
> Regards
> Andrzej
> 
> > 
> > Fixes: 7e2e69ed4678 ("drm/i915: Fix i915_request fence wait semantics")
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: stable@vger.kernel.org # v5.17
> > ---
> >   drivers/gpu/drm/i915/i915_request.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index f949a9495758a..406ddfafbed4d 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -2079,6 +2079,8 @@ long i915_request_wait_timeout(struct i915_request *rq,
> >   
> >   		timeout = io_schedule_timeout(timeout);
> >   	}
> > +	if (!timeout)	/* expired but signaled, we shouldn't return 0 */
> > +		timeout = 1;
> >   	__set_current_state(TASK_RUNNING);
> >   
> >   	if (READ_ONCE(wait.tsk))
> 
> 




