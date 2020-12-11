Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B9C2D7022
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 07:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509266E02D;
	Fri, 11 Dec 2020 06:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB606E02D;
 Fri, 11 Dec 2020 06:25:51 +0000 (UTC)
IronPort-SDR: BtQcTjxlBhztFL2N+40hsvljkkn4zD1joE8XseG29FrnslM6rM2foKnF9i+2PiH6Vokr8j72Lx
 2wUBQXCbR0Xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="162143470"
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; d="scan'208";a="162143470"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 22:25:50 -0800
IronPort-SDR: ELMKi+THYQlDItNYpm4hD5B/S8/mPcBiBvP5d9Bl4l5zzF/jAUhW5PyTOUK4YsHkH/jDG2p9QI
 MHRyouFwuGGQ==
X-IronPort-AV: E=Sophos;i="5.78,410,1599548400"; d="scan'208";a="333854032"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 22:25:47 -0800
Date: Fri, 11 Dec 2020 11:55:34 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v7 04/18] drm/i915/hdcp: No HDCP when encoder is't
 initialized
Message-ID: <20201211062534.GA1297@intel.com>
References: <20201210062640.11783-1-anshuman.gupta@intel.com>
 <20201210062640.11783-5-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210062640.11783-5-anshuman.gupta@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 uma.shankar@intel.com, seanpaul@chromium.org, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-12-10 at 11:56:26 +0530, Anshuman Gupta wrote:
> There can be situation when DP MST connector is created without
> mst modeset being done, in those cases connector->encoder will be
> NULL. MST connector->encoder initializes after modeset.
> Don't enable HDCP in such cases to prevent any crash.

LGTM..
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Juston Li <juston.li@intel.com>
> Tested-by: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index b9d8825e2bb1..7d63e9495956 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2106,6 +2106,12 @@ int intel_hdcp_enable(struct intel_connector *connector,
>  	if (!hdcp->shim)
>  		return -ENOENT;
>  
> +	if (!connector->encoder) {
> +		drm_err(&dev_priv->drm, "[%s:%d] encoder is not initialized\n",
> +			connector->base.name, connector->base.base.id);
> +		return -ENODEV;
> +	}
> +
>  	mutex_lock(&hdcp->mutex);
>  	mutex_lock(&dig_port->hdcp_mutex);
>  	drm_WARN_ON(&dev_priv->drm,
> -- 
> 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
