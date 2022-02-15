Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E50D4B616F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 04:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDB410E415;
	Tue, 15 Feb 2022 03:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D89710E3FF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 03:15:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bu29so29097637lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 19:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n+P11z1Rjs9Tcih/Zook2fZ60KP4QhmCWOTSK5iKxWk=;
 b=N4nYj7rNTC5uHpVcGL9QlugWcvGRZTp+CiKvYeKf6QUKM4NHmpN97jHR5JAyLwHU0G
 majfPSjK77b6t7X4lhovHCqFEO9SKlCLRi0DdE6BDr2pljCbwZc8Y9ndC4l5LcpZmSKW
 hvN2WlQweb/oFJ9OJ7+bDCb4FLOS9Ok0j1ryA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n+P11z1Rjs9Tcih/Zook2fZ60KP4QhmCWOTSK5iKxWk=;
 b=rzdWH5ljjWZjTYCsS/JmHlm5s4H8dh/ZIkggPpLl7lAPTOp6s5vI/av0Cd+LdO4Rrx
 vsuxP6XYcpbkFWViqPlPaZAW3g27qEXaIX2EY4O1TEi7F0qi2edEzgjzRvdQRV+ogqv2
 vEfn3di02izPWJvHjL/LBQqLf46yEOUX164B6astCL/5hYHM/ykyb938TCW4NvNJ24UY
 dBrjxRAwd0rwFURuQiTe8dFNumIs52VQLVnTMM+8cJ1QBBxUiM4z7UTeQnpsPJPexZu0
 FCpw384hqaQlRjBL9crvOWfMlE4lyDop1/FyOHD7IWoCmQVwP/42rEs/pAiqW7lO1CG7
 PzHA==
X-Gm-Message-State: AOAM530if8blMPtv+pXDDHPzFiIwu0SicTqW/H/gOOmI3Ew0qyKCFTtT
 1M4bih/iPaMPtvg1i4UKh1C+k23FluvPFQKbfZBlxg==
X-Google-Smtp-Source: ABdhPJzcbB9EByvT8Z4nbkpVZTyBXtRJOPYoyd47w64TJMSIQNnBwmZMUvf0GIvBRqtwNFPqBweHvkB8bEuLFTrC7OU=
X-Received: by 2002:a05:6512:1699:: with SMTP id
 bu25mr1543879lfb.403.1644894928818; 
 Mon, 14 Feb 2022 19:15:28 -0800 (PST)
MIME-Version: 1.0
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <87leydhqt3.fsf@collabora.com>
In-Reply-To: <87leydhqt3.fsf@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 15 Feb 2022 11:15:02 +0800
Message-ID: <CAJMQK-igpiYj-pkgG9amrQuVzf1Mc9BDDOwOdKLUbceKr=CHiQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] gpu: drm: separate panel orientation property
 creating and value setting
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 9:17 AM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> Hsin-Yi Wang <hsinyi@chromium.org> writes:
>
> > drm_dev_register() sets connector->registration_state to
> > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > drm_connector_set_panel_orientation() is first called after
> > drm_dev_register(), it will fail several checks and results in following
> > warning.
>
> Hi,
>
> I stumbled upon this when investigating the same WARN_ON on amdgpu.
> Thanks for the patch :)
>
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index a50c82bc2b2fec..572ead7ac10690 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -1252,7 +1252,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
> >   *   INPUT_PROP_DIRECT) will still map 1:1 to the actual LCD panel
> >   *   coordinates, so if userspace rotates the picture to adjust for
> >   *   the orientation it must also apply the same transformation to the
> > - *   touchscreen input coordinates. This property is initialized by calling
> > + *   touchscreen input coordinates. This property value is set by calling
> >   *   drm_connector_set_panel_orientation() or
> >   *   drm_connector_set_panel_orientation_with_quirk()
> >   *
> > @@ -2341,8 +2341,8 @@ EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
> >   * @connector: connector for which to set the panel-orientation property.
> >   * @panel_orientation: drm_panel_orientation value to set
> >   *
> > - * This function sets the connector's panel_orientation and attaches
> > - * a "panel orientation" property to the connector.
> > + * This function sets the connector's panel_orientation value. If the property
> > + * doesn't exist, it will try to create one.
> >   *
> >   * Calling this function on a connector where the panel_orientation has
> >   * already been set is a no-op (e.g. the orientation has been overridden with
> > @@ -2373,19 +2373,12 @@ int drm_connector_set_panel_orientation(
> >       info->panel_orientation = panel_orientation;
> >
> >       prop = dev->mode_config.panel_orientation_property;
> > -     if (!prop) {
> > -             prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> > -                             "panel orientation",
> > -                             drm_panel_orientation_enum_list,
> > -                             ARRAY_SIZE(drm_panel_orientation_enum_list));
> > -             if (!prop)
> > -                     return -ENOMEM;
> > -
> > -             dev->mode_config.panel_orientation_property = prop;
> > -     }
> > +     if (!prop &&
> > +         drm_connector_init_panel_orientation_property(connector) < 0)
> > +             return -ENOMEM;
> >
>
> In the case where the property has not been created beforehand, you
> forgot to reinitialize prop here, after calling
> drm_connector_init_panel_orientation_property().  This means
hi Gabriel,

drm_connector_init_panel_orientation_property() will create prop if
it's null. If prop fails to be created there, it will return -ENOMEM.

> drm_object_property_set_value() will be called with a NULL second argument
> and Oops the kernel.
>
>
> > -     drm_object_attach_property(&connector->base, prop,
> > -                                info->panel_orientation);
> > +     drm_object_property_set_value(&connector->base, prop,
> > +                                   info->panel_orientation);
>
>
> --
> Gabriel Krisman Bertazi
