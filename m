Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE1C53C37C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 06:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAC010E5DB;
	Fri,  3 Jun 2022 04:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8638110E5DB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 04:01:34 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id kq6so589599ejb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 21:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W8bVxKeCs+luEXxpnTLIbgpg19GNEZEh9tmWHWEe4S4=;
 b=fD7kHLPGCLB6BwqWqEUYpaRcFdRj6SfBXhNT8BN4I9zVIbzLaLp78HxuCGvWRZQMTi
 uyG/1hzIApR7fvPr0IySLfmaArCFTCp8JebyXa3+LDLDErePMizdjtRfFzLMYQpXcFiQ
 DZ2TCHIo3llis01Zupghoa06ycO+92zWx1r+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W8bVxKeCs+luEXxpnTLIbgpg19GNEZEh9tmWHWEe4S4=;
 b=muFnz7dx4mqQIzZRl+8spEGLPyOfXGo/YJXnmowgdjgYIEvQrmvZOcinIhgt/c4NPQ
 weKMSj8rPHGeM3Eh7tA8bGnL8Ws1seG0VHN7n69PvWYbWA/krEMCXvbM8noux7WCC+bd
 aRY4vd/Mg9NIEyTVqMcpE41H6KUa0rgpL9ROiDWRUHChR4Xkt+aDQfaLEWjSmqKqbsjY
 JSglSuTkONz+ieXZhaaypviPrN6Q0gLcJ+TXITrHbjZNDSfNSB4OBVbBBONDqyPUjBER
 nQ5lVhQNaiKUOvKHnBMI+Bz/0MkNJ4nJEkUeW2GxInAS0JXFIQmEH01nZ1PSYlkbxa47
 oEJw==
X-Gm-Message-State: AOAM531l02AX+1kxIFa4ZyXQW4m6wrlA3jUvGqKgmK6dhoovzYVaGnuJ
 szg0jtaHRAOhwlt/9n9/a6YNb8GifzcxWzOvyAzn7Q==
X-Google-Smtp-Source: ABdhPJyw/i2NBojqg3RSMKZ6XZsX0ph8P35ta717/u7cXFNMwFYFBna4UYDnpqAg0IP9EfLOD4BvkdnYqa5fefRVriI=
X-Received: by 2002:a17:907:2ce2:b0:6ff:30e2:25c3 with SMTP id
 hz2-20020a1709072ce200b006ff30e225c3mr6928613ejc.494.1654228892918; Thu, 02
 Jun 2022 21:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220601094637.1200634-1-hsinyi@chromium.org>
 <20220601094637.1200634-4-hsinyi@chromium.org>
 <CAD=FV=XnA80P7BoaAX6JD9Q4ggnk4g4M3wmJFEDNij3+10aL4g@mail.gmail.com>
In-Reply-To: <CAD=FV=XnA80P7BoaAX6JD9Q4ggnk4g4M3wmJFEDNij3+10aL4g@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 3 Jun 2022 12:01:06 +0800
Message-ID: <CAJMQK-g7CdR8sgVssGGYPCaeGz3dKwqsWBnCRCdMvsh1Mtph6g@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/panel: panel-edp: Implement .get_orientation
 callback
To: Doug Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 3, 2022 at 5:51 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jun 1, 2022 at 2:46 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > To return the orientation property to drm/kms driver.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 1732b4f56e38..a2133581a72d 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -609,6 +609,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
> >         return p->desc->num_timings;
> >  }
> >
> > +static enum drm_panel_orientation panel_edp_get_orientation(struct drm_panel *panel)
> > +{
> > +       struct panel_edp *p = to_panel_edp(panel);
> > +
> > +       return p->orientation;
> > +}
> > +
> >  static int detected_panel_show(struct seq_file *s, void *data)
> >  {
> >         struct drm_panel *panel = s->private;
> > @@ -637,6 +644,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
> >         .prepare = panel_edp_prepare,
> >         .enable = panel_edp_enable,
> >         .get_modes = panel_edp_get_modes,
> > +       .get_orientation = panel_edp_get_orientation,
> >         .get_timings = panel_edp_get_timings,
> >         .debugfs_init = panel_edp_debugfs_init,
> >  };
>
> I'm curious: should we be removing the old
> drm_connector_set_panel_orientation() from panel_edp_get_modes()?
> ...or maybe you want to keep it for now because you're only adding
> support to the mediatek driver and for other drivers the WARN_ON is
> better than no orientation support at all?

Right, for the drm/kms drivers that calls
drm_connector_set_panel_orientation(), the
drm_connector_set_panel_orientation() called in panels is no-op, but
others they still need this to be called in the panel.
>
> Maybe you could put a comment next to the old
> drm_connector_set_panel_orientation() saying that it's deprecated and
> that drm drivers are expected to add a call to get_orientation()? Then
> when people see the WARN_ON splat they'll quickly figure out how to
> fix it. ...and eventually we can probably remove all the old calls
> from get_modes() ?
Sure, sounds good to me. I will add this.

>
> -Doug
