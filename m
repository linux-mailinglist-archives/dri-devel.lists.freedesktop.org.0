Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5457CF737
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 13:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25AE10E4C3;
	Thu, 19 Oct 2023 11:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF9B10E4C3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 11:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1697715748; x=1729251748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dGVV1XZ3kTX7Tv24pGahJ1gi4uw7pJN6njyEQsHMwIA=;
 b=kcWq2VBJgij19qfb9OZuRvNUJgk/GztKJgxi+gCHZY4v1HOhsNHdLM0S
 pbEB/ra030cEIBOMI6v2KH2XktCL7sGaIVnl/+TO4VuSXMRdsWq47yC0A
 sPXxpdfQ9k+fcAwL57ahWPlh4JdOvxUGHUkKDpWvoySm1tISNHrfNmNfL
 GvleN9SQJbAJI97kVM3JDqqmM0CZ9NaKbkg8anFXhFoYjt6Kw3rH7CMEu
 dMRgjHQqjXmWkYNv+x/u1ImYPJUy5svz/P8xI7tlT7MqFIpnCWfDlQXjO
 x9ZI05cwsU5FeQiDhPXiuCPLMKRgw/tfkaL8geu0Pj8aVZ4nJdiJsYBxX g==;
X-IronPort-AV: E=Sophos;i="6.03,237,1694728800"; d="scan'208";a="33551544"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 19 Oct 2023 13:42:25 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8F44D280082;
 Thu, 19 Oct 2023 13:42:25 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Date: Thu, 19 Oct 2023 13:42:27 +0200
Message-ID: <1907377.IobQ9Gjlxr@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
 <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-arm-msm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Donnerstag, 19. Oktober 2023, 13:19:51 CEST schrieb Dmitry Baryshkov:
> On Thu, 19 Oct 2023 at 12:26, Maxime Ripard <mripard@kernel.org> wrote:
> > On Mon, Oct 16, 2023 at 07:53:48PM +0300, Dmitry Baryshkov wrote:
> > > The MIPI DSI links do not fully fall into the DRM callbacks model.
> >=20
> > Explaining why would help
>=20
> A kind of explanation comes afterwards, but probably I should change
> the order of the phrases and expand it:
>=20
> The atomic_pre_enable / atomic_enable and correspondingly
> atomic_disable / atomic_post_disable expect that the bridge links
> follow a simple paradigm: either it is off, or it is on and streaming
> video. Thus, it is fine to just enable the link at the enable time,
> doing some preparations during the pre_enable.
>=20
> But then it causes several issues with DSI. First, some of the DSI
> bridges and most of the DSI panels would like to send commands over
> the DSI link to setup the device. Next, some of the DSI hosts have
> limitations on sending the commands. The proverbial sunxi DSI host can
> not send DSI commands after the video stream has started. Thus most of
> the panels have opted to send all DSI commands from pre_enable (or
> prepare) callback (before the video stream has started).
>=20
> However this leaves no good place for the DSI host to power up the DSI
> link. By default the host's pre_enable callback is called after the
> DSI bridge's pre_enable. For quite some time we were powering up the
> DSI link from mode_set. This doesn't look fully correct. And also we
> got into the issue with ps8640 bridge, which requires for the DSI link
> to be quiet / unpowered at the bridge's reset time.

There are also bridges (e.g. tc358767) which require DSI-LP11 upon bridge=20
reset. And additionally this DSI-(e)DP bridge requires LP11 while accessing=
=20
DP-AUX channel, e.g. reading EDID. So bridges need at least some control ov=
er=20
DSI line state.

> Dave has come with the idea of pre_enable_prev_first /
> prepare_prev_first flags, which attempt to solve the issue by
> reversing the order of pre_enable callbacks. This mostly solves the
> issue. However during this cycle it became obvious that this approach
> is not ideal too. There is no way for the DSI host to know whether the
> DSI panel / bridge has been updated to use this flag or not, see the
> discussion at [1].
>=20
> Thus comes this proposal. It allows for the panels to explicitly bring
> the link up and down at the correct time, it supports automatic use
> case, where no special handling is required. And last, but not least,
> it allows the DSI host to note that the bridge / panel were not
> updated to follow new protocol and thus the link should be powered on
> at the mode_set time. This leaves us with the possibility of dropping
> support for this workaround once all in-kernel drivers are updated.

I want to use this series to support tc358767 properly, because=20
pre_enable_prev_first is not enough, see AUX channel above. I hope I'll fin=
d=20
any time soon.

Best regards,
Alexander

>=20
> > > The drm_bridge_funcs abstraction.
> >=20
> > Is there a typo or missing words?
>=20
> missing comma in front of The
>=20
> > > Instead of having just two states (off and on) the DSI hosts have
> > > separate LP-11 state. In this state the host is on, but the video
> > > stream is not yet enabled.
> > >=20
> > > Introduce API that allows DSI bridges / panels to control the DSI host
> > > power up state.
>=20
> [1]
> https://lore.kernel.org/dri-devel/6c0dd9fd-5d8e-537c-804f-7a03d5899a07@li=
na
> ro.org/
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >=20
> > >  drivers/gpu/drm/drm_mipi_dsi.c | 31 +++++++++++++++++++++++++++++++
> > >  include/drm/drm_mipi_dsi.h     | 29 +++++++++++++++++++++++++----
> > >  2 files changed, 56 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c
> > > b/drivers/gpu/drm/drm_mipi_dsi.c index 14201f73aab1..c467162cb7d8
> > > 100644
> > > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > > @@ -428,6 +428,37 @@ int devm_mipi_dsi_attach(struct device *dev,
> > >=20
> > >  }
> > >  EXPORT_SYMBOL_GPL(devm_mipi_dsi_attach);
> > >=20
> > > +bool mipi_dsi_host_power_control_available(struct mipi_dsi_host *hos=
t)
> > > +{
> > > +     const struct mipi_dsi_host_ops *ops =3D host->ops;
> > > +
> > > +     return ops && ops->power_up;
> > > +}
> > > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_control_available);
> > > +
> > > +int mipi_dsi_host_power_up(struct mipi_dsi_host *host)
> > > +{
> > > +     const struct mipi_dsi_host_ops *ops =3D host->ops;
> > > +
> > > +     if (!mipi_dsi_host_power_control_available(host))
> > > +             return -EOPNOTSUPP;
> > > +
> > > +     return ops->power_up ? ops->power_up(host) : 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_up);
> > > +
> > > +void mipi_dsi_host_power_down(struct mipi_dsi_host *host)
> > > +{
> > > +     const struct mipi_dsi_host_ops *ops =3D host->ops;
> > > +
> > > +     if (!mipi_dsi_host_power_control_available(host))
> > > +             return;
> > > +
> > > +     if (ops->power_down)
> > > +             ops->power_down(host);
> > > +}
> > > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_down);
> > > +
> >=20
> > If this API is supposed to be used by DSI devices, it should probably
> > take a mipi_dsi_device pointer as a parameter?
>=20
> Ack.
>=20
> > We should probably make sure it hasn't been powered on already too?
>=20
> Ack, I can add an atomic count there and a WARN_ON. However I don't
> think that it is a real problem.
>=20
> > Maxime
>=20
> --
> With best wishes
>=20
> Dmitry


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


