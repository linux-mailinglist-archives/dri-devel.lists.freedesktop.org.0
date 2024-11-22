Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CB89D6022
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 15:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E8D10EBA7;
	Fri, 22 Nov 2024 14:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSa3LyLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E2F10EBA4;
 Fri, 22 Nov 2024 14:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732284405; x=1763820405;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Mh2fcL/PqSSF44NqD5j7AIgjDasJ295whoWJkqgrAsE=;
 b=CSa3LyLyZdaIBJ0rQzMDnfGZgAHEE06QxCEiIKbUbi9KuenzrmrhaODw
 wLPhtLX8Ybjpqq8aNtaoeaekh5zeFjK81yYkPmHyjxdmYtqIUBzL7ueEC
 XU4hl2khKtSInaSULzxvvw9ODoZeu/4AJYhWYRYYaGDUnx45WjVROhY5T
 LH6/GTt9efVr4I/+uXMQCuK/fptFeH38t/pysylcyKqB5KMunPFQ2I/ad
 WlgzdLZoqc+Ec61qGx4sodtv0ldZLj/uA1uUWt7vqbbyci0WcvT3Hk55y
 h1z6tGdyoovz78v04yJYtdDf1MlB92AxjZbTPzfyxS8Pin0WxDXvrFrhZ w==;
X-CSE-ConnectionGUID: d9j7ky9gSbeh3iIMfpHQJg==
X-CSE-MsgGUID: QAI1WGcPTxqraeqj35vAbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32597329"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="32597329"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:06:41 -0800
X-CSE-ConnectionGUID: tCloOKjXS3iCZqGUKaC/zA==
X-CSE-MsgGUID: z9A7m2W6QZmRjD5oDf0tMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="95374755"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 06:06:38 -0800
Date: Fri, 22 Nov 2024 16:07:13 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/dp: extract drm_dp_dpcd_poll_act_handled()
Message-ID: <Z0CQEQLh_Ue7Ak64@ideak-desk.fi.intel.com>
References: <cover.1731942780.git.jani.nikula@intel.com>
 <3d91f7b6639960fe688eb6ae0236254adae3e82d.1731942780.git.jani.nikula@intel.com>
 <Zz345xhVgGlshsJN@ideak-desk.fi.intel.com>
 <87bjy7zcdn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjy7zcdn.fsf@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 22, 2024 at 02:22:44PM +0200, Jani Nikula wrote:
> On Wed, 20 Nov 2024, Imre Deak <imre.deak@intel.com> wrote:
> > On Mon, Nov 18, 2024 at 05:14:52PM +0200, Jani Nikula wrote:
> >> SST with 128b/132b channel coding needs this too. Extract to a separate
> >> helper, independent of MST.
> >> 
> >> Pass timeout in as a parameter, anticipating that we can reduce the
> >> timeout for SST.
> >
> > I wish there was a DP Standard section making the above clear,
> > but I suppose we just deduct that except of the side-band messaging,
> > every other payload programming and ACT signaling is required for
> > 128b/132b SST.

The closest I found explaing the above is 5.7.5. Allocation Change
Trigger in DP Standard v2.1, maybe worth mentioning it in the commit
log.

> Ping. Okay to merge, or do we want to mull over the the timeout?

My R-b still applies, if that's enough for merging.

