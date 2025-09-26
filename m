Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D3BA3230
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A95B10E350;
	Fri, 26 Sep 2025 09:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="fch2lPIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325CE10E36A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:27:22 +0000 (UTC)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E0F0E3FCFE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1758878840;
 bh=UMECNuH8iJkpboeAHJcySkNdr6QNOKXh2NGRecV2G6A=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=fch2lPIpqs62S5y8/4fjBVqmH4g33cbLERQlWgyObVc9lWmaQidtwMTfNhfyjxvLL
 KbktyXpoO8CYpAi/JKAp1RY8I9FbvSx79Zv67rGe54ScUi9WKesTSp84FJUfMMTMNU
 0OlQaOysEaQCVPNyR6hVSzMklZMmm6dADKC1OV9s80Vb5PnkDtChJjIL5K1RmRI6M1
 0gnFHQzv8s3hb3XmxTAkMmOHWndHxx0AJXiWR2Xz5xouy5BFRQ1LW2HzPG0PnkBQps
 ZrIN6Z8s8CIST+DeiIga8SQacKbkh+FnyPHekh5DCh+JdRJe9/OqpJ7u3+Tph7BVDH
 QtRQKfPoYmjuA==
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3324538ceb0so3179775a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 02:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758878839; x=1759483639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UMECNuH8iJkpboeAHJcySkNdr6QNOKXh2NGRecV2G6A=;
 b=BowbQDpS6yAMGxXuwKVZ6mcU5S2udq2BvYZjfL6qARTLLEN7vEWkzDKpLWLMmfilGK
 8sbpdDvUaW+39e3877egVlEj+JJpsyEOOPC3gCYt2P9QIWmGIGPR2aSZIfUzT7eTYNTJ
 QPJ9605cXOKbE/TkzLaQO1iDIaCGC1cSt7fN44OOtKGkrQBKQ10W/XpYvVJVNOftgmML
 +fvnR1L7VjIcVgg/sA4iPsgUaEaHmdK1pHWJ/c+PGl6xX7Be8GPVKMAZZkkSIVMWqPmt
 1yGa9QJSA+NzrBTdfRS21Qt8YXSQ8dafYMUoxKQvJNg+F1QtlZRRkCkSfzWGiMBR785r
 dMzQ==
X-Gm-Message-State: AOJu0Yw+moO0GlNlu+88JQuNPQUa/oovS/K8xpilkfvDUtOQP6WXsN7o
 MVOHcFXRRgu16Zsgnfe6Kkkg9DGXGXUlA4svlA/I1nety3RQWxnv+ozIqXpI3nBUCWnFmpJFdvr
 PujWmkD6xR884WLyia7GkOUH/TtoEVc10wE260IGxGwy6/IBhhWjGDLGIzzRxpD9eIu4Spnxu5r
 CQzBsdJiw8PCh4QZTpzSTKj2IF5oNbzvTNQXutZ3VslKMsqpEhbIGTj5ceTci2
X-Gm-Gg: ASbGncvQlLMoZYOlyL6c/B7BjCyocZnZoPgqYL2CCbWnNy++MMkTj2gSJVGDju1Gf2+
 r5Q659nqy9LchRJK9iPLZWwlAQxkEeSoVC5H9WX1C/YIzEG6vwu+W5yAIKWM3QOMtS5N7MGiX8h
 K5KQvjHLTUjQV0GrizdHex
X-Received: by 2002:a17:90b:3a91:b0:32e:70f5:6988 with SMTP id
 98e67ed59e1d1-3342a301f41mr6091169a91.32.1758878839141; 
 Fri, 26 Sep 2025 02:27:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdUJdAo1wiP6b2HM8j6DIQRIVviZk7V+3bVtvJYXfYtDZyb39spbHEIKqdzZSeA10XtcnXKP+FZxdNeke/XNc=
X-Received: by 2002:a17:90b:3a91:b0:32e:70f5:6988 with SMTP id
 98e67ed59e1d1-3342a301f41mr6091136a91.32.1758878838702; Fri, 26 Sep 2025
 02:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250926085401.2808634-1-aaron.ma@canonical.com>
 <DM3PPF208195D8D72521EAAFDA64C84654FE31EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D72521EAAFDA64C84654FE31EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Fri, 26 Sep 2025 17:27:07 +0800
