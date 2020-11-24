Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A4E2C2C8E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3616E49F;
	Tue, 24 Nov 2020 16:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE736E49A;
 Tue, 24 Nov 2020 16:16:24 +0000 (UTC)
IronPort-SDR: xXNLSHZD829jgWU5eWbY47CBtgXlj5AoXokTMmpewngzk0ho57SOrphr10kAa19GSm9HTNvFfI
 23BKHYiu85Bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="256680737"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="256680737"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 08:16:24 -0800
IronPort-SDR: s9PkmxjB3nXcCpHQIASn3lfjrmtiW8rKwi8ZWlNpup2dGVK051cggNC+K1tYpjn4RqayZVk8df
 rFNuTZAWPUWg==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="432652284"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 08:16:21 -0800
Date: Tue, 24 Nov 2020 21:47:19 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v5 08/17] drm/i915/hdcp: Enable Gen12 HDCP 1.4 DP MST
 support
Message-ID: <20201124161719.GA25919@intel.com>
References: <20201111062051.11529-1-anshuman.gupta@intel.com>
 <20201111062051.11529-9-anshuman.gupta@intel.com>
 <20201124142017.GB25283@intel.com>
 <20201124150243.GG13853@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124150243.GG13853@intel.com>
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

On 2020-11-24 at 20:32:43 +0530, Anshuman Gupta wrote:
> On 2020-11-24 at 19:50:17 +0530, Ramalingam C wrote:
> > On 2020-11-11 at 11:50:42 +0530, Anshuman Gupta wrote:
> > > Enable HDCP 1.4 over DP MST for Gen12.
> > > 
> > > Cc: Ramalingam C <ramalingam.c@intel.com>
> > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 +++-------
> > >  1 file changed, 3 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > index 16865b200062..f00e12fc83e8 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > @@ -826,13 +826,9 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
> > >  	intel_attach_force_audio_property(connector);
> > >  	intel_attach_broadcast_rgb_property(connector);
> > >  
> > > -
> > > -	/* TODO: Figure out how to make HDCP work on GEN12+ */
> > > -	if (INTEL_GEN(dev_priv) < 12) {
> > Just a thought, shouldn't we enable for the platforms that we have
> > tested HDCP? like <= 12. 
> > 
> > We could keep expanding the list supported.
> thanks for comment, i will keep this as if (INTEL_GEN(dev_priv) < 12)
I guess you meant <= 12.

Ram.
> Thanks,
> Anshuman
> > 
> > Ram.
> > > -		ret = intel_dp_init_hdcp(dig_port, intel_connector);
> > > -		if (ret)
> > > -			DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
> > > -	}
> > > +	ret = intel_dp_init_hdcp(dig_port, intel_connector);
> > > +	if (ret)
> > > +		drm_dbg_kms(&dev_priv->drm, "HDCP init failed, skipping.\n");
> > >  
> > >  	/*
> > >  	 * Reuse the prop from the SST connector because we're
> > > -- 
> > > 2.26.2
> > > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
