Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6400827AC9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 23:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9226010E2C7;
	Mon,  8 Jan 2024 22:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0170110E2C7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 22:47:00 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-557d554ca30so1066612a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1704754017; x=1705358817;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Un2/baPM1eoyR6xBkggDdw0l2aptAfl7q01gFgzCYH8=;
 b=b1w6/zKF0xBcfdl2cT49WJNhGca9b79/aQRaAtBreJiZBPNWMZQnMAKwvGiHsEjFOF
 /PF4nMa6XvX73UPx2QJE+0lxnOeFZcA2oU04nE1qWgIlFiNf09FFidn4WSVmoltfFIm5
 H3+FJdm+3nzARe3XVjLJPpvBE5C7lAkWuB7JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704754017; x=1705358817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Un2/baPM1eoyR6xBkggDdw0l2aptAfl7q01gFgzCYH8=;
 b=GniEzt8TbzIWFTiXP9XQb0OOJ3GBwZRslMHRVxd0OoYWOfoXm6KlW/etOthQCICEXl
 buu6zY3BKPphfA+iFGnG43xwqb5ZhPHud40rl8a5WXNGsujiCR8NBUcz9+6jesc+C9WR
 6MT4v0HVuDeC3rFCkObghEVGd40h3zaAcwjOkgIzUAofaS9lpzV7KYg1a/SUjFtx4w4K
 d5zcmy4nI97jWXxmCpmUZhNKA39L8BEokFii3QYTBTqO7SVZX3LbaJmO+ArabXN1ORWc
 FBGjJp+Fd7dlv8Uc0SoGV+I8xhi5/YQgkYX+0GUwfqqTsEl4GP9wK04ohfImixzvBEaU
 5fHg==
X-Gm-Message-State: AOJu0YwRSKuiv+iuwx4IzIA2JaqHirR1BwWkVWdo+mSCiVblWc4HmAO3
 yEviXWdBTXCNkI3J+hoMiPjZX7O1SKOGLPYKiG65CGKeZpoZgpk=
X-Google-Smtp-Source: AGHT+IEg2yROgD7Wo3+oneScq4wJCHWmtdRqSEKmusuoasQx7MOZX/2/hPuj9RSMqF4ws1S5HX9/Jg==
X-Received: by 2002:a17:906:7159:b0:a27:b278:b3e with SMTP id
 z25-20020a170906715900b00a27b2780b3emr48439ejj.83.1704754017216; 
 Mon, 08 Jan 2024 14:46:57 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 s4-20020a170906500400b00a289a8839d9sm327128ejj.164.2024.01.08.14.46.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 14:46:57 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-40e4a606183so17565e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 14:46:56 -0800 (PST)
X-Received: by 2002:a05:600c:600a:b0:40e:4686:7c95 with SMTP id
 az10-20020a05600c600a00b0040e46867c95mr10764wmb.1.1704754016032; Mon, 08 Jan
 2024 14:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20231227104324.2457378-1-treapking@chromium.org>
In-Reply-To: <20231227104324.2457378-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Jan 2024 14:46:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XjpSbqJ=qb0BiuUCAww6=OLHuxxSot6o_u_vKYBYQ57w@mail.gmail.com>
Message-ID: <CAD=FV=XjpSbqJ=qb0BiuUCAww6=OLHuxxSot6o_u_vKYBYQ57w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Ensure bridge is suspended in
 .post_disable()
To: Pin-yen Lin <treapking@chromium.org>
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

Hi,

On Wed, Dec 27, 2023 at 2:43=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Disable the autosuspend of runtime PM and use completion to make sure
> ps8640_suspend() is called in ps8640_atomic_post_disable().
>
> The ps8640 bridge seems to expect everything to be power cycled at the
> disable process, but sometimes ps8640_aux_transfer() holds the runtime
> PM reference and prevents the bridge from suspend.
>
> Instead of force powering off the bridge and taking the risk of breaking
> the AUX communication, disable the autosuspend and wait for
> ps8640_suspend() being called here, and re-enable the autosuspend
> afterwards.  With this approach, the bridge should be suspended after
> the current ps8640_aux_transfer() completes.
>
> Fixes: 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable runtime power man=
agement")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 33 +++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index 8161b1a1a4b1..f8ea486a76fd 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -107,6 +107,7 @@ struct ps8640 {
>         struct device_link *link;
>         bool pre_enabled;
>         bool need_post_hpd_delay;
> +       struct completion suspend_completion;
>  };
>
>  static const struct regmap_config ps8640_regmap_config[] =3D {
> @@ -417,6 +418,8 @@ static int __maybe_unused ps8640_suspend(struct devic=
e *dev)
>         if (ret < 0)
>                 dev_err(dev, "cannot disable regulators %d\n", ret);
>
> +       complete_all(&ps_bridge->suspend_completion);
> +
>         return ret;
>  }
>
> @@ -465,11 +468,37 @@ static void ps8640_atomic_post_disable(struct drm_b=
ridge *bridge,
>                                        struct drm_bridge_state *old_bridg=
e_state)
>  {
>         struct ps8640 *ps_bridge =3D bridge_to_ps8640(bridge);
> +       struct device *dev =3D &ps_bridge->page[PAGE0_DP_CNTL]->dev;
>
>         ps_bridge->pre_enabled =3D false;
>
>         ps8640_bridge_vdo_control(ps_bridge, DISABLE);
> -       pm_runtime_put_sync_suspend(&ps_bridge->page[PAGE0_DP_CNTL]->dev)=
;
> +
> +       /*
> +        * The ps8640 bridge seems to expect everything to be power cycle=
d at
> +        * the disable process, but sometimes ps8640_aux_transfer() holds=
 the
> +        * runtime PM reference and prevents the bridge from suspend.
> +        * Instead of force powering off the bridge and taking the risk o=
f
> +        * breaking the AUX communication, disable the autosuspend and wa=
it for
> +        * ps8640_suspend() being called here, and re-enable the autosusp=
end
> +        * afterwards.  With this approach, the bridge should be suspende=
d after
> +        * the current ps8640_aux_transfer() completes.
> +        */
> +       reinit_completion(&ps_bridge->suspend_completion);
> +       pm_runtime_dont_use_autosuspend(dev);
> +       pm_runtime_put_sync_suspend(dev);
> +
> +       /*
> +        * Mostly the suspend completes under 10 ms, but sometimes it cou=
ld
> +        * take 708 ms to complete.  Set the timeout to 2000 ms here to b=
e
> +        * extra safe.
> +        */
> +       if (!wait_for_completion_timeout(&ps_bridge->suspend_completion,
> +                                        msecs_to_jiffies(2000))) {
> +               dev_warn(dev, "Failed to wait for the suspend completion\=
n");
> +       }
> +
> +       pm_runtime_use_autosuspend(dev);

Thanks for tracking this down! I agree with your analysis and it seems
like we've got to do something about it.

I spent a little time trying to think about a cleaner way. What do you
think about adding a "aux_transfer" mutex? You'd grab this mutex for
the entire duration of ps8640_aux_transfer() and
ps8640_atomic_post_disable(). That way you don't need the weird
completion / timeout and don't need to hackily turn off/on
autosuspend. You shouldn't need the mutex in
ps8640_wait_hpd_asserted() because that will never be called at the
same time as ps8640_atomic_post_disable().

-Doug
