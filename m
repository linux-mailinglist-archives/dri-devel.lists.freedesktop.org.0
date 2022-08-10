Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A748C58F33F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 21:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3FC10EC4C;
	Wed, 10 Aug 2022 19:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9F910FD20
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 19:35:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CFE761374
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 19:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E628EC433C1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 19:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660160148;
 bh=QLZd8R8UuiEP1ol6MBHCA8sMLRNVWMlmj5a9PIR3yxU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PQbAATReEg4tAC63wkT6/7GGmAPC+fn+Dsi5rGCi4+bw4CCsV8hsITkCpKl3A8srA
 jj6GBkqwTzsTUHpdUzAW8hVcUJc9wEIjwbK/zIFA/2toSW/AtDKa+vBWyri+fts7zf
 Ml4VhvOkQmjZShHx+zP5vplkZypX3RQxppPVhnWpq5iNH/WWpOsieT8xJjj1iSZm3s
 DlDzmBzBjnOriP+qWiRlkOpGJxhOXvIucsJ7cw5gxUV1ASZB0n54db9OOnIMpCSDR7
 HX7MqH+e+Sg0x9KFPv0qbP1usSugdeWksYNExfW4x0GXJYLG32SLzx6zCSzQ6pZtl8
 I161Yj9Pa5eqg==
Received: by mail-vs1-f54.google.com with SMTP id j2so16231867vsp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 12:35:48 -0700 (PDT)
X-Gm-Message-State: ACgBeo05tmFY9Ci4ox3JOhbeucb0LwtBllpvK9T/ikPh1agYws/t0wec
 XDvqUb4FRUm95NYvQ/fyf93tV2NZhb708i3pCw==
X-Google-Smtp-Source: AA6agR6ByJIxW7D+Y+tlXWu4JJOaeqM4BYEflHuRHNnzk2UPmYm3x90UWbxQh10prAf0G5nYRkx5rflaTPm7HPoizvY=
X-Received: by 2002:a67:c19c:0:b0:386:3a4b:dd5 with SMTP id
 h28-20020a67c19c000000b003863a4b0dd5mr11476424vsj.53.1660160147922; Wed, 10
 Aug 2022 12:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220711131550.361350-1-windhl@126.com>
 <YvPeNbHCV29oHNtw@phenom.ffwll.local>
In-Reply-To: <YvPeNbHCV29oHNtw@phenom.ffwll.local>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Aug 2022 13:35:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKX-XsMM90iQNmk=9de9cJu51+ebLAtBcRcAvHAHFbH=g@mail.gmail.com>
Message-ID: <CAL_JsqKX-XsMM90iQNmk=9de9cJu51+ebLAtBcRcAvHAHFbH=g@mail.gmail.com>
Subject: Re: [PATCH] drm:pl111: Add of_node_put() when breaking out of
 for_each_available_child_of_node()
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: airlied@linux.ie, Liang He <windhl@126.com>, emma@anholt.net,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 10:37 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jul 11, 2022 at 09:15:50PM +0800, Liang He wrote:
> > The reference 'child' in the iteration of for_each_available_child_of_node()
> > is only escaped out into a local variable which is only used to check
> > its value. So we still need to the of_node_put() when breaking of the
> > for_each_available_child_of_node() which will automatically increase
> > and decrease the refcount.
> >
> > Fixes: ca454bd42dc2 ("drm/pl111: Support the Versatile Express")
> > Signed-off-by: Liang He <windhl@126.com>
> > ---
> >
> > As 'Check-after-Put' has been widely accepted in kernel source, we just
> > use it. If the maintainer thinks it is harmful, I'd like also to use
> > 'Check-and-Put' coding style but with a bit more work.
> >
> >  drivers/gpu/drm/pl111/pl111_versatile.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> > index bdd883f4f0da..963a5d5e6987 100644
> > --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> > +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> > @@ -402,6 +402,7 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
> >               if (of_device_is_compatible(child, "arm,pl111")) {
> >                       has_coretile_clcd = true;
> >                       ct_clcd = child;
> > +                     of_node_put(child);
>
> The same issue seems to exist right below in the next break? Can you pls
> respin with that included?

It has a put already.

Reviewed-by: Rob Herring <robh@kernel.org>
