Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9B929A455
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 06:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CAD6EACB;
	Tue, 27 Oct 2020 05:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8996EACB;
 Tue, 27 Oct 2020 05:51:19 +0000 (UTC)
IronPort-SDR: PF7YJX2dyVWctiGwiniwhhiLpdR+t3eQICp9z2bbiYdYGH02+ue4vpwgPQYSaLDa7Lm104ob7o
 G+egRFnNFBjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="167249677"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="167249677"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 22:51:19 -0700
IronPort-SDR: SDd1NIz2NgVv7Feb9L4RPmeX6Lhf0kwkWYNN1nVdj8DM9xlNB7nGZK5b6MrN/nbHDoGeVJqFe8
 aPWuN3AJx5cQ==
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="360632412"
Received: from genxfsim-desktop.iind.intel.com (HELO intel.com)
 ([10.223.74.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 22:51:17 -0700
Date: Tue, 27 Oct 2020 11:07:39 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH v3 02/16] drm/i915/hdcp: Get conn while content_type
 changed
Message-ID: <20201027053737.GB29526@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-3-anshuman.gupta@intel.com>
 <447146c6e1034f7fb03c57f9e35d18d4@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <447146c6e1034f7fb03c57f9e35d18d4@intel.com>
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

On 2020-10-27 at 11:04:17 +0530, Shankar, Uma wrote:
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
> > Subject: [PATCH v3 02/16] drm/i915/hdcp: Get conn while content_type changed
> > 
> > Get DRM connector reference count while scheduling a prop work to avoid any
> > possible destroy of DRM connector when it is in DRM_CONNECTOR_REGISTERED
> > state.
> > 
> > Fixes: a6597faa2d59 ("drm/i915: Protect workers against disappearing
> > connectors")
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdcp.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index 0d9e8d3b5603..42cf91cf4f20 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -2210,6 +2210,7 @@ void intel_hdcp_update_pipe(struct intel_atomic_state
> > *state,
> >  	if (content_protection_type_changed) {
> >  		mutex_lock(&hdcp->mutex);
> >  		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> > +		drm_connector_get(&connector->base);
> 
> Where are releasing this ref.
Thanks Uma for review the releasing ref is present in prop work function.
intel_hdcp_prop_work().
As prop function releases the ref for connector somtimes it lead to destroy
the connector, if we schedule the prop work without taking any connector reference.

Thanks,
Anshuman Gupta.
> 
> >  		schedule_work(&hdcp->prop_work);
> >  		mutex_unlock(&hdcp->mutex);
> >  	}
> > --
> > 2.26.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
