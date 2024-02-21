Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D8385D656
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 12:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C158E10E566;
	Wed, 21 Feb 2024 11:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="gbf2hFUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B9810E566
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 11:02:20 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-365138d9635so16949905ab.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 03:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1708513340; x=1709118140;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nj6plWk587aeTNhJ0vkYdN+O+gXvvYvjwMhID6PtyEo=;
 b=gbf2hFUn36drjM35bJWwBs+VZzhgynzu+DEbQYxj0Mij5k5VPu5fy5T5Qz+r9zNIzR
 N9qchvwSryIDyQUKvHknTQ4zicOaMEPydkqID8ij/HTzAchixitkVa89qhO0fO9jzHV7
 NxX2tpX6fw38UZFtHMUTErwnAi90V+DrlfQ/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708513340; x=1709118140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nj6plWk587aeTNhJ0vkYdN+O+gXvvYvjwMhID6PtyEo=;
 b=SItbtlXKZ7JAOm5kkfFjRzjUhfd0ec3/ML1OcDWn858p7dwsfkKszd9bOKmjXehONX
 7vFgPdrRRFGDrBr8zyZ29hsu8gAtnxwbe5y/Rd1ME9OWPBiGGlgBUdW5WH91fr42sBL8
 FMWr3Mr4cwjdLTMjxcIWpTFYfXLkK9O4U/LZa7B13G9mhrHIX702O6SDUq5sqlQqW2yi
 IKD00SAMtIgDWmwGmg8jwTIEC7e3km53+3lKwWSViTHgoPbL8yCXgWAHDQvUPnFDzo0x
 I238nTHKE6JX0G8M6xhd1CBbAp1PELZFNddKapQpc0QgW1uRtQNshvRHjdhAiKhN/0Cs
 I+Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz4/BxgjszKanIMER/KbbKPA0kqflNzEkHsKCu9Eq5VrwhVxYjwsEtq+S73bc453IPzI8/9Jmq8t7qA56uQDZv4EriMEqMsFjJ/gE5Qv2y
X-Gm-Message-State: AOJu0YyiUjiyxcR3unP+Q0sLVPMCrbUIKNSrBl7Tbf4/H49rd5yIylYz
 BN1juzkC5wsrcIvlgHHZVlCWR7mNAhbTnaVEx0LujFSeA/5oCrnA2zY4AZWRANf1bZqtnGeZrRq
 23tXZLxP+f2IBqps60mcY+DNm2ln1PSy66SLw
X-Google-Smtp-Source: AGHT+IFRuetw5HHoAaykdxsWg1k/jdCPmgy1RRD0vtBNXNkGDwXav9XOh2vDYGqoq5JVOhvuSphvXWyMcI7Q5su/xZg=
X-Received: by 2002:a92:de48:0:b0:365:4b91:7cf9 with SMTP id
 e8-20020a92de48000000b003654b917cf9mr3286429ilr.26.1708513339714; Wed, 21 Feb
 2024 03:02:19 -0800 (PST)
MIME-Version: 1.0
References: <20240221080441.190922-1-kuro.chung@ite.com.tw>
In-Reply-To: <20240221080441.190922-1-kuro.chung@ite.com.tw>
From: Pin-yen Lin <treapking@chromium.org>
Date: Wed, 21 Feb 2024 19:02:08 +0800
Message-ID: <CAEXTbpf-Kn8YH1KPq=CT2-0Uu3HSoaejW4c4SWAftKAUhNxy7w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: fix hibernate to resume no display
 issue
To: kuro <kuro.chung@ite.com.tw>
Cc: Allen Chen <allen.chen@ite.com.tw>, Kenneth Haung <kenneth.hung@ite.com.tw>,
 Allen Chen <allen.chen@ite.corp-partner.google.com>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kuro,

On Wed, Feb 21, 2024 at 3:53=E2=80=AFPM kuro <kuro.chung@ite.com.tw> wrote:
>
> From: kuro chung <kuro.chung@ite.com.tw>
>
> ITE added a FIFO reset bit for input video. When system power resume,
> the TTL input of it6505 may get some noise before video signal stable
> and the hardware function reset is required.
> But the input FIFO reset will also trigger error interrupts of output mod=
ule rising.
> Thus, it6505 have to wait a period can clear those expected error interru=
pts
> caused by manual hardware reset in one interrupt handler calling to avoid=
 interrupt looping.
>
> Signed-off-by: Allen Chen <allen.chen@ite.corp-partner.google.com>

IIUC you should also sign this off with your own account, and don't
include Allen if he is not involved in the patch development.corp
account here

