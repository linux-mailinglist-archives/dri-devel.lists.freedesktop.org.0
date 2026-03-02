Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IG5MQ+hpWmuCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:39:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C01DB01F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB21E10E519;
	Mon,  2 Mar 2026 14:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKNFF65Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E6410E519
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 14:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772462349; x=1803998349;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+zp71fvqIJqC3AXbnfXSuCQrsxntFTsXUmp/G0OAMtw=;
 b=QKNFF65Z2CcrvLWw16sx8l6gBeL0pqVSgG0SXZJsMml91WjFHYs3d0v3
 GADn55LackM54qNqERpxM0VKbsArZLyXZJhoPrpbXGrkhJL324d9wX0DW
 N6fElZy7ZfpbfYYcmCaT75QHWNEtRFQvG/Tv4XWSikkn/HsSlJP4jCLpk
 WHwMQtSusM+4+aNdEyZGXoW+e8kkWgsILeF8dLUoFlg/Sf69Nq25bOn9h
 Apvw5bcTaWVGIGSXiekP1BkJGUqbIFN0aMf8bNb4zAg+uR1bFkylHWgvl
 EbshsqH/UdcCL34Vf2vaiFLoO8f8AF4ezyFFscwUyXeTcox91217oVMNz A==;
X-CSE-ConnectionGUID: DbhnEiGdSxy8xXpltBqkNA==
X-CSE-MsgGUID: t+shCcplTvG+erMQKvHn8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="83805756"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="83805756"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:39:07 -0800
X-CSE-ConnectionGUID: aIgv7D2jT6izEBTmifXZvA==
X-CSE-MsgGUID: X9k6OckeQpW08Cxqh6HDuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="222172109"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.129])
 ([10.245.244.129])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:39:03 -0800
Message-ID: <c87a99bc-5481-444e-8841-b09d20016cfd@linux.intel.com>
Date: Mon, 2 Mar 2026 15:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] cgroup,cgroup/dmem: Add
 (dmem_)cgroup_common_ancestor helper
