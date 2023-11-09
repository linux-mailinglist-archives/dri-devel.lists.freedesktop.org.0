Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554827E7258
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 20:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BA710E8F8;
	Thu,  9 Nov 2023 19:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A9410E8F8;
 Thu,  9 Nov 2023 19:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699558245; x=1731094245;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pqDz+sc/+C+AMR4bPCvv/cCskCFFIrQJqu2d75D/nzI=;
 b=HUKvJf1nR3oPpWYllzV0QPn9/i3k9Mf/jnjLrh2GHgKlCTBzJnQq63mZ
 ei+95pQ2o0mIZLTlwvdxUJMYphoY3wSYJSZu3JaqFMjrFN5Ut4qhfm4ZE
 iDFqjwc8PP4bUAonsPI/8QgCj3YsyhZQJafOgM792SYkqtWmJBtTXoXuN
 w+UhQa/lWr3gmucLLU/B2fEfsk+IndwqOB0CqRxtbPhI9xW/lxcwkk4p0
 oLaCOzshIRYsJGHd2QSDP2cwFwgLyucdrJSSYRRMpnlTbZjf8RvdkMUKg
 6zvyxowfBR+huG4gB1kf7XF0C1o2k6ZBjXbwwbG7myduiPFCpHwZ1FIVc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3096805"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="3096805"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 11:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="756987828"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="756987828"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 09 Nov 2023 11:30:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 09 Nov 2023 21:30:41 +0200
Date: Thu, 9 Nov 2023 21:30:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Read a shadowed mmio register for
 ggtt flush
Message-ID: <ZU0zYaFkpZJoUcZE@intel.com>
References: <20231109192148.475156-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231109192148.475156-1-vinay.belgaumkar@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 11:21:48AM -0800, Vinay Belgaumkar wrote:
> We read RENDER_HEAD as a part of the flush. If GT is in
> deeper sleep states, this could lead to read errors since we are
> not using a forcewake. Safer to read a shadowed register instead.

IIRC shadowing is only thing for writes, not reads.

> 
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index ed32bf5b1546..ea814ea5f700 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -451,7 +451,7 @@ void intel_gt_flush_ggtt_writes(struct intel_gt *gt)
>  
>  		spin_lock_irqsave(&uncore->lock, flags);
>  		intel_uncore_posting_read_fw(uncore,
> -					     RING_HEAD(RENDER_RING_BASE));
> +					     RING_TAIL(RENDER_RING_BASE));
>  		spin_unlock_irqrestore(&uncore->lock, flags);
>  	}
>  }
> -- 
> 2.38.1

-- 
Ville Syrjälä
Intel