> I'm primarily trying to do a non-functional change. I could omit the
> timeout parameter, but for non-hubs three seconds seems excessive, and
> reducing it for hubs too is a can of worms I prefer keeping the lid on
> top.
> 
> > Cc: Lyude Paul <lyude@redhat.com>
> >
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/display/drm_dp_helper.c       | 54 ++++++++++++++++++-
> >>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 36 +------------
> >>  include/drm/display/drm_dp_helper.h           |  2 +
> >>  3 files changed, 57 insertions(+), 35 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> >> index 6ee51003de3c..b7e03bf02cd8 100644
> >> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> >> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> >> @@ -22,15 +22,16 @@
> >>  
> >>  #include <linux/backlight.h>
> >>  #include <linux/delay.h>
> >> +#include <linux/dynamic_debug.h>
> >>  #include <linux/errno.h>
> >>  #include <linux/i2c.h>
> >>  #include <linux/init.h>
> >> +#include <linux/iopoll.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/module.h>
> >>  #include <linux/sched.h>
> >>  #include <linux/seq_file.h>
> >>  #include <linux/string_helpers.h>
> >> -#include <linux/dynamic_debug.h>
> >>  
> >>  #include <drm/display/drm_dp_helper.h>
> >>  #include <drm/display/drm_dp_mst_helper.h>
> >> @@ -779,6 +780,57 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
> >>  }
> >>  EXPORT_SYMBOL(drm_dp_dpcd_read_phy_link_status);
> >>  
> >> +static int read_payload_update_status(struct drm_dp_aux *aux)
> >> +{
> >> +	int ret;
> >> +	u8 status;
> >> +
> >> +	ret = drm_dp_dpcd_readb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
> >> +	if (ret < 0)
> >> +		return ret;
> >> +
> >> +	return status;
> >> +}
> >> +
> >> +/**
> >> + * drm_dp_dpcd_poll_act_handled() - Polls for ACT handled status.
> >> + * @aux: DisplayPort AUX channel
> >> + * @timeout_ms: Timeout in ms
> >> + *
> >> + * Tries waiting for the sink to finish updating its payload table by polling
> >> + * for the ACT handled bit for up to @timeout_ms milliseconds, defaulting to
> >> + * 3000 ms if 0.
> >> + *
> >> + * Returns:
> >> + * 0 if the ACT was handled in time, negative error code on failure.
> >> + */
> >> +int drm_dp_dpcd_poll_act_handled(struct drm_dp_aux *aux, int timeout_ms)
> >
> > I wonder if it'd make sense to namespace these helpers using ll_mtp or mtp.
> 
> Honestly I think there's already enough of an acronym jumble in the
> name. At least "drm_dp_dpcd" is common for most functions around here.
> 
> 
> BR,
> Jani.
> 
> >
> >> +{
> >> +	int ret, status;
> >> +
> >
> > Extra w/s.
> >
> > Regardless of the namespace comment:
> >
> > Reviewed-by: Imre Deak <imre.deak@intel.com>
> >
> >> +	/* default to 3 seconds, this is arbitrary */
> >> +	timeout_ms = timeout_ms ?: 3000;
> >> +
> >> +	ret = readx_poll_timeout(read_payload_update_status, aux, status,
> >> +				 status & DP_PAYLOAD_ACT_HANDLED || status < 0,
> >> +				 200, timeout_ms * USEC_PER_MSEC);
> >> +	if (ret < 0 && status >= 0) {
> >> +		drm_err(aux->drm_dev, "Failed to get ACT after %d ms, last status: %02x\n",
> >> +			timeout_ms, status);
> >> +		return -EINVAL;
> >> +	} else if (status < 0) {
> >> +		/*
> >> +		 * Failure here isn't unexpected - the hub may have
> >> +		 * just been unplugged
> >> +		 */
> >> +		drm_dbg_kms(aux->drm_dev, "Failed to read payload table status: %d\n", status);
> >> +		return status;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +EXPORT_SYMBOL(drm_dp_dpcd_poll_act_handled);
> >> +
> >>  static bool is_edid_digital_input_dp(const struct drm_edid *drm_edid)
> >>  {
> >>  	/* FIXME: get rid of drm_edid_raw() */
> >> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> index ac90118b9e7a..2bdbc1eb282b 100644
> >> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> @@ -29,7 +29,6 @@
> >>  #include <linux/random.h>
> >>  #include <linux/sched.h>
> >>  #include <linux/seq_file.h>
> >> -#include <linux/iopoll.h>
> >>  
> >>  #if IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS)
> >>  #include <linux/stacktrace.h>
> >> @@ -4723,18 +4722,6 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
> >>  	return ret;
> >>  }
> >>  
> >> -static int do_get_act_status(struct drm_dp_aux *aux)
> >> -{
> >> -	int ret;
> >> -	u8 status;
> >> -
> >> -	ret = drm_dp_dpcd_readb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
> >> -	if (ret < 0)
> >> -		return ret;
> >> -
> >> -	return status;
> >> -}
> >> -
> >>  /**
> >>   * drm_dp_check_act_status() - Polls for ACT handled status.
> >>   * @mgr: manager to use
> >> @@ -4752,28 +4739,9 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
> >>  	 * There doesn't seem to be any recommended retry count or timeout in
> >>  	 * the MST specification. Since some hubs have been observed to take
> >>  	 * over 1 second to update their payload allocations under certain
> >> -	 * conditions, we use a rather large timeout value.
> >> +	 * conditions, we use a rather large timeout value of 3 seconds.
> >>  	 */
> >> -	const int timeout_ms = 3000;
> >> -	int ret, status;
> >> -
> >> -	ret = readx_poll_timeout(do_get_act_status, mgr->aux, status,
> >> -				 status & DP_PAYLOAD_ACT_HANDLED || status < 0,
> >> -				 200, timeout_ms * USEC_PER_MSEC);
> >> -	if (ret < 0 && status >= 0) {
> >> -		drm_err(mgr->dev, "Failed to get ACT after %dms, last status: %02x\n",
> >> -			timeout_ms, status);
> >> -		return -EINVAL;
> >> -	} else if (status < 0) {
> >> -		/*
> >> -		 * Failure here isn't unexpected - the hub may have
> >> -		 * just been unplugged
> >> -		 */
> >> -		drm_dbg_kms(mgr->dev, "Failed to read payload table status: %d\n", status);
> >> -		return status;
> >> -	}
> >> -
> >> -	return 0;
> >> +	return drm_dp_dpcd_poll_act_handled(mgr->aux, 3000);
> >>  }
> >>  EXPORT_SYMBOL(drm_dp_check_act_status);
> >>  
> >> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> >> index 279624833ea9..38eea21d1082 100644
> >> --- a/include/drm/display/drm_dp_helper.h
> >> +++ b/include/drm/display/drm_dp_helper.h
> >> @@ -567,6 +567,8 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
> >>  				     enum drm_dp_phy dp_phy,
> >>  				     u8 link_status[DP_LINK_STATUS_SIZE]);
> >>  
> >> +int drm_dp_dpcd_poll_act_handled(struct drm_dp_aux *aux, int timeout_ms);
> >> +
> >>  bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
> >>  				    u8 real_edid_checksum);
> >>  
> >> -- 
> >> 2.39.5
> >> 
> 
> -- 
> Jani Nikula, Intel
