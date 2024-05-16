Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394F88C7617
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3152A10E129;
	Thu, 16 May 2024 12:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fDciE40S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22D110E129
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 12:22:50 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2b9702e05easo108737a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715862170; x=1716466970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EEJR8hPJpPEfgFXU9E3SX+q8sQ52F164lqvG9VHNrco=;
 b=fDciE40SptStYPJpxpg2jhD8DKD+Yi68TC+O9B0Dn4vkNXJZjPsK2asSzUFB/2ZcL7
 Mz8Ap9CRz3r3H2YbsFlMZadSzSWF9OEPB4iP4nvbW9DFJ00V5HhYfw4pcVVMIoUI+ucM
 fsj/d2SNR5zZ9JqRWHthCmfyujhNp4smhJNHS2syfUfTh5Sly/5bKIapJj/Vgqgk1pP/
 KxumcG+/MzZJrhAt0OZellPM4aHgrXJftU7Lrq2KS57mBDP+SZ2r8B+OhLdCjRhSs3mF
 GHpGyYNVQmCsyskpgdL67KbPVZKknXJgAcinm9r09WKBZ8MrIL6s5WjCe1fHOz4zb88q
 cpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715862170; x=1716466970;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EEJR8hPJpPEfgFXU9E3SX+q8sQ52F164lqvG9VHNrco=;
 b=SwLmAiSCu5tS6Wz22YtgwT6WMSrWBxRlcRT5S3ndEueAHsOGBjTK0B3JY+YSnqI3Up
 2X92gs4xkMxT3hury2qBLoiTpnD8btVxOcrAF45A937OaXcAuIEB1UaFSchQflTJwGhb
 Akgo4t0fzKlhxHh3g+9fbtKmjrfDPhFbpOF9tlEwwLmsRJEvI6+AIN511utRWQVX6tgM
 ucMGD4lqH55z8XpLSmsLtieeD0q7xnWDd/V9qG9xizszbvk8ePNJmExRfm3YHufy24qf
 zsXbKzcwyfRXeEvZm9kfiyRnzD8k+mUl85KPOikVrbiOmMo0ZgVHW3p8stGEZ8vDLzVn
 iNuA==
X-Gm-Message-State: AOJu0YzN3iJWkbK+ClVK1bk+H7Y42sAVWjapKWaUqZKL0PPF+vvx4sOQ
 I9IR3vO+xmMfTFjvrPJ163g6EcrTFLyMogG/mmkfotW6QRuS9GRRCBRTIGbqhCWMtpfGpccJ+5j
 VzW+k9yuOU0Q1E5hz5EZnsXqdr0Q=
X-Google-Smtp-Source: AGHT+IF9iM23m/7qaTv229g3fOJAhMCwN+Gu+QDSppNoB2gwTzxDO8SQ1wawIp9cnlsSpY4+8c5gKhNm9D6D6btwuRA=
X-Received: by 2002:a17:90a:bb09:b0:2ae:78cd:59fe with SMTP id
 98e67ed59e1d1-2b6ccd7fc30mr16639459a91.31.1715862169944; Thu, 16 May 2024
 05:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240516101006.2388767-1-victor.liu@nxp.com>
In-Reply-To: <20240516101006.2388767-1-victor.liu@nxp.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 16 May 2024 07:22:38 -0500
Message-ID: <CAHCN7xKiVYPfvu1h0Nz2sRCt=P2zfdS1aMdU=LAeptNv0JbfJw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, biju.das.jz@bp.renesas.com, 
 dmitry.baryshkov@linaro.org, u.kleine-koenig@pengutronix.de, 
 jani.nikula@intel.com, bli@bang-olufsen.dk, sui.jingfeng@linux.dev
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

On Thu, May 16, 2024 at 5:01=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
> no interrupt requested at all.

Sorry about that.

>
> Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
> because it polls adv7511->edid_read flag by calling adv7511_irq_process()
> a few times, but adv7511_irq_process() happens to refuse to handle
> interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.
>
> Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
> handling from adv7511_irq_process().
>
> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Acked-by:  Adam Ford <aford173@gmail.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 6089b0bb9321..2074fa3c1b7b 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv751=
1, bool process_hpd)
>                 return ret;
>
>         /* If there is no IRQ to handle, exit indicating no IRQ data */
> -       if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> +       if (adv7511->i2c_main->irq &&
> +           !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>             !(irq1 & ADV7511_INT1_DDC_ERROR))
>                 return -ENODATA;
>
> --
> 2.37.1
>
