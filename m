Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCC075404E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 19:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93A910E8C1;
	Fri, 14 Jul 2023 17:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3416C10E8C5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 17:17:05 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7996e265b4dso648213241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1689355024; x=1691947024;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kPkTDTNfOApHatP9lNZWj31zOJzwMg7NBxlcg43JW0A=;
 b=YJZ5856Wzct0W9OUT10Qr4DLI5UVwZNjb5sCCL+c4HA879k/1jjcx6Sqn3Pywy8Al3
 0MCtvdFfjgZ3JkmXgE9eilx7iKZU9vy2GL2Ia0aZUzEDNhmPkyVrBwps6B38KBgw7dpC
 ep3tvD5QGa2oGOOuZyX8f45fEit68XSGrz3AeTX1GAYMZEVK1LCvzdeCsyRHL55IycrX
 GLbDNA30Egw51BpH3JwWmvqSKExUMe4fvk84+lUWWDiE4E7HeRlVsyuD3dJ85QFG38PG
 UBg4cl8FtIeEgSYFf+PxULkyyZ4lCswJ5C6TGZ2CqcPtpogwQiOu/laZJqGlZp95X+TK
 SGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689355024; x=1691947024;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kPkTDTNfOApHatP9lNZWj31zOJzwMg7NBxlcg43JW0A=;
 b=iGcD+URv1mnZ9X4Wizm1VQIzRrsJ8X7znhtiAAd1u4QeUYRRDV061TUtSyinrmUtpx
 XoO+En/EDA9DNuAwa9nzMoOnOJDWeqbbF+rSqAJ3Xwzc2Q19jS33iUoCOeAPgTD6D7uP
 bYFvWgjnvVgzwKA6dtzot0zh7OsrXVj9Jg+S4mkodIZ50Go9GOyL8Umuslh5vQVh17px
 ASu2rQS2+Q+sbXjq5EWxUx+P323Z3q1xiG3LpIwXfxtUtWXJ1OPEfDdvcd0gFa8tZR6F
 9Kkg3vps21V9ORWDwvfDy3Jj9h3qGaqwM8DHw670+JXLxNo19nSKFNEYUyswjqtukQ1q
 Kunw==
X-Gm-Message-State: ABy/qLbXhrlubz4E0BSE7v5mXgX/HqbIs+iiU9vLnM5JtJ7+/0fElUa+
 NsId3Cw2fuESrC6fflUbNESC6T5vaSYVAcTI435PqQ==
X-Google-Smtp-Source: APBJJlF68nyBZQWjjKu6x2+WknZa+vyhroJilqDKSdVZZiJZNfDJ12qlqrbIltEhVmePfALAAyvocnnQfRhMzKvR9nY=
X-Received: by 2002:a1f:d045:0:b0:47e:8a9:478c with SMTP id
 h66-20020a1fd045000000b0047e08a9478cmr2987555vkg.16.1689355023876; Fri, 14
 Jul 2023 10:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230707190020.6280-2-vladimir.lypak@gmail.com>
 <7c4affcb-bcb4-5f4b-cc2f-bed2cad9de71@kontron.de>
In-Reply-To: <7c4affcb-bcb4-5f4b-cc2f-bed2cad9de71@kontron.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 14 Jul 2023 18:16:47 +0100
Message-ID: <CAPY8ntBWmfDPwPJS_z5tko7PUxHG9pVQ1DOKC3baGDCNzMzykw@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/bridge: Fix handling of bridges with
 pre_enable_prev_first flag
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frieder

On Mon, 10 Jul 2023 at 08:46, Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 07.07.23 21:00, Vladimir Lypak wrote:
> > [Sie erhalten nicht h=C3=A4ufig E-Mails von vladimir.lypak@gmail.com. W=
eitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.=
ms/LearnAboutSenderIdentification ]
> >
> > In function drm_atomic_bridge_chain_post_disable handling of
> > pre_enable_prev_first flag is broken because "next" variable will alway=
s
> > end up set to value of "bridge". This breaks loop which should disable
> > bridges in reverse:
> >
> >  next =3D list_next_entry(bridge, chain_node);
> >
> >  if (next->pre_enable_prev_first) {
> >         /* next bridge had requested that prev
> >          * was enabled first, so disabled last
> >          */
> >         limit =3D next;
> >
> >         /* Find the next bridge that has NOT requested
> >          * prev to be enabled first / disabled last
> >          */
> >         list_for_each_entry_from(next, &encoder->bridge_chain,
> >                                  chain_node) {
> > // Next condition is always true. It is likely meant to be inversed
> > // according to comment above. But doing this uncovers another problem:
> > // it won't work if there are few bridges with this flag set at the end=
.
> >                 if (next->pre_enable_prev_first) {
> >                         next =3D list_prev_entry(next, chain_node);
> >                         limit =3D next;
> > // Here we always set next =3D limit =3D branch at first iteration.
> >                         break;
> >                 }
> >         }
> >
> >         /* Call these bridges in reverse order */
> >         list_for_each_entry_from_reverse(next, &encoder->bridge_chain,
> >                                          chain_node) {
> > // This loop never executes past this branch.
> >                 if (next =3D=3D bridge)
> >                         break;
> >
> >                 drm_atomic_bridge_call_post_disable(next, old_state);
> >
> > In this patch logic for handling the flag is simplified. Temporary
> > "iter" variable is introduced instead of "next" which is used only
> > inside inner loops.
> >
> > Fixes: 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to al=
ter bridge init order")
> > Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
>
> I haven't had a chance to look at this, but I still want to reference
> another patch by Jagan that intends to fix some bug in this area:
>
> https://patchwork.kernel.org/project/dri-devel/patch/20230328170752.11023=
47-1-jagan@amarulasolutions.com/
>
> +Cc: Jagan
>
> Dave, as you introduced this feature, did you have a chance to look at
> Jagan's and Vladimir's patches?

Sorry, they'd fallen off my radar.
I'm having a look at the moment, but will probably need to carry it
over to Monday.

  Dave
