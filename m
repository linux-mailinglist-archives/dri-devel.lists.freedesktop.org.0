Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA870C060F4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D3C10EA76;
	Fri, 24 Oct 2025 11:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="GnG7EPb+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F291F10EA76
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761306272;
 bh=nThNGbn396MUk+fscta05g9tCvShMWDdvTs92xblY9c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GnG7EPb+q90YSGS3/gRp6UVuCsywY6uWHsvMZwwX61mAgo3Zv2+1o5O34+hH/zhHL
 zdx7JE1f9FjwrLfJMkZ7ldpU6r2PUN7HohHbaukYW2s3VAiI/gqK7ry5icVxoHQHSn
 YcCjFnldOo15YLfymHsIo1gbPXKxcq+SXVk44Tp6T71S0Ips62b5FvGISytCULbxOo
 b45XzH2FMbF3mveWkdgrvqK/XmfUq2do7IKjDHitF39TABQMVH5G+khAYupeEI17zY
 R/hMpv9BFUdUT71JP1+sV9r2sDSeaf3Ktjyvn+B7ddi+4EgK1l3pbMWiC7AYd700ck
 uBo7vxLykNnIw==
Message-ID: <4f425860-1a43-443a-8b34-3fdd75bb9168@lankhorst.se>
Date: Fri, 24 Oct 2025 13:44:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] cgroup/dmem: Add queries for protection values
To: Natalie Vock <natalie.vock@gmx.de>, Maxime Ripard <mripard@kernel.org>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015-dmemcg-aggressive-protect-v2-0-36644fb4e37f@gmx.de>
 <20251015-dmemcg-aggressive-protect-v2-1-36644fb4e37f@gmx.de>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20251015-dmemcg-aggressive-protect-v2-1-36644fb4e37f@gmx.de>
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

Hey,

Den 2025-10-15 kl. 15:57, skrev Natalie Vock:
> Callers can use this feedback to be more aggressive in making space for
> allocations of a cgroup if they know it is protected.
> 
> These are counterparts to memcg's mem_cgroup_below_{min,low}.
> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
It could be useful to document why we are calculating protection here,
since memcg doesn't do that in their functions.

> ---
>  include/linux/cgroup_dmem.h | 16 +++++++++++++++
>  kernel/cgroup/dmem.c        | 48 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/include/linux/cgroup_dmem.h b/include/linux/cgroup_dmem.h
> index dd4869f1d736e26847578e81377e40504bbba90f..1a88cd0c9eb00409ddd07d1f06eb63d2e55e8805 100644
> --- a/include/linux/cgroup_dmem.h
> +++ b/include/linux/cgroup_dmem.h
> @@ -24,6 +24,10 @@ void dmem_cgroup_uncharge(struct dmem_cgroup_pool_state *pool, u64 size);
>  bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
>  				      struct dmem_cgroup_pool_state *test_pool,
>  				      bool ignore_low, bool *ret_hit_low);
> +bool dmem_cgroup_below_min(struct dmem_cgroup_pool_state *root,
> +			   struct dmem_cgroup_pool_state *test);
> +bool dmem_cgroup_below_low(struct dmem_cgroup_pool_state *root,
> +			   struct dmem_cgroup_pool_state *test);
>  
>  void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool);
>  #else
> @@ -59,6 +63,18 @@ bool dmem_cgroup_state_evict_valuable(struct dmem_cgroup_pool_state *limit_pool,
>  	return true;
>  }
>  
> +static inline bool dmem_cgroup_below_min(struct dmem_cgroup_pool_state *root,
> +					 struct dmem_cgroup_pool_state *test)
> +{
> +	return false;
> +}
> +
> +static inline bool dmem_cgroup_below_low(struct dmem_cgroup_pool_state *root,
> +					 struct dmem_cgroup_pool_state *test)
> +{
> +	return false;
> +}
> +
>  static inline void dmem_cgroup_pool_state_put(struct dmem_cgroup_pool_state *pool)
>  { }
>  
> diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
> index 10b63433f05737cc43a87029f2306147283a77ff..ece23f77f197f1b2da3ee322ff176460801907c6 100644
> --- a/kernel/cgroup/dmem.c
> +++ b/kernel/cgroup/dmem.c
> @@ -641,6 +641,54 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
>  }
>  EXPORT_SYMBOL_GPL(dmem_cgroup_try_charge);
>  
> +/**
> + * dmem_cgroup_below_min() - Tests whether current usage is within min limit.
> + *
> + * @root: Root of the subtree to calculate protection for, or NULL to calculate global protection.
> + * @test: The pool to test the usage/min limit of.
> + *
> + * Return: true if usage is below min and the cgroup is protected, false otherwise.
> + */
> +bool dmem_cgroup_below_min(struct dmem_cgroup_pool_state *root,
> +			   struct dmem_cgroup_pool_state *test)
> +{
> +	if (root == test || !pool_parent(test))
> +		return false;
> +
> +	if (!root) {
> +		for (root = test; pool_parent(root); root = pool_parent(root))
> +			{}
> +	}
> +
> +	dmem_cgroup_calculate_protection(root, test);
> +	return page_counter_read(&test->cnt) <= READ_ONCE(test->cnt.emin);
> +}
> +EXPORT_SYMBOL_GPL(dmem_cgroup_below_min);
> +
> +/**
> + * dmem_cgroup_below_low() - Tests whether current usage is within low limit.
> + *
> + * @root: Root of the subtree to calculate protection for, or NULL to calculate global protection.
> + * @test: The pool to test the usage/low limit of.
> + *
> + * Return: true if usage is below low and the cgroup is protected, false otherwise.
> + */
> +bool dmem_cgroup_below_low(struct dmem_cgroup_pool_state *root,
> +			   struct dmem_cgroup_pool_state *test)
> +{
> +	if (root == test || !pool_parent(test))
> +		return false;
> +
> +	if (!root) {
> +		for (root = test; pool_parent(root); root = pool_parent(root))
> +			{}
> +	}
> +
> +	dmem_cgroup_calculate_protection(root, test);
> +	return page_counter_read(&test->cnt) <= READ_ONCE(test->cnt.elow);
> +}
> +EXPORT_SYMBOL_GPL(dmem_cgroup_below_low);
> +
>  static int dmem_cgroup_region_capacity_show(struct seq_file *sf, void *v)
>  {
>  	struct dmem_cgroup_region *region;
> 

Kind regards,
~Maarten lankhorst
