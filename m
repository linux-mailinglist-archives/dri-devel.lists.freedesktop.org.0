Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6B651229A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 21:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F3C10E1EA;
	Wed, 27 Apr 2022 19:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FBA10E112;
 Wed, 27 Apr 2022 19:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651087482; x=1682623482;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lWQ1sn2XGCHqLs6+U4JwpTmrJMXeodWuEEqefd+DKVw=;
 b=N1yWHnhiunli0MD1jLXc2L+uupdUDvfKtr0avUF6hQLSuaBma4SUZwdH
 apjbhAOUsZDHHIPC38hnFEHeyckwUhYVhSMT03j4E+nLVhQ4026/XSPUg
 xknGYEJmd8PPWdxrt8GEgiXvtwlha1RuhYEE2EEe7qAcD9+4+UyQBjZVl
 2s74cG9C2H7SXEcjwoPU39gLqQiheQpMLFk50NYHQ1HKB19x4o1VK7HE0
 1DJhNlDB8P7TdeWglzdshY5dTXhNB4EBEgxEy3MpWZJXoTx9pGoQHAAWE
 pn6kFQGEb/9m4mI04fPiXp3PwxcH7eUiTYfuX1Z3deX3ZVSUNUIQ26swG g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265570751"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="265570751"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 12:24:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; d="scan'208";a="680964640"
Received: from konishi-mobl.gar.corp.intel.com (HELO [10.252.6.183])
 ([10.252.6.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 12:24:40 -0700
Message-ID: <845ad9dc-4570-56de-31a9-a9898884c2b2@intel.com>
Date: Wed, 27 Apr 2022 20:24:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/4] drm/i915/gt: optimize the ccs_sz calculation per
 chunk
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220425162430.28844-1-ramalingam.c@intel.com>
 <20220425162430.28844-3-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220425162430.28844-3-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/04/2022 17:24, Ramalingam C wrote:
> Calculate the ccs_sz that needs to be emitted based on the src
> and dst pages emitted per chunk. And handle the return value of emit_pte
> for the ccs pages.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_migrate.c | 36 +++++++++----------------
>   1 file changed, 12 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 29d761da02c4..463a6a14b5f9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -647,17 +647,9 @@ static int scatter_list_length(struct scatterlist *sg)
>   
>   static void
>   calculate_chunk_sz(struct drm_i915_private *i915, bool src_is_lmem,
> -		   int *src_sz, int *ccs_sz, u32 bytes_to_cpy,
> -		   u32 ccs_bytes_to_cpy)
> +		   int *src_sz, u32 bytes_to_cpy, u32 ccs_bytes_to_cpy)
>   {
>   	if (ccs_bytes_to_cpy) {
> -		/*
> -		 * We can only copy the ccs data corresponding to
> -		 * the CHUNK_SZ of lmem which is
> -		 * GET_CCS_BYTES(i915, CHUNK_SZ))
> -		 */
> -		*ccs_sz = min_t(int, ccs_bytes_to_cpy, GET_CCS_BYTES(i915, CHUNK_SZ));
> -
>   		if (!src_is_lmem)
>   			/*
>   			 * When CHUNK_SZ is passed all the pages upto CHUNK_SZ
> @@ -713,10 +705,10 @@ intel_context_migrate_copy(struct intel_context *ce,
>   	struct drm_i915_private *i915 = ce->engine->i915;
>   	u32 ccs_bytes_to_cpy = 0, bytes_to_cpy;
>   	enum i915_cache_level ccs_cache_level;
> -	int src_sz, dst_sz, ccs_sz;
>   	u32 src_offset, dst_offset;
>   	u8 src_access, dst_access;
>   	struct i915_request *rq;
> +	int src_sz, dst_sz;
>   	bool ccs_is_src;
>   	int err;
>   
> @@ -770,7 +762,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>   	}
>   
>   	do {
> -		int len;
> +		int len, ccs_sz;

This could be moved into the reduced scope below.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   
>   		rq = i915_request_create(ce);
>   		if (IS_ERR(rq)) {
> @@ -797,7 +789,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>   		if (err)
>   			goto out_rq;
>   
> -		calculate_chunk_sz(i915, src_is_lmem, &src_sz, &ccs_sz,
> +		calculate_chunk_sz(i915, src_is_lmem, &src_sz,
>   				   bytes_to_cpy, ccs_bytes_to_cpy);
>   
>   		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
> @@ -835,33 +827,29 @@ intel_context_migrate_copy(struct intel_context *ce,
>   			if (err)
>   				goto out_rq;
>   
> +			ccs_sz = GET_CCS_BYTES(i915, len);
>   			err = emit_pte(rq, &it_ccs, ccs_cache_level, false,
>   				       ccs_is_src ? src_offset : dst_offset,
>   				       ccs_sz);
> +			if (err < 0)
> +				goto out_rq;
> +			if (err < ccs_sz) {
> +				err = -EINVAL;
> +				goto out_rq;
> +			}
>   
>   			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
>   			if (err)
>   				goto out_rq;
>   
> -			/*
> -			 * Using max of src_sz and dst_sz, as we need to
> -			 * pass the lmem size corresponding to the ccs
> -			 * blocks we need to handle.
> -			 */
> -			ccs_sz = max_t(int, ccs_is_src ? ccs_sz : src_sz,
> -				       ccs_is_src ? dst_sz : ccs_sz);
> -
>   			err = emit_copy_ccs(rq, dst_offset, dst_access,
> -					    src_offset, src_access, ccs_sz);
> +					    src_offset, src_access, len);
>   			if (err)
>   				goto out_rq;
>   
>   			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
>   			if (err)
>   				goto out_rq;
> -
> -			/* Converting back to ccs bytes */
> -			ccs_sz = GET_CCS_BYTES(rq->engine->i915, ccs_sz);
>   			ccs_bytes_to_cpy -= ccs_sz;
>   		}
>   
