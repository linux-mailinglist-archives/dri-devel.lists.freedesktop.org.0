Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 989FE602902
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 12:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A6810E205;
	Tue, 18 Oct 2022 10:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A0810E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666087669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVAuj60zVid8tnUTYoywG3UsDAm158ghcQ2hRE8va2U=;
 b=g6soOzIBI05QLW5DT04wP8LlyQ4jd7VH57G4gGfeDXlN9TESCpoy7o2pO8ZurOW3pDm03Z
 wFNknqisp8eRDYT/VSZ4kVuvxpCE53mrydgWncPq+kkS3TuJ2KgU/d1hVG/k2BRst3ILMu
 yf/yAQyaPcIKcISZCI7SBgz5gt/Azbk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-xPjSowkFOdC-Vay3Uhk17g-1; Tue, 18 Oct 2022 06:07:48 -0400
X-MC-Unique: xPjSowkFOdC-Vay3Uhk17g-1
Received: by mail-lj1-f199.google.com with SMTP id
 c13-20020a2ea78d000000b0026fc3f582c5so5878652ljf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 03:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oVAuj60zVid8tnUTYoywG3UsDAm158ghcQ2hRE8va2U=;
 b=vjRnHD3zz1GysYMcTYtiWGzzXdmVwnvVtXgE6QnfXTCousH5wRIBaRU5rYg2OwzMIy
 cdICPJ3N+l+4v2JqtRTgp9TgRsku9EheDPCmBNZ3ZPlvdD+7VfuDOA+jmnHG1qJndZaO
 pK7q9kAf/N9ngB22NlTWVVTtxCfd2MSxxbzDDmuyO4fY3kQwjTQw/B/npNVdihsaxtc5
 fwfI8FEGX28ve/++6buXztfri7fwOcr8A4wAcRBFMTSboF5HydF/i4w6GXDvmLTi8+9g
 jQ7Fh2QuiTMG4VrP8pHUhtGlAumWT7COPnpB5bxup97b63aDwnZkBx+HnIW8fpBffkjv
 vySQ==
X-Gm-Message-State: ACrzQf34OutCOto56rmZe0TQIBmEMBsCBrNMnzH0O1NdFqUatbiqeNVp
 AmkiA/eycNbJgkbDwAhgh16GTVSoQt7xutath0vX4LGe3YSVqxpx/KtQrRAr2mi/6eIuSavh154
 04q7nfsmPxI8bZct5l2k0KocCtZVW
X-Received: by 2002:a2e:549:0:b0:26d:ff5f:53c1 with SMTP id
 70-20020a2e0549000000b0026dff5f53c1mr816246ljf.450.1666087666546; 
 Tue, 18 Oct 2022 03:07:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5tIS+EstveFrc1nmePB1nt4rDJ+2JEnsMWTjP0ODaThasKehihS7klsxCeEr6UOnz3mnrmMQ==
X-Received: by 2002:a2e:549:0:b0:26d:ff5f:53c1 with SMTP id
 70-20020a2e0549000000b0026dff5f53c1mr816234ljf.450.1666087666320; 
 Tue, 18 Oct 2022 03:07:46 -0700 (PDT)
Received: from redhat.com (host-90-235-2-194.mobileonline.telia.com.
 [90.235.2.194]) by smtp.gmail.com with ESMTPSA id
 7-20020ac24d47000000b00492e6642937sm1785067lfp.200.2022.10.18.03.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 03:07:45 -0700 (PDT)
Date: Tue, 18 Oct 2022 12:07:43 +0200
From: Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/2] Revert "drm: hide unregistered connectors from
 GETCONNECTOR IOCTL"
Message-ID: <Y05671TEjdLcQyXj@redhat.com>
References: <20221017153150.60675-1-contact@emersion.fr>
 <Y05uYUPoYB25JVpX@intel.com> <Y05xdzMB51BnEw9U@redhat.com>
 <Y0543Y/iiZC6Bdw1@intel.com>
MIME-Version: 1.0
In-Reply-To: <Y0543Y/iiZC6Bdw1@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Tue, Oct 18, 2022 at 12:58:53PM +0300, Ville Syrjälä wrote:
> On Tue, Oct 18, 2022 at 11:27:19AM +0200, Jonas Ådahl wrote:
> > On Tue, Oct 18, 2022 at 12:14:09PM +0300, Ville Syrjälä wrote:
> > > On Mon, Oct 17, 2022 at 03:31:57PM +0000, Simon Ser wrote:
> > > > This reverts commit 981f09295687f856d5345e19c7084aca481c1395.
> > > > 
> > > > It turns out this breaks Mutter.
> > > 
> > > A bit more detail would be a good to help future archaeologists.
> > 
> > Perhaps a better explanation is
> > 
> > It turns out this causes logically active but disconnected MST display
> > port connectors to disappear from the drmModeGetResources() list,
> 
> That was the whole point was it not? So I'd drop the
> "it turns out" part.
> 
> > meaning userspace is made to believe the connector is already disabled.
> 
> That wording to me implies its a generic issue affecting all
> userspace when so far it looks like only mutter is affected.

Maybe other userspace was? I only found out by testing drm-next, and
only tried using mutter when bisecting.

> So apparently mutter (for some reason) assumes that the
> connector has somehow magically been disabled by someone
> else if it disappears from the list of resources?

Mutter makes the assumption that connectors it can interact with are the
ones that drmModeGetResources() return - nothing magic about that.


Jonas

> 
> > 
> > When userspace then attempts post a new mode set commit, if that commit
> > uses the same CRTC used to previously drive the disconnected connector,
> > it will fail as that CRTC is logically still tied to the disconnected
> > connector.
> > 
> > This was discovered by a bisecting docking station hot plugging
> > regression using mutter.
> > 
> > 
> > Jonas
> > 
> > > 
> > > > 
> > > > Signed-off-by: Simon Ser <contact@emersion.fr>
> > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > Cc: Jonas Ådahl <jadahl@redhat.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_mode_config.c | 3 ---
> > > >  1 file changed, 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> > > > index 939d621c9ad4..688c8afe0bf1 100644
> > > > --- a/drivers/gpu/drm/drm_mode_config.c
> > > > +++ b/drivers/gpu/drm/drm_mode_config.c
> > > > @@ -151,9 +151,6 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
> > > >  	count = 0;
> > > >  	connector_id = u64_to_user_ptr(card_res->connector_id_ptr);
> > > >  	drm_for_each_connector_iter(connector, &conn_iter) {
> > > > -		if (connector->registration_state != DRM_CONNECTOR_REGISTERED)
> > > > -			continue;
> > > > -
> > > >  		/* only expose writeback connectors if userspace understands them */
> > > >  		if (!file_priv->writeback_connectors &&
> > > >  		    (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK))
> > > > -- 
> > > > 2.38.0
> > > > 
> > > 
> > > -- 
> > > Ville Syrjälä
> > > Intel
> > > 
> 
> -- 
> Ville Syrjälä
> Intel
> 

