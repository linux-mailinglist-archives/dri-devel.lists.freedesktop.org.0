Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481AB8310F6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 02:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EB010E066;
	Thu, 18 Jan 2024 01:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDE510E066;
 Thu, 18 Jan 2024 01:37:48 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-559f92bf7b6so488760a12.0; 
 Wed, 17 Jan 2024 17:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705541806; x=1706146606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Z9m6hPmqmYL+JFz3wIA/pboCcBVyWFCc3DeuY26Ipc=;
 b=bCWrJJUBtD1GsQD2Sy05o0XLat6UlNgwlAOxBoaqhOu3//MFRqfGFFkuH1PETnAxCd
 eJqzR8M9fME330fmsuSCKfS8D1Y5xICGtBnYlPapr1NAEDKlAQCIMbasOoWFA5pEci3C
 FaJR3LCtHJK50gMUQhroClD/qNy6mFLtIrAuS+E4sxw3VFTMuXJ+OT9b23/BlSz5L592
 CRtcakFxtvRfnfNYuySfKDt3A+Gw4KtuxzOhxqb6f6krvckQZN45F/es0wlsKt2dxpsw
 y0+MVxRD+35qwkErVynkGryIOUIaeH4GxY/8msGBYxPWGSrYs45T2IS9nun7tAd3NJ8r
 dqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705541806; x=1706146606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Z9m6hPmqmYL+JFz3wIA/pboCcBVyWFCc3DeuY26Ipc=;
 b=QDO5VO2PqU4R2G4ll5JCMRTDjgZcsI9axpl+OOA7jNjlbNovFZmCMcmdTlaI/hzUyF
 30+i2NX/Tzlqq6mvE/9x2lMeeGO9q9uHiteO7WGHx3EgmRA4BAS1ETdJYOgRAwNLmLEc
 oedUwBpYuyYDcomKZNM0aS3p8iaej4LyMoKhlQY/20nJKLM+iNYKVse1lZFzHS4svCRI
 ENI39wqNRGji0Um1d9QCNnZfZp6Cdxc/VwUBN7P+qRc1Cx5l3VYXlHDM8mJveAyDVDZU
 GhShiWK6RPjM0Q45ylAQxSTnqvKtIMZeIln55El8f8UCcQVyKm7lBcGpIOeyoCiMUMI6
 Gd6Q==
X-Gm-Message-State: AOJu0YyrC/L2N9ZYF+wDu3RVuY9/LHJPyF32U1XowZuottLggGGBtHKj
 vyHHAI2m6j1lpommy5ODDTOviKGcrxpYPBsicqqAf2x6jnB0AiZEF01PNz0bwMbkz5UJ+Zmd7ax
 J+BsmyzqVDZ2g7BNXbX/12aKynf4=
X-Google-Smtp-Source: AGHT+IHgWZI8AyD36IA/j+qIgY8kij60I7dsU7WVURaWdH6KDArdEvwF/vu64DZAMjqwazkjqO/cRYqasTD2XUY1eJc=
X-Received: by 2002:aa7:c305:0:b0:557:c568:1d03 with SMTP id
 l5-20020aa7c305000000b00557c5681d03mr186663edq.1.1705541806339; Wed, 17 Jan
 2024 17:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-2-nunes.erico@gmail.com>
In-Reply-To: <20240117031212.1104034-2-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 18 Jan 2024 09:36:34 +0800
Message-ID: <CAKGbVbsydzXyKuhN8VyW9zYwuOMWzvz192WKKReHVX1XCnuXGQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] drm/lima: fix devfreq refcount imbalance for job
 timeouts
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, anarsoul@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So this is caused by same job trigger both done and timeout handling?
I think a better way to solve this is to make sure only one handler
(done or timeout) process the job instead of just making lima_pm_idle()
unique.

Regards,
Qiang

On Wed, Jan 17, 2024 at 11:12=E2=80=AFAM Erico Nunes <nunes.erico@gmail.com=
> wrote:
>
> In case a task manages to complete but it took just long enough to also
> trigger the timeout handler, the current code results in a refcount
> imbalance on lima_pm_idle.
>
> While this can be a rare occurrence, when it happens it may fill user
> logs with stack traces such as:
>
> [10136.669170] WARNING: CPU: 0 PID: 0 at drivers/gpu/drm/lima/lima_devfre=
q.c:205 lima_devfreq_record_idle+0xa0/0xb0
> ...
> [10136.669459] pc : lima_devfreq_record_idle+0xa0/0xb0
> ...
> [10136.669628] Call trace:
> [10136.669634]  lima_devfreq_record_idle+0xa0/0xb0
> [10136.669646]  lima_sched_pipe_task_done+0x5c/0xb0
> [10136.669656]  lima_gp_irq_handler+0xa8/0x120
> [10136.669666]  __handle_irq_event_percpu+0x48/0x160
> [10136.669679]  handle_irq_event+0x4c/0xc0
>
> The imbalance happens because lima_sched_pipe_task_done() already calls
> lima_pm_idle for this case if there was no error.
> Check the error flag in the timeout handler to ensure we can never run
> into this case.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_sched.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lim=
a_sched.c
> index c3bf8cda8498..66317296d831 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -427,7 +427,8 @@ static enum drm_gpu_sched_stat lima_sched_timedout_jo=
b(struct drm_sched_job *job
>         pipe->current_vm =3D NULL;
>         pipe->current_task =3D NULL;
>
> -       lima_pm_idle(ldev);
> +       if (pipe->error)
> +               lima_pm_idle(ldev);
>
>         drm_sched_resubmit_jobs(&pipe->base);
>         drm_sched_start(&pipe->base, true);
> --
> 2.43.0
>