>
> BUG=3DNone
> TEST=3DNone
Please remove these two lines for upstream review.
>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 53 ++++++++++++++++++++++++-----
>  1 file changed, 44 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index b53da9bb65a16..86277968fab93 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1318,6 +1318,8 @@ static void it6505_video_reset(struct it6505 *it650=
5)
>         it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_VID_MUTE, EN_VID_M=
UTE);
>         it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_VID_CTRL_PKT, 0x00=
);
>         it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET)=
;
> +       it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x02);
> +       it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x00);
>         it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, RST_501_=
FIFO);
>         it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, 0x00);
>         it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, 0x00);
> @@ -2480,10 +2482,6 @@ static void it6505_irq_video_fifo_error(struct it6=
505 *it6505)
>         struct device *dev =3D &it6505->client->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "video fifo overflow interrupt");
> -       it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> -       flush_work(&it6505->link_works);
> -       it6505_stop_hdcp(it6505);
> -       it6505_video_reset(it6505);
>  }
>
>  static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
> @@ -2491,10 +2489,6 @@ static void it6505_irq_io_latch_fifo_overflow(stru=
ct it6505 *it6505)
>         struct device *dev =3D &it6505->client->dev;
>
>         DRM_DEV_DEBUG_DRIVER(dev, "IO latch fifo overflow interrupt");
> -       it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> -       flush_work(&it6505->link_works);
> -       it6505_stop_hdcp(it6505);
> -       it6505_video_reset(it6505);
>  }

Do we need to keep these two functions if they do nothing other than loggin=
g?

>
>  static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
> @@ -2502,6 +2496,45 @@ static bool it6505_test_bit(unsigned int bit, cons=
t unsigned int *addr)
>         return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
>  }
>
> +static bool it6505_is_video_error_int(const int *int_status)
> +{
> +       if ((it6505_test_bit(BIT_INT_VID_FIFO_ERROR, (unsigned int *)int_=
status)) || (it6505_test_bit(BIT_INT_IO_FIFO_OVERFLOW, (unsigned int *)int_=
status)))
> +               return 1;
> +       return 0;
> +}

Maybe just:
return it6505_test_bit(BIT_INT_VID_FIFO_ERROR, (unsigned int
*)int_status) || it6505_test_bit(BIT_INT_IO_FIFO_OVERFLOW, (unsigned
int *)int_status)

> +
> +static void it6505_irq_video_error_handler(struct it6505 *it6505)
> +{
> +       struct device *dev =3D &it6505->client->dev;
> +       int int_status[3] =3D {0};
> +       int reg_0d;
> +
> +       it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> +       flush_work(&it6505->link_works);
> +       it6505_stop_hdcp(it6505);
> +       it6505_video_reset(it6505);
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "Video Error reset wait video...");
> +

Can you add some code comments here to explain why we need to clear
the interrupt bits here?

> +       for (i =3D 0; i < 10; i++) {
> +               usleep_range(10000, 11000);
> +               int_status[2] =3D it6505_read(it6505, INT_STATUS_03);
> +               reg_0d =3D it6505_read(it6505, REG_SYSTEM_STS);
> +               it6505_write(it6505, INT_STATUS_03, int_status[2]);

If we clear all interrupts like this, won't we risk missing other
interrupts here? E.g., if an HPD interrupt is fired here, it will be
cleared without being handled.

> +
> +               DRM_DEV_DEBUG_DRIVER(dev, "reg08 =3D 0x%02x", int_status[=
2]);
> +               DRM_DEV_DEBUG_DRIVER(dev, "reg0D =3D 0x%02x", reg_0d);
> +
> +               if ((reg_0d & VIDEO_STB) && (reg_0d >=3D 0))
> +                       break;
> +
> +               if (it6505_is_video_error_int(int_status)) {
> +                       it6505_video_reset(it6505);
> +                       DRM_DEV_DEBUG_DRIVER(dev, "Video Error reset wait=
 video (%d)", i);
> +               }
> +       }
> +}

Why do we need a for-loop here, and why 10?

> +
>  static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>  {
>         struct it6505 *it6505 =3D data;
> @@ -2522,7 +2555,7 @@ static irqreturn_t it6505_int_threaded_handler(int =
unused, void *data)
>                 { BIT_INT_VID_FIFO_ERROR, it6505_irq_video_fifo_error },
>                 { BIT_INT_IO_FIFO_OVERFLOW, it6505_irq_io_latch_fifo_over=
flow },
>         };
> -       int int_status[3], i;
> +       int int_status[3], i, reg_0d;
>
>         if (it6505->enable_drv_hold || !it6505->powered)
>                 return IRQ_HANDLED;
> @@ -2550,6 +2583,8 @@ static irqreturn_t it6505_int_threaded_handler(int =
unused, void *data)
>                         if (it6505_test_bit(irq_vec[i].bit, (unsigned int=
 *)int_status))
>                                 irq_vec[i].handler(it6505);
>                 }
> +               if (it6505_is_video_error_int(int_status))
> +                       it6505_irq_video_error_handler(it6505);
>         }
>
>         pm_runtime_put_sync(dev);
> --
> 2.25.1
>

Regards,
Pin-yen
