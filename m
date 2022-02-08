Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874AD4AD2C2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B624210E284;
	Tue,  8 Feb 2022 08:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE2D10E25E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 08:07:25 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id b5so6929679ile.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 00:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2nn1yw6s4IptKKkqexjsVuYGnZXdnpYECt5wmy4nCLI=;
 b=RbemnSrhXrKKcmiNAQChCDTCfg6l6ls5LgDIaRQkZLTLaWYDjG6MM8osL8JkLF3bCp
 /Kq4sd9uU0NEZm+Wz8RgynFJAbap5ItA1CILACu+hFiwrULXgQ7eCzkQ14TNBanKSWIw
 TjONrz2gQtSvRje+DKUublwrHeFhbhnyVgZ3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2nn1yw6s4IptKKkqexjsVuYGnZXdnpYECt5wmy4nCLI=;
 b=LgL4RA1n/CV5NTj560C9jJz+FJXOQvHisheg4xcdSQ6E9XvtwEaTeQTrVF3EXa5JKp
 2hw73UUwhYWsos+fCYHEuOZohBgXXVxA2YQ/Bf7Z9TKVpi0u29zTBrAm1NVL/s8f/eme
 MHHuv3027w2l8/j6GELTmrKbVZjlDUKKjjeUhnu3BZbl29V+k4dKwvDU3AKysIFWWnMk
 o3z4bftZ8p+GXJ8wVDJy80bzFdzrOXCrnU1E4jjIJtHU9f59Lpq/EYq1hvRaLUhAKtc4
 QQIHNhii7+lmNveLwySl8z7lvrnKHeLaobxzAmpqNyfaJ2AunLJaWeqPF9uKLBIyS4rh
 ohmg==
X-Gm-Message-State: AOAM53093JF2E3bwxMBVYuDaHpSbNldOskuJcJ4vnRxMVqROSThR4l9w
 J4oV+GB+QzIdeOCTNUpR8GqyA2zRL3glCz+Rp9IceQ==
X-Google-Smtp-Source: ABdhPJzX6bk4eNvEnp69aytew5yHADtPJVvGPNtbE4EZRnOFljwbLJwfYxI5lISAClkMzxAfRIq8Gdm85/RAs5cGYNM=
X-Received: by 2002:a05:6e02:18c6:: with SMTP id
 s6mr1637885ilu.230.1644307645048; 
 Tue, 08 Feb 2022 00:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20220208073714.1540390-1-hsinyi@chromium.org>
 <YgIhJb3+MckKD4dC@intel.com>
In-Reply-To: <YgIhJb3+MckKD4dC@intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 8 Feb 2022 16:06:59 +0800
Message-ID: <CAJMQK-hzjtZrXC+sdcs39kF6nvUzkNcgNXFXPzTUQHzr8f6ZkA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 8, 2022 at 3:52 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Feb 08, 2022 at 03:37:12PM +0800, Hsin-Yi Wang wrote:
> > +int drm_connector_init_panel_orientation_property(
> > +     struct drm_connector *connector)
> > +{
> > +     struct drm_device *dev =3D connector->dev;
> > +     struct drm_property *prop;
> > +
> > +     prop =3D drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE,
> > +                     "panel orientation",
> > +                     drm_panel_orientation_enum_list,
> > +                     ARRAY_SIZE(drm_panel_orientation_enum_list));
> > +     if (!prop)
> > +             return -ENOMEM;
> > +
> > +     dev->mode_config.panel_orientation_property =3D prop;
>
> Leak when called multiple times. I guess you could just put
> this into drm_connector_create_standard_properties() instead
> and avoid that issue entirely.
>
I'll add a check for dev->mode_config.panel_orientation_property to
avoid the leak issue if called multiple times.
If we add in drm_connector_create_standard_properties(), we still need
another function to attach the property earlier for bridge/connectors
that require this property, since not all bridge/connectors need this
property.

> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
