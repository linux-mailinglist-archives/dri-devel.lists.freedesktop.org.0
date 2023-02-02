Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80FA68800F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 15:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C643A10E562;
	Thu,  2 Feb 2023 14:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9563510E548;
 Thu,  2 Feb 2023 14:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675347972; x=1706883972;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f3HA4j/3sz9ZxloTe8PsLAHonqU/MTJv3W2yuiyZ67c=;
 b=c2DtQs5Y4GqsemFMDxMC+ks8uXmurvmadj+hGftBSn0acb3jjdpcCa16
 koGhRMcrlHdZKbKjeFABjqe3VN45sKb+82KVs5CFdiGGaZvqpJ6NYV8Fc
 aKwaPcMwPg9Bi/6teGxi4/1pvHgiCCPEJuT4PpYtygtmZlMOof0tfQsDo
 bgsuTBVtl0hVLht0mRu8CFwK0bw3T/ZGJF4cApPA0qXU1dCUX1iddGr21
 AuHUyQ8Wl37rL6sIIeA35aCVao7LFHaesfnFkOn3Vphh6dNAAE64A7v11
 QjT7gFUkn7PeuZtHaH4KQBlA4w0Mje8bzEF0iEJV6NhRM/KEjssaL+wMM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326151128"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="326151128"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 06:26:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="994112813"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="994112813"
Received: from stirulak-mobl3.ger.corp.intel.com (HELO [10.213.219.106])
 ([10.213.219.106])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 06:26:08 -0800
Message-ID: <27b7882e-1201-b173-6f56-9ececb5780e8@linux.intel.com>
Date: Thu, 2 Feb 2023 14:26:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC 10/12] cgroup/drm: Introduce weight based drm cgroup control
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
 <20230112165609.1083270-11-tvrtko.ursulin@linux.intel.com>
 <Y9R2N8sl+7f8Zacv@slm.duckdns.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y9R2N8sl+7f8Zacv@slm.duckdns.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/01/2023 01:11, Tejun Heo wrote:
> On Thu, Jan 12, 2023 at 04:56:07PM +0000, Tvrtko Ursulin wrote:
> ...
>> +	/*
>> +	 * 1st pass - reset working values and update hierarchical weights and
>> +	 * GPU utilisation.
>> +	 */
>> +	if (!__start_scanning(root, period_us))
>> +		goto out_retry; /*
>> +				 * Always come back later if scanner races with
>> +				 * core cgroup management. (Repeated pattern.)
>> +				 */
>> +
>> +	css_for_each_descendant_pre(node, &root->css) {
>> +		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
>> +		struct cgroup_subsys_state *css;
>> +		unsigned int over_weights = 0;
>> +		u64 unused_us = 0;
>> +
>> +		if (!css_tryget_online(node))
>> +			goto out_retry;
>> +
>> +		/*
>> +		 * 2nd pass - calculate initial budgets, mark over budget
>> +		 * siblings and add up unused budget for the group.
>> +		 */
>> +		css_for_each_child(css, &drmcs->css) {
>> +			struct drm_cgroup_state *sibling = css_to_drmcs(css);
>> +
>> +			if (!css_tryget_online(css)) {
>> +				css_put(node);
>> +				goto out_retry;
>> +			}
>> +
>> +			sibling->per_s_budget_us  =
>> +				DIV_ROUND_UP_ULL(drmcs->per_s_budget_us *
>> +						 sibling->weight,
>> +						 drmcs->sum_children_weights);
>> +
>> +			sibling->over = sibling->active_us >
>> +					sibling->per_s_budget_us;
>> +			if (sibling->over)
>> +				over_weights += sibling->weight;
>> +			else
>> +				unused_us += sibling->per_s_budget_us -
>> +					     sibling->active_us;
>> +
>> +			css_put(css);
>> +		}
>> +
>> +		/*
>> +		 * 3rd pass - spread unused budget according to relative weights
>> +		 * of over budget siblings.
>> +		 */
>> +		css_for_each_child(css, &drmcs->css) {
>> +			struct drm_cgroup_state *sibling = css_to_drmcs(css);
>> +
>> +			if (!css_tryget_online(css)) {
>> +				css_put(node);
>> +				goto out_retry;
>> +			}
>> +
>> +			if (sibling->over) {
>> +				u64 budget_us =
>> +					DIV_ROUND_UP_ULL(unused_us *
>> +							 sibling->weight,
>> +							 over_weights);
>> +				sibling->per_s_budget_us += budget_us;
>> +				sibling->over = sibling->active_us  >
>> +						sibling->per_s_budget_us;
>> +			}
>> +
>> +			css_put(css);
>> +		}
>> +
>> +		css_put(node);
>> +	}
>> +
>> +	/*
>> +	 * 4th pass - send out over/under budget notifications.
>> +	 */
>> +	css_for_each_descendant_post(node, &root->css) {
>> +		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
>> +
>> +		if (!css_tryget_online(node))
>> +			goto out_retry;
>> +
>> +		if (drmcs->over || drmcs->over_budget)
>> +			signal_drm_budget(drmcs,
>> +					  drmcs->active_us,
>> +					  drmcs->per_s_budget_us);
>> +		drmcs->over_budget = drmcs->over;
>> +
>> +		css_put(node);
>> +	}
> 
> It keeps bothering me that the distribution logic has no memory. Maybe this
> is good enough for coarse control with long cycle durations but it likely
> will get in trouble if pushed to finer grained control. State keeping
> doesn't require a lot of complexity. The only state that needs tracking is
> each cgroup's vtime and then the core should be able to tell specific
> drivers how much each cgroup is over or under fairly accurately at any given
> time.
> 
> That said, this isn't a blocker. What's implemented can work well enough
> with coarse enough time grain and that might be enough for the time being
> and we can get back to it later. I think Michal already mentioned it but it
> might be a good idea to track active and inactive cgroups and build the
> weight tree with only active ones. There are machines with a lot of mostly
> idle cgroups (> tens of thousands) and tree wide scanning even at low
> frequency can become a pretty bad bottleneck.

Right, that's the kind of experience (tens of thousands) I was missing, 
thank you. Another one item on my TODO list then but I have a question 
first.

When you say active/inactive - to what you are referring in the cgroup 
world? Offline/online? For those my understanding was offline was a 
temporary state while css is getting destroyed.

Also, I am really postponing implementing those changes until I hear at 
least something from the DRM community.

Regards,

Tvrtko
