Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B2CBC10D2
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 12:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C3B10E374;
	Tue,  7 Oct 2025 10:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bykqyXuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B227E10E374
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 10:51:46 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-76e4fc419a9so5646994b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759834306; x=1760439106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ERaGQ9yaIxATr8iiR27EbRVx7ElSWO0RKNhQEdswlB8=;
 b=bykqyXuuVFiMhXZsdIlCR6GZOinipKL7MZeVvpPikHTK3OT0vEv148AVV/BiadGv03
 SrqptzKGajNbIi6HbNTKUikOSFzzBCMfUcQG/ILPMVcEbSyn+UdFz+eSV+8djW+wcUn8
 1K2fe1fSKd4qx55Dfj6oRcbqHyA5kFSOiQCasWrIyqhRXkw+yBgdab7MIOIH7/RfJ82n
 ZyauoFexK8uTX7b6L1foEw79VOizk54GLarkBHI8PbNN+OXHpydenxitGyXXdmX6aN97
 07kwDgGoCAd6skuoH570gKDKHNYsXTecNT+4GabVACLJWJTqLw3UABMZuTW2B4w0HuII
 LrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759834306; x=1760439106;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ERaGQ9yaIxATr8iiR27EbRVx7ElSWO0RKNhQEdswlB8=;
 b=hDxgauCh/K6wWEsdLDLrnpW4loQxN65+VtwH/QzAVg+iYvCNVTRVfGLk5a2TztcVb/
 vg+DpQnXwpeP99khxIS5GjOWK1q1FCQoNLEfoXxWGBjsKWL7Sk/LtTiZyCcHKy4QmWea
 dtAH0TI0uPNuRH5xizVOQTIj0jHs1qFxL4KYxdnl8d3xpeEwtx+eTu8WSyH4knJS0Pi5
 Ys8hmxZ9WeeF+S049HTfz7/iFw87czIfIzjVgnnpxxhgF/FsrF7JnABd2bi8m0Tu5B1H
 1OWAfJMk/Jnv+13mm2+8PGiRIiuFYqrEhLAZUKkxQS1kqNvRpKFXLgBXpu29uid3ZFQr
 EYXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXccU2T8qwGJiuM+hJrbEpTZ/86bGnt4j28rdp8GYkHJkkAxH3l2y5xZ33OPoPfGPcsb6MlAI4UKlw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1fwowNcPuWpDBpIpQ2p1ymDyijRcLPUnKniNSziGevVeJ9LsL
 ckNEAadHQDQV5b8IA8CzDNw5FxvRIqo9FQvImMJfBqCD0lwEuLryRqu0Ju3TQ+4/2g5ELfarXEv
 OZNS3eO/PhIipO6J9e68T7srVY2JwN2M=
X-Gm-Gg: ASbGncveGA5U1AQQ2lHQXoPzt6hBRhGnkfOVs8qZa96N6bUGP8IZtWGHQWNlhsvhno2
 QkMH+CrSWSNPLWz/RhoGlkmmFnv7OH3QU9C1LlTBmE6KTa+GcUWsfz0sV39qmFen7ll6BQRzuBI
 FDBcqZE1CnN3geMDXkIlzjBBaMUYsrjJGBedBNOQIYYRHbBxE8F58tu/cn9epbxnT2XAfI6lt/6
 KsJVx2XsKJ/8vhj6/QGIqrQPeiM2hC7jd9ofKm7JFdgM7IhFs8f28GIJedG1zgseRXwsEsJT32n
 RuO7QdC8H1XSx9zlYniBe3haVPUl
X-Google-Smtp-Source: AGHT+IHd4zGkj8r8eX1uXnoNZwLblBsh2kU8FR1292Wn++vUByrkdWyStrHKXbzebA9hvSEeVl0scLTbBp83jB2APSE=
X-Received: by 2002:a05:6a00:2406:b0:77e:325b:f614 with SMTP id
 d2e1a72fcca58-78c98d42c3emr18728701b3a.12.1759834306125; Tue, 07 Oct 2025
 03:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250928054913.7871-1-opensource206@gmail.com>
In-Reply-To: <20250928054913.7871-1-opensource206@gmail.com>
From: opensource india <opensource206@gmail.com>
Date: Tue, 7 Oct 2025 16:21:34 +0530
X-Gm-Features: AS18NWAMfEoLWOWgvXjGrgouycSgLmjfzvSwhjaSRxD-4Nl9jKScURjrqBIQrkY
Message-ID: <CAKPKb8_8uQdzNevB4wVpXcRrBr0-rjfvBR=oNNyCCA4yASgK-g@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Replace schedule() with schedule_hrtimeout()
 in fallback wait
To: zack.rusin@broadcom.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sun, Sep 28, 2025 at 11:19=E2=80=AFAM Pavan Bobba <opensource206@gmail.c=
om> wrote:
>
> Replace the open-coded polling with schedule() in vmw_fallback_wait()
> by schedule_hrtimeout(). The old code wakes up at jiffy granularity and
> leads to unnecessary CPU wakeups during fence waits.
>
> schedule_hrtimeout() provides high-resolution sleep with finer control,
> reducing CPU utilization without affecting fence correctness. For the
> non-interruptible case, use schedule_timeout_uninterruptible().
>
> Signed-off-by: Pavan Bobba <opensource206@gmail.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_irq.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_irq.c
> index 05773eb394d3..64045b0efafc 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
> @@ -202,16 +202,12 @@ int vmw_fallback_wait(struct vmw_private *dev_priv,
>                 if (lazy)
>                         schedule_timeout(1);
>                 else if ((++count & 0x0F) =3D=3D 0) {
> -                       /**
> -                        * FIXME: Use schedule_hr_timeout here for
> -                        * newer kernels and lower CPU utilization.
> -                        */
> -
> -                       __set_current_state(TASK_RUNNING);
> -                       schedule();
> -                       __set_current_state((interruptible) ?
> -                                           TASK_INTERRUPTIBLE :
> -                                           TASK_UNINTERRUPTIBLE);
> +                       ktime_t delta =3D ktime_set(0, NSEC_PER_MSEC);
> +
> +                       if (interruptible)
> +                               schedule_hrtimeout(&delta, HRTIMER_MODE_R=
EL);
> +                       else
> +                               schedule_timeout_uninterruptible(delta);
>                 }
>                 if (interruptible && signal_pending(current)) {
>                         ret =3D -ERESTARTSYS;
> --
> 2.43.0
>

anyone please review this patch
