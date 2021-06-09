Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D183A14D8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 14:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB4C6E2ED;
	Wed,  9 Jun 2021 12:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A99A6E3D3;
 Wed,  9 Jun 2021 12:48:20 +0000 (UTC)
IronPort-SDR: uqmB2N4ab+nOry0sG2fqEPz2Kh1FOIUqdoPWgRfGrk5kMSdbFLAcMPBNAYCbwgnaC+Nl7S3S1H
 Cz4/uKyPjqrw==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="204877281"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="204877281"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 05:48:19 -0700
IronPort-SDR: FhYDG0OCOjI8NXB11zIOIPCQGSbgKkfBAiZFpAsOquGOZGPR+/XTGzAM70hUtcqxzgrrMPDJ0D
 N9BFFnU8RiwQ==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="419268532"
Received: from gbwalsh-mobl6.ger.corp.intel.com (HELO [10.252.10.147])
 ([10.252.10.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 05:48:17 -0700
Subject: Re: [PATCH v2 7/9] drm/i915/gt: Pipelined page migration
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
 <20210609063436.284332-8-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <f3bbc37f-5926-90ec-fa2e-6719b27189bd@intel.com>
Date: Wed, 9 Jun 2021 13:48:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609063436.284332-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2021 07:34, Thomas Hellström wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> If we pipeline the PTE updates and then do the copy of those pages
> within a single unpreemptible command packet, we can submit the copies
> and leave them to be scheduled without having to synchronously wait
> under a global lock. In order to manage migration, we need to
> preallocate the page tables (and keep them pinned and available for use
> at any time), causing a bottleneck for migrations as all clients must
> contend on the limited resources. By inlining the ppGTT updates and
> performing the blit atomically, each client only owns the PTE while in
> use, and so we can reschedule individual operations however we see fit.
> And most importantly, we do not need to take a global lock on the shared
> vm, and wait until the operation is complete before releasing the lock
> for others to claim the PTE for themselves.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
> v2:
> - Add a TODO for huge LMEM ptes (Pointed out by Matthew Auld)
> - Use intel_engine_destroy_pinned_context() to properly take the pinned
>    context timeline off the engine list. (CI warning).
> ---

<snip>

> +
> +int
> +intel_context_migrate_copy(struct intel_context *ce,
> +			   struct dma_fence *await,
> +			   struct scatterlist *src,
> +			   enum i915_cache_level src_cache_level,
> +			   bool src_is_lmem,
> +			   struct scatterlist *dst,
> +			   enum i915_cache_level dst_cache_level,
> +			   bool dst_is_lmem,
> +			   struct i915_request **out)
> +{
> +	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst);
> +	struct i915_request *rq;
> +	int err;
> +
> +	*out = NULL;
> +
> +	/* GEM_BUG_ON(ce->vm != migrate_vm); */

Should we drop this?

> +
> +	GEM_BUG_ON(ce->ring->size < SZ_64K);
> +
> +	do {
> +		int len;
> +
> +		rq = i915_request_create(ce);
> +		if (IS_ERR(rq)) {
> +			err = PTR_ERR(rq);
> +			goto out_ce;
> +		}
> +
> +		if (await) {
> +			err = i915_request_await_dma_fence(rq, await);
> +			if (err)
> +				goto out_rq;
> +
> +			if (rq->engine->emit_init_breadcrumb) {
> +				err = rq->engine->emit_init_breadcrumb(rq);
> +				if (err)
> +					goto out_rq;
> +			}
> +
> +			await = NULL;
> +		}
> +
> +		/* The PTE updates + copy must not be interrupted. */
> +		err = emit_no_arbitration(rq);
> +		if (err)
> +			goto out_rq;
> +
> +		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem, 0,
> +			       CHUNK_SZ);
> +		if (len <= 0) {
> +			err = len;
> +			goto out_rq;
> +		}
> +
> +		err = emit_pte(rq, &it_dst, dst_cache_level, dst_is_lmem,
> +			       CHUNK_SZ, len);
> +		if (err < 0)
> +			goto out_rq;
> +		if (err < len) {
> +			err = -EINVAL;
> +			goto out_rq;
> +		}
> +
> +		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
> +		if (err)
> +			goto out_rq;
> +
> +		err = emit_copy(rq, len);
> +
> +		/* Arbitration is re-enabled between requests. */
> +out_rq:
> +		if (*out)
> +			i915_request_put(*out);
> +		*out = i915_request_get(rq);
> +		i915_request_add(rq);
> +		if (err || !it_src.sg || !sg_dma_len(it_src.sg))
> +			break;
> +
> +		cond_resched();
> +	} while (1);
> +
> +out_ce:
> +	return err;
> +}
> +
