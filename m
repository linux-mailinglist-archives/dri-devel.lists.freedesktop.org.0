Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770B4830CB2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F6A10E7A1;
	Wed, 17 Jan 2024 18:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B6210E7B7;
 Wed, 17 Jan 2024 18:25:14 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-33761776af9so2022082f8f.0; 
 Wed, 17 Jan 2024 10:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705515852; x=1706120652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KNRogNawE98vzU6hLj1KXDSyquhagx1/Y27JreKsQM=;
 b=AvWbXw9m9Jzo6QLF5ueKgHVpAY27u7qX26IuPRUiq3jttz8DaziH8oPg+wzWs8jxwH
 jC5LEyLCN0qtW4XE1iglrMvBoNCZcdbszYJMnGMFgC5w6EYXF8DFi5QpiweEjRNN+vq5
 hEZVglf/4x7fgk+lCGeo7v3tLMC3QfTiUMjnke3n9i6TyYsVgdm8khsHzoJzb2IFxUjr
 SjB9CdCYUHwnmk81dIIpnpI/JAlisGH03RbfNyLIZwCNFbxs2jLBnOTuNca1Xgiu4jZi
 Yr841LWNdZngJyM6Z+wjx+ChTrle43/Obk4WNQdD7O9oURuoJJiGNgl/2pShRx292+tG
 iJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705515852; x=1706120652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KNRogNawE98vzU6hLj1KXDSyquhagx1/Y27JreKsQM=;
 b=Y3Vqq0p0wFEeLoxe9YVQfKV+gI45PXgtxVKQ2Bs0dEnFdjy+2O3oHoE9oXc/xbkEZi
 jC2VEbpJmhpSkOEVqUpCVPfUGxXBIv3NJbJ8UFJtPR88BtPHlDwKPvsVsd1MQZCDjmrv
 klLDu3G6q19oK5tGgvBHycdtTCgdqzVzeUPGX/zhzORNyusBa6ASh3CHOXycNGTxfnct
 5pmDCbx79o4FZhmi9DtlqUx+GRFT8JX75Yjq8rfM4lEFlE79XeNG6atDS3WG8SKbWHE5
 M7LD1ap7uawGUWlJYZjNnAEtURqNQBdAi+DPiQW6/g91KYou/+jK/5c7fCVkhFdasbVs
 F4Yg==
X-Gm-Message-State: AOJu0YyZKsXwdW2Ad46ShJNsTSgoerdSkgokN3aYQeT9G2q4Da1BIohY
 jRP1e/jOWpOUE28bvnXeuGPP2PDqDDR9M9DUhz0=
X-Google-Smtp-Source: AGHT+IHMrOchJ+5dcyqg95SjFNj5eWwJ0BRr8CfuLDBHpYipUaBdrJQEVAGODtTLanoMQLOnw2q9YwVW9qInm8lBML8=
X-Received: by 2002:a5d:4111:0:b0:337:c4c8:92d with SMTP id
 l17-20020a5d4111000000b00337c4c8092dmr1411467wrp.0.1705515852542; Wed, 17 Jan
 2024 10:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-4-nunes.erico@gmail.com>
In-Reply-To: <20240117031212.1104034-4-nunes.erico@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Wed, 17 Jan 2024 10:23:45 -0800
Message-ID: <CA+E=qVfjKvW=R6NaF7eEKkHk91HLGnohQjM8h-3Kh=fv61WgJA@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] drm/lima: set bus_stop bit before hard reset
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: Daniel Vetter <daniel@ffwll.ch>, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 7:12=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> This is required for reliable hard resets. Otherwise, doing a hard reset
> while a task is still running (such as a task which is being stopped by
> the drm_sched timeout handler) may result in random mmu write timeouts
> or lockups which cause the entire gpu to hang.

It looks like Mali driver is doing the same, so it totally makes sense.

> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

> ---
>  drivers/gpu/drm/lima/lima_pp.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/lima/lima_pp.c b/drivers/gpu/drm/lima/lima_p=
p.c
> index a8f8f63b8295..ac097dd75072 100644
> --- a/drivers/gpu/drm/lima/lima_pp.c
> +++ b/drivers/gpu/drm/lima/lima_pp.c
> @@ -168,6 +168,11 @@ static void lima_pp_write_frame(struct lima_ip *ip, =
u32 *frame, u32 *wb)
>         }
>  }
>
> +static int lima_pp_bus_stop_poll(struct lima_ip *ip)
> +{
> +       return !!(pp_read(LIMA_PP_STATUS) & LIMA_PP_STATUS_BUS_STOPPED);
> +}
> +
>  static int lima_pp_hard_reset_poll(struct lima_ip *ip)
>  {
>         pp_write(LIMA_PP_PERF_CNT_0_LIMIT, 0xC01A0000);
> @@ -181,6 +186,14 @@ static int lima_pp_hard_reset(struct lima_ip *ip)
>
>         pp_write(LIMA_PP_PERF_CNT_0_LIMIT, 0xC0FFE000);
>         pp_write(LIMA_PP_INT_MASK, 0);
> +
> +       pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_STOP_BUS);
> +       ret =3D lima_poll_timeout(ip, lima_pp_bus_stop_poll, 10, 100);
> +       if (ret) {
> +               dev_err(dev->dev, "pp %s bus stop timeout\n", lima_ip_nam=
e(ip));
> +               return ret;
> +       }
> +
>         pp_write(LIMA_PP_CTRL, LIMA_PP_CTRL_FORCE_RESET);
>         ret =3D lima_poll_timeout(ip, lima_pp_hard_reset_poll, 10, 100);
>         if (ret) {
> --
> 2.43.0
>
