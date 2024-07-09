Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5598F92BE3D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 17:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1FB10E597;
	Tue,  9 Jul 2024 15:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GsbIsJAl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B00B10E59B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 15:26:27 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-79f014a53b7so281440785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 08:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720538783; x=1721143583;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aj2kSla0vBt0/GLSIO8CQ/A6D734l7WrZXmLB07NQmU=;
 b=GsbIsJAlyV9Vm7DAB6OdHN4YiQv1Xo3g+SlP7KTBI1CBr/tdEQAjmXDapDbb8pJpf/
 tNF8Zco9PmLgX7W5ZZZJfKTT58gMTVaBzqEf3k2sR+zjmVY13N0ZubNQCLzUCPdVPOzS
 K7ORMfDBYNOMD7ZqJ+ishv6Mvxm4trLcJ6GjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538783; x=1721143583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aj2kSla0vBt0/GLSIO8CQ/A6D734l7WrZXmLB07NQmU=;
 b=Aan49L8T/skkcmSZ/ig/DkJylHdtWakG+Rcynp+0f0GJQdPnDknvVu3TyvX5zHbGK3
 5OYWKP4bSQi2g9s10J2eROev2sulFlUYuXhRiCiA8vaztVP+ukEuoNPPaKDJGZbEJZxr
 jh+4tIWEGUHtoERcD1uQTWMI7b6tQDgkdUG0QBkZhFbXuqeH8dxThBtAtXkHaJCmstrg
 jR3UNGsun3pcmH3nKgFRxiq8oZzumUAtVH+UKQgyhgtVb8njJDkaTXwkGvWRf3uP7vjj
 6QknPJ3ZVOaFCwI7jhH0Ko+NVdvJRR+IcIfnn3604iPhXTtOAT8sr0aYIhdBj6KAgYGB
 aNTQ==
X-Gm-Message-State: AOJu0YzzH1yYy3ROxQIX38Z2qdkXZpDZRaU1APeFrQXtDwoo2RH7+UrK
 XGSn8Lfdx7gKxRZknuP96of2LvlOf4Am/EAfCzkcwRowPV5eqLi9rdrqKn5jQumrRcJ7a8D8VKY
 oQonZ
X-Google-Smtp-Source: AGHT+IEyT0i40+5Mgde5Iqp0ysxF+G8zHKzx8vL7GelTnLEJ5CF0ca4Oebt0d3Bk+97B8X415hDZgQ==
X-Received: by 2002:a05:620a:70e2:b0:79f:c54:70d6 with SMTP id
 af79cd13be357-79f19a1f2ffmr327011385a.27.1720538783539; 
 Tue, 09 Jul 2024 08:26:23 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f1909ab81sm106447585a.99.2024.07.09.08.26.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 08:26:22 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-44664ad946eso239671cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 08:26:22 -0700 (PDT)
X-Received: by 2002:ac8:45ce:0:b0:447:cebf:705 with SMTP id
 d75a77b69052e-447faede198mr3930761cf.0.1720538781555; Tue, 09 Jul 2024
 08:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240708105221.1.I576751c661c7edb6b804dda405d10e2e71153e32@changeid>
 <ba539524-d0bf-4a22-9872-7c8347d88abd@linaro.org>
In-Reply-To: <ba539524-d0bf-4a22-9872-7c8347d88abd@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 9 Jul 2024 08:26:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UU00oJ0Gi5fhOOk4gCFp1Cg55cA7Gy_GPpVgj95BNNbA@mail.gmail.com>
Message-ID: <CAD=FV=UU00oJ0Gi5fhOOk4gCFp1Cg55cA7Gy_GPpVgj95BNNbA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: sharp-lq101r1sx01: Fixed reversed "if" in
 remove
To: neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, 
 Thierry Reding <treding@nvidia.com>, kernel test robot <lkp@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

On Tue, Jul 9, 2024 at 12:53=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 08/07/2024 19:52, Douglas Anderson wrote:
> > Commit d7d473d8464e ("drm/panel: sharp-lq101r1sx01: Don't call disable
> > at shutdown/remove") had a subtle bug. We should be calling
> > sharp_panel_del() when the "sharp" variable is non-NULL, not when it's
> > NULL. Fix.
> >
> > Fixes: d7d473d8464e ("drm/panel: sharp-lq101r1sx01: Don't call disable =
at shutdown/remove")
> > Cc: Thierry Reding <treding@nvidia.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202406261525.SkhtM3ZV-lkp@intel.com/
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >   drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/=
gpu/drm/panel/panel-sharp-lq101r1sx01.c
> > index edc9425bb143..a0d76d588da1 100644
> > --- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
> > +++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
> > @@ -362,7 +362,7 @@ static void sharp_panel_remove(struct mipi_dsi_devi=
ce *dsi)
> >               dev_err(&dsi->dev, "failed to detach from DSI host: %d\n"=
, err);
> >
> >       /* only detach from host for the DSI-LINK2 interface */
> > -     if (!sharp)
> > +     if (sharp)
> >               sharp_panel_del(sharp);
> >   }
> >
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks! I've pushed to "drm-misc-next-fixes" since it's after -rc6 and
the problematic patch is in drm-next.

[1/1] drm/panel: sharp-lq101r1sx01: Fixed reversed "if" in remove
      commit: ec85147a3529fded4bba12b48623f3a2587af83f
