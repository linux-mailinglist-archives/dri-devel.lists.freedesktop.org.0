Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3E17F6B75
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 05:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C606010E17C;
	Fri, 24 Nov 2023 04:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B5A10E17C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 04:40:40 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507c5249d55so2252723e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 20:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1700800838; x=1701405638;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6KekUES4QEaW3T6OzwXPRLAJ7BoFDfNAQJ2uK8ftZs4=;
 b=Mfo4m63Uvu4GybHl4fT5ses0dO+2bhK7X8oiRGMqa+2yyxXDR5S9yjks0/lp8kEUum
 W8Zs1A/8/ke06yCEvDDfkRCoNydW7fsV8WHoPVqHTxCm2KYVd7IoH9ugoaZuJ3mAhWb/
 gx/4HTVosgARjm9U8cqBzSAln1ZMBwSwMI/88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700800838; x=1701405638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6KekUES4QEaW3T6OzwXPRLAJ7BoFDfNAQJ2uK8ftZs4=;
 b=j3bk7UnjWwnFQRyQaMo+BvP4nENcyWwQa+VSlAGO9P34a99Zof9Elnrxa45HYHVTQm
 GcBd/81338rIN+DyjM9U74WGNUu74qW1K3k/TEsD/hvIuTAWqSJEF9LlvEa435N8y4cO
 1MO1X9ghctxrfYHOSCLYwQfxIVOfhVa3MPfXqwygOXZzUsKwbYeQXvTcYMyve5k5WAtH
 r85qb0q0CPctKlSyZPmgrRnCzTh4GTkNU7oWCoN2H1JFhghQ21loO0ZYFsmpLuZGjLmO
 7c3aVO62yCjSYuONdtQTIeZ+o2qCiL1mYI3L8R6HvAZLHeZxcn61MFDiu6t/M4VDSkra
 aBAw==
X-Gm-Message-State: AOJu0YxClAx5v8oTiAA3jxo0239yvNnCYIfkXTF/M1cfP3t5JgwVL/m6
 dVkZdKrSjJBmegfKv0rbtTFLbhkWFGiTONl8dfF4hJdsvN6qqRvU
X-Google-Smtp-Source: AGHT+IGdD+/8ruJjlhlvRhWd1o7YaLznxCb2y1AN3J4cYgMXWOthMIC6kIZi9F0WtwbcSOzhaUMLEFUIHM/mmVrW99g=
X-Received: by 2002:a05:6512:3b2c:b0:4fb:9f93:365f with SMTP id
 f44-20020a0565123b2c00b004fb9f93365fmr1155339lfv.38.1700800838386; Thu, 23
 Nov 2023 20:40:38 -0800 (PST)
MIME-Version: 1.0
References: <20230920090658.31181-1-jason-jh.lin@mediatek.com>
 <4b55632a4cc92932384844f94a7d237aa3f471e3.camel@mediatek.com>
In-Reply-To: <4b55632a4cc92932384844f94a7d237aa3f471e3.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Nov 2023 12:40:27 +0800
Message-ID: <CAGXv+5GvOCOPkjxyhv-Wwwbosp1KrL1aFzSyoU_FhqKPk=evPQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Add spinlock for setting vblank event in
 atomic_begin
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?= <Jason-ch.Chen@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 8, 2023 at 3:27=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) =
<ck.hu@mediatek.com> wrote:
>
> Hi, Jason:
>
> On Wed, 2023-09-20 at 17:06 +0800, Jason-JH.Lin wrote:
> > Add spinlock protection to avoid race condition on vblank event
> > between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Please also merge this for fixes so it lands sooner.

> >
> > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC
> > MT8173.")
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Suggested-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> > Reviewed-by: Fei Shao <fshao@chromium.org>
> > Tested-by: Fei Shao <fshao@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index b6fa4ad2f94d..cab4fe092f13 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -744,6 +744,7 @@ static void mtk_drm_crtc_atomic_begin(struct
> > drm_crtc *crtc,
> >
> >   crtc);
> >       struct mtk_crtc_state *mtk_crtc_state =3D
> > to_mtk_crtc_state(crtc_state);
> >       struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> > +     unsigned long flags;
> >
> >       if (mtk_crtc->event && mtk_crtc_state->base.event)
> >               DRM_ERROR("new event while there is still a pending
> > event\n");
> > @@ -751,7 +752,11 @@ static void mtk_drm_crtc_atomic_begin(struct
> > drm_crtc *crtc,
> >       if (mtk_crtc_state->base.event) {
> >               mtk_crtc_state->base.event->pipe =3D
> > drm_crtc_index(crtc);
> >               WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
> > +
> > +             spin_lock_irqsave(&crtc->dev->event_lock, flags);
> >               mtk_crtc->event =3D mtk_crtc_state->base.event;
> > +             spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> > +
> >               mtk_crtc_state->base.event =3D NULL;
> >       }
> >  }
