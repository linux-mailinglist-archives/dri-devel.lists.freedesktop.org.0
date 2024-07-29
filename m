Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9B94015D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 00:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C7010E0D5;
	Mon, 29 Jul 2024 22:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BE34ulQS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5325210E0D5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 22:51:18 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ef2d7d8854so50253821fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 15:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722293476; x=1722898276; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AjdbzGzDCJdJVNZYfogce/knOVvuSIpIzGC0C/2/QR0=;
 b=BE34ulQSeFvivdVfraSu3QFHTAEOWKWXojHowDpV7dHtda6pgNW6PV/l603fZ9Vd8s
 CFjEK8OfVAXvtabGDckeM+G3xg/3zHXeBD0OqZDsEFsGmTUPKbADZ5110mbWWPMmNsZu
 6VIs7lCx/ejjaMu1YpAe9a57bS0rzf0gpSCFQ0GFzuUCAMi2CZvBckbc75SU6yRnpwvz
 /JkqD2YwCgJgP88ELQRF9Um7oO4cgcxqkWSD2H3FcZ6SsN/LxSeszmJlVOMuNsKUSVEJ
 9MLRQ0S30SwMLLSnsRNlTl0AA3cMhJ4F5hpIQSkSjUz83HVjxqMzu0mLk7ZBcjCF9dUb
 dzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722293476; x=1722898276;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AjdbzGzDCJdJVNZYfogce/knOVvuSIpIzGC0C/2/QR0=;
 b=KVoEAtVsoO5ANCokpsRmhRa04NvQejXTwE5PPFPDCCG92nZKX1dQRMG0F2LlAzSmQg
 DwKvSg79oQ0xkUvGPXu9fb8/PwrMUo9hqwKCutp6L5xZ8eZhvW7NXJRcvRzKeiGkLxht
 S2RFshOFQUW+Ejb6gSOfLEzCX0s7kE8kFdVUBahacZ2JGdGHcerRlE6rdIrVVBK0i1Rr
 GyjBUMvinPTt6zkdjlNdSRRIXcUAo1GKZRfOs3iV4F8FGaCfPCtngHWa9H32r6vrBEpK
 bZWhe62FDdvgC32bcvO1c5+0fhIQPmB6pfzsgTqc9Onlp/G3omVNAqM6Ee9qfyQOc7Xb
 TuJw==
X-Gm-Message-State: AOJu0YxG2VqR4xCiedDBfBhSV23YxxvXTTIXENIIa7KBvR1vYKqFU26U
 xH71C6ESsW6pgm+M1HlBKFmhNbsiYEEGt01xWxvE5I+/qQoEDkTUTenYyCAYl/U=
X-Google-Smtp-Source: AGHT+IFpl5Th61KnbICmP9Cbe63mTplRtS4QFHIMbdFdHCDDdEydHlmYH13WPg5cKn0n86ISepgtcA==
X-Received: by 2002:a2e:7006:0:b0:2f0:1c7d:1ee2 with SMTP id
 38308e7fff4ca-2f12ee2e4a3mr58298871fa.41.1722293475859; 
 Mon, 29 Jul 2024 15:51:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03cf2e62dsm14466091fa.29.2024.07.29.15.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 15:51:15 -0700 (PDT)
Date: Tue, 30 Jul 2024 01:51:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
 interoperability
Message-ID: <jsrh2xyopzcmsi7uardklw2gfzmseq4pldj6bt6ozezhx5qqbs@epk6y7hg6ihv>
References: <20240709074656.1389387-1-arun.r.murthy@intel.com>
 <IA0PR11MB7307E4F207A125F53A23342BBAB72@IA0PR11MB7307.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7307E4F207A125F53A23342BBAB72@IA0PR11MB7307.namprd11.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 29, 2024 at 04:59:14AM GMT, Murthy, Arun R wrote:
> Gentle Reminder!
> Any comments?

First of all, the format is underdocumented. Second, there is a usual
requirement for new uAPI: please provide a pointer to IGT patch and to
the userspace utilising the property.

