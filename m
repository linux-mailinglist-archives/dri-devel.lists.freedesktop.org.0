Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9B8CAE83
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 14:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D3810EBFB;
	Tue, 21 May 2024 12:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bs1YC+i+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D5610EBFB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:47:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 251BBCE0FA4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B15C4AF0F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716295625;
 bh=XrmoUJhlU/7bc8VrKrGuLyJ3TJTPjZrW2vhspqHfNdg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bs1YC+i+B0zqCkEQPSnVW00xHFKrAIpmcQuRqQ21Ag9g/wMtZzc+Kv6+LjP9KrdMp
 l9nLroAlertIVW1wMIk4znNsWrp51c4IDMypVHGcOUy9+M3mr+mDcCJkJR3lBjZ+Ap
 eFYVp5eOr4uRF0PN+5V/0kulCaIcwL/VMROqVue5eIOjQOLHO9f2rzxhdu/ALc1DeM
 6Pk4bSJSjBbr+IfwVIP8X8YibK9qF3Ehft5/v4AwS+pTp0WmONUj20xb6q1qNJj5FZ
 hBOjV57mXg9GHgqarLkIF9/r+DdSW2F6x0Cfk4XP5bxpGyq6klXCH+FQMf4jn74iaF
 WjIbbYUrL39jw==
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-df3dfcf7242so3635229276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 05:47:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVVJPRSJHuw3wA97ExHaP4sWWVfULlT68AJTFpJw0kr4tJ85uPmbu/PjCU8d6jPkkmgs2bIs/QmcTjyUfkEIn5Bj46aMvPG9QHXh4FY8Q3e
X-Gm-Message-State: AOJu0YwGwWHxhr/mepNMPR9qHafGyDo2Gk2QFOTqH0nw3AHmyAvt0OH2
 OIp4/sDgwIqtP1CmcVQh/kw8w7VhYqyYXeqlRdkr5s24ADDgvm8W5C2qEk9L68wwFrsrIc8DHBL
 Kt2zYASz/eU+zHImkjWBlBakvunqL/BV/cxyulQ==
X-Google-Smtp-Source: AGHT+IF7l4XX7l5reCGXrOLAv02SHRdBHksZn1pO49ZL7lhTkI15PZwDPMMPL1gmx/OnXSMcHfkJUQCo3B+kw4bfUjA=
X-Received: by 2002:a25:a125:0:b0:dd0:76e:d630 with SMTP id
 3f1490d57ef6-dee4f37cd06mr28033009276.53.1716295624118; Tue, 21 May 2024
 05:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240521080149.1047892-1-kuro.chung@ite.com.tw>
In-Reply-To: <20240521080149.1047892-1-kuro.chung@ite.com.tw>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 21 May 2024 14:46:53 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4QkALMhwYT7XAHksq7D6CKXsmE4ownCSoaQ5gqr1decA@mail.gmail.com>
Message-ID: <CAN6tsi4QkALMhwYT7XAHksq7D6CKXsmE4ownCSoaQ5gqr1decA@mail.gmail.com>
Subject: Re: [PATCH v12] drm/bridge: it6505: fix hibernate to resume no
 display issue
To: kuro <kuro.chung@ite.com.tw>
Cc: Pin-yen Lin <treapking@chromium.org>,
 Kenneth Haung <kenneth.hung@ite.com.tw>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Allen Chen <allen.chen@ite.com.tw>, Hermes Wu <hermes.wu@ite.com.tw>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
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

Hey,

Thanks for spinning another few revisions.

