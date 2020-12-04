Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE292CEA6A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 10:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CB76E139;
	Fri,  4 Dec 2020 09:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76756E135;
 Fri,  4 Dec 2020 09:02:37 +0000 (UTC)
IronPort-SDR: J4zrkhhb+FuXTnLtnq2jzYJlFadYSQSta/ZvFHWEEwc8S8X0LIouZeubnWNiWAgaJ/4CumOFwe
 t18MAGc+4oEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="170781561"
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="170781561"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 01:02:36 -0800
IronPort-SDR: 93oqj+yMLNMQ6nd884NHkOlG8oEZ7fcduNJhMBIPxZsM9iPL2giNKQJ/CZOjQMkBesBWV75T0A
 1LumlZ9EsPxw==
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="540619939"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 01:02:33 -0800
Date: Fri, 4 Dec 2020 14:32:16 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v6 04/18] drm/i915/hdcp: No HDCP when encoder is't
 initialized
Message-ID: <20201204090216.GA5336@intel.com>
References: <20201126073722.19107-1-anshuman.gupta@intel.com>
 <20201126073722.19107-5-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126073722.19107-5-anshuman.gupta@intel.com>
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
 dri-devel@lists.freedesktop.org, uma.shankar@intel.com, seanpaul@chromium.org,
 juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-26 at 13:07:08 +0530, Anshuman Gupta wrote:
> There can be situation when DP MST connector is created without
> mst modeset being done, in those cases connector->encoder will be
> NULL. MST connector->encoder initializes after modeset.

This patch is to reject the HDCP request on MST connector without
encoder initialized(modeset). But userspace are not supposed to request hdcp at such
scenario right?.

Ram

> Don't enable HDCP in such cases to prevent any crash.
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Juston Li <juston.li@intel.com>
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
