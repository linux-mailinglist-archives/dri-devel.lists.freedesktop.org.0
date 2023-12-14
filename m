Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A8813C93
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 22:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541D910E079;
	Thu, 14 Dec 2023 21:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6FF10E9C4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 21:26:27 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-425c1d7d72eso22431cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 13:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702589186; x=1703193986;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mhf9WflZRAY4Fk+Lgl28+c0grxjrzNUPXiwh2v8HVeY=;
 b=oLkGsEZuy6FWmj2hKGrbuHE1j8uCA3rZ/2+QqNizlJupKAXz8FCocNPIbx6U53q2BM
 zw6sUBFCHZm+2p1js3mwo0Zg2aWNBe1H55WyuD4b4cgEVDFfDEpcsatRJzdUdBRZOVwq
 rcfLWRgQXDQnqSZHCYvvMcUAa3I2zFrttTFUQjDasNJO9MyIb8JF/PmUNcBap9Hop18D
 Pma9ad63LXiVtG/C8od+9NZULRHPuY/gBd04kgsquxkyQtDi5QJexDoxsW37sN32CDRi
 J6l9arKP2Gqu75KUi5FmQOVbAA7LvzRXnaX6H67OvEk3trbtc1wAIBi+25pGqKtLY4/s
 8Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702589186; x=1703193986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mhf9WflZRAY4Fk+Lgl28+c0grxjrzNUPXiwh2v8HVeY=;
 b=BMBn/o/amN2lZNRA7zhLOZJlnZ8UdR+Euu6fvaziSS9fqXesemM6SefLeUuYYa3nQA
 Mw144rqX+kr0jx6JQ4TOu7fHI4LaVg2jwVC3e4T5Wv49DWBs4KGVnzwEYOcTfqd09lzn
 TZuuDJFNTNzJ0fb2gGmFmCxlvSR+pKPMFD66jDUvasl+9AklAeMe3NT0GByKQokcV9tE
 PGHvSIJugnO66KjS2BsZVNk4qEUUkukBa2sy+FCARJlKbramS1/kaYLTQnNMHNuVfv3E
 hhi947uODDcUEod4yM3cQV8dSjnSVRbnC4nA4YVeUTTxf6Z6MYDKJcHJnk6XBeE3UkGw
 ZJ+w==
X-Gm-Message-State: AOJu0YwdfAkDmW75XDEO+UGAsfc1aAX24Y9sQg0vTySgGfFZxThE+euY
 iny4D4pmvTd3OYTwlqw6jS6GWyFGIa0mbQyxkLJGaA==
X-Google-Smtp-Source: AGHT+IEwX58D2SeaZ0xdLw5jOv5+L3eK0VxaqundXQosAWlvkMCJnh9yNkkBmuvAaDTMtGEYX2cFo77D/m3frIkB2qs=
X-Received: by 2002:a05:622a:1818:b0:425:946d:4299 with SMTP id
 t24-20020a05622a181800b00425946d4299mr1673126qtc.9.1702589186326; Thu, 14 Dec
 2023 13:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
In-Reply-To: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 14 Dec 2023 13:26:12 -0800
Message-ID: <CABXOdTf2WovgDwcU_oq8QtOhg94KFi+b6biB=za4-8ZTKwnixw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: parade-ps8640: Never store more than
 msg->size bytes in AUX xfer
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philip Chen <philipchen@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 12:38=E2=80=AFPM Douglas Anderson <dianders@chromiu=
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

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
> Changes in v3:
> - Never return more than msg->size as the number of bytes we read.
>
> Changes in v2:
> - Still read all the bytes; just don't write them all to the buffer.
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index 8161b1a1a4b1..d264b80d909d 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -330,11 +330,12 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_d=
p_aux *aux,
>                                 return ret;
>                         }
>
> -                       buf[i] =3D data;
> +                       if (i < msg->size)
> +                               buf[i] =3D data;
>                 }
>         }
>
> -       return len;
> +       return min(len, msg->size);
>  }
>
>  static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
> --
> 2.43.0.472.g3155946c3a-goog
>
