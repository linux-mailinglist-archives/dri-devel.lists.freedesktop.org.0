Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D8EAE23C4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 22:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFB710EBBA;
	Fri, 20 Jun 2025 20:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MgutoI4Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B868910EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 20:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750452528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qV2GuOk6prsGImt4/Ey1K9gQAvfZF21DhfJmgVLr4ZY=;
 b=MgutoI4QV/aKPiyhIkb6U2gLnli59RRvyMwm5dBZR08C1ehaqz4oK8BJ1IKX4CS3FhPng3
 ZtzZ+3AGz/mrOUu1uivyffacw555mr7mFuPEJweZgr/yBu9lks2UpCJBYtfc24lQZL1c6d
 F7H6YUy/dy/Eu1ghGzaWggY5/9kTbts=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-BRKC-ATYOlCxXVO99dnAVA-1; Fri, 20 Jun 2025 16:48:46 -0400
X-MC-Unique: BRKC-ATYOlCxXVO99dnAVA-1
X-Mimecast-MFC-AGG-ID: BRKC-ATYOlCxXVO99dnAVA_1750452526
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-703d7a66d77so27173267b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 13:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750452526; x=1751057326;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qV2GuOk6prsGImt4/Ey1K9gQAvfZF21DhfJmgVLr4ZY=;
 b=YbfT4I6pnhxtvrhC5Db6367RREDmtVrJAsAbcUSsNIDghdLiZYP6Kg3kZ2g0Zuar0J
 z1wNkazsDzrpGRK6av0pdTyiUp7B3pCkjEeUWZic6Nk3X/06meagZic/Yx9M5QF0zB5o
 aqq8LIIdBMTuYa+ecj8A6kXvTUTSUmG2egLTop/g2FA5azS3LHcW3Aee9vyDozuVWsom
 FvfWK0OSAEMuyN2spwrawC7GhmMFriguxsArWsyFwKVJY76Te3dg4giYShyLUpgXf0a3
 bfNrxgEoOFr7bNWgKD8y+tX1WFScPTPH4uymVwOXSAuqVCf+CyjCojPk2ocTl/POJDHd
 40Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5J07rzAqQFysR5rKpthf5DaIb8Q5tp3b5vIu6bpcu4qHn8IJckFGkEQaYrta8nXhGNMuFZXRAAlU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVw5ZhbpMKaqAmBKe3sqjL4SJdC8xaVzSYBPQqs/VsGSYhHb48
 e/oM12xJza6ykuuToJDsM/wWAm/cxFQv6uOIpdrM/wbzXAmhGkI//cQngEjuIg1XWCXmnSxoohN
 jVu5YtNRDkWVzSshUwlmxAX4T9TH5+k++Y2XEj40HnSJp9ieFNm9/iSbWgEsKmPmnVPSeMny+GN
 laif6pMJgXA49Af3Q/5g1gpIwh6GtHlxfDuYEuw6vDcGvd
X-Gm-Gg: ASbGncucYoVlzw2jNgqW6UNEIJSTFEmJD4g6YlARLPU9Q7lJXrkPMFQDjSfPUcPQp6v
 ph/6MiE7xJt/QAnvbQOtoqK13r1hr5c/IMtPE9QDzRYwMNNeyqQz5mBLNf3VbSWDSlE9G1NoPQQ
 fSbg==
X-Received: by 2002:a05:690c:3804:b0:70e:25e2:74cf with SMTP id
 00721157ae682-712ca54e4afmr51585037b3.18.1750452525819; 
 Fri, 20 Jun 2025 13:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh08joDHXcQUzg8KLHSzcW1Mh/OstEWq4Fw22TWWJ68HBD0dg5sJCgCzfVsRu7xWHXXNGDbPLSWbGSgVA1mGw=
X-Received: by 2002:a05:690c:3804:b0:70e:25e2:74cf with SMTP id
 00721157ae682-712ca54e4afmr51584557b3.18.1750452525443; Fri, 20 Jun 2025
 13:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
 <20250619-b4-of_drm_find_panel_part1-v2-1-0df94aecc43d@redhat.com>
 <20250620103353.5b43b86f@booty> <20250620-conscious-purring-ant-b0a64e@houat>
