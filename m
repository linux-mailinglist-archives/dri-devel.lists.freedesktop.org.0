Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE457AD69A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 13:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97FD510E01F;
	Mon, 25 Sep 2023 11:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AA910E01F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695639838; x=1727175838;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w8jzm9ukgkRaSpCF3iWY59UBd1VY/ShRBJdRFVOKN0U=;
 b=nUPOnuwIAwesCAhKDUbmf6PpjAvOkASj6KngY/wkEQNebW97J4Dc9t3w
 v5l8uRoqMXcyBa7Cd4bIx2vmb2yZ2583CVomUGCMXaZNF2wOK7KcnQQjl
 QLcnvxFUEM+ZJkbgSjkwG+mqWoMMnhoSC+ii0GSI+Dk90qAZnB4S9ViYs
 rLjnefSm4D/LehMrNFpoqZE/HGAu3Ho3KdSyZulmAcbWt7uZoP2Bkmkyq
 vBDhmRrIOrnQO1QN335xNWX3QB7sx8Osn4YWoCqFpSsKx9meCV/Ks07ah
 aoMICmlh+5Ew/rC52XewfzWOKG98D/BfuC9CIH/x3JeUP9/VbM+51Isxs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="412153495"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="412153495"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="921936202"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="921936202"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 04:03:54 -0700
Date: Mon, 25 Sep 2023 13:03:52 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] accel/ivpu: Annotate struct ivpu_job with __counted_by
Message-ID: <20230925110352.GB846747@linux.intel.com>
References: <20230922175416.work.272-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175416.work.272-kees@kernel.org>
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
Cc: Tom Rix <trix@redhat.com>, Oded Gabbay <ogabbay@kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 10:54:17AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ivpu_job.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Tom Rix <trix@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Please apply the patch via whatever tree is appropriate. Or if I have
to take it via drm-misc, please let me know.

Regards
Stanislaw

> ---
>  drivers/accel/ivpu/ivpu_job.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
> index aa1f0b9479b0..5514c2d8a609 100644
> --- a/drivers/accel/ivpu/ivpu_job.h
> +++ b/drivers/accel/ivpu/ivpu_job.h
> @@ -51,7 +51,7 @@ struct ivpu_job {
>  	u32 job_id;
>  	u32 engine_idx;
>  	size_t bo_count;
> -	struct ivpu_bo *bos[];
> +	struct ivpu_bo *bos[] __counted_by(bo_count);
>  };
>  
>  int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
> -- 
> 2.34.1
> 
