Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7A4922AB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 10:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C971129AE;
	Tue, 18 Jan 2022 09:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094F61129AE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 09:25:23 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id d3so16986902ilr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 01:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4nJyI6eUhIELdgXFkdrBzVMhM0Y1Gcauhxwwo0CSvpo=;
 b=a7wHf17/waSeg4gU4SCxg3XtQIQmgnZ9oLXhXsh7E6nGZEX8a9pxmky5RpdL4SEpJF
 XyqfRtUuMs6UOq3c64hLYLesUR/BCqpoFrOmKQXH6o6/d7pnOBTpvnlbhDASEpBfBiFf
 aSCrNFayKE6moPZZtaoUAgMu4QRgE4GJbE01I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4nJyI6eUhIELdgXFkdrBzVMhM0Y1Gcauhxwwo0CSvpo=;
 b=law+KNUm4YtPZ08T7kLiwZSvZFGzkhHPSCfFRYEIH4qJW3IgLhv34ZfUTjB6vJ1oaN
 5zgpXR40rnYkGtig/LdSK/XKuadEWSiaE5cAB/8gdmlg5elUPFo+OHcCYSTRRB5cHn9m
 JO0AVZpujXXysYlqhGDnTpseO0BnIYtv5tJd+Te25lCeCO4z5/EuC1z4OkAcK6XjcJXT
 DQYsmU4yfHzv4vFF2yY+CcnWzHeLvmTbbYhZzF1SP7C8F536enWBMyVcDACrREt04Zbr
 8Wy1L/hOdnUfkMYVEy2eAA426aBOK7YuHdcLPeJwyUDpGIPx/7j8QcexH0dAOk+tMS45
 RYjg==
X-Gm-Message-State: AOAM531Bu9HkE7qXvhD+v+iUBcsy+wbVVNsH2xhvYhmvo+KTuJqpWSWT
 6qNTZ2ArBekYddoYVW+PnERcdXzi2eqX1xhwfWwAmA==
X-Google-Smtp-Source: ABdhPJx0AV/W+kXKIgPEQuoEPUU/Q24Z4RuR77346sKClFXpzzJr2J5A2NlQs0ErkKMIWfqVq14VvtZb7Ezvq8RHBFU=
X-Received: by 2002:a05:6e02:1946:: with SMTP id
 x6mr12916718ilu.10.1642497922291; 
 Tue, 18 Jan 2022 01:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20220113082918.2279347-1-hsinyi@chromium.org>
 <CAG3jFytu8VpopWYHvGiSYRW2bcX-wHSoYgQ42u84WBQKGrnfZQ@mail.gmail.com>
 <CAJMQK-gOMeK+_-6COEsaTdMq3GUejVRuH-HfdvBFS+Q-wKaGkA@mail.gmail.com>
In-Reply-To: <CAJMQK-gOMeK+_-6COEsaTdMq3GUejVRuH-HfdvBFS+Q-wKaGkA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 18 Jan 2022 17:24:56 +0800
Message-ID: <CAJMQK-hZ=jfBe7FjkrRJvWPBG2r3s9Ahq=cpnBCUVGczYt7diA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/bridge: anx7625: Convert to use devm_kzalloc
To: Robert Foss <robert.foss@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 17, 2022 at 6:04 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> hi Robert,
>
> The second patch depends on "drm/bridge: anx7625: send DPCD command to
> downstream" (https://patchwork.kernel.org/project/dri-devel/patch/1f36f8bf0a48fb2bba17bacec23700e58c1d407d.1641891874.git.xji@analogixsemi.com/).
> But I'm waiting for Xin Ji's response for that patch.
>

Hi Robert,

I've rebased to the latest drm-misc-next and sent v4:
https://lore.kernel.org/lkml/20220118092002.4267-1-hsinyi@chromium.org/T/#t
I also discussed with Xin Ji about the dependent patch and included it
in the series.

Thanks.

> Thanks
>
> On Mon, Jan 17, 2022 at 5:40 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > Hey Hsin-Yi,
> >
> >
> > On Thu, 13 Jan 2022 at 09:29, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > Use devm_kzalloc instead of kzalloc and drop kfree(). Let the memory
> > > handled by driver detach.
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > Reviewed-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > > v2->v3: remove kfree() in anx7625_i2c_remove().
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 +++-------
> > >  1 file changed, 3 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 0b858c78abe8b6..d3661c78770a8f 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -2515,7 +2515,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > >                 return -ENODEV;
> > >         }
> > >
> > > -       platform = kzalloc(sizeof(*platform), GFP_KERNEL);
> > > +       platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
> > >         if (!platform) {
> > >                 DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
> > >                 return -ENOMEM;
> > > @@ -2527,7 +2527,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > >         if (ret) {
> > >                 if (ret != -EPROBE_DEFER)
> > >                         DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
> > > -               goto free_platform;
> > > +               return ret;
> > >         }
> > >
> > >         platform->client = client;
> > > @@ -2552,7 +2552,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > >         if (!platform->hdcp_workqueue) {
> > >                 dev_err(dev, "fail to create work queue\n");
> > >                 ret = -ENOMEM;
> > > -               goto free_platform;
> > > +               return ret;
> > >         }
> > >
> > >         platform->pdata.intp_irq = client->irq;
> > > @@ -2637,9 +2637,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > >         if (platform->hdcp_workqueue)
> > >                 destroy_workqueue(platform->hdcp_workqueue);
> > >
> > > -free_platform:
> > > -       kfree(platform);
> > > -
> > >         return ret;
> > >  }
> > >
> > > @@ -2666,7 +2663,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
> > >         if (platform->pdata.audio_en)
> > >                 anx7625_unregister_audio(platform);
> > >
> > > -       kfree(platform);
> > >         return 0;
> > >  }
> > >
> >
> > I just had a look at applying this series, but it fails to apply on
> > drm-misc-next today.
> >
> > Could you send a v4 that applies cleanly, and I'll try to be quick
> > about applying it.
> >
> >
> > Rob.
