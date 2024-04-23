Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7241F8AE8A3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9181133D2;
	Tue, 23 Apr 2024 13:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mI68GxxR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BD11133D2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:50:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DEB47614C0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11583C4AF0B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713880239;
 bh=WvgEJunFxQxvZe5kKGX5pJ8T4b7SjDJ99+xPaVRVWMg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mI68GxxRP5tbNsV+KQPm/AUrW1EpoZ3ti5srNmCTsI1uBIy5riuElETJVcSG3Nei1
 WokJ1uxAJH3yLeQtRoBFCEKp106Bf6PslvNSqKhDy9cSNfP0GxfU77KllOC2pP8EcL
 1hECMk0lfGLMueNvng0MMbdJt3gFLuP7n6WHJtBl31TlPweLHFUDLX5puy5fFEDI6M
 FN02WzQkaIO7Sw6k13NsmRVFqpl6XTWGQJpTg+P4mwk1ZmRwRI4rBHE2oTy+cbYU4I
 DSjPYwS6b3uHx9PAk/8/KrxKEXCjAYxYZTNz3/5sLpgEgPqSn9sRAbh+L7VuHLJcqm
 AElfigklgWGcQ==
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-23a6a8e9978so840017fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 06:50:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWffZZ81cfFebdI12xFKTEUD8bcyHH2r56XRYCwqsKqR+fwSXMlM41FFH09oInWqfrHarGxpTjVQvnPFvTqV6Mgef/jmh1/8vFw6LzHCGRh
X-Gm-Message-State: AOJu0YxbaIGs7fn9b7XkdB6CheSuNUP3xquJ098/bZfMguMsJILto0go
 oqFpX1ektX0HtAYVy79l/cj7hokHg8k5u8GfIZ7PqRFqzSv3DcBgpZcAWQ/+8V9/AP7+8Llm2Tu
 2KuguYRieaDse9x9+Tk0TiEhKQIt4YcEDBBaArQ==
X-Google-Smtp-Source: AGHT+IE/YD0s84IsYB0S2ZE6yekA5zCcCTcTvhBJHQHR+U6iv+FpDCMJciZD7J3d+FRWEGJM6YD/NW9iPYrm7WJNEps=
X-Received: by 2002:a05:6870:b601:b0:233:5557:c6a2 with SMTP id
 cm1-20020a056870b60100b002335557c6a2mr18799782oab.34.1713880238268; Tue, 23
 Apr 2024 06:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240423082722.843587-1-kuro.chung@ite.com.tw>
 <20240423082722.843587-2-kuro.chung@ite.com.tw>
In-Reply-To: <20240423082722.843587-2-kuro.chung@ite.com.tw>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 23 Apr 2024 15:50:26 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5cM=2qDAVQk3vdQAHJCOZFMPnA9ypZ_U2ZnKn7JDLGyA@mail.gmail.com>
Message-ID: <CAN6tsi5cM=2qDAVQk3vdQAHJCOZFMPnA9ypZ_U2ZnKn7JDLGyA@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] drm/bridge: it6505: fix hibernate to resume no
 display issue
To: kuro <kuro.chung@ite.com.tw>
Cc: Allen Chen <allen.chen@ite.com.tw>, Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Haung <kenneth.hung@ite.com.tw>, 
 Kuro Chung <kuro.chung@ite.corp-partner.google.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
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

On Tue, Apr 23, 2024 at 10:16=E2=80=AFAM kuro <kuro.chung@ite.com.tw> wrote=
:
>
> From: Kuro <kuro.chung@ite.com.tw>
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
> Signed-off-by: Kuro Chung <kuro.chung@ite.corp-partner.google.com>
>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 73 +++++++++++++++++++----------
>  1 file changed, 49 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index b53da9bb65a16..ae7f4c7ec6dd0 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1317,9 +1317,15 @@ static void it6505_video_reset(struct it6505 *it65=
05)
>         it6505_link_reset_step_train(it6505);
>         it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_VID_MUTE, EN_VID_M=
UTE);
>         it6505_set_bits(it6505, REG_INFOFRAME_CTRL, EN_VID_CTRL_PKT, 0x00=
);
> -       it6505_set_bits(it6505, REG_RESET_CTRL, VIDEO_RESET, VIDEO_RESET)=
;
> +
> +       it6505_set_bits(it6505, REG_VID_BUS_CTRL1, TX_FIFO_RESET, 0x02);
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

Can any of these magic values be defined as macros?

>  }
>
> @@ -2249,12 +2255,11 @@ static void it6505_link_training_work(struct work=
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
> @@ -2475,31 +2480,53 @@ static void it6505_irq_link_train_fail(struct it6=
505 *it6505)
>         schedule_work(&it6505->link_works);
>  }
>
> -static void it6505_irq_video_fifo_error(struct it6505 *it6505)
> +static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
>  {
> -       struct device *dev =3D &it6505->client->dev;
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
>         struct device *dev =3D &it6505->client->dev;
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

Is this correct? Doesreg_int03 contain reg08?

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
> @@ -2512,15 +2539,12 @@ static irqreturn_t it6505_int_threaded_handler(in=
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
> @@ -2550,6 +2574,7 @@ static irqreturn_t it6505_int_threaded_handler(int =
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
