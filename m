Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFD0467E66
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 20:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526A77BDEF;
	Fri,  3 Dec 2021 19:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D586E7BDED;
 Fri,  3 Dec 2021 19:43:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="297842920"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="297842920"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 11:43:53 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="678208771"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 11:43:53 -0800
Date: Fri, 3 Dec 2021 11:38:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix error pointer dereference in
 i915_gem_do_execbuffer()
Message-ID: <20211203193826.GA31951@jons-linux-dev-box>
References: <20211202044831.29583-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202044831.29583-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 01, 2021 at 08:48:31PM -0800, Matthew Brost wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Originally "out_fence" was set using out_fence = sync_file_create() but
> which returns NULL, but now it is set with out_fence = eb_requests_create()
> which returns error pointers.  The error path needs to be modified to
> avoid an Oops in the "goto err_request;" path.
> 
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 9f7c6ecadb90..6db588b9a30e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3288,6 +3288,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  	out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
>  	if (IS_ERR(out_fence)) {
>  		err = PTR_ERR(out_fence);
> +		out_fence = NULL;
>  		if (eb.requests[0])
>  			goto err_request;
>  		else
> -- 
> 2.33.1
> 
