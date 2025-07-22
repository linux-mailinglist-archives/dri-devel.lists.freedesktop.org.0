Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D28B0E406
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 21:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB9010E324;
	Tue, 22 Jul 2025 19:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="CQ60EPoz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8961A10E324;
 Tue, 22 Jul 2025 19:21:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753212098; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YOi6TTEwIU2i9DCnhpi0g1oF/9DeebmF2lachFVjl68/HyOjwDyixlFUsyDM+8ZaikTpedNCH7Df8MoFWFtXSvLoElq9nFa7SY3lLU/WjT+mP2BXngXnLRwfuUUeMnliLj+eFD+DZ//t9yE5sagXFtCsk2goch+18EibRStPsGQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753212098;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Qai5M5VsrAf1/MTCRQHTr0B01Buum0Ep0FyLGUM5vS8=; 
 b=d1zuihA9HrYBTvYTh+ob+jYW6BlahuDns2mqMGjFdfqM/QRHmgQszjBoPeFAYnZD5N2za9GGveKam6JH+PSrcaIFow+TAq+q3/xEuI4jiRwN2LX3UHwMNyv63ftGS2Yj/hxMUxKzAYv+lbFTzV/dGT32SPv6Gea2atfDlk0a2Rc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753212098; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=Qai5M5VsrAf1/MTCRQHTr0B01Buum0Ep0FyLGUM5vS8=;
 b=CQ60EPozePG5VpzlDk6J6JJ+PmMEOg6A/Eip79NbBhAnrfkPc+b3d4sXA5MnHcip
 KUvlOXhHhH5OMVZoe7UHch1ze2nC45l9k8KLQ+lGgUJyVqJmmW3ZQvlxVA15h6SQaWS
 ZdfDZMa1Yf7gFOlirmiLDd2zMgBEypMPbSc1AxhU=
Received: by mx.zohomail.com with SMTPS id 1753212096981311.77162614318456;
 Tue, 22 Jul 2025 12:21:36 -0700 (PDT)
Date: Tue, 22 Jul 2025 20:21:25 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v4 5/7] drm/gpuvm: Add a flags field to
 drm_gpuvm_map_req/drm_gpuva_op_map
Message-ID: <rquyd5sq4y6dhnnbqcmnorvhzvui6kbpysol6idinuwajlmawn@awv2uqosdacl>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-6-caterina.shablia@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707170442.1437009-6-caterina.shablia@collabora.com>
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

On 07.07.2025 17:04, Caterina Shablia wrote:
> From: Asahi Lina <lina@asahilina.net>
>
> drm_gpuva objects have a flags field. Currently, this can be managed by
> drivers out-of-band, without any special handling in drm_gpuvm.
>
> To be able to introduce flags that do affect the logic in the drm_gpuvm
> core, we need to plumb it through the map calls. This will allow the
> core to check the flags on map and alter the merge/split logic depending
> on the requested flags and the flags of the existing drm_gpuva ranges
> that are being split.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 7 +++++++
>  include/drm/drm_gpuvm.h     | 9 +++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index dc3c2f906400..dd949a8853b0 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2063,6 +2063,7 @@ op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
>  	op.map.va.range = req->va.range;
>  	op.map.gem.obj = req->gem.obj;
>  	op.map.gem.offset = req->gem.offset;
> +	op.map.flags = req->flags;
>
>  	return fn->sm_step_map(&op, priv);
>  }
> @@ -2175,6 +2176,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					.va.range = range - req->va.range,
>  					.gem.obj = obj,
>  					.gem.offset = offset + req->va.range,
> +					.flags = va->flags,
>  				};
>  				struct drm_gpuva_op_unmap u = {
>  					.va = va,
> @@ -2193,6 +2195,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				.va.range = ls_range,
>  				.gem.obj = obj,
>  				.gem.offset = offset,
> +				.flags = va->flags,
>  			};
>  			struct drm_gpuva_op_unmap u = { .va = va };
>
> @@ -2219,6 +2222,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					.gem.obj = obj,
>  					.gem.offset = offset + ls_range +
>  						      req->va.range,
> +					.flags = va->flags,
>  				};
>
>  				ret = op_remap_cb(ops, priv, &p, &n, &u);
> @@ -2247,6 +2251,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					.va.range = end - req_end,
>  					.gem.obj = obj,
>  					.gem.offset = offset + req_end - addr,
> +					.flags = va->flags,
>  				};
>  				struct drm_gpuva_op_unmap u = {
>  					.va = va,
> @@ -2290,6 +2295,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>  			prev.va.range = req_addr - addr;
>  			prev.gem.obj = obj;
>  			prev.gem.offset = offset;
> +			prev.flags = va->flags;
>
>  			prev_split = true;
>  		}
> @@ -2299,6 +2305,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>  			next.va.range = end - req_end;
>  			next.gem.obj = obj;
>  			next.gem.offset = offset + (req_end - addr);
> +			next.flags = va->flags;
>
>  			next_split = true;
>  		}
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index a6e6c33fc10b..f77a89e791f1 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -847,6 +847,11 @@ struct drm_gpuva_op_map {
>  		 */
>  		struct drm_gem_object *obj;
>  	} gem;
> +
> +	/**
> +	 * @flags: requested flags for the &drm_gpuva for this mapping
> +	 */
> +	enum drm_gpuva_flags flags;
>  };
>
>  /**
> @@ -1074,6 +1079,9 @@ struct drm_gpuvm_map_req {
>  		/** @offset: offset in the GEM */
>  		u64 offset;
>  	} gem;
> +
> +	/** @flags: combination of DRM_GPUVA_ flags describing the mapping properties. */
> +	enum drm_gpuva_flags flags;

Wouldn't this be better expressed as a u32 combination of enum drm_gpuva_flags flags?
Calling it 'flags' makes me feel like any OR'd combination of enum values would be possible.

>  };
>
>  struct drm_gpuva_ops *
> @@ -1097,6 +1105,7 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
>  static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
>  					  struct drm_gpuva_op_map *op)
>  {
> +	va->flags = op->flags;
>  	va->va.addr = op->va.addr;
>  	va->va.range = op->va.range;
>  	va->gem.obj = op->gem.obj;
> --
> 2.47.2

Adrian Larumbe
