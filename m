Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F27AE2712E1
	for <lists+dri-devel@lfdr.de>; Sun, 20 Sep 2020 10:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD6F6E095;
	Sun, 20 Sep 2020 08:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1858E6E095
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Sep 2020 08:25:07 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 60so9595047otw.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Sep 2020 01:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/a7naUyGGQKH1PXxQJcaI7djTJ1eGMxz16YFC+CoiHA=;
 b=MwFaajB4ddZEfoS7GDUcwZ09kFwbv/ZPTx4QWEGF92caNb0CPyyc8mE2LnbmeydYRg
 SiXt2yT2P3jWmptEP4rwZTk1fwEjtS/pTYL6Q8V40Y01tXllkHP+t+b6Hsvhroi/DjiG
 kxCI09qbc0xIpWl8xxp8GDUaqMoxh3MOpOINY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/a7naUyGGQKH1PXxQJcaI7djTJ1eGMxz16YFC+CoiHA=;
 b=PgI/M6SFa5mab+1p/V5WREOKuprjGocMVn5DXqlMINekod/PzV83F41R5x8TdbepcH
 wrYedtibTu3BAx203RwBNZdrHf5JSSQvxjQ0ZdrZX5laQa+X5adpqC9MoFkVw0yv1u3j
 R0oq0DUZu2KXk5shGWh7YoOIAeo0dke6w1A5wrH3D+l08OLQMbASja8bTDx8ChHOiyX2
 hQpNTzcTngrzAboBscZwZcNe6BSHXCzX4o1soejSR9k7jkyA+WuFBcTPx2iDsr01BFMh
 Ll9Wq/iXpULejAKyYq9s3Nvcux/Q3e4KypIU5VCQCHsUg44j3YR1Cv3CVyO8jKB1pfFR
 UeQA==
X-Gm-Message-State: AOAM530cofASeAswKt38WAexv7mUKumR8gFJPzu43UHj96Hp5ugXyS1N
 8wkoG4I6GrkZghP5DTN4oATTQvEeTJLE63/tI8hxCg==
X-Google-Smtp-Source: ABdhPJwvCe+IENwJ8m6nRbrwsW1P4512f+jSE1TU352LgCSSh9cgMw9oHKltWRqeohi5j6nyA0l0FsdeQtUcKr0FdFA=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr29624761otf.281.1600590306336; 
 Sun, 20 Sep 2020 01:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200909190213.156302-1-alex.dewar90@gmail.com>
 <c14d055d-1f6e-8c46-3a6e-7794ec69e6fe@baylibre.com>
 <89c599d2-6766-df68-5359-7672679b3d89@gmail.com>
In-Reply-To: <89c599d2-6766-df68-5359-7672679b3d89@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 20 Sep 2020 10:24:55 +0200
Message-ID: <CAKMK7uEwQhdqmU4+Ri+M9JtYqMmetmK8p9uFrhx1Lp16g=1edA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Use kmemdup cf. kmalloc+memcpy
To: Alex Dewar <alex.dewar90@gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Antonio Borneo <antonio.borneo@st.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Markus Elfring <elfring@users.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 19, 2020 at 9:31 PM Alex Dewar <alex.dewar90@gmail.com> wrote:
>
> On 2020-09-11 13:57, Neil Armstrong wrote:
> > On 09/09/2020 21:02, Alex Dewar wrote:
> >> kmemdup can be used instead of kmalloc+memcpy. Replace an occurrence of
> >> this pattern.
> Friendly ping?
> >>
> >> Issue identified with Coccinelle.
> >>
> >> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> >> ---
> >>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 +---
> >>   1 file changed, 1 insertion(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >> index 52f5c5a2ed64..7e9a62ad56e8 100644
> >> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >> @@ -1049,12 +1049,10 @@ static void debugfs_create_files(void *data)
> >>      };
> >>      int i;
> >>
> >> -    dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
> >> +    dsi->debugfs_vpg = kmemdup(debugfs, sizeof(debugfs), GFP_KERNEL);
> >>      if (!dsi->debugfs_vpg)
> >>              return;
> >>
> >> -    memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
> >> -
> >>      for (i = 0; i < ARRAY_SIZE(debugfs); i++)
> >>              debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
> >>                                  dsi->debugfs, &dsi->debugfs_vpg[i],
> >>
> > Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Neil has commit rights, so I was assuming he'd push this to drm-misc-next.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
