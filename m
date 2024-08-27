Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EFD960CF3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 16:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A1310E0C0;
	Tue, 27 Aug 2024 14:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cepbEcsj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAA510E0C0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 14:05:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9C0B8CE1267
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 14:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15531C4AF0F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724767517;
 bh=LKBzwLK1VuRCG247aZ18hkKv8Cu+JZVib28vpysx80E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cepbEcsjf81GL1oTNQ4cpG2rya1VZgaBMQ5UK+Eef8HF7HrmE4NgZchfghQqUuOQ1
 B9zows4udjTc8PvO/15qa2CKES/aSaYQAbDEpnyZXfi6lO2/h2VeDM4b/E2BuG/HbK
 bcguEJocmarmkPaH2NWtYQqWerl7WKmmrrSxP5NlBJxPSex0nAOP5JkmSAurmimAOv
 3UV85kxV8JNnaaj01N/DL394XITUeKKSAC3Vf7Xeyeb5m70iuFBhQOh4VdkLUG7uZv
 mGGepPeI8+7RdEABg0cLfiaKFExxg4wwdPTvQOv8H5dDHyCUaZmBOudvzv0jz3KH7l
 guzD0PZEbiaoQ==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53349d3071eso6748133e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 07:05:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWMC79Z5gKiATjd2K6OGhzfcnZ1K1+FTSVJqRexY6MASKw5YbTS2FB68OOKTe23CL0rtF8wZz2p4SM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXu3VlRJwotuJpJGgMpTHKp8Oe4eM5TVHz8yAz3AViJtRV1cJf
 Wr+vJeEgy+e5l//QopifEXvFaobmnXTHoDn9o+g+Q17eRAyXLkEmMWpcqMyuZRBibC8TY1In9bl
 22t0rFnhdX1znjz0KLqA/vZufjA==
X-Google-Smtp-Source: AGHT+IER8wl94tUFX0eKrTywG7PWQXHkf/Kibv/Fvx5W7HJEPoMeI4PCXKA6CTewYNf/vhQ7d085ZoNSwSxadgFvBDE=
X-Received: by 2002:a05:6512:31c4:b0:52e:f950:31f3 with SMTP id
 2adb3069b0e04-53438785441mr11027241e87.35.1724767515105; Tue, 27 Aug 2024
 07:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
 <20240826154009.GA300981-robh@kernel.org>
 <Zs2tYUh3PXv-0e20@valkosipuli.retiisi.eu>
In-Reply-To: <Zs2tYUh3PXv-0e20@valkosipuli.retiisi.eu>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Aug 2024 09:05:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcM3r0dPHX9eoU3cz78UxBfg3_DnU4eKX7aohbYC2mRA@mail.gmail.com>
Message-ID: <CAL_JsqLcM3r0dPHX9eoU3cz78UxBfg3_DnU4eKX7aohbYC2mRA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] of: property: add of_graph_get_next_port_endpoint()
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 Jaroslav Kysela <perex@perex.cz>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Saravana Kannan <saravanak@google.com>, 
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
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

On Tue, Aug 27, 2024 at 5:47=E2=80=AFAM Sakari Ailus <sakari.ailus@iki.fi> =
wrote:
>
> Rob, Kunimori-san,
>
> On Mon, Aug 26, 2024 at 10:40:09AM -0500, Rob Herring wrote:
> > On Mon, Aug 26, 2024 at 02:43:28AM +0000, Kuninori Morimoto wrote:
> > > We already have of_graph_get_next_endpoint(), but it is not
> > > intuitive to use in some case.
> >
> > Can of_graph_get_next_endpoint() users be replaced with your new
> > helpers? I'd really like to get rid of the 3 remaining users.
>
> The fwnode graph API has fwnode_graph_get_endpoint_by_id() which can also
> be used to obtain endpoints within a port. It does the same than
> of_graph_get_endpoint_by_regs() with the addition that it also has a
> flags field to allow e.g. returning endpoints with regs higher than
> requested (FWNODE_GRAPH_ENDPOINT_NEXT).

Looks to me like FWNODE_GRAPH_ENDPOINT_NEXT is always used with
endpoint #0. That's equivalent to passing -1 for the endpoint number
with the OF API.

> Most users dealing with endpoints on fwnode property API use this, could
> something like this be done on OF as well? Probably a similar flag would =
be
> needed though.

I had fixed almost all the OF cases at one point. Unfortunately, there
were a few corner cases that I didn't address to eliminate the API. So
now it has proliferated with the fwnode API.

Rob