> 
> Thanks and Regards,
> Arun R Murthy
> --------------------
> 
> > -----Original Message-----
> > From: Murthy, Arun R <arun.r.murthy@intel.com>
> > Sent: Tuesday, July 9, 2024 1:17 PM
> > To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> > Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> > Subject: [PATCH] RFC: drm/drm_plane: Expose the plane capability and
> > interoperability
> > 
> > Each plane has its own capability or interoperability based on the harware
> > restrictions. If this is exposed to the user, then user can read it once on boot
> > and store this. Later can be used as a lookup table to check a corresponding
> > capability is supported by plane then only go ahead with the framebuffer
> > creation/calling atomic_ioctl.
> > 
> > For Ex: There are few restiction as to async flip doesnt support all the
> > formats/modifiers. Similar restrictions on scaling. With the availabililty of this
> > info to user, failures in atomic_check can be avoided as these are more the
> > hardware capabilities.
> > 
> > There are two options on how this can be acheived.
> > Option 1:
> > 
> > Add a new element to struct drm_mode_get_plane that holds the addr to the
> > array of a new struct. This new struct consists of the formats supported and the
> > corresponding plane capabilities.
> > 
> > Option 2:
> > 
> > These can be exposed to user as a plane property so that the user can get to
> > know the limitation ahead and avoid failures in atomic_check.
> > 
> > Usually atomic_get_property is controlled over the state struct for the
> > parameters/elements that can change. But here these capabilities or the
> > interoperabilities are rather hardware restrictions and wont change over flips.
> > Hence having as a plane_property may not make much sense.
> > On the other hand, Option 1 include changes in the uapi struct
> > drm_mode_get_plane. Shouldnt have impact on backward compatibility, but if
> > userspace has some implementation so as to check the size of the struct, then it
> > might a challenge.
> > 
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
> >  include/drm/drm_plane.h           |  8 ++++++++
> >  include/uapi/drm/drm_mode.h       | 20 ++++++++++++++++++++
> >  3 files changed, 31 insertions(+)
> > 
> > =============Option 2========================
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 22bbb2d83e30..b46177d5fc8c 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -631,6 +631,9 @@ drm_atomic_plane_get_property(struct drm_plane
> > *plane,
> >  		*val = state->hotspot_x;
> >  	} else if (property == plane->hotspot_y_property) {
> >  		*val = state->hotspot_y;
> > +	} else if (property == config->prop_plane_caps) {
> > +		*val = (state->plane_caps) ?
> > +			state->plane_caps->base.id : 0;
> >  	} else {
> >  		drm_dbg_atomic(dev,
> >  			       "[PLANE:%d:%s] unknown property
> > [PROP:%d:%s]\n", diff --git a/include/drm/drm_plane.h
> > b/include/drm/drm_plane.h index dd718c62ac31..dfe931677d0a 100644
> > --- a/include/drm/drm_plane.h
> > +++ b/include/drm/drm_plane.h
> > @@ -260,6 +260,14 @@ struct drm_plane_state {
> >  	 * flow.
> >  	 */
> >  	bool color_mgmt_changed : 1;
> > +
> > +	/**
> > +	 * @plane_caps:
> > +	 *
> > +	 * Blob representing plane capcabilites and interoperability.
> > +	 * This element is a pointer to the array of struct drm_format_blob.
> > +	 */
> > +	struct drm_property_blob *plane_caps;
> >  };
> > 
> >  static inline struct drm_rect
> > 
> > =============Option 1========================
> > 
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index d390011b89b4..0b5c1b65ef63 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -312,6 +312,20 @@ struct drm_mode_set_plane {
> >  	__u32 src_w;
> >  };
> > 
> > +#define DRM_FORMAT_PLANE_CAP_LINEAR_TILE	BIT(0)
> > +#define DRM_FORMAT_PLANE_CAP_X_TILE		BIT(1)
> > +#define DRM_FORMAT_PLANE_CAP_Y_TILE		BIT(2)
> > +#define DRM_FORMAT_PLANE_CAP_Yf_TILE		BIT(3)
> > +#define DRM_FORMAT_PLANE_CAP_ASYNC_FLIP		BIT(4)
> > +#define DRM_FORMAT_PLANE_CAP_FBC		BIT(5)
> > +#define DRM_FORMAT_PLANE_CAP_RC			BIT(6)
> > +
> > +struct drm_format_blob {
> > +	__u64 modifier;
> > +	__u32 plane_caps;
> > +
> > +};
> > +
> >  /**
> >   * struct drm_mode_get_plane - Get plane metadata.
> >   *
> > @@ -355,6 +369,12 @@ struct drm_mode_get_plane {
> >  	 * supported by the plane. These formats do not require modifiers.
> >  	 */
> >  	__u64 format_type_ptr;
> > +	/**
> > +	 * @ format_blob_ptr: Pointer to the array of struct drm_format_blob.
> > +	 * Specify the plane capabilites/restrictions w.r.t tiling/sync-async
> > +	 * flips etc
> > +	 */
> > +	__u64 format_blob_ptr;
> >  };
> > 
> >  struct drm_mode_get_plane_res {
> > --
> > 2.25.1
> 

-- 
With best wishes
Dmitry
