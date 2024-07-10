Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7402792D949
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 21:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE0610E8A7;
	Wed, 10 Jul 2024 19:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56AAE10E8A7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 19:38:03 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 72D59581A;
 Wed, 10 Jul 2024 21:38:00 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jul 2024 21:38:00 +0200
Message-Id: <D2M42ODWQPAU.I0BMEOLKUP29@kernel.org>
Subject: Re: [PATCH v1 4/4] drm/panel: ili9806e: Break some CMDS into helper
 functions
Cc: "Cong Yang" <yangcong5@huaqin.corp-partner.google.com>,
 <quic_jesszhan@quicinc.com>, <neil.armstrong@linaro.org>,
 <linus.walleij@linaro.org>, <airlied@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.16.0
References: <20240710084715.1119935-1-yangcong5@huaqin.corp-partner.google.com>
 <20240710084715.1119935-5-yangcong5@huaqin.corp-partner.google.com>
 <D2LQJROQYIY3.2Q88EXS8HUDLQ@kernel.org>
 <CAD=FV=WAosZPSKdpwR6pjOmiy4hih=jXaMg2guuVgmc+qj-Csw@mail.gmail.com>
In-Reply-To: <CAD=FV=WAosZPSKdpwR6pjOmiy4hih=jXaMg2guuVgmc+qj-Csw@mail.gmail.com>
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

On Wed Jul 10, 2024 at 9:12 PM CEST, Doug Anderson wrote:
> Hi,
>
> On Wed, Jul 10, 2024 at 2:02=E2=80=AFAM Michael Walle <mwalle@kernel.org>=
 wrote:
> >
> > On Wed Jul 10, 2024 at 10:47 AM CEST, Cong Yang wrote:
> > > Break select page cmds into helper function.
> >
> > Why though? I don't find that anything easier to read. In fact, I
> > deliberately chose not to factor that out into a function. It's just
> > a sequence of magic commands, taken straight from the datasheet. So,
> > I'd like to keep it that way.
>
> The consensus of previous discussion on the lists was that folks
> agreed that we should, where possible, make it more obvious what these
> magic sequences of commands were doing. IMO separating out the page
> switch command helps. Certainly I'm always happy to hear other
> opinions, though.

Fair enough, but in that case, one should take the datasheet (which
you can find online) and replace all the magic numbers with the
correct command names from it. E.g. 0xff is the ENEXTC register. To
be clear, I'm not just talking about the "switch page command".

As patch stands, I don't see much value, TBH. On the contrary, you
make it harder to compare it with the Ortustech panel datasheet.

just my 2c,
-michael

> > -michael
> >
> > > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-ilitek-ili9806e.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/drivers/=
gpu/drm/panel/panel-ilitek-ili9806e.c
> > > index e4a44cd26c4d..68fb9a1a4d80 100644
> > > --- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> > > +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> > > @@ -35,6 +35,12 @@ struct ili9806e_panel {
> > >       enum drm_panel_orientation orientation;
> > >  };
> > >
> > > +#define ILI9806E_DCS_SWITCH_PAGE     0xff
> > > +
> > > +#define ili9806e_switch_page(ctx, page) \
> > > +     mipi_dsi_dcs_write_seq_multi(ctx, ILI9806E_DCS_SWITCH_PAGE, \
> > > +                                  0xff, 0x98, 0x06, 0x04, (page))
> > > +
> > >  static const char * const regulator_names[] =3D {
> > >       "vdd",
> > >       "vccio",
> > > @@ -227,7 +233,7 @@ static void ili9806e_dsi_remove(struct mipi_dsi_d=
evice *dsi)
> > >  static void com35h3p70ulc_init(struct mipi_dsi_multi_context *ctx)
> > >  {
> > >       /* Switch to page 1 */
> > > -     mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04,=
 0x01);
> > > +     ili9806e_switch_page(ctx, 0x01);
>
> I think with your change you should remove the "Switch to page X"
> comments since they're now obvious. Other than that, I'm happy with:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