X-Gm-Features: AS18NWCSrKLnqxrwwYvNVeS9cJf8ImIu2xCkiFqxIAX57zMgxKBouIb1i6UjwOM
Message-ID: <CAJ6xRxW0jb+UfKOpp7W9eAorPVpuaTFu+4cy31ydHDy6naSduw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/dp: Add drm_edp_backlight_get_level
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Deak, Imre" <imre.deak@intel.com>, 
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 26, 2025 at 5:23=E2=80=AFPM Kandpal, Suraj <suraj.kandpal@intel=
.com> wrote:
>
> > Subject: [PATCH 1/2] drm/dp: Add drm_edp_backlight_get_level
> >
> > Implement drm_edp_backlight_get_level() to read the current backlight
> > brightness level from eDP DPCD registers via AUX channel.
> >
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 52 +++++++++++++++++++++++++
> >  include/drm/display/drm_dp_helper.h     |  1 +
> >  2 files changed, 53 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> > b/drivers/gpu/drm/display/drm_dp_helper.c
> > index 1ecc3df7e3167..0cfb357ebd9e2 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -3945,6 +3945,58 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct
> > drm_dp_aux *aux, u8 color_spc)  }
> > EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
> >
> > +/**
> > + * drm_edp_backlight_get_level - Get the backlight level of eDP DPCD
> > +via AUX
> > + * @aux: The DP aux device
> > + * @bl: Backlight capability info from the panel
> > + *
> > + * Reads the current backlight brightness level from luminance mode
> > + * (24-bit value in nits) or DPCD AUX mode(16-bit and 8-bit modes).
> > + *
> > + * Returns: Current backlight level.
> > + */
> > +u32 drm_edp_backlight_get_level(struct drm_dp_aux *aux, const struct
> > +drm_edp_backlight_info *bl) {
> > +     int ret;
> > +     u8 buf[3] =3D { 0 };
> > +     u32 level =3D 0;
> > +
> > +     if (!(bl->aux_set || bl->luminance_set))
> > +             return 0;
> > +
> > +     if (bl->luminance_set) {
> > +             ret =3D drm_dp_dpcd_read(aux,
> > DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf, sizeof(buf));
> > +             if (ret < 0) {
> > +                     DRM_DEV_ERROR(aux->drm_dev->dev,
> > +                                   "%s: Failed to read luminance value=
: %d\n",
> > +                                   aux->name, ret);
> > +                     return 0;
> > +             }
> > +             level =3D (buf[2] << 16 | buf[1] << 8 | buf[0]) / 1000;
> > +     } else if (bl->lsb_reg_used) {
> > +             ret =3D drm_dp_dpcd_read(aux,
> > DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, 2);
> > +             if (ret < 0) {
> > +                     DRM_DEV_ERROR(aux->drm_dev->dev,
>
> Use drm_err here ditto for same where ever this has been used
>

I will send v2.
Thanks,
Aaron


> Regards,
> Suraj Kandpal
>
> > +                                   "%s: Failed to read backlight level=
: %d\n",
> > +                                   aux->name, ret);
> > +                     return 0;
> > +             }
> > +             level =3D buf[0] << 8 | buf[1];
> > +     } else {
> > +             ret =3D drm_dp_dpcd_read(aux,
> > DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, 1);
> > +             if (ret < 0) {
> > +                     DRM_DEV_ERROR(aux->drm_dev->dev,
> > +                                   "%s: Failed to read backlight level=
: %d\n",
> > +                                   aux->name, ret);
> > +                     return 0;
> > +             }
> > +             level =3D buf[0];
> > +     }
> > +
> > +     return level;
> > +}
> > +EXPORT_SYMBOL(drm_edp_backlight_get_level);
> > +
> >  /**
> >   * drm_edp_backlight_set_level() - Set the backlight level of an eDP p=
anel via
> > AUX
> >   * @aux: The DP AUX channel to use
> > diff --git a/include/drm/display/drm_dp_helper.h
> > b/include/drm/display/drm_dp_helper.h
> > index 87caa4f1fdb86..0b045a47ae573 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -864,6 +864,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> > struct drm_edp_backlight_info *bl
> >                      u32 max_luminance,
> >                      u16 driver_pwm_freq_hz, const u8
> > edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
> >                      u32 *current_level, u8 *current_mode, bool
> > need_luminance);
> > +u32 drm_edp_backlight_get_level(struct drm_dp_aux *aux, const struct
> > +drm_edp_backlight_info *bl);
> >  int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct
> > drm_edp_backlight_info *bl,
> >                               u32 level);
> >  int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct
> > drm_edp_backlight_info *bl,
> > --
> > 2.43.0
>
