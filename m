Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA63725467A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 16:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02DE6E461;
	Thu, 27 Aug 2020 14:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147FA6E447;
 Thu, 27 Aug 2020 14:09:53 +0000 (UTC)
IronPort-SDR: 8p5xA7Ftnf40BfIaqBb6mgmy0i3bibHhw5Upt/neciCZ9PcuvVDsJ+6S9vGReMpkPQq8xWqUfq
 WVhwll55EZvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="174532804"
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="174532804"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 07:09:52 -0700
IronPort-SDR: tTSvESxR9RipwxjZHhADv4pjL5OiXsRMFEjlqizOteBN7KVDQkX1PUKc/XjSYDB4yBf/3XF4r+
 1ufOHdWC+N/g==
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; d="scan'208";a="475227761"
Received: from jhaapako-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.249.33.115])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 07:09:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v5 13/20] drm/i915/dp: Extract
 drm_dp_read_downstream_info()
In-Reply-To: <20200826182456.322681-14-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200826182456.322681-1-lyude@redhat.com>
 <20200826182456.322681-14-lyude@redhat.com>
Date: Thu, 27 Aug 2020 17:09:42 +0300
Message-ID: <87a6yg5gex.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Aug 2020, Lyude Paul <lyude@redhat.com> wrote:
> We're going to be doing the same probing process in nouveau for
> determining downstream DP port capabilities, so let's deduplicate the
> work by moving i915's code for handling this into a shared helper:
> drm_dp_read_downstream_info().
>
> Note that when we do this, we also do make some functional changes while
> we're at it:
> * We always clear the downstream port info before trying to read it,
>   just to make things easier for the caller
> * We skip reading downstream port info if the DPCD indicates that we
>   don't support downstream port info
> * We only read as many bytes as needed for the reported number of
>   downstream ports, no sense in reading the whole thing every time
>
> v2:
> * Fixup logic for calculating the downstream port length to account for
>   the fact that downstream port caps can be either 1 byte or 4 bytes
>   long. We can actually skip fixing the max_clock/max_bpc helpers here
>   since they all check for DP_DETAILED_CAP_INFO_AVAILABLE anyway.
> * Fix ret code check for drm_dp_dpcd_read
> v5:
> * Change name from drm_dp_downstream_read_info() to
>   drm_dp_read_downstream_info()
> * Also, add "See Also" sections for the various downstream info
>   functions (drm_dp_read_downstream_info(), drm_dp_downstream_max_clock(),
>   drm_dp_downstream_max_bpc())
>
> Reviewed-by: Sean Paul <sean@poorly.run>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> squash! drm/i915/dp: Extract drm_dp_read_downstream_info()

Whoops!

>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c         | 62 ++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_dp.c | 14 +-----
>  include/drm/drm_dp_helper.h             |  3 ++
>  3 files changed, 65 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 4c21cf69dad5a..f3643894ad951 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -423,6 +423,56 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
>  }
>  EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
>  
> +static u8 drm_dp_downstream_port_count(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +	u8 port_count = dpcd[DP_DOWN_STREAM_PORT_COUNT] & DP_PORT_COUNT_MASK;
> +
> +	if (dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DETAILED_CAP_INFO_AVAILABLE && port_count > 4)
> +		port_count = 4;
> +
> +	return port_count;
> +}
> +
> +/**
> + * drm_dp_read_downstream_info() - read DPCD downstream port info if available
> + * @aux: DisplayPort AUX channel
> + * @dpcd: A cached copy of the port's DPCD
> + * @downstream_ports: buffer to store the downstream port info in
> + *
> + * See also:
> + * drm_dp_downstream_max_clock()
> + * drm_dp_downstream_max_bpc()
> + *
> + * Returns: 0 if either the downstream port info was read successfully or
> + * there was no downstream info to read, or a negative error code otherwise.
> + */
> +int drm_dp_read_downstream_info(struct drm_dp_aux *aux,
> +				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> +				u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS])
> +{
> +	int ret;
> +	u8 len;
> +
> +	memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
> +
> +	/* No downstream info to read */
> +	if (!drm_dp_is_branch(dpcd) ||
> +	    dpcd[DP_DPCD_REV] < DP_DPCD_REV_10 ||
> +	    !(dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT))
> +		return 0;

Generally I think stuff like this is easier and faster to read with
multiple if statements and early returns, but *shrug*.

I really hope we didn't have a reason to not check
DP_DWN_STRM_PORT_PRESENT here... there's been a lot of junk branch
devices in the past. Fingers crossed.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> +
> +	len = drm_dp_downstream_port_count(dpcd);
> +	if (dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DETAILED_CAP_INFO_AVAILABLE)
> +		len *= 4;
> +
> +	ret = drm_dp_dpcd_read(aux, DP_DOWNSTREAM_PORT_0, downstream_ports, len);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ret == len ? 0 : -EIO;
> +}
> +EXPORT_SYMBOL(drm_dp_read_downstream_info);
> +
>  /**
>   * drm_dp_downstream_max_clock() - extract branch device max
>   *                                 pixel rate for legacy VGA
> @@ -431,7 +481,11 @@ EXPORT_SYMBOL(drm_dp_send_real_edid_checksum);
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: port capabilities
>   *
> - * Returns max clock in kHz on success or 0 if max clock not defined
> + * See also:
> + * drm_dp_read_downstream_info()
> + * drm_dp_downstream_max_bpc()
> + *
> + * Returns: Max clock in kHz on success or 0 if max clock not defined
>   */
>  int drm_dp_downstream_max_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				const u8 port_cap[4])
> @@ -462,7 +516,11 @@ EXPORT_SYMBOL(drm_dp_downstream_max_clock);
>   * @dpcd: DisplayPort configuration data
>   * @port_cap: port capabilities
>   *
> - * Returns max bpc on success or 0 if max bpc not defined
> + * See also:
> + * drm_dp_read_downstream_info()
> + * drm_dp_downstream_max_clock()
> + *
> + * Returns: Max bpc on success or 0 if max bpc not defined
>   */
>  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  			      const u8 port_cap[4])
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4c7314b7a84e4..9c4b806af8c79 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4685,18 +4685,8 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  			return false;
>  	}
>  
> -	if (!drm_dp_is_branch(intel_dp->dpcd))
> -		return true; /* native DP sink */
> -
> -	if (intel_dp->dpcd[DP_DPCD_REV] == 0x10)
> -		return true; /* no per-port downstream info */
> -
> -	if (drm_dp_dpcd_read(&intel_dp->aux, DP_DOWNSTREAM_PORT_0,
> -			     intel_dp->downstream_ports,
> -			     DP_MAX_DOWNSTREAM_PORTS) < 0)
> -		return false; /* downstream port status fetch failed */
> -
> -	return true;
> +	return drm_dp_read_downstream_info(&intel_dp->aux, intel_dp->dpcd,
> +					   intel_dp->downstream_ports) == 0;
>  }
>  
>  static bool
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 5c28199248626..b8716b200666f 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1613,6 +1613,9 @@ int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
>  bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
>  				    u8 real_edid_checksum);
>  
> +int drm_dp_read_downstream_info(struct drm_dp_aux *aux,
> +				const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> +				u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS]);
>  int drm_dp_downstream_max_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				const u8 port_cap[4]);
>  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
