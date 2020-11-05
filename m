Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8647D2A7FA6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 14:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48296ED22;
	Thu,  5 Nov 2020 13:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FEA6ED22;
 Thu,  5 Nov 2020 13:26:05 +0000 (UTC)
IronPort-SDR: jMVC0fmp9e5CONqNI28jNu+iVJ8vRMH6qBjmI0gi6GKkqui7Q4D5K5r/ZtHr0m8yr8y4OK11/h
 7V4OJ1QRIkBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="169488941"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="169488941"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 05:26:05 -0800
IronPort-SDR: ana5z/o+ohmIwDpaMESjGDeEOQmDZtWiIPzR76x5iNms58sL97pKiRuWXu7yGma/Xb4CN/WpHO
 SVUftJPWs0Vg==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="306512062"
Received: from unknown (HELO intel.com) ([10.99.66.154])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 05:26:03 -0800
Date: Thu, 5 Nov 2020 18:56:47 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 01/16] drm/i915/hdcp: Update CP property
 in update_pipe
Message-ID: <20201105132647.GD3242@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-2-anshuman.gupta@intel.com>
 <20201105131801.GA3242@intel.com> <20201105132157.GB3242@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105132157.GB3242@intel.com>
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
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-05 at 18:51:57 +0530, Ramalingam C wrote:
> On 2020-11-05 at 18:48:02 +0530, Ramalingam C wrote:
> > On 2020-10-27 at 22:11:53 +0530, Anshuman Gupta wrote:
> > > When crtc state need_modeset is true it is not necessary
> > > it is going to be a real modeset, it can turns to be a
> > > fastset instead of modeset.
> > > This turns content protection property to be DESIRED and hdcp
> > > update_pipe left with property to be in DESIRED state but
> > > actual hdcp->value was ENABLED.
> > > 
> > > This issue is caught with DP MST setup, where we have multiple
> > > connector in same DP_MST topology. When disabling HDCP on one of
> > > DP MST connector leads to set the crtc state need_modeset to true
> > > for all other crtc driving the other DP-MST topology connectors.
> > > This turns up other DP MST connectors CP property to be DESIRED
> > > despite the actual hdcp->value is ENABLED.
> > > Above scenario fails the DP MST HDCP IGT test, disabling HDCP on
> > > one MST stream should not cause to disable HDCP on another MST
> > > stream on same DP MST topology.
> > > 
> > > v2:
> > > Fix WARN_ON(connector->base.registration_state == DRM_CONNECTOR_REGISTERED)
> > > v3:
> > > Commit log improvement. [Uma]
> > > Added a comment before scheduling prop_work. [Uma]
> > > 
> > > Fixes: 33f9a623bfc6 ("drm/i915/hdcp: Update CP as per the kernel internal state")
> > > Cc: Ramalingam C <ramalingam.c@intel.com>
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_hdcp.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > index b2a4bbcfdcd2..eee8263405b9 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > > @@ -2221,6 +2221,14 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
> > >  		desired_and_not_enabled =
> > >  			hdcp->value != DRM_MODE_CONTENT_PROTECTION_ENABLED;
> > >  		mutex_unlock(&hdcp->mutex);
> > > +		/*
> > > +		 * If HDCP already ENABLED and CP property is DESIRED, schedule
> > > +		 * prop_work to update correct CP property to user space.
> > > +		 */
> > > +		if (!desired_and_not_enabled && !content_protection_type_changed) {
> > > +			drm_connector_get(&connector->base);
> > Sorry for late review.
> > 
> > why do we need this? and where do we release the connector ref?
> ignore it seems like prop work is expecting the caller to get ref.
> In that case in intel_hdcp_update_pipe() previous scheduling of
> prop_work needs to take a ref. Missing?
Got the answer from the next patch.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
> -Ram
> > 
> > -Ram
> > > +			schedule_work(&hdcp->prop_work);
> > > +		}
> > >  	}
> > >  
> > >  	if (desired_and_not_enabled || content_protection_type_changed)
> > > -- 
> > > 2.26.2
> > > 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
