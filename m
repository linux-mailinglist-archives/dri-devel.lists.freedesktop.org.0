Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7605A2A8EAF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 06:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856E96EA9D;
	Fri,  6 Nov 2020 05:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDEE6EA7B;
 Fri,  6 Nov 2020 05:21:36 +0000 (UTC)
IronPort-SDR: bH0BqOzE0SRRhq8f2PaP0jOnLmXCzJB+9SvjLMRCxVONJv5KzRV1pDcZLOh81LeFdD5VxuRlQ3
 sgYX2rbNjcoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="157282961"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; d="scan'208";a="157282961"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 21:21:35 -0800
IronPort-SDR: 20eBV12jyriP456DRXkcHzDWnuDcrYIPuoRcvRN+wxi/MbIYZCe8K857Qpmc9InF7+04rComgP
 NyBYjkr8o6pg==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; d="scan'208";a="364067768"
Received: from genxfsim-desktop.iind.intel.com (HELO intel.com)
 ([10.223.74.178])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 21:21:33 -0800
Date: Fri, 6 Nov 2020 10:38:08 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v4 13/16] drm/i915/hdcp: Pass connector to check_2_2_link
Message-ID: <20201106050808.GR29526@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
 <20201027164208.10026-14-anshuman.gupta@intel.com>
 <20201105164537.GM3242@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105164537.GM3242@intel.com>
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

On 2020-11-05 at 22:15:37 +0530, Ramalingam C wrote:
> On 2020-10-27 at 22:12:05 +0530, Anshuman Gupta wrote:
> > This requires for HDCP 2.2 MST check link.
> > 
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_types.h | 3 ++-
> >  drivers/gpu/drm/i915/display/intel_dp_hdcp.c       | 3 ++-
> >  drivers/gpu/drm/i915/display/intel_hdcp.c          | 2 +-
> >  drivers/gpu/drm/i915/display/intel_hdmi.c          | 3 ++-
> >  4 files changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 24e0067c2e7c..dfb5be64e03a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -375,7 +375,8 @@ struct intel_hdcp_shim {
> >  				  bool is_repeater, u8 type);
> >  
> >  	/* HDCP2.2 Link Integrity Check */
> > -	int (*check_2_2_link)(struct intel_digital_port *dig_port);
> > +	int (*check_2_2_link)(struct intel_digital_port *dig_port,
> > +			      struct intel_connector *connector);
> do we need both of them?
I have followed the HDCP 1.4 check_link signature.
https://patchwork.freedesktop.org/patch/386157/?series=78749&rev=3
We need connector for QSES check, we can't retrieve DP MST connector from
dig_port.
Thanks,
Anshuman 
> 
> -Ram.
> >  };
> >  
> >  struct intel_hdcp {
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > index 591b68e5de48..4be61e7fde4e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> > @@ -585,7 +585,8 @@ int intel_dp_hdcp2_config_stream_type(struct intel_digital_port *dig_port,
> >  }
> >  
> >  static
> > -int intel_dp_hdcp2_check_link(struct intel_digital_port *dig_port)
> > +int intel_dp_hdcp2_check_link(struct intel_digital_port *dig_port,
> > +			      struct intel_connector *connector)
> >  {
> >  	u8 rx_status;
> >  	int ret;
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index 1df6d4a23476..87f7aaf3a319 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -1940,7 +1940,7 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
> >  		goto out;
> >  	}
> >  
> > -	ret = hdcp->shim->check_2_2_link(dig_port);
> > +	ret = hdcp->shim->check_2_2_link(dig_port, connector);
> >  	if (ret == HDCP_LINK_PROTECTED) {
> >  		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> >  			intel_hdcp_update_value(connector,
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > index 0788de04711b..bd0d91101464 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > @@ -1734,7 +1734,8 @@ int intel_hdmi_hdcp2_read_msg(struct intel_digital_port *dig_port,
> >  }
> >  
> >  static
> > -int intel_hdmi_hdcp2_check_link(struct intel_digital_port *dig_port)
> > +int intel_hdmi_hdcp2_check_link(struct intel_digital_port *dig_port,
> > +				struct intel_connector *connector)
> >  {
> >  	u8 rx_status[HDCP_2_2_HDMI_RXSTATUS_LEN];
> >  	int ret;
> > -- 
> > 2.26.2
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
