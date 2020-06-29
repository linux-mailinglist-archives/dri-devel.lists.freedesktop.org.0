Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B1120CD07
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 09:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7DB89E9E;
	Mon, 29 Jun 2020 07:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B296A89E9E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 07:46:57 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C8CB220023;
 Mon, 29 Jun 2020 09:46:55 +0200 (CEST)
Date: Mon, 29 Jun 2020 09:46:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/3] drm/panel: use mipi_dsi_dcs_write_buffer where
 possible
Message-ID: <20200629074654.GC227119@ravnborg.org>
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
 <20200505160329.2976059-2-emil.l.velikov@gmail.com>
 <CACvgo51qzvmf9oTxx_dXWPJEz8VN5VuBGaBJL-JMbbLwSoEDCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51qzvmf9oTxx_dXWPJEz8VN5VuBGaBJL-JMbbLwSoEDCw@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=NXpJzYs8AAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=PWEOW87Kur7FUUydQVUA:9
 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22 a=cwV61pgf2j4Cq8VD9hE_:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 12:28:40PM +0100, Emil Velikov wrote:
> On Tue, 5 May 2020 at 17:05, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > A few of the new panels create a local macro wrapping around
> > mipi_dsi_dcs_write. At the same time, they don't really care about the
> > command/payload split.
> >
> > mipi_dsi_dcs_write does a kmalloc/memcpy/kfree for payload > 7 bytes.
> > kmalloc - avoid that all together by using the _buffer function.
> >
> Seems like I've left an extra word here - will fix in v2, alongside
> any review feedback.
> s/kmalloc - avoid/Avoid/
> 
> > Aside:
> > panel-xinpeng-xpp055c272.c calls its wrapper "generic" although it
> > should be "dcs". But that for another day/patch.
> >
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Fixed up changelog when applied to drm-misc-next.

	Sam
> > ---
> >  drivers/gpu/drm/panel/panel-elida-kd35t133.c       | 4 ++--
> >  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 4 ++--
> >  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   | 4 ++--
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > index 711ded453c44..00e3d67af812 100644
> > --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > @@ -52,9 +52,9 @@ static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
> >  }
> >
> >  #define dsi_dcs_write_seq(dsi, cmd, seq...) do {                       \
> > -               static const u8 d[] = { seq };                          \
> > +               static const u8 b[] = { cmd, seq };                     \
> >                 int ret;                                                \
> > -               ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));   \
> > +               ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b)); \
> >                 if (ret < 0)                                            \
> >                         return ret;                                     \
> >         } while (0)
> > diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> > index 5a7a31c8513e..eaa9da3ebbea 100644
> > --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> > +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> > @@ -246,9 +246,9 @@ struct ltk050h3146w *panel_to_ltk050h3146w(struct drm_panel *panel)
> >  }
> >
> >  #define dsi_dcs_write_seq(dsi, cmd, seq...) do {                       \
> > -               static const u8 d[] = { seq };                          \
> > +               static const u8 b[] = { cmd, seq };                     \
> >                 int ret;                                                \
> > -               ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));   \
> > +               ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b)); \
> >                 if (ret < 0)                                            \
> >                         return ret;                                     \
> >         } while (0)
> > diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> > index 1645aceab597..9e07d7e86807 100644
> > --- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> > +++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> > @@ -62,9 +62,9 @@ static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
> >  }
> >
> >  #define dsi_generic_write_seq(dsi, cmd, seq...) do {                   \
> > -               static const u8 d[] = { seq };                          \
> > +               static const u8 b[] = { cmd, seq };                     \
> >                 int ret;                                                \
> > -               ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));   \
> > +               ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b)); \
> >                 if (ret < 0)                                            \
> >                         return ret;                                     \
> >         } while (0)
> > --
> > 2.25.1
> >
> 
> Humble poke?
> 
> -Emil
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
