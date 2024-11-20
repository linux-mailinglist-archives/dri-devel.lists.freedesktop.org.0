Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28019D3ED4
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 16:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7700F10E779;
	Wed, 20 Nov 2024 15:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kd2/lpfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D4E10E76F;
 Wed, 20 Nov 2024 15:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732115872; x=1763651872;
 h=date:from:to:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=6ke8OgPCxZKd8NS2faAXTKVe1v45cv3XSj3mKom1zlE=;
 b=Kd2/lpfgvSK+yLUFWh5RqJ82HUFQxSm8JBmH29qRbgwA5JQ+XhE8aCIE
 y0AGwkpfk1k9ba/jMAZ/fKfFAeC8XqleuLo+/VE/vn1C8Fo+DCcXzj54v
 I66Wz6Qyued3X9KE424FnQjuu9IsT2LJ188AVtAOVnQeITJixMlo87uO2
 Vw8ct82hVmk5pfWfGPu4bX4TcVEcL48O/hIxtS3kKJm2dHdAC12u2mEVi
 6oD3to1DvXSkg9kMMGK8PpDLO6HFTe8wzWhnuFls1WAUBlJYsThr+UTDR
 mO01kb1O9UyWafqE2/Gs89lIqpZCTVW8Prvw0jQF4D5tSSvehq3q0ikn3 Q==;
X-CSE-ConnectionGUID: yJDXEDqFSRaGbZhToCDrWQ==
X-CSE-MsgGUID: nYUoIDtVRKyNq0RYB7FXbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43582403"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="43582403"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 07:17:52 -0800
X-CSE-ConnectionGUID: TDuQM8BNS8mz58k/VQAYFA==
X-CSE-MsgGUID: zUrq7kWPQkm0Vi+pTd6CHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="90750161"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 07:17:51 -0800
Date: Wed, 20 Nov 2024 17:18:27 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/dp: extract drm_dp_dpcd_poll_act_handled()
Message-ID: <Zz39w1yhHS2CCefO@ideak-desk.fi.intel.com>
References: <cover.1731942780.git.jani.nikula@intel.com>
 <3d91f7b6639960fe688eb6ae0236254adae3e82d.1731942780.git.jani.nikula@intel.com>
 <Zz345xhVgGlshsJN@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zz345xhVgGlshsJN@ideak-desk.fi.intel.com>
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

