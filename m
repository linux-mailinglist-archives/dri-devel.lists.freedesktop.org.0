Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4375F8743E6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 00:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479C410EEA0;
	Wed,  6 Mar 2024 23:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Nsi9VBaK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C0C10EEA0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 23:30:34 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-60978e6f9a3so3524487b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709767829; x=1710372629;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3s2xlVEAfJBrVxkA6EpLcD8kwhVsasxC35kpd9zGC/E=;
 b=Nsi9VBaKRJ3HxGL/9+LQAP0nuC8COpzAZICwmIovsFCm7WWfD9EQLPWkx5MOuwP9kX
 0B+ldpArQpLlLyHfPHA76GTOaTuitnRJtBOJKugC9+Ov118U4FFbczihf7lNn7156aNH
 Szx4zY4WK2pQGbFbbAB0bKdEslZy57cG/pE1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709767829; x=1710372629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3s2xlVEAfJBrVxkA6EpLcD8kwhVsasxC35kpd9zGC/E=;
 b=lvOi7GUZsxYnkfOsR6Ys1gGlefoBcQpuaumIoHXXxz3fj2SfEqgZMndlHtntZXaSAt
 WW34OtzeoexJYJI0P0Wp4fL/4g8elT23SGL/KoIg4G+fxexCd1dGFeIZgw/6gXpVy3LE
 xbcnzZ/vxp14jxq9Yz4VVOfcrCVn8M+KORr6U9ARGn8/LI0OVU3joT6DpLP4nKIB80Hl
 +C4YUUSdBasm2OCVT04BCk1IZJZNZNAaaxi11u5zxkAaoFIJoxxo60kgbuLtrTRT+wAd
 8yO76K+v/Q9hYqCAFKSWHowwnMUCazIlvpd3qx6kWShFoQ9Wzf4BNwimP458lQOdsYTr
 HUFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrvOFdg+x0RQLxwPxvzUUtd22rMRxqnmWC1KPXdZ39/kxnfLID3NBZHRp+kS7+cicCVns+FMHy1f5GFC+7UN/EH3zpAsDfJX0Dp2rZ1zjW
X-Gm-Message-State: AOJu0YxKb+zC+/t9FUG6wypHJ2Jd+FoLpDJ+33DNgo4kDDOBVKacu5Jx
 +RCIDamxIWFL6j7/4NxfcD8bc0dEXrSObquH3G0I/cimunP1OjW8k93s1LxTKhCxB+qus4K9Urc
 =
X-Google-Smtp-Source: AGHT+IEk9ejmVPfg1PTxIetN2W6reprqmiN7Bu8BEKqiUSlz2XoEQ+Cm517B5Nag/F7DHzG0YAMNyw==
X-Received: by 2002:a0d:c647:0:b0:609:d94e:e4b9 with SMTP id
 i68-20020a0dc647000000b00609d94ee4b9mr3714677ywd.43.1709767829418; 
 Wed, 06 Mar 2024 15:30:29 -0800 (PST)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 ku4-20020a05622a0a8400b0042f03bfa3d1sm1965781qtb.83.2024.03.06.15.30.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 15:30:19 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-42ef8193ae6so56341cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:30:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWB4/9FGVbjuYFF0aAKnzMx3vwo0DWO9haoWTteXpzHB3M6ymfMAD5z9hpVhrK7pcC47MeQ8sH7vyohydJOTVlIl3bMrzInYS23JoMpUvJN
X-Received: by 2002:ac8:5891:0:b0:42e:fce9:a5e4 with SMTP id
 t17-20020ac85891000000b0042efce9a5e4mr149098qta.4.1709767816368; Wed, 06 Mar
 2024 15:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-6-hsinyi@chromium.org>
In-Reply-To: <20240306200353.1436198-6-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Mar 2024 15:30:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U0CGmqYRCUr6-X6Ttkkp4NOP+2BQOpYn3hW-mO0wrtxw@mail.gmail.com>
Message-ID: <CAD=FV=U0CGmqYRCUr6-X6Ttkkp4NOP+2BQOpYn3hW-mO0wrtxw@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] drm/panel-edp: Match edp_panels with panel identity
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi,

On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> @@ -2111,15 +2113,16 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         { /* sentinal */ }
>  };
>
> -static const struct edp_panel_entry *find_edp_panel(u32 panel_id)
> +static const struct edp_panel_entry *find_edp_panel(u32 panel_id, const =
struct drm_edid *edid)
>  {
>         const struct edp_panel_entry *panel;
>
> -       if (!panel_id)
> -               return NULL;
> +       for (panel =3D edp_panels; panel->ident.panel_id; panel++)
> +               if (drm_edid_match(edid, &panel->ident))
> +                       return panel;
>
> -       for (panel =3D edp_panels; panel->panel_id; panel++)
> -               if (panel->panel_id =3D=3D panel_id)
> +       for (panel =3D edp_panels; panel->ident.panel_id; panel++)
> +               if (panel->ident.panel_id =3D=3D panel_id)
>                         return panel;

Reading through this another time, I wouldn't object to a comment
reminding the user why there are two loops here. Something like "Try
to match both the panel ID and name at first. This allows handling the
case where vendors incorrectly reused the same panel ID for multiple
panels that need different settings. If we don't get a match with the
name, that's OK. Panel ID _should_ be unique anyway". Feel free to
reword.

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>



-Doug
