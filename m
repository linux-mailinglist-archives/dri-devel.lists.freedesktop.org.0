Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3434230BF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 21:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749D16E450;
	Tue,  5 Oct 2021 19:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD2B6E44F;
 Tue,  5 Oct 2021 19:27:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="225729812"
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="225729812"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 12:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,349,1624345200"; d="scan'208";a="458176402"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 05 Oct 2021 12:26:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 05 Oct 2021 22:26:55 +0300
Date: Tue, 5 Oct 2021 22:26:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/tc: Delete bogus NULL check in
 intel_ddi_encoder_destroy()
Message-ID: <YVym/wi1xCuyntvY@intel.com>
References: <20211004103737.GC25015@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004103737.GC25015@kili>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 04, 2021 at 01:37:37PM +0300, Dan Carpenter wrote:
> The "digi_port" pointer can't be NULL and we have already dereferenced
> it so checking for NULL is not necessary.  Delete the check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks. Applied to drm-intel-next.

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 51d07e9af9f3..b9c6eb13804f 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4025,8 +4025,7 @@ static void intel_ddi_encoder_destroy(struct drm_encoder *encoder)
>  	intel_display_power_flush_work(i915);
>  
>  	drm_encoder_cleanup(encoder);
> -	if (dig_port)
> -		kfree(dig_port->hdcp_port_data.streams);
> +	kfree(dig_port->hdcp_port_data.streams);
>  	kfree(dig_port);
>  }
>  
> -- 
> 2.20.1

-- 
Ville Syrjälä
Intel
