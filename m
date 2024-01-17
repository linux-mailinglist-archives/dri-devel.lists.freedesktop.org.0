Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04FC830C88
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 19:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D798C10E791;
	Wed, 17 Jan 2024 18:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B66010E78B;
 Wed, 17 Jan 2024 18:15:06 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33761776af9so2020517f8f.0; 
 Wed, 17 Jan 2024 10:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705515245; x=1706120045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ah6G4FuJVDtGXNTGJe0RwSbK/PDR7s+N3OBq9omTPlE=;
 b=FWMHevUIJehqb5u6cbetB7VltRsHfZoI96ItiIV6Ule5RsFs4mShix8ZhHOpUUvRI+
 VLUMEdLUUYbH/9yfBdCjUfWzQYddr01N/3NSfShq9tM6o/VbOj3YdcDBvgOl2EMUQ2ps
 jJH4JBV+bD7ifraBHQQK5TbyVSlb5DZuN7GGrj3wX6zRDlU526cQGj1UCAgre5r79k2q
 pvXiujgty4ni2MmOApm3uj0ykz0a1VVzzUFyUaxyVzcU5Q9uWDHpEZb1TKTRkIQZM49S
 5W9ak5K3qAghZJuyFqmM+JrMbALtr5SKqCm7Z4h6O9DHNAi2nsqi1chRcg0ejWB067NK
 MRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705515245; x=1706120045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ah6G4FuJVDtGXNTGJe0RwSbK/PDR7s+N3OBq9omTPlE=;
 b=NcYlzjJ3G+EFDjeItUAdH89kspCzgysOy/z089iw01fMvO4TWhHprknXnHnmP7sWFB
 Goz8vvxxh/onxa1d3SxaaOC5A1yruVCYXE72eYu+rLLEUALKwPZ3lyVYep8t8qDp15S4
 /j1iSEmzXNcnAPfhFHo4U6LJfMpPLBZkSpp4S7EoZyF2M5KvvuSMLRDMH2BLSAxLjOaD
 j3QDyzj0oto5qqgWQTky2zt3Qu0qXFV3DqlzDBR6XHVzRnK8xZYwFTfzuzItQW7RQiAs
 aFindrPyOfuj3aEORIuHH2RtbFkH2byL7P5tq4BRZGX6zscrxPTteJlcQM6XmhwRfz7Y
 u1PA==
X-Gm-Message-State: AOJu0YwBZMLUEEq7cfdtksiL2qWrWBNAepRG5GEQTFKOxAz2tEHpFN4C
 c4XeQkxsid+RYFP8/rTDU8v+hZqQb2bXxDL6mr0=
X-Google-Smtp-Source: AGHT+IHvJb7g3OZLRLqDFnVSe+upbeblv1HtgvAe/9r7raV1xd+t01Wswklkic/eecuwd2GSzJOnnPazUFbrwwEMIbw=
X-Received: by 2002:adf:e906:0:b0:337:bfa2:8d4b with SMTP id
 f6-20020adfe906000000b00337bfa28d4bmr2925346wrm.4.1705515244592; Wed, 17 Jan
 2024 10:14:04 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-2-nunes.erico@gmail.com>
In-Reply-To: <20240117031212.1104034-2-nunes.erico@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Wed, 17 Jan 2024 10:13:37 -0800
Message-ID: <CA+E=qVcDynxk7E9+TwR6Vu9bhCHU-3WnGVk_170EFbUWn+0Adw@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 7:12=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
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
Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

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
