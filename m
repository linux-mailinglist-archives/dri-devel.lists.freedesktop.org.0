Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35571300700
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 16:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA16E6E9FF;
	Fri, 22 Jan 2021 15:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBD36E9F9;
 Fri, 22 Jan 2021 15:21:11 +0000 (UTC)
IronPort-SDR: +nddeMGgv/5XXeG/NwfgjmUjtPcB1YxVJ2JR85nNyLPGWRTYWmaFhoEWmbES/Nbyxr4b6xp8bZ
 YwXRy1G+Z9pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="264277551"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="264277551"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 07:21:10 -0800
IronPort-SDR: houAtDeADSmmcQbQWowfw/7Ijefe89LxGOc9gRjLNXgmOmPoa4inxl58NBuD8nLYiCezx2bJ04
 e2d6BENtCOOw==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="385793960"
Received: from blaschkj-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.247])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 07:21:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin King <colin.king@canonical.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Ramalingam C <ramalingam.c@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH][next] drm/i915/hdcp: Fix return of value in uninitialized
 variable ret
In-Reply-To: <20210122150957.209779-1-colin.king@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210122150957.209779-1-colin.king@canonical.com>
Date: Fri, 22 Jan 2021 17:21:02 +0200
Message-ID: <87y2glj8v5.fsf@intel.com>
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Jan 2021, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently when there are other connectors on the port using HDCP the
> function _intel_hdcp_disable returns a garbage uninitialized value in
> variable ret.  I believe the intention is to return 0, so return this
> literal value instead of the value in ret.
>
> Addresses-Coverity: ("Uninitialized scalar return")
> Fixes: 899c8762f981 ("drm/i915/hdcp: Configure HDCP2.2 MST steram encryption status")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, but there's already a fix in progress:

http://lore.kernel.org/r/20210119064655.1605-3-anshuman.gupta@intel.com

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index db8dff2eeb0a..a0e7b0bf892b 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -883,7 +883,7 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
>  	 * until it disabled HDCP encryption for all connectors in MST topology.
>  	 */
>  	if (dig_port->num_hdcp_streams > 0)
> -		return ret;
> +		return 0;
>  
>  	hdcp->hdcp_encrypted = false;
>  	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
