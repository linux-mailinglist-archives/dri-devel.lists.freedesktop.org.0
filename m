Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D9782857F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 12:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC5E10E3EC;
	Tue,  9 Jan 2024 11:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421E910E3EC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 11:51:37 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3606dda206aso16774005ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1704801096; x=1705405896;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlbBXaJ6QChQt8nzvFhN1UrWQRmEjHRHlNEfK3vCyiA=;
 b=WVoEH7FS8sof5osO5uwxoH3mCOTF9jKmF4VS9yxu1ANX5X0UmEBHYTj0/1abvD8cIe
 e12hJlpKXIStq5U+/BXb9bfxrNXGx6STXcWu/aoiCsIDaAq0FIBYOy2pjp8vNOIzV1pq
 SXhb9KDyAUrA3bPM2ibqKjbqPkv8qhWQYPRoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704801096; x=1705405896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlbBXaJ6QChQt8nzvFhN1UrWQRmEjHRHlNEfK3vCyiA=;
 b=Bj51p+VFBuX3ab0KmZz8EgtIDvg+NPCiXka8smiP2KtvyfUzGa7eAtvVnPu6w1DEXg
 NGg6w91+pVNbubGj7A6KfRUDuPmsyfHiZtXaNzAFtmKwlZoV28V33UT+RgJkh8Mxo4Vg
 WwgcvfJWIOSnuH7xY5abyLX6P1XMDcWkP/RRExkwzslDYBd+Z7KaskeTqPD0LXhkCEto
 FYRMfrBSaugozq8dx8YmunGAwgliaHOT9wuwVvrXNagVF4syZZ1DcS5KstQTXr+/tC3c
 NWvi7fYo5eqRDwJyGA770xC5wkRrRRgC60m8BBCiNR6/XrKWJjZKs7w9Ohjez88e3grx
 TdmA==
X-Gm-Message-State: AOJu0Yz57C0/mlL5F8x//O9st6rk1huJ/1syxzjFMk/cj7gnH6X+ssSb
 oV+0XRmQbjwLMEe6ius+EouhBM6ljBgiQrrxQKAifMWZJ16N3OhjoYRm6KA=
X-Google-Smtp-Source: AGHT+IHRwiVkHQh7SIX/3ly4K5QyIfRTw+mMqjEYhSXlsigfyCwTnTznpzS7qg1nRmeOf6u2xNSfwd3Ho+G/zv51xUQ=
X-Received: by 2002:a92:c243:0:b0:35f:eb24:6bbe with SMTP id
 k3-20020a92c243000000b0035feb246bbemr7884021ilo.41.1704801096603; Tue, 09 Jan
 2024 03:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20231227104324.2457378-1-treapking@chromium.org>
 <CAD=FV=XjpSbqJ=qb0BiuUCAww6=OLHuxxSot6o_u_vKYBYQ57w@mail.gmail.com>
In-Reply-To: <CAD=FV=XjpSbqJ=qb0BiuUCAww6=OLHuxxSot6o_u_vKYBYQ57w@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 9 Jan 2024 19:51:25 +0800
Message-ID: <CAEXTbpdrjSGczw12CB7=GGKRywpROWvS73SdgYEq5o4kQTSk9w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Ensure bridge is suspended in
 .post_disable()
