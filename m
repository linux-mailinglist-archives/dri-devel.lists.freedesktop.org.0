Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DB34534B2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 15:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA7A6E093;
	Tue, 16 Nov 2021 14:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E666E093;
 Tue, 16 Nov 2021 14:53:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="257462525"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="257462525"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 06:53:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="454476963"
Received: from jprocter-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.39.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 06:53:39 -0800
Date: Tue, 16 Nov 2021 09:53:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: fix NULL vs IS_ERR() checking
Message-ID: <YZPF8vuxAsLmWQln@intel.com>
References: <20211116114916.GB11936@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116114916.GB11936@kili>
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
Cc: Matthew Brost <matthew.brost@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 02:49:16PM +0300, Dan Carpenter wrote:
> The intel_engine_create_virtual() function does not return NULL.  It
> returns error pointers.
> 
> Fixes: e5e32171a2cf ("drm/i915/guc: Connect UAPI to GuC multi-lrc interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 38b47e73e35d..c48557dfa04c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3080,8 +3080,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
>  
>  		ce = intel_engine_create_virtual(siblings, num_siblings,
>  						 FORCE_VIRTUAL);
> -		if (!ce) {
> -			err = ERR_PTR(-ENOMEM);
> +		if (IS_ERR(ce)) {
> +			err = ERR_CAST(ce);
>  			goto unwind;
>  		}
>  
> -- 
> 2.20.1
> 
