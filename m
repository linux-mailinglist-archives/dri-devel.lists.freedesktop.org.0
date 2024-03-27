Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51088E5A5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 15:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B147010F2BC;
	Wed, 27 Mar 2024 14:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKc480Rz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DFC10EEE3;
 Wed, 27 Mar 2024 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711549497; x=1743085497;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=pUCFl894xDreALh7QFhMu4p8mDOLEGfFQkjDwp8A6tE=;
 b=LKc480Rz9mamiEAl1Q2+j+7QoGq13gwLuXtQir5jZplEX1wliXWbky7o
 Z9DfkmCEEtPByW2P0EEYdvDRM3YzhOdZ73i8ms5BsnxGSYFcu6DlmpWv7
 R9XSdrSWpDOL2XF8LD+0e1X8sl6KP/M66D+xWV3CPU1rL0nGbCDYqD+xr
 +98JnZ2J9VH2rEqKHyJumOX8NmRlfZVkYoYNs5rwu2ywQ+qz7blnpabfG
 V3hyGpzMt1KujlWzBbzQuuxHsYgIvkZEUzgzjCaJFpMqmx51tx9Of5AV7
 glCP/lGmUCiVeP3eCauo2qyu8wuB/zBdPrPDqdWFVUTrXd8fRAJAGJw/8 A==;
X-CSE-ConnectionGUID: xNETIc+gTwmIE0XP25aUSQ==
X-CSE-MsgGUID: fBvZeooLS5OIPCcxxE8OcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6592726"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6592726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 07:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="47514622"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 07:24:53 -0700
Date: Wed, 27 Mar 2024 16:25:23 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 09/11] drm/dp_mst: Add drm_dp_mst_aux_for_parent()
Message-ID: <ZgQsUy15GWxvz/Gh@ideak-desk.fi.intel.com>
References: <20240320201152.3487892-1-imre.deak@intel.com>
 <20240320201152.3487892-10-imre.deak@intel.com>
 <ca468470-3b9f-4c06-8faf-ae9063cbe09c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca468470-3b9f-4c06-8faf-ae9063cbe09c@intel.com>
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

On Wed, Mar 27, 2024 at 02:30:53PM +0530, Nautiyal, Ankit K wrote:
> 
> On 3/21/2024 1:41 AM, Imre Deak wrote:
> > Add a function to get the AUX device of the parent of an MST port, used
> > by a follow-up i915 patch in the patchset.
> > 
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >   drivers/gpu/drm/display/drm_dp_mst_topology.c | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 6bd471a2266ce..d70f7de644371 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -6004,6 +6004,22 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
> >   	return false;
> >   }
> > +/**
> > + * drm_dp_mst_aux_for_parent() - Get the AUX device for an MST port's parent
> > + * @port: MST port whose parent's AUX device is returned
> > + *
> > + * Return the AUX device for @port's parent or NULL if port's parent is the
> > + * root port.
> > + */
> > +struct drm_dp_aux *drm_dp_mst_aux_for_parent(struct drm_dp_mst_port *port)
> > +{
> > +	if (!port->parent || !port->parent->port_parent)
> > +		return NULL;
> > +
> > +	return &port->parent->port_parent->aux;
> > +}
> > +EXPORT_SYMBOL(drm_dp_mst_aux_for_parent);
> 
> As mentioned in previous patch, the declaration of this in the header,
> got included in previous patch.

Yes thanks, the header change should've been in this patch, will move it here
(while applying the patches if nothing else comes up).

> Regards,
> 
> Ankit
> 
> > +
> >   /**
> >    * drm_dp_mst_dsc_aux_for_port() - Find the correct aux for DSC
> >    * @port: The port to check. A leaf of the MST tree with an attached display.