To: Doug Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Tue, Jan 9, 2024 at 6:46=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Wed, Dec 27, 2023 at 2:43=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > Disable the autosuspend of runtime PM and use completion to make sure
> > ps8640_suspend() is called in ps8640_atomic_post_disable().
> >
> > The ps8640 bridge seems to expect everything to be power cycled at the
> > disable process, but sometimes ps8640_aux_transfer() holds the runtime
> > PM reference and prevents the bridge from suspend.
> >
> > Instead of force powering off the bridge and taking the risk of breakin=
g
> > the AUX communication, disable the autosuspend and wait for
> > ps8640_suspend() being called here, and re-enable the autosuspend
> > afterwards.  With this approach, the bridge should be suspended after
> > the current ps8640_aux_transfer() completes.
> >
> > Fixes: 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable runtime power m=
anagement")
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 33 +++++++++++++++++++++++++-
> >  1 file changed, 32 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/b=
ridge/parade-ps8640.c
> > index 8161b1a1a4b1..f8ea486a76fd 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -107,6 +107,7 @@ struct ps8640 {
> >         struct device_link *link;
> >         bool pre_enabled;
> >         bool need_post_hpd_delay;
> > +       struct completion suspend_completion;
> >  };
> >
> >  static const struct regmap_config ps8640_regmap_config[] =3D {
> > @@ -417,6 +418,8 @@ static int __maybe_unused ps8640_suspend(struct dev=
ice *dev)
> >         if (ret < 0)
> >                 dev_err(dev, "cannot disable regulators %d\n", ret);
> >
> > +       complete_all(&ps_bridge->suspend_completion);
> > +
> >         return ret;
> >  }
> >
> > @@ -465,11 +468,37 @@ static void ps8640_atomic_post_disable(struct drm=
_bridge *bridge,
> >                                        struct drm_bridge_state *old_bri=
dge_state)
> >  {
> >         struct ps8640 *ps_bridge =3D bridge_to_ps8640(bridge);
> > +       struct device *dev =3D &ps_bridge->page[PAGE0_DP_CNTL]->dev;
> >
> >         ps_bridge->pre_enabled =3D false;
> >
> >         ps8640_bridge_vdo_control(ps_bridge, DISABLE);
> > -       pm_runtime_put_sync_suspend(&ps_bridge->page[PAGE0_DP_CNTL]->de=
v);
> > +
> > +       /*
> > +        * The ps8640 bridge seems to expect everything to be power cyc=
led at
> > +        * the disable process, but sometimes ps8640_aux_transfer() hol=
ds the
> > +        * runtime PM reference and prevents the bridge from suspend.
> > +        * Instead of force powering off the bridge and taking the risk=
 of
> > +        * breaking the AUX communication, disable the autosuspend and =
wait for
> > +        * ps8640_suspend() being called here, and re-enable the autosu=
spend
> > +        * afterwards.  With this approach, the bridge should be suspen=
ded after
> > +        * the current ps8640_aux_transfer() completes.
> > +        */
> > +       reinit_completion(&ps_bridge->suspend_completion);
> > +       pm_runtime_dont_use_autosuspend(dev);
> > +       pm_runtime_put_sync_suspend(dev);
> > +
> > +       /*
> > +        * Mostly the suspend completes under 10 ms, but sometimes it c=
ould
> > +        * take 708 ms to complete.  Set the timeout to 2000 ms here to=
 be
> > +        * extra safe.
> > +        */
> > +       if (!wait_for_completion_timeout(&ps_bridge->suspend_completion=
,
> > +                                        msecs_to_jiffies(2000))) {
> > +               dev_warn(dev, "Failed to wait for the suspend completio=
n\n");
> > +       }
> > +
> > +       pm_runtime_use_autosuspend(dev);
>
> Thanks for tracking this down! I agree with your analysis and it seems
> like we've got to do something about it.
>
> I spent a little time trying to think about a cleaner way. What do you
> think about adding a "aux_transfer" mutex? You'd grab this mutex for
> the entire duration of ps8640_aux_transfer() and
> ps8640_atomic_post_disable(). That way you don't need the weird
> completion / timeout and don't need to hackily turn off/on
> autosuspend. You shouldn't need the mutex in
> ps8640_wait_hpd_asserted() because that will never be called at the
> same time as ps8640_atomic_post_disable().
>
> -Doug

Hi Doug,

Thanks for the suggestion! I tried that approach and it fixes the issue as =
well.

I'll send out another patch with that approach.

Regards,
Pin-yen
