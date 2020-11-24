Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1DE2C2B0A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 16:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE9A6E418;
	Tue, 24 Nov 2020 15:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6236E3FE;
 Tue, 24 Nov 2020 15:19:06 +0000 (UTC)
IronPort-SDR: 4chzIZoH44luZqC6hDnX6QSrze2PkGhJc5iUbsSYV8KVuQiAO5ZTsJ34DsfSfLTUMc2U0rjt7O
 M/841Ea1RuGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151220125"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="151220125"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 07:19:06 -0800
IronPort-SDR: NclzXhh8HtagT0JyLUc41gxGA+ltwMnnUWIreBxvfJOEWzJk45EiD52nS1h6KnCiXye6abgwa6
 eOKki05zqQog==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="370400361"
Received: from genxfsim-desktop.iind.intel.com (HELO intel.com)
 ([10.223.74.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 07:19:03 -0800
Date: Tue, 24 Nov 2020 20:35:17 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v5 07/17] drm/i915/hdcp: Enable HDCP 1.4 stream encryption
Message-ID: <20201124150517.GH13853@intel.com>
References: <20201111062051.11529-1-anshuman.gupta@intel.com>
 <20201111062051.11529-8-anshuman.gupta@intel.com>
 <20201124141457.GA25283@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124141457.GA25283@intel.com>
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

On 2020-11-24 at 19:44:59 +0530, Ramalingam C wrote:
> On 2020-11-11 at 11:50:41 +0530, Anshuman Gupta wrote:
> > Enable HDCP 1.4 DP MST stream encryption.
> > 
> > Enable stream encryption once encryption is enabled on
> > the DP transport driving the link for each stream which
> > has requested encryption.
> > 
> > Disable stream encryption for each stream that no longer
> > requires encryption before disabling HDCP encryption on
> > the link.
> > 
> > v2:
> > - Added debug print for stream encryption.
> > - Disable the hdcp on port after disabling last stream
> >   encryption.
> > v3:
> > - Cosmetic change, removed the value less comment. [Uma]
> > v4:
> > - Split the Gen12 HDCP enablement patch. [Ram]
> > - Add connector details in drm_err.
> > 
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdcp.c | 45 ++++++++++++++++-------
> >  1 file changed, 31 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index 0322a83c151d..e12bd0ac9fb5 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -612,7 +612,12 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
> >  	return ret;
> >  }
> >  
> > -/* Implements Part 1 of the HDCP authorization procedure */
> > +/*
> > + * Implements Part 1 of the HDCP authorization procedure.
> > + * Authentication Part 1 steps for Multi-stream DisplayPort.
> > + * Step 1. Auth Part 1 sequence on the driving MST Trasport Link.
> > + * Step 2. Enable encryption for each stream that requires encryption.
> > +1*/
> IMO this function is generic for SST and MST. Why do we document only
> for MST at the top of the function? We can remove them.
Sure i will remove it.
> >  static int intel_hdcp_auth(struct intel_connector *connector)
> >  {
> >  	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
> > @@ -766,10 +771,17 @@ static int intel_hdcp_auth(struct intel_connector *connector)
> >  		return -ETIMEDOUT;
> >  	}
> >  
> > -	/*
> > -	 * XXX: If we have MST-connected devices, we need to enable encryption
> > -	 * on those as well.
> > -	 */
> > +	/* DP MST Auth Part 1 Step 2.a and Step 2.b */
> > +	if (shim->stream_encryption) {
> > +		ret = shim->stream_encryption(connector, true);
> > +		if (ret) {
> > +			drm_err(&dev_priv->drm, "[CONNECTOR:%d:%s] Failed to enable HDCP 1.4 stream enc\n",
> All the existing error messgae has the %s:%d, why are we changing it
> here? Could we retain the uniformity?
Sure i will fix this in entire series.
> > +				connector->base.base.id, connector->base.name);
> > +			return ret;
> > +		}
> > +		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 transcoder: %s stream encrypted\n",
> > +			    transcoder_name(hdcp->stream_transcoder));
> > +	}
> >  
> >  	if (repeater_present)
> >  		return intel_hdcp_auth_downstream(connector);
> > @@ -791,18 +803,23 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
> >  	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
> >  		    connector->base.name, connector->base.base.id);
> >  
> > +	if (hdcp->shim->stream_encryption) {
> > +		ret = hdcp->shim->stream_encryption(connector, false);
> > +		if (ret) {
> > +			drm_err(&dev_priv->drm, "[CONNECTOR:%d:%s] Failed to disable HDCP 1.4 stream enc\n",
> same here. remove CONNECTOR ?
> > +				connector->base.base.id, connector->base.name);
> > +			return ret;
> > +		}
> > +		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 transcoder: %s stream encryption disabled\n",
> > +			    transcoder_name(hdcp->stream_transcoder));
> > +	}
> > +
> >  	/*
> > -	 * If there are other connectors on this port using HDCP, don't disable
> > -	 * it. Instead, toggle the HDCP signalling off on that particular
> > -	 * connector/pipe and exit.
> > +	 * If there are other connectors on this port using HDCP, don't disable it.
> > +	 * Repeat steps 1-2 for each stream that no longer requires encryption.
> What is this steps 1-2 here!? Here you are not disabling if other
> streams are encrpted. May be you want to put something like "Untill all
> steams of MST stopped encrypting, dont disable the port encryption"
Sure i will fix this.
Thanks,
Anshuman.
> 
> -Ram
> >  	 */
> > -	if (dig_port->num_hdcp_streams > 0) {
> > -		ret = hdcp->shim->toggle_signalling(dig_port,
> > -						    cpu_transcoder, false);
> > -		if (ret)
> > -			DRM_ERROR("Failed to disable HDCP signalling\n");
> > +	if (dig_port->num_hdcp_streams > 0)
> >  		return ret;
> > -	}
> >  
> >  	hdcp->hdcp_encrypted = false;
> >  	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
> > -- 
> > 2.26.2
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
