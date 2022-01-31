Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CBE4A4BEB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 17:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0C610E1A2;
	Mon, 31 Jan 2022 16:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD7C10E1A2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 16:26:41 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id i65so13269377pfc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 08:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cXgpXNmpURYuKO5hFXomyVO5gSKNrTXbh1rD4OzUpXg=;
 b=WR1c+rZqvGGeYSIO6gzOcCW1QC9dPCVdFWw/OeifVZiQihnPygq/QdXzuViZ9SjphP
 ayzUaWkLGwzDG4Xsge/K+PoDGxJiL1fTn8t/T5alQQYGbtr9FbCKoQYdPTPTAKoDAqvj
 qwxu29KzmhcPfmcGid0kH50kWRV7OjH2pkxpbZpJUlldIKhYyNtY2LhMbyFaHT42ZoOu
 OasYPUbcQuUdTH12mC2b6ZjJtt/eLtFk16st4bwPHmOOqg1vK9C2vNZw9XWNIuLy71FB
 Rlgj9qfzTjR4Th548pf2sEQQGJld0nPufqxTkBZUwMhezj0nXWLsjGK2YoAuSuxoPTKh
 +lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cXgpXNmpURYuKO5hFXomyVO5gSKNrTXbh1rD4OzUpXg=;
 b=M+sCLPzTlBGMNJhMfmiSiWIYq6cR4JcEl5s5vTBFv9swXjXEKMo0T1P4/tG0Hxu8pJ
 hmGg0/TjOfn1PN5tmQh/E3d6Pr8JkNStyGodd635U8cBzt2eUgPIeE3o/MBcLlnh2+8t
 rlCY/ccnTEr0gras0UEV4/0PYHkc55LWOebLGjW6ty1BfJvaQKdbxS8B97EfwwaJkFja
 qbFTG4Yjyb6iuTQbFauOu8wZ1YxUmzTK1A7Sa6lCSbctqKpBvQEg1eUsJSNY0rxk7EFG
 4DDbYj+deRssxRX+7vKQztqTymKybM9hR+jUtvdwm0cE0vV1ZLEKVFKmH9fqcUg4Ea0V
 dPiQ==
X-Gm-Message-State: AOAM533txxgDxsUv3bkfkDsc4O4D4spaQiztsEYSFb1uQLtPnoYdpP0B
 eFuvAQy5zs5oSM0brY50ZDe3311XJzK5FpCOJe0f5g==
X-Google-Smtp-Source: ABdhPJyul35EmKETJMvyOwoqTDyNw60O6aZw61+KCHfRM3+oym7Fio60R+RndTgIhPeuZtvYj2RPvrUYpe+m2VVADs8=
X-Received: by 2002:a63:4a49:: with SMTP id j9mr17048783pgl.178.1643646401132; 
 Mon, 31 Jan 2022 08:26:41 -0800 (PST)
MIME-Version: 1.0
References: <9c20eb74d42f6d4128e58e3e46aa320482472b77.1643468761.git.christophe.jaillet@wanadoo.fr>
 <CAG3jFytrA4D2-JrABb+iG2kFQHVB5-_UQWoQyFJ3R=rfarre-A@mail.gmail.com>
In-Reply-To: <CAG3jFytrA4D2-JrABb+iG2kFQHVB5-_UQWoQyFJ3R=rfarre-A@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 31 Jan 2022 17:26:30 +0100
Message-ID: <CAG3jFys5GLKpLFfeVUg-cJaY2j17Z=4c4M+QYiS6M=+b=YH=Ag@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lt9611: Fix an error handling path in
 lt9611_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Jan 2022 at 17:25, Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Christophe,
>
> Thanks for submitting this fix.
>
> On Sat, 29 Jan 2022 at 16:06, Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> >
> > If lt9611_audio_init() fails, some resources still need to be released
> > before returning an error code.
> >
> > Add the missing goto the error handling path.
> >
> > Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt9611.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > index dafb1b47c15f..00597eb54661 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> > @@ -1164,7 +1164,11 @@ static int lt9611_probe(struct i2c_client *client,
> >
> >         lt9611_enable_hpd_interrupts(lt9611);
> >
> > -       return lt9611_audio_init(dev, lt9611);
> > +       ret = lt9611_audio_init(dev, lt9611);
> > +       if (ret)
> > +               goto err_remove_bridge;
> > +
> > +       return 0;
> >
> >  err_remove_bridge:
> >         drm_bridge_remove(&lt9611->bridge);
> > --
> > 2.32.0
> >
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