On Wed, Nov 20, 2024 at 04:59:43PM +0200, Imre Deak wrote:
> On Mon, Nov 18, 2024 at 05:14:52PM +0200, Jani Nikula wrote:
> > SST with 128b/132b channel coding needs this too. Extract to a separate
> > helper, independent of MST.
> > 
> > Pass timeout in as a parameter, anticipating that we can reduce the
> > timeout for SST.
> 
> I wish there was a DP Standard section making the above clear,
> but I suppose we just deduct that except of the side-band messaging,
> every other payload programming and ACT signaling is required for
> 128b/132b SST.
> 
> > 
> 
> Cc: Lyude Paul <lyude@redhat.com>
> 
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c       | 54 ++++++++++++++++++-
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 36 +------------
> >  include/drm/display/drm_dp_helper.h           |  2 +
> >  3 files changed, 57 insertions(+), 35 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 6ee51003de3c..b7e03bf02cd8 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -22,15 +22,16 @@
> >  
> >  #include <linux/backlight.h>
> >  #include <linux/delay.h>
> > +#include <linux/dynamic_debug.h>
> >  #include <linux/errno.h>
> >  #include <linux/i2c.h>
> >  #include <linux/init.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/sched.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/string_helpers.h>
> > -#include <linux/dynamic_debug.h>
> >  
> >  #include <drm/display/drm_dp_helper.h>
> >  #include <drm/display/drm_dp_mst_helper.h>
> > @@ -779,6 +780,57 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
> >  }
> >  EXPORT_SYMBOL(drm_dp_dpcd_read_phy_link_status);
> >  
> > +static int read_payload_update_status(struct drm_dp_aux *aux)
> > +{
> > +	int ret;
> > +	u8 status;
> > +
> > +	ret = drm_dp_dpcd_readb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return status;
> > +}
> > +
> > +/**
> > + * drm_dp_dpcd_poll_act_handled() - Polls for ACT handled status.
> > + * @aux: DisplayPort AUX channel
> > + * @timeout_ms: Timeout in ms
> > + *
> > + * Tries waiting for the sink to finish updating its payload table by polling
> > + * for the ACT handled bit for up to @timeout_ms milliseconds, defaulting to
> > + * 3000 ms if 0.
> > + *
> > + * Returns:
> > + * 0 if the ACT was handled in time, negative error code on failure.
> > + */
> > +int drm_dp_dpcd_poll_act_handled(struct drm_dp_aux *aux, int timeout_ms)
> 
> I wonder if it'd make sense to namespace these helpers using ll_mtp or mtp.
> 
> > +{
> > +	int ret, status;
> > +
> 
> Extra w/s.

Ah nvm, timeout_ms is a function param so new is needed.

> 
> Regardless of the namespace comment:
> 
> Reviewed-by: Imre Deak <imre.deak@intel.com>
> 
> > +	/* default to 3 seconds, this is arbitrary */
> > +	timeout_ms = timeout_ms ?: 3000;
> > +
> > +	ret = readx_poll_timeout(read_payload_update_status, aux, status,
> > +				 status & DP_PAYLOAD_ACT_HANDLED || status < 0,
> > +				 200, timeout_ms * USEC_PER_MSEC);
> > +	if (ret < 0 && status >= 0) {
> > +		drm_err(aux->drm_dev, "Failed to get ACT after %d ms, last status: %02x\n",
> > +			timeout_ms, status);
> > +		return -EINVAL;
> > +	} else if (status < 0) {
> > +		/*
> > +		 * Failure here isn't unexpected - the hub may have
> > +		 * just been unplugged
> > +		 */
> > +		drm_dbg_kms(aux->drm_dev, "Failed to read payload table status: %d\n", status);
> > +		return status;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_dpcd_poll_act_handled);
> > +
> >  static bool is_edid_digital_input_dp(const struct drm_edid *drm_edid)
> >  {
> >  	/* FIXME: get rid of drm_edid_raw() */
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index ac90118b9e7a..2bdbc1eb282b 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -29,7 +29,6 @@
> >  #include <linux/random.h>
> >  #include <linux/sched.h>
> >  #include <linux/seq_file.h>
> > -#include <linux/iopoll.h>
> >  
> >  #if IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS)
> >  #include <linux/stacktrace.h>
> > @@ -4723,18 +4722,6 @@ static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
> >  	return ret;
> >  }
> >  
> > -static int do_get_act_status(struct drm_dp_aux *aux)
> > -{
> > -	int ret;
> > -	u8 status;
> > -
> > -	ret = drm_dp_dpcd_readb(aux, DP_PAYLOAD_TABLE_UPDATE_STATUS, &status);
> > -	if (ret < 0)
> > -		return ret;
> > -
> > -	return status;
> > -}
> > -
> >  /**
> >   * drm_dp_check_act_status() - Polls for ACT handled status.
> >   * @mgr: manager to use
> > @@ -4752,28 +4739,9 @@ int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr)
> >  	 * There doesn't seem to be any recommended retry count or timeout in
> >  	 * the MST specification. Since some hubs have been observed to take
> >  	 * over 1 second to update their payload allocations under certain
> > -	 * conditions, we use a rather large timeout value.
> > +	 * conditions, we use a rather large timeout value of 3 seconds.
> >  	 */
> > -	const int timeout_ms = 3000;
> > -	int ret, status;
> > -
> > -	ret = readx_poll_timeout(do_get_act_status, mgr->aux, status,
> > -				 status & DP_PAYLOAD_ACT_HANDLED || status < 0,
> > -				 200, timeout_ms * USEC_PER_MSEC);
> > -	if (ret < 0 && status >= 0) {
> > -		drm_err(mgr->dev, "Failed to get ACT after %dms, last status: %02x\n",
> > -			timeout_ms, status);
> > -		return -EINVAL;
> > -	} else if (status < 0) {
> > -		/*
> > -		 * Failure here isn't unexpected - the hub may have
> > -		 * just been unplugged
> > -		 */
> > -		drm_dbg_kms(mgr->dev, "Failed to read payload table status: %d\n", status);
> > -		return status;
> > -	}
> > -
> > -	return 0;
> > +	return drm_dp_dpcd_poll_act_handled(mgr->aux, 3000);
> >  }
> >  EXPORT_SYMBOL(drm_dp_check_act_status);
> >  
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index 279624833ea9..38eea21d1082 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -567,6 +567,8 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
> >  				     enum drm_dp_phy dp_phy,
> >  				     u8 link_status[DP_LINK_STATUS_SIZE]);
> >  
> > +int drm_dp_dpcd_poll_act_handled(struct drm_dp_aux *aux, int timeout_ms);
> > +
> >  bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
> >  				    u8 real_edid_checksum);
> >  
> > -- 
> > 2.39.5
> > 
