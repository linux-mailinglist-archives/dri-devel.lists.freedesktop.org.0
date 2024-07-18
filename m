Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72300934AE0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 11:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4BE10E65D;
	Thu, 18 Jul 2024 09:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bfhUKnsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88D810E65D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 09:28:13 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-4f2f24f6470so244343e0c.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721294892; x=1721899692;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vIVo0OQ1EsBJVsYCtM25PmcXBbJ96Ax/6H8Xf2sBrfU=;
 b=bfhUKnsQJ+/aLpE80PGrj+oSWgKZF4UJUmOD8zGYQje0ZsBpbkLrwol+P/gdR6Qjqg
 LscxiUV3zoz2Y85XcXc75URWM+SKiqOa3Gup4Pv24SZhFCzOjjWmDBNfNdh6OBtDE9lr
 EdltPjaWXJtcqUeT89z1wK+Lopw8ASJAK5PCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721294892; x=1721899692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vIVo0OQ1EsBJVsYCtM25PmcXBbJ96Ax/6H8Xf2sBrfU=;
 b=YC3ltCNITgN1mJDhJfzzauOm3KXLHY+6gazNMISWX6jXnROtyKk2i0MQ+FEK1MgDKT
 nUgZcOe8vtFsNiMjNA8vUSd5XC5kVGv3zrSGjp7QlJW/OB6m+cPihyCedK7/8bXyb0MW
 gH/YUwyFd7IJ2MCVrJ38NCEXbQ8db6M/ZJV7Xl30oRbhbMrLpmjPlsqYd1DnipOjx99D
 2olx3HysHYiEHtMlizwuUQ9z7wARdZSH9nrkEqsgwcLhZbocYzh4rxYoMGwFhxySO9nT
 +1d594MbfCwciR69l4aiaXUlltQtIUv8Lr/mYa0mVucGmIZJM+JOG2It7lmThero18R0
 UmZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiA+5MQM8lKB8xSmKCB90J2qzauT3e/NxGpPCVlbLdg2ZqpSaTgZaSFbfdRfpCM1o4Xwz3S7vBWA3CTGsREZ9/knwA0NsmLLOl8273Fq4U
X-Gm-Message-State: AOJu0YxSptOV5lo+oDuw6yyU/WC+fuVLd37B7QmGUmKsn/gp7gB/F8Oe
 UMq+i6kRx16ZFl9TMsyywNWZimDbBqUZ08l7FA5gVYiGThoriW0LG3uW/z6JHwMoFUMs4zd/a4q
 v3Q==
X-Google-Smtp-Source: AGHT+IE1xrNhQihJCMhOwMC+sv/6iA5kudlEVoB80GCvXY2ZSCW+yMdaq0p0wz6R8FGMKCy9kw+XOw==
X-Received: by 2002:a05:6122:2218:b0:4ef:66cf:8745 with SMTP id
 71dfb90a1353d-4f4df6e5a5bmr5695754e0c.7.1721294892504; 
 Thu, 18 Jul 2024 02:28:12 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-4f4ee9bd09csm120826e0c.25.2024.07.18.02.28.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 02:28:11 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-4f2fad3fb8eso236195e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 02:28:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU/WQ0CyOULzEiJNRiA69PqpJ+814J2w2ajKR82VNxHA7DyHg6/Na5TFHFBKFtQOuA2OSQARXIEEPSCR9EXqJKd2GE6jDJ4TzHbFuer50tI
X-Received: by 2002:a05:6122:3684:b0:4ec:fc9b:a0bc with SMTP id
 71dfb90a1353d-4f4df688191mr5774468e0c.4.1721294891079; Thu, 18 Jul 2024
 02:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
In-Reply-To: <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 18 Jul 2024 17:27:33 +0800
X-Gmail-Original-Message-ID: <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com>
Message-ID: <CAC=S1nigoJWAECBrm-Q=Co1-qd_yUhx3R4D9=dYeUV=gr5UYfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, ck.hu@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
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

On Thu, Jul 18, 2024 at 4:49=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> (CC-ed Fei Shao)
>
> On Thu, Jul 18, 2024 at 4:24=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Hardware-speaking, there is no feature-reduced cursor specific
> > plane, so this driver reserves the last all Overlay plane as a
> > Cursor plane, but sets the maximum cursor width/height to the
> > maximum value that the full overlay plane can use.
> >
> > While this could be ok, it raises issues with common userspace
> > using libdrm (especially Mutter, but other compositors too) which
> > will crash upon performing allocations and/or using said cursor
> > plane.
> >
> > Reduce the maximum width/height for the cursor to 512x512 pixels,
> > value taken from IGT's maximum cursor size test, which succeeds.
> >
> > Fixes: a4c9410b31ca ("drm/mediatek: Set DRM mode configs accordingly")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_drv.c
> > index 6f0b415a978d..b96763664c4f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -540,8 +540,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
> >         }
> >
> >         /* IGT will check if the cursor size is configured */
> > -       drm->mode_config.cursor_width =3D drm->mode_config.max_width;
> > -       drm->mode_config.cursor_height =3D drm->mode_config.max_height;
> > +       drm->mode_config.cursor_width =3D 512;
> > +       drm->mode_config.cursor_height =3D 512;
>
> Fei already did the same (?) workaround downstream just recently.

Well, so another userspace gets confused...
I actually sent a separate userspace (i.e. Chrome) fix where I
encountered the issue, so I didn't proceed with upstreaming it in the
end.

This matches my preference in [1], so of course I'd like to see it
merged... if maintainers are okay with it.
Given I've tested the exact same change before:
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

[1]: https://lore.kernel.org/all/CAC=3DS1nhKPo5BUYJ_cHGz3OoPrWNh5eO8rhdyikL=
imsqSOrZ5Xg@mail.gmail.com/

Regards,
Fei
>
> OOTH, Intel recently added a feature for enumerating "suggested"
> cursor sizes. See https://patchwork.freedesktop.org/patch/583299/
>
> Not sure if other compositors will end up using it or not.
>
> ChenYu
>
> >         /* Use OVL device for all DMA memory allocations */
> >         crtc =3D drm_crtc_from_index(drm, 0);
> > --
> > 2.45.2
> >
