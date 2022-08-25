Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9273F5A0951
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 09:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C532D89F9;
	Thu, 25 Aug 2022 06:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C0DD892B;
 Thu, 25 Aug 2022 06:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661410735; x=1692946735;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oL/cDsyvaZ2AMAuLWe4mBX/p2crsIcQ5eiyX+HbuLvc=;
 b=nl4S89VTxT/vE1Yd8BnmiStHg9XDaMf2tqcLdOsKZlUCRHoa5BtoXTGw
 dDOHjdaaJtcPtrcCtgzLIj+icqTI2n+6edj0FUq+iXKeEdUTz0fc0AYTw
 v1seEbLEbA33qbqUCVzI+ErdwaouUnKcrB99oX4B+nI0aMphdgFfTw3zI
 1gpg7Es+Ta59+G0oDAcpVTZnJv2EkFtrrfjKGslfJDPSWF+TUBzBm8aBC
 eZOEFMpVZwk8zXhf8xLAmLWvg9ziCPl+hl9wUGEje6Vv3jxEfUQOBjU/R
 TX7HZKuRoByjK5IplLd6YxKXNZMzQ6A54YwisBt1irIprm63Q0ElOb0HG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="380454575"
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; d="scan'208";a="380454575"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 23:51:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,262,1654585200"; d="scan'208";a="670847183"
Received: from pranavir-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.50.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 23:51:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lv qian <lvqian@nfschina.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: Re: [PATCH] drm/i915:Move the code position to reduce the number of
 judgments
In-Reply-To: <20220825013752.120988-1-lvqian@nfschina.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220825013752.120988-1-lvqian@nfschina.com>
Date: Thu, 25 Aug 2022 09:51:39 +0300
Message-ID: <87h720izno.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lv qian <lvqian@nfschina.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Aug 2022, Lv qian <lvqian@nfschina.com> wrote:
> 	If the kmalloc allocation is successful, the if is judged twice, 
> 	so I move the second judgment in to the first judgment.

The code is fine as it is.

BR,
Jani.

>
> Signed-off-by: Lv qian <lvqian@nfschina.com>
> ---
>  drivers/gpu/drm/i915/i915_gpu_error.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 32e92651ef7c..c8230a8beadb 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -112,10 +112,10 @@ static bool __i915_error_grow(struct drm_i915_error_state_buf *e, size_t len)
>  	if (!e->buf) {
>  		e->size = PAGE_ALIGN(len + 1);
>  		e->buf = kmalloc(e->size, GFP_KERNEL);
> -	}
> -	if (!e->buf) {
> -		e->err = -ENOMEM;
> -		return false;
> +		if (!e->buf) {
> +			e->err = -ENOMEM;
> +			return false;
> +		}
>  	}
>  
>  	return true;

-- 
Jani Nikula, Intel Open Source Graphics Center
