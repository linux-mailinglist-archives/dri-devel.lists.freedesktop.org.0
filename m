Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 645E0813B93
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 21:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDA810E26C;
	Thu, 14 Dec 2023 20:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1A110E26C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 20:34:11 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a22fb5f71d9so208926966b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702586047; x=1703190847;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=deJfGFzyJNks7N/BltMI7GtIwHuIoyf8Os70wSNeWV8=;
 b=PtZUwn6uiBs4p3Jj+Dpw07DHC22s4hCWYsDQFJlNXvvpGiJhUObAxyNjlAc49Qd4G1
 eYEK69nQd0pdcyE5/oOIYYc9E+VtTQTEmFMqK/TcLqjQYXhgnM8n0Lg7u59eVOxayxE3
 z9udO86qYuOw43IS4VR25TqNnQMa4g6qqlwWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702586047; x=1703190847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=deJfGFzyJNks7N/BltMI7GtIwHuIoyf8Os70wSNeWV8=;
 b=lBOq+HizoUEADVwwp7yulTeoKDl1ArARr6Y4of6jaZXzLvvHxHZy1lKMm/fgsDGzn6
 SW+eZyB5QzjrN/yAx/GeA/roL64COZ0mZobAVBgctEUTzqldG/d32vJK3MWiOTa22ecH
 VfO7inNhJMshRcXMMrrgnwfAishoM/oUAu97zg6KGMl9SyH9GoKaskBP1EN3eJAceS4R
 h7bnuMM0qHIe2579Nv21YW5looMkc16G3lAb5o2Z3QeOaIF+DU2E5goWBNyctGEixp+N
 PemxYPqVPZdDgzMeRfDbL/4e/nDy7MiEnEcNLeQzTDtdpmeGKr3aZTxW4FeljdTHPxND
 Nmpw==
X-Gm-Message-State: AOJu0Yz++xwrzCwBLhv5ESdabTg5dxzSAhV13LG3rQ9GS1APJbW4CwAh
 cgciy/WkKABM86yze1vQMK8vC594NG93YTfybLmnkxQJ
X-Google-Smtp-Source: AGHT+IEyV8Zvh7uDTzqw1A9LPZ2iMwFrgVRyj81ulmS0ETQ083iyL0+QhIVLg7y3195U0dAVk0fwdQ==
X-Received: by 2002:a17:907:280f:b0:a1f:4d21:301a with SMTP id
 eb15-20020a170907280f00b00a1f4d21301amr11281722ejc.13.1702586047216; 
 Thu, 14 Dec 2023 12:34:07 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 ez1-20020a056402450100b00551ca461bd7sm2621258edb.48.2023.12.14.12.34.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 12:34:07 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5529df1d4d1so1560a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:34:06 -0800 (PST)
X-Received: by 2002:a50:d643:0:b0:54b:321:ef1a with SMTP id
 c3-20020a50d643000000b0054b0321ef1amr706322edj.6.1702586046109; Thu, 14 Dec
 2023 12:34:06 -0800 (PST)
MIME-Version: 1.0
References: <20231214123205.v2.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
In-Reply-To: <20231214123205.v2.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Dec 2023 12:33:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X=UCn55Z9vYpis41GwQowFBjM+L5j6tO-dC7nWRdX7tQ@mail.gmail.com>
Message-ID: <CAD=FV=X=UCn55Z9vYpis41GwQowFBjM+L5j6tO-dC7nWRdX7tQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: parade-ps8640: Never store more than
 msg->size bytes in AUX xfer
To: dri-devel@lists.freedesktop.org
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philip Chen <philipchen@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 14, 2023 at 12:32=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> While testing, I happened to notice a random crash that looked like:
>
>   Kernel panic - not syncing: stack-protector:
>   Kernel stack is corrupted in: drm_dp_dpcd_probe+0x120/0x120
>
> Analysis of drm_dp_dpcd_probe() shows that we pass in a 1-byte buffer
> (allocated on the stack) to the aux->transfer() function. Presumably
> if the aux->transfer() writes more than one byte to this buffer then
> we're in a bad shape.
>
> Dropping into kgdb, I noticed that "aux->transfer" pointed at
> ps8640_aux_transfer().
>
> Reading through ps8640_aux_transfer(), I can see that there are cases
> where it could write more bytes to msg->buffer than were specified by
> msg->size. This could happen if the hardware reported back something
> bogus to us. Let's fix this so we never write more than msg->size
> bytes. We'll still read all the bytes from the hardware just in case
> the hardware requires it since the aux transfer data comes through an
> auto-incrementing register.
>
> NOTE: I have no actual way to reproduce this issue but it seems likely
> this is what was happening in the crash I looked at.
>
> Fixes: 13afcdd7277e ("drm/bridge: parade-ps8640: Add support for AUX chan=
nel")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Still read all the bytes; just don't write them all to the buffer.
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index 8161b1a1a4b1..dfb97fbb5be6 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -330,7 +330,8 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_=
aux *aux,
>                                 return ret;
>                         }
>
> -                       buf[i] =3D data;
> +                       if (i < msg->size)
> +                               buf[i] =3D data;

Ah crud. I just read over Stephen's response again and realized that
in this case I'm returning the wrong length from the function. A v3
will come shortly.

-Doug
