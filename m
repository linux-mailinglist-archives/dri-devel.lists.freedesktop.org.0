Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CFC64D98D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 11:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B44210E515;
	Thu, 15 Dec 2022 10:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2870610E515
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:28:27 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 v19-20020a9d5a13000000b0066e82a3872dso3318495oth.5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 02:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LtljAWqATTprBdx/puLbz5M+a12OV6zS3WLjEmNHu0g=;
 b=Ez24esC5a/EJHDAcFcUCcoPyf6nSQvYavzX2fr3fW1qLKEbuL2vEKMqAxm0nB8eop6
 hCOr9sy58ar6xUuMiBPphsM/qEPindCwfln+nmmUbFZNedDDocfwX7h0OeDFxA9wpSB4
 51V+2TVBY5aRgp4EiapRR+XsZuC+ZtgFeqVEwI3RNv+ogOyP4tLaE1bLvtZH9vdhuA1q
 bO+LmleAziTi+A+Ren80+4Y5ZLI1ZBNltDIUkB78A5A16CkZkgHFD0Nc0YnJG9czC8bd
 8a7u7SDf4fSPVnKjoBPwwYpgvc3GUw8psTV65UEbnKW9ah6MGIN3hxE5eJYSahGjCxRo
 A8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LtljAWqATTprBdx/puLbz5M+a12OV6zS3WLjEmNHu0g=;
 b=UXicEKl+mq5/4HJq+fl1G4AV/o0NMGG5EnXigvC7CsYtqnN2Pj08Qk+0oahmPEY7i8
 A0cA5udht0TB14/lI5yNHBmvyKIlJW0XkVi5uCqiiqO0t2X/psqJz7UQ5+WpEKgKO5Bi
 Z+1YX9M4PWoMwZorRzsx0K4ufOOKsruVcumRP94ZKZrGTdnVL2V/vRCpGyAxRe0evsHu
 Dlb52ypFjBZPFbz5dV3OUX9YZyHHwG0BmCRUr30gf5l0G5/JhrkSz9Gm3y4RAhawJqMq
 d8M1zGZgMltk97FnPzNrL7UaI9OzN6mvxgqvPanxtryTsvtgPcA62OoQjzjgBcO+tZnn
 HgVQ==
X-Gm-Message-State: ANoB5pmxEXfawbcxK8qozt+ZpKy8QkEODCJnLhUlb63ca+tfQwAZMeJA
 5X0fTkOwzzy+pwU2R9yNF2YIZvSxOrRfN0ybtjV9ug==
X-Google-Smtp-Source: AA0mqf4gtJ4oe2CfZk2E+pvBi+849dIwpPxXu0vTF/npAndT/NXXThP36dbstmvHpO1keWYrWKjprQq3UsZdljXW8Yo=
X-Received: by 2002:a05:6830:3697:b0:66b:e4f2:7f2a with SMTP id
 bk23-20020a056830369700b0066be4f27f2amr40760256otb.317.1671100106329; Thu, 15
 Dec 2022 02:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20221109095227.3320919-1-treapking@chromium.org>
 <CAEXTbpf+6n9KWRkQEbQVxsBjd65Rs0voH=JNHk5BaoE_55-yuw@mail.gmail.com>
In-Reply-To: <CAEXTbpf+6n9KWRkQEbQVxsBjd65Rs0voH=JNHk5BaoE_55-yuw@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 11:28:15 +0100
Message-ID: <CAG3jFytMKqGvyn==OZQ_rFZHkfyLtNFNHvj+Ata7D3bgh5JvcQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: Guard bridge power in IRQ handler
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 allen chen <allen.chen@ite.com.tw>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Dec 2022 at 04:30, Pin-yen Lin <treapking@chromium.org> wrote:
>
> Hi all,
>
> Friendly ping on this patch.
>
> Regards,
> Pin-yen
>
> On Wed, Nov 9, 2022 at 5:52 PM Pin-yen Lin <treapking@chromium.org> wrote:
> >
> > Add a pair of pm_runtime_get_if_in_use and pm_runtime_put_sync in the
> > interrupt handler to make sure the bridge won't be powered off during
> > the interrupt handlings. Also remove the irq_lock mutex because it's not
> > guarding anything now.
> >
> > Fixes: ab28896f1a83 ("drm/bridge: it6505: Improve synchronization between extcon subsystem")
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/bridge/ite-it6505.c | 22 ++++++++--------------
> >  1 file changed, 8 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> > index 21a9b8422bda..e7f7d0ce1380 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -412,7 +412,6 @@ struct it6505 {
> >          * Mutex protects extcon and interrupt functions from interfering
> >          * each other.
> >          */
> > -       struct mutex irq_lock;
> >         struct mutex extcon_lock;
> >         struct mutex mode_lock; /* used to bridge_detect */
> >         struct mutex aux_lock; /* used to aux data transfers */
> > @@ -2494,10 +2493,8 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
> >         };
> >         int int_status[3], i;
> >
> > -       mutex_lock(&it6505->irq_lock);
> > -
> > -       if (it6505->enable_drv_hold || !it6505->powered)
> > -               goto unlock;
> > +       if (it6505->enable_drv_hold || pm_runtime_get_if_in_use(dev) <= 0)
> > +               return IRQ_HANDLED;
> >
> >         int_status[0] = it6505_read(it6505, INT_STATUS_01);
> >         int_status[1] = it6505_read(it6505, INT_STATUS_02);
> > @@ -2515,16 +2512,14 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
> >         if (it6505_test_bit(irq_vec[0].bit, (unsigned int *)int_status))
> >                 irq_vec[0].handler(it6505);
> >
> > -       if (!it6505->hpd_state)
> > -               goto unlock;
> > -
> > -       for (i = 1; i < ARRAY_SIZE(irq_vec); i++) {
> > -               if (it6505_test_bit(irq_vec[i].bit, (unsigned int *)int_status))
> > -                       irq_vec[i].handler(it6505);
> > +       if (it6505->hpd_state) {
> > +               for (i = 1; i < ARRAY_SIZE(irq_vec); i++) {
> > +                       if (it6505_test_bit(irq_vec[i].bit, (unsigned int *)int_status))
> > +                               irq_vec[i].handler(it6505);
> > +               }
> >         }
> >
> > -unlock:
> > -       mutex_unlock(&it6505->irq_lock);
> > +       pm_runtime_put_sync(dev);
> >
> >         return IRQ_HANDLED;
> >  }
> > @@ -3277,7 +3272,6 @@ static int it6505_i2c_probe(struct i2c_client *client,
> >         if (!it6505)
> >                 return -ENOMEM;
> >
> > -       mutex_init(&it6505->irq_lock);
> >         mutex_init(&it6505->extcon_lock);
> >         mutex_init(&it6505->mode_lock);
> >         mutex_init(&it6505->aux_lock);
> > --
> > 2.38.1.431.g37b22c650d-goog
> >


Applied to drm-misc-next.


Rob.
