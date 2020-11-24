Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CB82C2AFC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 16:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A316E223;
	Tue, 24 Nov 2020 15:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32156E223;
 Tue, 24 Nov 2020 15:16:32 +0000 (UTC)
IronPort-SDR: bNaNksPXpX5RSs8D2BaaJgQcFeZir8joPNVm+SD/bcIC71x7/oEWPpRACZYBbalfrj43HXVDXw
 cC7nGP3ec+Bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="172058277"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="172058277"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 07:16:31 -0800
IronPort-SDR: 5/fS5LVCr5rlANU0+TAPWHPnhmk/wLl5HTEMX5jI3tLc8el784davKgqITkK8SNWQn77JG+Or5
 osNrTvQVkRtw==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="534893926"
Received: from genxfsim-desktop.iind.intel.com (HELO intel.com)
 ([10.223.74.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 07:16:29 -0800
Date: Tue, 24 Nov 2020 20:32:43 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v5 08/17] drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST
 support
Message-ID: <20201124150243.GG13853@intel.com>
References: <20201111062051.11529-1-anshuman.gupta@intel.com>
 <20201111062051.11529-9-anshuman.gupta@intel.com>
 <20201124142017.GB25283@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124142017.GB25283@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, uma.shankar@intel.com, seanpaul@chromium.org,
 juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-24 at 19:50:17 +0530, Ramalingam C wrote:
> On 2020-11-11 at 11:50:42 +0530, Anshuman Gupta wrote:
> > Enable HDCP 1.4 over DP MST for Gen12.
> > 
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 16865b200062..f00e12fc83e8 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -826,13 +826,9 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> >  	intel_attach_force_audio_property(connector);
> >  	intel_attach_broadcast_rgb_property(connector);
> >  
> > -
> > -	/* TODO: Figure out how to make HDCP work on GEN12+ */
> > -	if (INTEL_GEN(dev_priv) < 12) {
> Just a thought, shouldn't we enable for the platforms that we have
> tested HDCP? like <= 12. 
> 
> We could keep expanding the list supported.
thanks for comment, i will keep this as if (INTEL_GEN(dev_priv) < 12)
Thanks,
Anshuman
> 
> Ram.
> > -		ret = intel_dp_init_hdcp(dig_port, intel_connector);
> > -		if (ret)
> > -			DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
> > -	}
> > +	ret = intel_dp_init_hdcp(dig_port, intel_connector);
> > +	if (ret)
> > +		drm_dbg_kms(&dev_priv->drm, "HDCP init failed, skipping.\n");
> >  
> >  	/*
> >  	 * Reuse the prop from the SST connector because we're
> > -- 
> > 2.26.2
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