On Tue, May 21, 2024 at 9:51=E2=80=AFAM kuro <kuro.chung@ite.com.tw> wrote:
>
> From: Kuro Chung <kuro.chung@ite.com.tw>
>
> When the system power resumes, the TTL input of IT6505 may experience
> some noise before the video signal stabilizes, necessitating a video
> reset. This patch is implemented to prevent a loop of video error
> interrupts, which can occur when a video reset in the video FIFO error
> interrupt triggers another such interrupt. The patch processes the SCDT
> and FIFO error interrupts simultaneously and ignores any video FIFO
> error interrupts caused by a video reset.
>
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Kuro Chung <kuro.chung@ite.com.tw>
> Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
>
> ---
> V1->V3: update MAINTAINERS mail list
> V3->V4: remove function it6505_irq_video_fifo_error,it6505_irq_io_latch_f=
ifo_overflow
> V4->V5: customer feedback again, update again, kernel build pass
> V5->V6: remove unrelated patch change, split into another patch
> V6->V7: modify code 0x02 to TX_FIFO_RESET by macro define
> V7->V8: fix merge conflict, change mail from 'cc' to 'to'
> V8->V9: modify patch description, patch summary
> V9->V10: modify patch summary, add Fixes
> V10->V11: modify patch description, add Signed-off-by
> V11->V12: moidfy patch description.
>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 73 +++++++++++++++++++----------
>  1 file changed, 49 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index 469157341f3ab..5703fcf4b7b00 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1307,9 +1307,15 @@ static void it6505_video_reset(struct it6505 *it65=
05)
>         it6505_link_reset_step_train(it6505);
>         it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_VID_MUTE, EN_VID_M=
UTE);
>         it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_VID_CTRL_PKT, 0x00=
);
> -       it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET)=
;
> +
> +       it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, TX_FIFO=
_RESET);
> +       it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x00);
> +
>         it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, RST_501_=
FIFO);
>         it6505_set_bits(it6505, REG_501_FIFO_CTRL, RST_501_FIFO, 0x00);
> +
> +       it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET)=
;
> +       usleep_range(1000, 2000);
>         it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, 0x00);
>  }
>
> @@ -2245,12 +2251,11 @@ static void it6505_link_training_work(struct work=
_struct *work)
>         if (ret) {
>                 it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
>                 it6505_link_train_ok(it6505);
> -               return;
>         } else {
>                 it6505->auto_train_retry--;
> +               it6505_dump(it6505);
>         }
>
> -       it6505_dump(it6505);
>  }
>
>  static void it6505_plugged_status_to_codec(struct it6505 *it6505)
> @@ -2471,31 +2476,53 @@ static void it6505_irq_link_train_fail(struct it6=
505 *it6505)
>         schedule_work(&it6505->link_works);
>  }
>
> -static void it6505_irq_video_fifo_error(struct it6505 *it6505)
> +static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
>  {
> -       struct device *dev =3D it6505->dev;
> -
> -       DRM_DEV_DEBUG_DRIVER(dev, "video fifo overflow interrupt");
> -       it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> -       flush_work(&it6505->link_works);
> -       it6505_stop_hdcp(it6505);
> -       it6505_video_reset(it6505);
> +       return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
>  }
>
> -static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
> +static void it6505_irq_video_handler(struct it6505 *it6505, const int *i=
nt_status)
>  {
>         struct device *dev =3D it6505->dev;
> +       int reg_0d, reg_int03;
>
> -       DRM_DEV_DEBUG_DRIVER(dev, "IO latch fifo overflow interrupt");
> -       it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> -       flush_work(&it6505->link_works);
> -       it6505_stop_hdcp(it6505);
> -       it6505_video_reset(it6505);
> -}
> +       /*
> +        * When video SCDT change with video not stable,
> +        * Or video FIFO error, need video reset
> +        */
>
> -static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
> -{
> -       return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
> +       if ((!it6505_get_video_status(it6505) &&
> +               (it6505_test_bit(INT_SCDT_CHANGE, (unsigned int *) int_st=
atus))) ||
> +               (it6505_test_bit(BIT_INT_IO_FIFO_OVERFLOW, (unsigned int =
*) int_status)) ||
> +               (it6505_test_bit(BIT_INT_VID_FIFO_ERROR, (unsigned int *)=
 int_status))) {
> +
> +               it6505->auto_train_retry =3D AUTO_TRAIN_RETRY;
> +               flush_work(&it6505->link_works);
> +               it6505_stop_hdcp(it6505);
> +               it6505_video_reset(it6505);
> +
> +               usleep_range(10000, 11000);
> +
> +               /*
> +                * Clear FIFO error IRQ to prevent fifo error -> reset lo=
op
> +                * HW will trigger SCDT change IRQ again when video stabl=
e
> +                */
> +
> +               reg_int03 =3D it6505_read(it6505, INT_STATUS_03);
> +               reg_0d =3D it6505_read(it6505, REG_SYSTEM_STS);
> +
> +               reg_int03 &=3D (BIT(INT_VID_FIFO_ERROR) | BIT(INT_IO_LATC=
H_FIFO_OVERFLOW));
> +               it6505_write(it6505, INT_STATUS_03, reg_int03);
> +
> +               DRM_DEV_DEBUG_DRIVER(dev, "reg08 =3D 0x%02x", reg_int03);
> +               DRM_DEV_DEBUG_DRIVER(dev, "reg0D =3D 0x%02x", reg_0d);
> +
> +               return;
> +       }
> +
> +
> +       if (it6505_test_bit(INT_SCDT_CHANGE, (unsigned int *) int_status)=
)
> +               it6505_irq_scdt(it6505);
>  }
>
>  static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
> @@ -2508,15 +2535,12 @@ static irqreturn_t it6505_int_threaded_handler(in=
t unused, void *data)
>         } irq_vec[] =3D {
>                 { BIT_INT_HPD, it6505_irq_hpd },
>                 { BIT_INT_HPD_IRQ, it6505_irq_hpd_irq },
> -               { BIT_INT_SCDT, it6505_irq_scdt },
>                 { BIT_INT_HDCP_FAIL, it6505_irq_hdcp_fail },
>                 { BIT_INT_HDCP_DONE, it6505_irq_hdcp_done },
>                 { BIT_INT_AUX_CMD_FAIL, it6505_irq_aux_cmd_fail },
>                 { BIT_INT_HDCP_KSV_CHECK, it6505_irq_hdcp_ksv_check },
>                 { BIT_INT_AUDIO_FIFO_ERROR, it6505_irq_audio_fifo_error }=
,
>                 { BIT_INT_LINK_TRAIN_FAIL, it6505_irq_link_train_fail },
> -               { BIT_INT_VID_FIFO_ERROR, it6505_irq_video_fifo_error },
> -               { BIT_INT_IO_FIFO_OVERFLOW, it6505_irq_io_latch_fifo_over=
flow },
>         };
>         int int_status[3], i;
>
> @@ -2546,6 +2570,7 @@ static irqreturn_t it6505_int_threaded_handler(int =
unused, void *data)
>                         if (it6505_test_bit(irq_vec[i].bit, (unsigned int=
 *)int_status))
>                                 irq_vec[i].handler(it6505);
>                 }
> +               it6505_irq_video_handler(it6505, (unsigned int *) int_sta=
tus);
>         }
>
>         pm_runtime_put_sync(dev);
> --
> 2.25.1
>

This patch has a few checkpatch --strict warnings, do you mind fixing
those and then we can merge this patch?

linux/scripts/checkpatch.pl --strict --no-signoff --git 'HEAD~0'


Rob.
