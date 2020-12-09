Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310902D3760
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 01:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F190A6E201;
	Wed,  9 Dec 2020 00:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48B26E201
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 00:06:02 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q75so9052wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 16:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oAhDp6sxFgT6Zzy5Vs8E8DDPLpeYnjrFDoOsAwIhBF4=;
 b=GwkFc6vLDJQ56Wi+BCvmVEUOTFaxztzBQuGfuS5Kor9cQi4X7cx2bt4/kJA0p2B3Gd
 qYHB9l00GNNB15N/lnQubYogzKOc4SHRaB5N8NjgvPbxssvGHiVZNgXy/JYb8X1QYYgl
 qthX7yI5U4y9eWj1seHqTe9ry8IO+LVRKMXTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oAhDp6sxFgT6Zzy5Vs8E8DDPLpeYnjrFDoOsAwIhBF4=;
 b=rRs7NP01r+Q07zMveW0sM38CR4KC6d7trIole4TQIT1BkO6t/28gYJe9D2wqmy8WHF
 WbG8NlAWhPGjJBx4v5g5yslqhBHRLLazVHRDxQt924X8BPnbyRXpOhuEzqtogeFIeaTl
 cwg7tdVD4NIog370efi87AV9umLutaxYje76NWhLjvbmKHZG6bFk6HpdFyR5auqyMo7d
 6fzJLDfjOsaW8J1FoTT3M6nrtde/eWHyEuqA+a6kInP6IPdptC1nK6LQ8E8X9wcfUour
 slzhgnNCsuGsfP+J1IuugbRCKYJ/awqSIcVwDciav0556F6uayYTexwM0GQZJQvar+2H
 qeYg==
X-Gm-Message-State: AOAM530zQsRuOL17riemYx+Tm6pN8gtbpHnmpILmKLKOQ4YpnaplFOJV
 w4ou3I/EKT7VPXLvtF5gW7FqfQ==
X-Google-Smtp-Source: ABdhPJyfzjdHHaESQcRHlidk3lXOFi9yTfpyQdI6nVQWjbnsjTDFME8IyKjvQflN+pT8G3Bn8u9dnA==
X-Received: by 2002:a1c:309:: with SMTP id 9mr3986wmd.80.1607472361317;
 Tue, 08 Dec 2020 16:06:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u66sm658730wmg.2.2020.12.08.16.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 16:06:00 -0800 (PST)
Date: Wed, 9 Dec 2020 01:05:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/2] drm: add legacy support for using degamma for gamma
Message-ID: <20201209000558.GE401619@phenom.ffwll.local>
References: <20201203114845.232911-1-tomi.valkeinen@ti.com>
 <20201203114845.232911-2-tomi.valkeinen@ti.com>
 <20201204223525.GJ4109@pendragon.ideasonboard.com>
 <X85K6PgnuVt/L5MH@intel.com>
 <69ff519e-835f-c60d-b43d-a7c9d4ca31c2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69ff519e-835f-c60d-b43d-a7c9d4ca31c2@ti.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Philippe Cornu <philippe.cornu@st.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 07, 2020 at 05:45:02PM +0200, Tomi Valkeinen wrote:
> On 07/12/2020 17:31, Ville Syrj=E4l=E4 wrote:
> > On Sat, Dec 05, 2020 at 12:35:25AM +0200, Laurent Pinchart wrote:
> >> Hi Tomi,
> >>
> >> Thank you for the patch.
> >>
> >> On Thu, Dec 03, 2020 at 01:48:44PM +0200, Tomi Valkeinen wrote:
> >>> We currently have drm_atomic_helper_legacy_gamma_set() helper which c=
an
> >>> be used to handle legacy gamma-set ioctl.
> >>> drm_atomic_helper_legacy_gamma_set() sets GAMMA_LUT, and clears
> >>> CTM and DEGAMMA_LUT. This works fine on HW where we have either:
> >>>
> >>> degamma -> ctm -> gamma -> out
> >>>
> >>> or
> >>>
> >>> ctm -> gamma -> out
> >>>
> >>> However, if the HW has gamma table before ctm, the atomic property
> >>> should be DEGAMMA_LUT, and thus we have:
> >>>
> >>> degamma -> ctm -> out
> >>>
> >>> This is fine for userspace which sets gamma table using the propertie=
s,
> >>> as the userspace can check for the existence of gamma & degamma, but =
the
> >>> legacy gamma-set ioctl does not work.
> >>>
> >>> This patch fixes the issue by changing
> >>> drm_atomic_helper_legacy_gamma_set() so that GAMMA_LUT will be used if
> >>> it exists, and DEGAMMA_LUT will be used as a fallback.
> >>>
> >>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> >>> ---
> >>>  drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++++++++---
> >>>  drivers/gpu/drm/drm_color_mgmt.c    |  4 ++++
> >>>  include/drm/drm_crtc.h              |  3 +++
> >>>  3 files changed, 22 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/dr=
m_atomic_helper.c
> >>> index ba1507036f26..fe59c8ea42a9 100644
> >>> --- a/drivers/gpu/drm/drm_atomic_helper.c
> >>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> >>> @@ -3512,6 +3512,10 @@ EXPORT_SYMBOL(drm_atomic_helper_page_flip_targ=
et);
> >>>   * that support color management through the DEGAMMA_LUT/GAMMA_LUT
> >>>   * properties. See drm_crtc_enable_color_mgmt() and the containing c=
hapter for
> >>>   * how the atomic color management and gamma tables work.
> >>> + *
> >>> + * This function uses the GAMMA_LUT or DEGAMMA_LUT property for the =
gamma table.
> >>> + * GAMMA_LUT property is used if it exists, and DEGAMMA_LUT property=
 is used as
