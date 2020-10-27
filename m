Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD7529A613
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 09:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C2B6EB1F;
	Tue, 27 Oct 2020 08:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5642D6E1B3;
 Tue, 27 Oct 2020 08:04:03 +0000 (UTC)
IronPort-SDR: kr6fKKF/gdo6u6zhvQTVaylukm2beDOTkYsXOQw9UqAS7ERiZZz0uCTn59wqmC38TtNiHn+klM
 ig30nRq7ygRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="229679240"
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="229679240"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 01:04:02 -0700
IronPort-SDR: w1c8joy0st/SiY0LXb8lELpGViZNHbWIVdFAUHdXmG6eQKsiYam4JyY6UopZs6i7gDhS9tbPCn
 cjYrov6rV4JQ==
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="535694834"
Received: from genxfsim-desktop.iind.intel.com (HELO intel.com)
 ([10.223.74.178])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 01:04:00 -0700
Date: Tue, 27 Oct 2020 13:20:22 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH v3 01/16] drm/i915/hdcp: Update CP property in update_pipe
Message-ID: <20201027075022.GE29526@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-2-anshuman.gupta@intel.com>
 <3aff190f909b4dc290ca1f1d8b47d963@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3aff190f909b4dc290ca1f1d8b47d963@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Li,
 Juston" <juston.li@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-27 at 11:02:26 +0530, Shankar, Uma wrote:
> 
> 
> > -----Original Message-----
> > From: Anshuman Gupta <anshuman.gupta@intel.com>
> > Sent: Friday, October 23, 2020 5:51 PM
> > To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Cc: seanpaul@chromium.org; Nikula, Jani <jani.nikula@intel.com>; C,
> > Ramalingam <ramalingam.c@intel.com>; Li, Juston <juston.li@intel.com>;
> > Shankar, Uma <uma.shankar@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>
> > Subject: [PATCH v3 01/16] drm/i915/hdcp: Update CP property in update_pipe
> > 
> > When crtc state need_modeset is true it is not necessary it is going to be a real
> > modeset, it can turns to be a update_pipe instead of modeset.
> 
> I believe you refer fastest here. May be make this a bit clear. 
> 
> > This turns content protection property to be DESIRED and hdcp update_pipe left
> > with property to be in DESIRED state but actually hdcp->value was ENABLED.
> > This caught with DP MST setup, when disabling HDCP on a connector sets the crtc
> > state need_modeset to true for all crtc driving the other DP-MST topology
> > connectors.
> 
> This is a bit ambiguous, you can mention it a bit more clearly. In case of DP MST, how this
> affects would help make it clearer.
> 
> > 
> > v2:
> > Fix WARN_ON(connector->base.registration_state ==
> > DRM_CONNECTOR_REGISTERED)
> > 
> > Fixes: 33f9a623bfc6 ("drm/i915/hdcp: Update CP as per the kernel internal
> > state")
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdcp.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index b2a4bbcfdcd2..0d9e8d3b5603 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -2221,6 +2221,11 @@ void intel_hdcp_update_pipe(struct
> > intel_atomic_state *state,
> >  		desired_and_not_enabled =
> >  			hdcp->value !=
> > DRM_MODE_CONTENT_PROTECTION_ENABLED;
> >  		mutex_unlock(&hdcp->mutex);
> >
> 
> Please add a comment explaining the rationale here as well.
Sure i will fix all above comment.
> 
> > +		if (!desired_and_not_enabled &&
> > !content_protection_type_changed) {
> > +			drm_connector_get(&connector->base);
> 
> Where are we releasing this ref.
prop worker function releases the connector reference.
Thanks,
Anshuman Gupta.
> 
> > +			schedule_work(&hdcp->prop_work);
> > +		}
> >  	}
> > 
> >  	if (desired_and_not_enabled || content_protection_type_changed)
> > --
> > 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
