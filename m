Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01692204BA7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46856E95B;
	Tue, 23 Jun 2020 07:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B7A6E841
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:32:31 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id i1so16224865ils.11
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 08:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iVOaPuKG0WedL7m6XG4ePzXgp0WJooLMXgeknREAmGE=;
 b=aD0MZqxcuG8wLlczv4aauaJmYLYPjjKyOvYUTKoDM8y2jTXwSEaKraPuu//1jWa0Yt
 n4RDREofpThN03Ue0aESzvfzdMnC2QeD3Uv3m/43lF+HgMfTvR8b3k38eMHUyc0EaKZ2
 ntjL1GEYrh9r8iB4BLpJE5+AiY0Zk0Ph1cPE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVOaPuKG0WedL7m6XG4ePzXgp0WJooLMXgeknREAmGE=;
 b=lf547+gX7mmInWh4doec5GMR8So7j4USwbDE9rLY41Q6T/WRT/uqp8yLAWAaJ+7IPP
 WMCrNV6gjmLk3nQVZ9jA+iowDWVLo25voNo8T73gMTZg6P8yTb2AIOAh367CN8T6SVJT
 v1GDzBLTMt5Gwuh/2qvtbYqCpNAAeTo1n/7OsEUpdq8vQrikPAL6tlXv9g7R7gjFIwTx
 i1GFYqyQXvnu3Bx9iQzKlYcgafVIS5ugtBbotHvWWVieV1OsjEm0JHAmDKbi7jN+Zijj
 jUyfZkx0xYXtz/3+pgEfCEm+lNeSf6e7GZEtkZFcqkb8G3Ac6u44GJiFKadZu81VxF+K
 skWg==
X-Gm-Message-State: AOAM533Oksfor1wAS6YVdkJLbc9MMtZkp7VMZlupJLk0Pn7r9bamGKhZ
 VTNmbAgCJ3TtcqmzzkePxd3Dg9Le/KFwCOZintIFIQ==
X-Google-Smtp-Source: ABdhPJyTqIDXVzE4w4P2apwayVscDjgB37tlXDW3/iCEMtbHjWEftO/iuEoA0KoUfM8LI18JEWWyrodeH1OAQfAbAW8=
X-Received: by 2002:a92:d0cc:: with SMTP id y12mr17275492ila.308.1592839951224; 
 Mon, 22 Jun 2020 08:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200622150109.91205-1-hsinyi@chromium.org>
 <20200622152014.GA260716@chromium.org>
In-Reply-To: <20200622152014.GA260716@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 22 Jun 2020 23:32:05 +0800
Message-ID: <CAJMQK-gpxG_vj-9hOBT-Pw6H9KAOEKJ6r+MJfa0ND_9839rQ9w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: check plane visibility in atomic_update
To: Tomasz Figa <tfiga@chromium.org>
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 11:20 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Hsin-Yi,
>
> On Mon, Jun 22, 2020 at 11:01:09PM +0800, Hsin-Yi Wang wrote:
> > Disable the plane if it's not visible. Otherwise mtk_ovl_layer_config()
> > would proceed with invalid plane and we may see vblank timeout.
> >
> > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > ---
> > v2: Add fixes tag
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 23 +++++++++++++----------
> >  1 file changed, 13 insertions(+), 10 deletions(-)
> >
>
> Thank you for the patch. Please see my comments inline.
>
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > index c2bd683a87c8..74dc71c7f3b6 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > @@ -164,6 +164,16 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
> >                                                  true, true);
> >  }
> >
> > +static void mtk_plane_atomic_disable(struct drm_plane *plane,
> > +                                  struct drm_plane_state *old_state)
> > +{
> > +     struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
> > +
> > +     state->pending.enable = false;
> > +     wmb(); /* Make sure the above parameter is set before update */
> > +     state->pending.dirty = true;
> > +}
> > +
> >  static void mtk_plane_atomic_update(struct drm_plane *plane,
> >                                   struct drm_plane_state *old_state)
> >  {
> > @@ -178,6 +188,9 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
> >       if (!crtc || WARN_ON(!fb))
> >               return;
> >
> > +     if (!plane->state->visible)
> > +             return mtk_plane_atomic_disable(plane, old_state);
>
> nit: Both this function and mtk_plane_atomic_disable() have the void return
> type. Perhaps we should rather move the return, without a value, to a
> separate statement?
Updated in v3, thanks.

>
> Best regards,
> Tomasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