> >>> + * a fallback.
> >>>   */
> >>>  int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> >>>  				       u16 *red, u16 *green, u16 *blue,
> >>> @@ -3525,6 +3529,12 @@ int drm_atomic_helper_legacy_gamma_set(struct =
drm_crtc *crtc,
> >>>  	struct drm_color_lut *blob_data;
> >>>  	int i, ret =3D 0;
> >>>  	bool replaced;
> >>> +	bool use_degamma;
> >>> +
> >>> +	if (!crtc->has_gamma_prop && !crtc->has_degamma_prop)
> >>> +		return -ENODEV;
> >>> +
> >>> +	use_degamma =3D !crtc->has_gamma_prop;
> >>>  =

> >>>  	state =3D drm_atomic_state_alloc(crtc->dev);
> >>>  	if (!state)
> >>> @@ -3554,10 +3564,12 @@ int drm_atomic_helper_legacy_gamma_set(struct=
 drm_crtc *crtc,
> >>>  		goto fail;
> >>>  	}
> >>>  =

> >>> -	/* Reset DEGAMMA_LUT and CTM properties. */
> >>> -	replaced  =3D drm_property_replace_blob(&crtc_state->degamma_lut, N=
ULL);
> >>> +	/* Set GAMMA/DEGAMMA_LUT and reset DEGAMMA/GAMMA_LUT and CTM */
> >>> +	replaced  =3D drm_property_replace_blob(&crtc_state->degamma_lut,
> >>> +					      use_degamma ? blob : NULL);
> >>>  	replaced |=3D drm_property_replace_blob(&crtc_state->ctm, NULL);
> >>> -	replaced |=3D drm_property_replace_blob(&crtc_state->gamma_lut, blo=
b);
> >>> +	replaced |=3D drm_property_replace_blob(&crtc_state->gamma_lut,
> >>> +					      use_degamma ? NULL : blob);
> >>>  	crtc_state->color_mgmt_changed |=3D replaced;
> >>>  =

> >>>  	ret =3D drm_atomic_commit(state);
> >>> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_c=
olor_mgmt.c
> >>> index 3bcabc2f6e0e..956e59d5f6a7 100644
> >>> --- a/drivers/gpu/drm/drm_color_mgmt.c
> >>> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> >>> @@ -176,6 +176,8 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *=
crtc,
> >>>  					   degamma_lut_size);
> >>>  	}
> >>>  =

> >>> +	crtc->has_degamma_prop =3D !!degamma_lut_size;
> >>> +
> >>>  	if (has_ctm)
> >>>  		drm_object_attach_property(&crtc->base,
> >>>  					   config->ctm_property, 0);
> >>> @@ -187,6 +189,8 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *=
crtc,
> >>>  					   config->gamma_lut_size_property,
> >>>  					   gamma_lut_size);
> >>>  	}
> >>> +
> >>> +	crtc->has_gamma_prop =3D !!gamma_lut_size;
> >>>  }
> >>>  EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
> >>>  =

> >>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> >>> index ba839e5e357d..9e1f06047e3d 100644
> >>> --- a/include/drm/drm_crtc.h
> >>> +++ b/include/drm/drm_crtc.h
> >>> @@ -1084,6 +1084,9 @@ struct drm_crtc {
> >>>  	 */
> >>>  	uint16_t *gamma_store;
> >>>  =

> >>> +	bool has_gamma_prop;
> >>> +	bool has_degamma_prop;
> >>
> >> We could use a bitfield to save a bit of memory. Apart from that, the
> >> patch looks good to me.
> > =

> > Or we could just check if the crtc has the relevant prop or not.
> =

> That's what I did at first, but it requires iterating over the props (unl=
ess I missed a simple way
> to just check it). Probably not noticeable (in performance) but just felt=
 a bit ugly.

Every atomic prop set iterates over that array somewhere for checking.
See drm_mode_obj_find_prop_id(). If that's too much, then we need a
hashtable or something like that just to make atomic commits acceptable.
I'd use that, instead of duplicating information, if at all possible. You
really don't have to worry about that loop, as long as you use that
function which atomic uses already.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
