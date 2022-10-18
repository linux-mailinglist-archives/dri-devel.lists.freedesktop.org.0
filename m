Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB896028E5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 11:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE5F10E1FA;
	Tue, 18 Oct 2022 09:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E004F10E1FA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666087153; x=1697623153;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kVhTV/jxy1GZM3/QmEu/aEax5pxGJ/xyLer37Rpa0Q4=;
 b=ANDubYpAtjpKUUC8+3R9uXafOoSKDAfDcfLu9yqubKZH9z3FQxuqW/m2
 6KPZ6rsWxIKbQoKFV6I2MAM5W3jZy7U2BpQCt76xlHzUhazgWSl4vp48s
 992A6Z8t1ZfIpfMaE09u/8CVNQjJKovhQz/qj54kRh70Rlji57LgTyH8M
 rB0n3RVE8BGipTdsDglccaMyjpPq28vbzSpYWtIWcuKJsk3N36ZJsOLuR
 gK9zM6GagERXKUfLiE6exnWHSkmpWBayG5emK1ceOvGCZkDKrAdyWLM4b
 XJu6eXyslNyZ1VXnduaplV9jFO6JUR80coDsV/bkvxWMk5s2WIw+Dw3rV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="332599306"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="332599306"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 02:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="771129260"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="771129260"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 18 Oct 2022 02:58:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 18 Oct 2022 12:58:53 +0300
Date: Tue, 18 Oct 2022 12:58:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
Subject: Re: [PATCH 1/2] Revert "drm: hide unregistered connectors from
 GETCONNECTOR IOCTL"
Message-ID: <Y0543Y/iiZC6Bdw1@intel.com>
References: <20221017153150.60675-1-contact@emersion.fr>
 <Y05uYUPoYB25JVpX@intel.com> <Y05xdzMB51BnEw9U@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y05xdzMB51BnEw9U@redhat.com>
X-Patchwork-Hint: comment
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 11:27:19AM +0200, Jonas Ådahl wrote:
> On Tue, Oct 18, 2022 at 12:14:09PM +0300, Ville Syrjälä wrote:
> > On Mon, Oct 17, 2022 at 03:31:57PM +0000, Simon Ser wrote:
> > > This reverts commit 981f09295687f856d5345e19c7084aca481c1395.
> > > 
> > > It turns out this breaks Mutter.
> > 
> > A bit more detail would be a good to help future archaeologists.
> 
> Perhaps a better explanation is
> 
> It turns out this causes logically active but disconnected MST display
> port connectors to disappear from the drmModeGetResources() list,

That was the whole point was it not? So I'd drop the
"it turns out" part.

> meaning userspace is made to believe the connector is already disabled.

That wording to me implies its a generic issue affecting all
userspace when so far it looks like only mutter is affected.
So apparently mutter (for some reason) assumes that the
connector has somehow magically been disabled by someone
else if it disappears from the list of resources?

> 
> When userspace then attempts post a new mode set commit, if that commit
> uses the same CRTC used to previously drive the disconnected connector,
> it will fail as that CRTC is logically still tied to the disconnected
> connector.
> 
> This was discovered by a bisecting docking station hot plugging
> regression using mutter.
> 
> 
> Jonas
> 
> > 
> > > 
> > > Signed-off-by: Simon Ser <contact@emersion.fr>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Jonas Ådahl <jadahl@redhat.com>
> > > ---
> > >  drivers/gpu/drm/drm_mode_config.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > index 939d621c9ad4..688c8afe0bf1 100644
> > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > @@ -151,9 +151,6 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
> > >  	count = 0;
> > >  	connector_id = u64_to_user_ptr(card_res->connector_id_ptr);
> > >  	drm_for_each_connector_iter(connector, &conn_iter) {
> > > -		if (connector->registration_state != DRM_CONNECTOR_REGISTERED)
> > > -			continue;
> > > -
> > >  		/* only expose writeback connectors if userspace understands them */
> > >  		if (!file_priv->writeback_connectors &&
> > >  		    (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK))
> > > -- 
> > > 2.38.0
> > > 
> > 
> > -- 
> > Ville Syrjälä
> > Intel
> > 

-- 
Ville Syrjälä
Intel
