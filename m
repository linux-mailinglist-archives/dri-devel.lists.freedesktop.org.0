Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4538F878
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 05:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1622B6E5BD;
	Tue, 25 May 2021 03:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36BB6E5BD;
 Tue, 25 May 2021 03:03:58 +0000 (UTC)
IronPort-SDR: VKJq1jfYYzBOpY1UumaAj1HLKMyXv8m5FAKTjUscEcWI1qIE4kj5bfMSKcBF3ZF/VrZ9sYxPKj
 w9F8IN4pmU2g==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="200186862"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="200186862"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 20:03:58 -0700
IronPort-SDR: bZXQsxen5wjVGpo3dSi79EVU0OVh6CkR3gqT14JNTjj5FI6Tcm/UGV4EYWwlj8coalWFrGHPQO
 g0ahnqyMj6kw==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="397185527"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 20:03:58 -0700
Date: Mon, 24 May 2021 19:56:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 14/97] drm/i915/guc: Update sizes of CTB buffers
Message-ID: <20210525025650.GA9876@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-15-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-15-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: tvrtko.ursulin@intel.com, daniele.ceraolospurio@intel.com,
 jason.ekstrand@intel.com, jon.bloomfield@intel.com, daniel.vetter@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:13:28PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Future GuC will require CTB buffers sizes to be multiple of 4K.
> Make these changes now as this shouldn't impact us too much.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 60 ++++++++++++-----------
>  1 file changed, 32 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index c54a29176862..c87a0a8bef26 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -38,6 +38,32 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
>  #define CT_PROBE_ERROR(_ct, _fmt, ...) \
>  	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__);
>  
> +/**
> + * DOC: CTB Blob
> + *
> + * We allocate single blob to hold both CTB descriptors and buffers:
> + *
> + *      +--------+-----------------------------------------------+------+
> + *      | offset | contents                                      | size |
> + *      +========+===============================================+======+
> + *      | 0x0000 | H2G `CTB Descriptor`_ (send)                  |      |
> + *      +--------+-----------------------------------------------+  4K  |
> + *      | 0x0800 | G2H `CTB Descriptor`_ (recv)                  |      |
> + *      +--------+-----------------------------------------------+------+
> + *      | 0x1000 | H2G `CT Buffer`_ (send)                       | n*4K |
> + *      |        |                                               |      |
> + *      +--------+-----------------------------------------------+------+
> + *      | 0x1000 | G2H `CT Buffer`_ (recv)                       | m*4K |
> + *      | + n*4K |                                               |      |
> + *      +--------+-----------------------------------------------+------+
> + *
> + * Size of each `CT Buffer`_ must be multiple of 4K.
> + * As we don't expect too many messages, for now use minimum sizes.
> + */
> +#define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> +#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> +#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
> +
>  struct ct_request {
>  	struct list_head link;
>  	u32 fence;
> @@ -175,29 +201,7 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>  
>  	GEM_BUG_ON(ct->vma);
>  
> -	/* We allocate 1 page to hold both descriptors and both buffers.
> -	 *       ___________.....................
> -	 *      |desc (SEND)|                   :
> -	 *      |___________|                   PAGE/4
> -	 *      :___________....................:
> -	 *      |desc (RECV)|                   :
> -	 *      |___________|                   PAGE/4
> -	 *      :_______________________________:
> -	 *      |cmds (SEND)                    |
> -	 *      |                               PAGE/4
> -	 *      |_______________________________|
> -	 *      |cmds (RECV)                    |
> -	 *      |                               PAGE/4
> -	 *      |_______________________________|
> -	 *
> -	 * Each message can use a maximum of 32 dwords and we don't expect to
> -	 * have more than 1 in flight at any time, so we have enough space.
> -	 * Some logic further ahead will rely on the fact that there is only 1
> -	 * page and that it is always mapped, so if the size is changed the
> -	 * other code will need updating as well.
> -	 */
> -
> -	blob_size = PAGE_SIZE;
> +	blob_size = 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE + CTB_G2H_BUFFER_SIZE;
>  	err = intel_guc_allocate_and_map_vma(guc, blob_size, &ct->vma, &blob);
>  	if (unlikely(err)) {
>  		CT_PROBE_ERROR(ct, "Failed to allocate %u for CTB data (%pe)\n",
> @@ -209,17 +213,17 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>  
>  	/* store pointers to desc and cmds for send ctb */
>  	desc = blob;
> -	cmds = blob + PAGE_SIZE / 2;
> -	cmds_size = PAGE_SIZE / 4;
> +	cmds = blob + 2 * CTB_DESC_SIZE;

2 is a magic number here. Think it would be more clear with
CTB_NUMBER_DESC define here.

Michal what do you think? We can fix this in the next post of this with
your blessing.

With that nit:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> +	cmds_size = CTB_H2G_BUFFER_SIZE;
>  	CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "send",
>  		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>  
>  	guc_ct_buffer_init(&ct->ctbs.send, desc, cmds, cmds_size);
>  
>  	/* store pointers to desc and cmds for recv ctb */
> -	desc = blob + PAGE_SIZE / 4;
> -	cmds = blob + PAGE_SIZE / 4 + PAGE_SIZE / 2;
> -	cmds_size = PAGE_SIZE / 4;
> +	desc = blob + CTB_DESC_SIZE;
> +	cmds = blob + 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE;
> +	cmds_size = CTB_G2H_BUFFER_SIZE;
>  	CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "recv",
>  		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>  
> -- 
> 2.28.0
> 