In-Reply-To: <20250620-conscious-purring-ant-b0a64e@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 20 Jun 2025 15:47:25 -0500
X-Gm-Features: AX0GCFsQAhMbF8DdRKAbPGnD63XqsKC320S2_TFYRlvhQMLyBBr03odOk3hfb3g
Message-ID: <CAN9Xe3QNQLjjgKF9-j+ANB=pBoej2Qk02ivwE9O6+5JzOsd64g@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] drm/panel: get/put panel reference in
 drm_panel_add/remove()
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rK6HKvOFfXfA8K-O3M8hi0-xpp7yVp-at57S4yXho14_1750452526
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f9be05063806fc90"
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

--000000000000f9be05063806fc90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 4:11=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:

> On Fri, Jun 20, 2025 at 10:33:53AM +0200, Luca Ceresoli wrote:
> > Hello Anusha,
> >
> > On Thu, 19 Jun 2025 14:15:53 -0500
> > Anusha Srivatsa <asrivats@redhat.com> wrote:
> >
> > > Take the panel reference and put it back as required.
> > > drm_panel_add() and drm_panel_remove() add a panel to
> > > the global registry and removes a panel respectively.
> > > Use get() and put() helpers to keep up with refcounting.
> > >
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> >
> > This patch is good.
> >
> > I'd just point out that this must be applied only after all drivers
> > have been converted to the the _alloc API, otherwise with the following
> > sequence:
> >
> >   panel =3D devm_kzalloc();
> >   drm_panel_init(panel);
> >   drm_panel_add(panel);
> >   ...
> >   drm_panel_remove(panel); <-----
> >
> > at the drm_panel_remove() you'd have a warning:
> >
> >   refcount_t: addition on 0; use-after-free.
>
> Yes, Luca. makes sense. Thanks.
You had reviewed this patch already, but thanks :)

> So, if all panel drivers are converted:
>
> Not all panels are yet:
> $ rg -l drm_panel_init -- drivers/gpu/drm/panel/ | wc -l
> 20
>
^^^^^
 Yup. Looks like there are some more occurences. On it.

Anusha

> Maxime
>

--000000000000f9be05063806fc90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 20,=
 2025 at 4:11=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel=
.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Fri, Jun 20, 2025 at 10:33:53AM +0200, Luca Cere=
soli wrote:<br>
&gt; Hello Anusha,<br>
&gt; <br>
&gt; On Thu, 19 Jun 2025 14:15:53 -0500<br>
&gt; Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com" target=3D"_=
blank">asrivats@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Take the panel reference and put it back as required.<br>
&gt; &gt; drm_panel_add() and drm_panel_remove() add a panel to<br>
&gt; &gt; the global registry and removes a panel respectively.<br>
&gt; &gt; Use get() and put() helpers to keep up with refcounting.<br>
&gt; &gt; <br>
&gt; &gt; Reviewed-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bo=
otlin.com" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@red=
hat.com" target=3D"_blank">asrivats@redhat.com</a>&gt;<br>
&gt; <br>
&gt; This patch is good.<br>
&gt; <br>
&gt; I&#39;d just point out that this must be applied only after all driver=
s<br>
&gt; have been converted to the the _alloc API, otherwise with the followin=
g<br>
&gt; sequence:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0panel =3D devm_kzalloc();<br>
&gt;=C2=A0 =C2=A0drm_panel_init(panel);<br>
&gt;=C2=A0 =C2=A0drm_panel_add(panel);<br>
&gt;=C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0drm_panel_remove(panel); &lt;-----<br>
&gt; <br>
&gt; at the drm_panel_remove() you&#39;d have a warning:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0refcount_t: addition on 0; use-after-free.<br>
<br></blockquote><div>Yes, Luca. makes sense. Thanks.</div><div>You had rev=
iewed this patch already, but thanks :)</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt; So, if all panel drivers are converted:<br>
<br>
Not all panels are yet:<br>
$ rg -l drm_panel_init -- drivers/gpu/drm/panel/ | wc -l<br>
20<br></blockquote><div>^^^^^ <br></div><div>=C2=A0Yup. Looks like there ar=
e some more occurences. On it.</div><div><br></div><div>Anusha</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--000000000000f9be05063806fc90--

