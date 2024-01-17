Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0FC830D5C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 20:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0C910E7FD;
	Wed, 17 Jan 2024 19:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E9D10E7FD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 19:40:07 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6dc8a63cb4aso4888050a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 11:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705520347; x=1706125147;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D6jKjCd8cxNvuyTvHeVd3uoTbVR5rb6TebJjLMiKkIw=;
 b=T0os8VHDybr3wJTcXgFf2MwUJLKX3cx3dNBpEJL9Dzdad1yb6Hpj7GytnuljwApzhS
 gwdt4BnjpU+HAR731GYzy4CFnl4ZKA2egInFBaoMcBZE+0XvcFCWkJHuSimAPk4Z+jtI
 VUw2wfRJdsw4qfxYqhzJPRG5vhHCm3zGO5vLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705520347; x=1706125147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D6jKjCd8cxNvuyTvHeVd3uoTbVR5rb6TebJjLMiKkIw=;
 b=kAztYU9VHiqv/1oNN8yJCWe+PuiuTeSCn8sWC8DZKZ211JcYVaJW7p70GPfBWV8IrF
 atYz0MIFoJgql9Ng4uEIPBKOAsWp5GIbMGhFlkNKBKAII/9keXMGlDMKTHFO7eIU68HC
 Z1V9qHEHUGXSftnWk71gAbvmjZafOhwQwBqbOLXzEq2Gm1dLTj5Fr2Qo+Tx8r1cpMaFw
 zYtRtEYDzqf/4W5P+QbvtFjcmJt5wknPlT0NtcO1DZDZpD5UpkMMEkmCTr23Bj+55o5N
 O05mW8fKsaee8zfco35cv9JN3/ivn5LjIFv2J7TGoszEdo2NtVUPwmux5orCLbHa+W0x
 0HiQ==
X-Gm-Message-State: AOJu0YzlvX5qw44f6fDRLcqr3zfHFqKau4cHfnQoBBkHxEGTO5xNxPBa
 bsWrq/qjIiuZlJ/nVcshHhsvo08iLdoagfBRDLigZn0IjqgL
X-Google-Smtp-Source: AGHT+IGH9stHtp4vFELGxHWV6sZJ5VLgX2UrJI9VZ6g5lxacI7FFdFqxVb2ZT4UmOppnd/g7oFSkYQYXplKjNDdRHqY=
X-Received: by 2002:a9d:63ce:0:b0:6db:ff8b:724e with SMTP id
 e14-20020a9d63ce000000b006dbff8b724emr548346otl.3.1705520347212; Wed, 17 Jan
 2024 11:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20240117103502.1.Ib726a0184913925efc7e99c4d4fc801982e1bc24@changeid>
In-Reply-To: <20240117103502.1.Ib726a0184913925efc7e99c4d4fc801982e1bc24@changeid>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 17 Jan 2024 11:38:41 -0800
Message-ID: <CAJMQK-j_gEfZqWppG3oVNWBopH9uVK-NrzXvoSr=ijF2pMycDA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Make sure we drop the AUX
 mutex in the error case
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 10:35=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> After commit 26db46bc9c67 ("drm/bridge: parade-ps8640: Ensure bridge
> is suspended in .post_disable()"), if we hit the error case in
> ps8640_aux_transfer() then we return without dropping the mutex. Fix
> this oversight.
>
> Fixes: 26db46bc9c67 ("drm/bridge: parade-ps8640: Ensure bridge is suspend=
ed in .post_disable()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Sorry for missing this in my review! :( Given that this is really
> simple and I'd rather the buggy commit not be there for long, if I can
> get a quick Reviewed-by tag on this patch I'll land it without the
> typical stewing period.
>

Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

>  drivers/gpu/drm/bridge/parade-ps8640.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index 166bfc725ef4..14d4dcf239da 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -351,11 +351,13 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_au=
x *aux,
>         ret =3D _ps8640_wait_hpd_asserted(ps_bridge, 200 * 1000);
>         if (ret) {
>                 pm_runtime_put_sync_suspend(dev);
> -               return ret;
> +               goto exit;
>         }
>         ret =3D ps8640_aux_transfer_msg(aux, msg);
>         pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
> +
> +exit:
>         mutex_unlock(&ps_bridge->aux_lock);
>
>         return ret;
> --
> 2.43.0.381.gb435a96ce8-goog
>
