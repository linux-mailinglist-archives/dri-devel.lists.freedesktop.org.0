Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392EF4E6622
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 16:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F9788B6C;
	Thu, 24 Mar 2022 15:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB63A88B6C;
 Thu, 24 Mar 2022 15:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 5492E3F3B2;
 Thu, 24 Mar 2022 16:36:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.111
X-Spam-Level: 
X-Spam-Status: No, score=-2.111 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fz9lxa_AqSGo; Thu, 24 Mar 2022 16:36:01 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D301F3F324;
 Thu, 24 Mar 2022 16:35:59 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="Ar8fTFmT";
 dkim-atps=neutral
Received: from [192.168.0.209] (unknown [192.55.54.50])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D2114362508;
 Thu, 24 Mar 2022 16:35:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1648136159; bh=kHCnijePaTHxHZIevz2QaS+9cJiCqjkDkv5m70BXYJ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ar8fTFmTOWstvfZLdu0cZ5SzdOyqgQ0GcaD8KUbjoFrjzEDqlx+hiiE2lpMq6PICF
 pZQG7xaZiexqRxrnsBVXyPTK2n66XR4Z/1L2ACSTBcsY98f2AYe9k6S2KtV98rJK2M
 +T/CzpnQDKCtInxoO6LIercKj/BhxQJXqAdkPvxI=
Message-ID: <e499a077-9998-f402-7732-047edc2f1329@shipmail.org>
Date: Thu, 24 Mar 2022 16:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v5 2/9] drm/i915/gt: Optimize the migration
 and clear loop
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220321224459.12223-1-ramalingam.c@intel.com>
 <20220321224459.12223-3-ramalingam.c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220321224459.12223-3-ramalingam.c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/21/22 23:44, Ramalingam C wrote:
> Move the static calculations out of the loops for copy and clear.
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gt/intel_migrate.c | 44 ++++++++++++-------------
>   1 file changed, 21 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 73199ebf0671..b656685a486d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -526,6 +526,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>   			   struct i915_request **out)
>   {
>   	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst);
> +	u32 src_offset, dst_offset;
>   	struct i915_request *rq;
>   	int err;
>   
> @@ -534,8 +535,20 @@ intel_context_migrate_copy(struct intel_context *ce,
>   
>   	GEM_BUG_ON(ce->ring->size < SZ_64K);
>   
> +	src_offset = 0;
> +	dst_offset = CHUNK_SZ;
> +	if (HAS_64K_PAGES(ce->engine->i915)) {
> +		GEM_BUG_ON(!src_is_lmem && !dst_is_lmem);
> +
> +		src_offset = 0;
> +		dst_offset = 0;
> +		if (src_is_lmem)
> +			src_offset = CHUNK_SZ;
> +		if (dst_is_lmem)
> +			dst_offset = 2 * CHUNK_SZ;
> +	}
> +
>   	do {
> -		u32 src_offset, dst_offset;
>   		int len;
>   
>   		rq = i915_request_create(ce);
> @@ -563,19 +576,6 @@ intel_context_migrate_copy(struct intel_context *ce,
>   		if (err)
>   			goto out_rq;
>   
> -		src_offset = 0;
> -		dst_offset = CHUNK_SZ;
> -		if (HAS_64K_PAGES(ce->engine->i915)) {
> -			GEM_BUG_ON(!src_is_lmem && !dst_is_lmem);
> -
> -			src_offset = 0;
> -			dst_offset = 0;
> -			if (src_is_lmem)
> -				src_offset = CHUNK_SZ;
> -			if (dst_is_lmem)
> -				dst_offset = 2 * CHUNK_SZ;
> -		}
> -
>   		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
>   			       src_offset, CHUNK_SZ);
>   		if (len <= 0) {
> @@ -585,12 +585,10 @@ intel_context_migrate_copy(struct intel_context *ce,
>   
>   		err = emit_pte(rq, &it_dst, dst_cache_level, dst_is_lmem,
>   			       dst_offset, len);
> -		if (err < 0)
> -			goto out_rq;
> -		if (err < len) {
> +		if (err < len)
>   			err = -EINVAL;
> +		if (err < 0)
>   			goto out_rq;
> -		}
>   
>   		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
>   		if (err)
> @@ -694,6 +692,7 @@ intel_context_migrate_clear(struct intel_context *ce,
>   {
>   	struct sgt_dma it = sg_sgt(sg);
>   	struct i915_request *rq;
> +	u32 offset;
>   	int err;
>   
>   	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
> @@ -701,8 +700,11 @@ intel_context_migrate_clear(struct intel_context *ce,
>   
>   	GEM_BUG_ON(ce->ring->size < SZ_64K);
>   
> +	offset = 0;
> +	if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
> +		offset = CHUNK_SZ;
> +
>   	do {
> -		u32 offset;
>   		int len;
>   
>   		rq = i915_request_create(ce);
> @@ -730,10 +732,6 @@ intel_context_migrate_clear(struct intel_context *ce,
>   		if (err)
>   			goto out_rq;
>   
> -		offset = 0;
> -		if (HAS_64K_PAGES(ce->engine->i915) && is_lmem)
> -			offset = CHUNK_SZ;
> -
>   		len = emit_pte(rq, &it, cache_level, is_lmem, offset, CHUNK_SZ);
>   		if (len <= 0) {
>   			err = len;
