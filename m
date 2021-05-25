Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9844B38F867
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 05:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABFE6E504;
	Tue, 25 May 2021 03:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3326E504;
 Tue, 25 May 2021 03:00:37 +0000 (UTC)
IronPort-SDR: L9FBviW6KMjau2IgOAS8DdFf9ogT2bjeIuUgW6codGfyS4kcu8dhLp1r4x13fGwBXpPuuN6T/x
 ADIONQeFyrrA==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="287658566"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="287658566"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 20:00:36 -0700
IronPort-SDR: aYnW53MNtKuXWPROa8o2cImMZgxCe6T+wSYAbA8ByDuLbz8keTOI4qvp5cJIeC11gZOLAZss5S
 TtNFq/KUUdzw==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="435527486"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 20:00:36 -0700
Date: Mon, 24 May 2021 19:53:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 12/97] drm/i915/guc: Don't repeat CTB layout
 calculations
Message-ID: <20210525025328.GA9162@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-13-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-13-matthew.brost@intel.com>
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

On Thu, May 06, 2021 at 12:13:26PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> We can retrieve offsets to cmds buffers and descriptor from
> actual pointers that we already keep locally.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index dbece569fbe4..fbd6bd20f588 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -244,6 +244,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>  {
>  	struct intel_guc *guc = ct_to_guc(ct);
>  	u32 base, cmds;
> +	void *blob;
>  	int err;
>  	int i;
>  
> @@ -251,15 +252,18 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>  
>  	/* vma should be already allocated and map'ed */
>  	GEM_BUG_ON(!ct->vma);
> +	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(ct->vma->obj));

This doesn't really have anything to do with this patch, but again this
patch will be squashed into a large patch updating the GuC firmware, so
I think this is fine.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  	base = intel_guc_ggtt_offset(guc, ct->vma);
>  
> -	/* (re)initialize descriptors
> -	 * cmds buffers are in the second half of the blob page
> -	 */
> +	/* blob should start with send descriptor */
> +	blob = __px_vaddr(ct->vma->obj);
> +	GEM_BUG_ON(blob != ct->ctbs[CTB_SEND].desc);
> +
> +	/* (re)initialize descriptors */
>  	for (i = 0; i < ARRAY_SIZE(ct->ctbs); i++) {
>  		GEM_BUG_ON((i != CTB_SEND) && (i != CTB_RECV));
>  
> -		cmds = base + PAGE_SIZE / 4 * i + PAGE_SIZE / 2;
> +		cmds = base + ptrdiff(ct->ctbs[i].cmds, blob);
>  		CT_DEBUG(ct, "%d: cmds addr=%#x\n", i, cmds);
>  
>  		guc_ct_buffer_reset(&ct->ctbs[i], cmds);
> @@ -269,12 +273,12 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>  	 * Register both CT buffers starting with RECV buffer.
>  	 * Descriptors are in first half of the blob.
>  	 */
> -	err = ct_register_buffer(ct, base + PAGE_SIZE / 4 * CTB_RECV,
> +	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs[CTB_RECV].desc, blob),
>  				 INTEL_GUC_CT_BUFFER_TYPE_RECV);
>  	if (unlikely(err))
>  		goto err_out;
>  
> -	err = ct_register_buffer(ct, base + PAGE_SIZE / 4 * CTB_SEND,
> +	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs[CTB_SEND].desc, blob),
>  				 INTEL_GUC_CT_BUFFER_TYPE_SEND);
>  	if (unlikely(err))
>  		goto err_deregister;
> -- 
> 2.28.0
> 
