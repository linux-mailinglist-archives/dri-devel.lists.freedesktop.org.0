Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5746D3F5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 14:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B468B73308;
	Wed,  8 Dec 2021 13:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148A47330A;
 Wed,  8 Dec 2021 13:04:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="261901254"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="261901254"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 05:04:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="658278402"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 08 Dec 2021 05:04:17 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 Dec 2021 15:04:17 +0200
Date: Wed, 8 Dec 2021 15:04:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: cgel.zte@gmail.com
Subject: Re: [PATCH linux-next] drm/i915/display: Delete redundant post_mask
 assignment
Message-ID: <YbCtUZUSbEpCuDoi@intel.com>
References: <20211208074619.404138-1-luo.penghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211208074619.404138-1-luo.penghao@zte.com.cn>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luo penghao <luo.penghao@zte.com.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 08, 2021 at 07:46:19AM +0000, cgel.zte@gmail.com wrote:
> From: luo penghao <luo.penghao@zte.com.cn>
> 
> This value will be overwritten by the following if statement, even
> if the if is not executed, the value will not be used
> 
> The clang_analyzer complains as follows:
> 
> Value stored to 'port_mask' is never read
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: luo penghao <luo.penghao@zte.com.cn>
> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index bd18432..3aad0c3 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2011,7 +2011,6 @@ void intel_ddi_sanitize_encoder_pll_mapping(struct intel_encoder *encoder)
>  			return;
>  	}
>  
> -	port_mask = BIT(encoder->port);
>  	ddi_clk_needed = encoder->base.crtc;
>  
>  	if (encoder->type == INTEL_OUTPUT_DSI) {

'port_mask' declaration could now be moved into this block.

> -- 
> 2.15.2
> 

-- 
Ville Syrjälä
Intel