To: Natalie Vock <natalie.vock@gmx.de>, Maarten Lankhorst <dev@lankhorst.se>, 
 Maxime Ripard <mripard@kernel.org>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20260302-dmemcg-aggressive-protect-v5-0-ffd3a2602309@gmx.de>
 <20260302-dmemcg-aggressive-protect-v5-2-ffd3a2602309@gmx.de>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20260302-dmemcg-aggressive-protect-v5-2-ffd3a2602309@gmx.de>
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Queue-Id: 1F3C01DB01F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:dev@lankhorst.se,m:mripard@kernel.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:tursulin@ursulin.net,m:cgroups@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,lankhorst.se,kernel.org,cmpxchg.org,suse.com,amd.com,intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[maarten.lankhorst@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hey,

This should probably have a Co-developed-by: Tejun Heo <tj@kernel.org>

I need to take a closer look at patch 4 and 6, to add my r-b over the rest.

Den 2026-03-02 kl. 13:37, skrev Natalie Vock:
> This helps to find a common subtree of two resources, which is important
> when determining whether it's helpful to evict one resource in favor of
> another.
> 
> To facilitate this, add a common helper to find the ancestor of two
> cgroups using each cgroup's ancestor array.
> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> ---
>  include/linux/cgroup.h      | 21 +++++++++++++++++++++
>  include/linux/cgroup_dmem.h |  9 +++++++++
>  kernel/cgroup/dmem.c        | 43 ++++++++++++++++++++++++++++++++++++++++---
>  3 files changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
> index bc892e3b37eea..560ae995e3a54 100644
> --- a/include/linux/cgroup.h
> +++ b/include/linux/cgroup.h
> @@ -561,6 +561,27 @@ static inline struct cgroup *cgroup_ancestor(struct cgroup *cgrp,
>  	return cgrp->ancestors[ancestor_level];
>  }
>  
> +/**
> + * cgroup_common_ancestor - find common ancestor of two cgroups
> + * @a: first cgroup to find common ancestor of
> + * @b: second cgroup to find common ancestor of
> + *
> + * Find the first cgroup that is an ancestor of both @a and @b, if it exists
> + * and return a pointer to it. If such a cgroup doesn't exist, return NULL.
> + *
> + * This function is safe to call as long as both @a and @b are accessible.
> + */
> +static inline struct cgroup *cgroup_common_ancestor(struct cgroup *a,
> +						    struct cgroup *b)
> +{
> +	int level;
> +
> +	for (level = min(a->level, b->level); level >= 0; level--)
> +		if (a->ancestors[level] == b->ancestors[level])
> +			return a->ancestors[level];
> +	return NULL;
> +}
> +
>  /**
>   * task_under_cgroup_hierarchy - test task's membership of cgroup ancestry
>   * @task: the task to be tested
> diff --git a/include/linux/cgroup_dmem.h b/include/linux/cgroup_dmem.h
> index 1a88cd0c9eb00..444b84f4c253a 100644
> --- a/include/linux/cgroup_dmem.h
> +++ b/include/linux/cgroup_dmem.h
> @@ -28,6 +28,8 @@ bool dmem_cgroup_below_min(struct dmem_cgroup_pool_state *root,
>  			   struct dmem_cgroup_pool_state *test);
>  bool dmem_cgroup_below_low(struct dmem_cgroup_pool_state *root,
>  			   struct dmem_cgroup_pool_state *test);
> +struct dmem_cgroup_pool_state *dmem_cgroup_common_ancestor(struct dmem_cgroup_pool_state *a,
> +							   struct dmem_cgroup_pool_state *b);
>  
>  void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool);
>  #else
> @@ -75,6 +77,13 @@ static inline bool dmem_cgroup_below_low(struct dmem_cgroup_pool_state *root,
>  	return false;
>  }
>  
> +static inline
> +struct dmem_cgroup_pool_state *dmem_cgroup_common_ancestor(struct dmem_cgroup_pool_state *a,
> +							   struct dmem_cgroup_pool_state *b)
> +{
> +	return NULL;
> +}
> +
>  static inline void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool)
>  { }
>  
> diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
> index 28227405f7cfe..a3ba865f4c68f 100644
> --- a/kernel/cgroup/dmem.c
> +++ b/kernel/cgroup/dmem.c
> @@ -569,11 +569,10 @@ void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool)
>  EXPORT_SYMBOL_GPL(dmem_cgroup_pool_state_put);
>  
>  static struct dmem_cgroup_pool_state *
> -get_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_region *region)
> +find_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_region *region)
>  {
> -	struct dmem_cgroup_pool_state *pool, *allocpool = NULL;
> +	struct dmem_cgroup_pool_state *pool;
>  
> -	/* fastpath lookup? */
>  	rcu_read_lock();
>  	pool = find_cg_pool_locked(cg, region);
>  	if (pool && !READ_ONCE(pool->inited))
> @@ -582,6 +581,17 @@ get_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_region *region)
>  		pool = NULL;
>  	rcu_read_unlock();
>  
> +	return pool;
> +}
> +
> +static struct dmem_cgroup_pool_state *
> +get_cg_pool_unlocked(struct dmemcg_state *cg, struct dmem_cgroup_region *region)
> +{
> +	struct dmem_cgroup_pool_state *pool, *allocpool = NULL;
> +
> +	/* fastpath lookup? */
> +	pool = find_cg_pool_unlocked(cg, region);
> +
>  	while (!pool) {
>  		spin_lock(&dmemcg_lock);
>  		if (!region->unregistered)
> @@ -756,6 +766,33 @@ bool dmem_cgroup_below_low(struct dmem_cgroup_pool_state *root,
>  }
>  EXPORT_SYMBOL_GPL(dmem_cgroup_below_low);
>  
> +/**
> + * dmem_cgroup_common_ancestor(): Find the first common ancestor of two pools.
> + * @a: First pool to find the common ancestor of.
> + * @b: First pool to find the common ancestor of.
> + *
> + * Return: The first pool that is a parent of both @a and @b, or NULL if either @a or @b are NULL,
> + * or if such a pool does not exist.
> + */
> +struct dmem_cgroup_pool_state *dmem_cgroup_common_ancestor(struct dmem_cgroup_pool_state *a,
> +							   struct dmem_cgroup_pool_state *b)
> +{
> +	struct cgroup *ancestor_cgroup;
> +	struct cgroup_subsys_state *ancestor_css;
> +
> +	if (!a || !b)
> +		return NULL;
> +
> +	ancestor_cgroup = cgroup_common_ancestor(a->cs->css.cgroup, b->cs->css.cgroup);
> +	if (!ancestor_cgroup)
> +		return NULL;
> +
> +	ancestor_css = cgroup_e_css(ancestor_cgroup, &dmem_cgrp_subsys);
> +
> +	return find_cg_pool_unlocked(css_to_dmemcs(ancestor_css), a->region);
> +}
> +EXPORT_SYMBOL_GPL(dmem_cgroup_common_ancestor);
From the naming, I would not expect a reference to be taken to the common ancestor, especially because the reference through a and b would both be able keep the ancestor alive. Otherwise it would not be an ancestor. Rename to dmem_cgroup_get_common_ancestor perhaps? Same for the find_, perhaps rename to lookup_ or use the unmodified get_cg_pool_unlocked version, because the common ancestor's pool_state definitely exists if either a or b do.

Kind regards,
~Maarten Lankhorst
