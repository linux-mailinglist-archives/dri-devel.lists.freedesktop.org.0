Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F6511E1F0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6421F6E31D;
	Fri, 13 Dec 2019 10:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9052C6E31D;
 Fri, 13 Dec 2019 10:29:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 02:29:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="246083915"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga002.fm.intel.com with ESMTP; 13 Dec 2019 02:29:50 -0800
Date: Fri, 13 Dec 2019 15:59:02 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2 02/12] drm/i915: Clear the repeater bit on HDCP disable
Message-ID: <20191213102902.GB3829@intel.com>
References: <20191212190230.188505-1-sean@poorly.run>
 <20191212190230.188505-3-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212190230.188505-3-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2019-12-12 at 14:02:20 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> On HDCP disable, clear the repeater bit. This ensures if we connect a
> non-repeater sink after a repeater, the bit is in the state we expect.
> 
> Fixes: ee5e5e7a5e0f ("drm/i915: Add HDCP framework + base implementation")
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v4.17+
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Changes in v2:
> -Added to the set
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index eaab9008feef..c4394c8e10eb 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -773,6 +773,7 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
>  	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
>  	enum port port = intel_dig_port->base.port;
>  	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
> +	u32 repeater_ctl;
>  	int ret;
>  
>  	DRM_DEBUG_KMS("[%s:%d] HDCP is being disabled...\n",
> @@ -787,6 +788,10 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
>  		return -ETIMEDOUT;
>  	}
>  
> +	repeater_ctl = intel_hdcp_get_repeater_ctl(dev_priv, cpu_transcoder,
> +						   port);
> +	I915_WRITE(HDCP_REP_CTL, I915_READ(HDCP_REP_CTL) & ~repeater_ctl);
Do you think it will help to (double) clear HDCP_REP_CTL when detect a
sink which is non repeater!? But yes disable will be executed on all
HDCP exits.

> +
LGTM

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>

>  	ret = hdcp->shim->toggle_signalling(intel_dig_port, false);
>  	if (ret) {
>  		DRM_ERROR("Failed to disable HDCP signalling\n");
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
