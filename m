Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9DA960CA6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 15:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212E910E0A2;
	Tue, 27 Aug 2024 13:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d1RSwg++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E242210E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:55:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0C810A41A08
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B717C61042
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724766906;
 bh=SUBG5hoMIRO14nV0jWKUhFG2oORyt7kd2MOv6Sog22g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d1RSwg++2vsw27s5mw8S0E+m9otKmoDc4aWXcdNmuuRadOumVBMJ5Z3RIJqQBGOUd
 /GCzOiCqujhzfUTswtOAvS2x4uxA/hIWsSw9WxFzNny3Zme003ccv/o0wfMZLFVF6m
 4mZS9CNY3CZBdR8wTZ8cJS843k3Lo4er0MWq7D3U4GSWqk1bEtRSJ1vquvKlFKBc8Y
 3ZNy5KKmqFwT2Zxgtmh8J9vg67x/lWxrckJrBfWkei+qKLEbhP2uLN403+CEUwAQFl
 yLEIeytnrvtvK6L14vWSu5pR5hniIa+Od3dlUdQTfQ35wo2jCwABezOXNEL5Ju1hpO
 iErF6HvEpGrzA==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53346132365so6483258e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 06:55:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW/b7mgKLaArC7nR8cdlpUmLSBPdkM+lWXcsHjjQFusgdz35MH8D7a9A2/PiX+NwRhn0+sC6XsQ2tQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLJLvM8muTla/45ABFtVxJPk3cjBtk4jtNo4Z/3unlD9otXLEO
 W4Z6BrGlS5XISbgYshxS6jIqDzjNU1A2Jy79KuHIuTmr630JurpLwC1I67yl2eV16uw/3QbML16
 p4nLVxx8ETDZwBLIdY8Rw4Ku75w==
X-Google-Smtp-Source: AGHT+IFGoChqzPb8c5bU7g7SCtu0XFZWBbc3/ggPD1QT1E2fNBMBbbJ063/8ywSLhH92vmiZkqq4veEvdtq2nuDD85I=
X-Received: by 2002:a05:6512:31d3:b0:533:4b07:a8dc with SMTP id
 2adb3069b0e04-5344e3e4978mr2079374e87.35.1724766904825; Tue, 27 Aug 2024
 06:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
 <20240826154009.GA300981-robh@kernel.org>
 <87bk1ebz59.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bk1ebz59.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Aug 2024 08:54:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLysakbSdENNy+_XvotK9_eHG0KP50s6gtfFUYntawyWw@mail.gmail.com>
Message-ID: <CAL_JsqLysakbSdENNy+_XvotK9_eHG0KP50s6gtfFUYntawyWw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] of: property: add of_graph_get_next_port_endpoint()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
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

+Jonathan C for the naming

On Mon, Aug 26, 2024 at 7:14=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob
>
> > > We already have of_graph_get_next_endpoint(), but it is not
> > > intuitive to use in some case.
> >
> > Can of_graph_get_next_endpoint() users be replaced with your new
> > helpers? I'd really like to get rid of the 3 remaining users.
>
> Hmm...
> of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port",
> but new helper doesn't have such feature.

Right, but the "feature" is somewhat awkward as you said. You
generally should know what port you are operating on.

> Even though I try to replace it with new helper, I guess it will be
> almost same as current of_graph_get_next_endpoint() anyway.
>
> Alternative idea is...
> One of the big user of of_graph_get_next_endpoint() is
> for_each_endpoint_of_node() loop.
>
> So we can replace it to..
>
> -       for_each_endpoint_of_node(parent, endpoint) {
> +       for_each_of_graph_port(parent, port) {
> +               for_each_of_graph_port_endpoint(port, endpoint) {
>
> Above is possible, but it replaces single loop to multi loops.
>
> And, we still need to consider about of_fwnode_graph_get_next_endpoint()
> which is the last user of of_graph_get_next_endpoint()

I missed fwnode_graph_get_next_endpoint() which has lots of users.
Though almost all of those are just "get the endpoint" and assume
there is only 1. In any case, it's a lot more than 3, so nevermind for
now.

> > > +struct device_node *of_graph_get_next_port_endpoint(const struct dev=
ice_node *port,
> > > +                                               struct device_node *p=
rev)
> > > +{
> > > +   do {
> > > +           prev =3D of_get_next_child(port, prev);
> > > +           if (!prev)
> > > +                   break;
> > > +   } while (!of_node_name_eq(prev, "endpoint"));
> >
> > Really, this check is validation as no other name is valid in a
> > port node. The kernel is not responsible for validation, but okay.
> > However, if we are going to keep this, might as well make it WARN().
>
> OK, will do in v4
>
> > > +/**
> > > + * for_each_of_graph_port_endpoint - iterate over every endpoint in =
a port node
> > > + * @parent: parent port node
> > > + * @child: loop variable pointing to the current endpoint node
> > > + *
> > > + * When breaking out of the loop, of_node_put(child) has to be calle=
d manually.
> >
> > No need for this requirement anymore. Use cleanup.h so this is
> > automatic.
>
> Do you mean it should include __free() inside this loop, like _scoped() ?

Yes.

> #define for_each_child_of_node_scoped(parent, child) \
>         for (struct device_node *child __free(device_node) =3D           =
 \
>              of_get_next_child(parent, NULL);                           \
>              child !=3D NULL;                                            =
 \
>              child =3D of_get_next_child(parent, child))
>
> In such case, I wonder does it need to have _scoped() in loop name ?

Well, we added that to avoid changing all the users at once.

> And in such case, I think we want to have non _scoped() loop too ?

Do we have a user? I don't think we need it because anywhere we need
the node iterator pointer outside the loop that can be done explicitly
(no_free_ptr()).

So back to the name, I don't think we need _scoped in it. I think if
any user treats the iterator like it's the old style, the compiler is
going to complain.

> For example, when user want to use the param.
>
>         for_each_of_graph_port_endpoint(port, endpoint)
>                 if (xxx =3D=3D yyy)
>                         return endpoint;
>
>         for_each_of_graph_port_endpoint_scoped(port, endpoint)
>                 if (xxx =3D=3D yyy)
>                         return of_node_get(endpoint)

Actually, you would do "return_ptr(endpoint)" here.

Rob
