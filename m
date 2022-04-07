Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDCF4F8822
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 21:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC7810ED34;
	Thu,  7 Apr 2022 19:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3AF10E812;
 Thu,  7 Apr 2022 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649359936; x=1680895936;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=I+5K1JdrruXJVMHbrqjXWaWvSlpHKmRZgbR2hOoO0fs=;
 b=UxsEqkuyYj1sniJf3+G/iTi9B2+RGuXL42hIp0zakepzLugJnacCUQZY
 7WV2UB7JjSWbWPpLsmJAnX89mtW3jxxLFfIYEuS/J6K0cMDC3gTQAsXJq
 PpQZK/0SJi9B9Bj5H18A5hxpBhLXaVdUNwIRQWNfGW9H4p6Yo+cAZeBcW
 zudnUGQMydOsgugSGHkP/tXwmf2zXck0m6fb+hc8qxfKM81oDW2FClDXA
 aecBIIUuBbBHqRyit0QH0diYMtyJ695zTBqhVimFzjhGsYYSAEGrgdjDb
 rcIUxhkueeNgbOnKfXMjLgXYuveXugAcfWlhFnLkW13Or1U7vHmbkoR84 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="322113984"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="322113984"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 12:32:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="550207984"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 12:32:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/dp: Export drm_dp_dpcd_access()
In-Reply-To: <20220407183826.724106-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220407183826.724106-1-imre.deak@intel.com>
Date: Thu, 07 Apr 2022 22:32:11 +0300
Message-ID: <87lewg3d1g.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Apr 2022, Imre Deak <imre.deak@intel.com> wrote:
> The next patch needs a way to read a DPCD register without the preceding
> wake-up read in drm_dp_dpcd_read(). Export drm_dp_dpcd_access() to allow
> this.

I think I'd rather you added a special "probe" function for this
specific purpose. I think drm_dp_dpcd_access() is a too generic low
level function to export, and runs the risk of complicating any
potential future refactoring of the DP AUX code.

Something like this:

ssize_t drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);

And you could reuse that for the wakeup in drm_dp_dpcd_read() too.


BR,
Jani.

>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/dp/drm_dp.c    | 19 +++++++++++++++++--
>  include/drm/dp/drm_dp_helper.h |  2 ++
>  2 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
> index 580016a1b9eb7..8b181314edcbe 100644
> --- a/drivers/gpu/drm/dp/drm_dp.c
> +++ b/drivers/gpu/drm/dp/drm_dp.c
> @@ -470,8 +470,22 @@ drm_dp_dump_access(const struct drm_dp_aux *aux,
>   * Both native and I2C-over-AUX transactions are supported.
>   */
>  
> -static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
> -			      unsigned int offset, void *buffer, size_t size)
> +/**
> + * drm_dp_dpcd_access() - read or write a series of bytes from/to the DPCD
> + * @aux: DisplayPort AUX channel (SST)
> + * @request: DP_AUX_NATIVE_READ or DP_AUX_NATIVE_WRITE
> + * @offset: address of the (first) register to read or write
> + * @buffer: buffer with the register values to write or the register values read
> + * @size: number of bytes in @buffer
> + *
> + * Returns the number of bytes transferred on success, or a negative error
> + * code on failure. This is a low-level function only for SST sinks and cases
> + * where calling drm_dp_dpcd_read()/write() is not possible (for instance due
> + * to the wake-up register read in drm_dp_dpcd_read()). For all other cases
> + * the latter functions should be used.
> + */
> +int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
> +		       unsigned int offset, void *buffer, size_t size)
>  {
>  	struct drm_dp_aux_msg msg;
>  	unsigned int retry, native_reply;
> @@ -526,6 +540,7 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
>  	mutex_unlock(&aux->hw_mutex);
>  	return ret;
>  }
> +EXPORT_SYMBOL(drm_dp_dpcd_access);
>  
>  /**
>   * drm_dp_dpcd_read() - read a series of bytes from the DPCD
> diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
> index 1eccd97419436..7cf6e83434a8c 100644
> --- a/include/drm/dp/drm_dp_helper.h
> +++ b/include/drm/dp/drm_dp_helper.h
> @@ -2053,6 +2053,8 @@ struct drm_dp_aux {
>  	bool is_remote;
>  };
>  
> +int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
> +		       unsigned int offset, void *buffer, size_t size);
>  ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>  			 void *buffer, size_t size);
>  ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,

-- 
Jani Nikula, Intel Open Source Graphics Center
