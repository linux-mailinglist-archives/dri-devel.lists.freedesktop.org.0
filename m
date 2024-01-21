Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0389E83557A
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 12:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9B410E1F8;
	Sun, 21 Jan 2024 11:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C96A10E1F5;
 Sun, 21 Jan 2024 11:21:29 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-559edcee47eso1894155a12.0; 
 Sun, 21 Jan 2024 03:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705836027; x=1706440827; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/9m8SPIHaGEo52lnFVreqQCDGwIx3Neobr40t4uq1CM=;
 b=QxZYCmO/PJaBvwIJLL3QErZmi0ZBqIH0IPVE4imoTG7GZnP7OvQsVBr2hSZPPRF6N9
 eAIud4qqfUqxoo8n9WsjK0kZ0jFNJ/SR1c8rq5X88iOYKgg1tOnapDiWAzLped4iYnm3
 KHpVIO90+oPjoWEDlZdFlDAblhYDGKLFgs+K0yEzJ/p3kh33DMLA4SN7qtFmt1Wo7MR7
 p0+r4jr0hejrcMEjFwpkD0cxQqHhLb7T3KigY7Z39AbWEQ3Kj8JPk5p87ZGVQA+zKphn
 I8Nc0kAPqlp4D4ABGkXsyAfxKPzohj73H/e/Y+08EqTeDgTv+6AzU9WFasMHBjBxp25b
 p8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705836027; x=1706440827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/9m8SPIHaGEo52lnFVreqQCDGwIx3Neobr40t4uq1CM=;
 b=pNnFqQh5ePwQitopg+shZIhQi1EOn2NUyOq91F+ARUFszOAt8SOeNFxF/yKtmOWO12
 UYQ4w2pEaCq7gGRV7Nu6GQvBpEH0lFhzKhnoWPkMfQxZx9/eHCnDILYhbMYI2QBuXSF1
 zUWr/8OLL9u9InXWd1V0n8IJgmAhIMz6p3yovF0um51hCsBA0JlTsEw3QHBYrw6TkYD5
 q19g11bI5OUlMpX2OVNtlXy6WfNHGgAWdnPT7R7+R3aZWmTJfxtcFd7CyFWrKZLD9M3j
 r4d+oFqCL6bpz5YLuzw/1QmQyWK22cuq5bz4V+IuxW3GIiLRp8yja3sGbDPAtI1xmjDG
 nNDg==
X-Gm-Message-State: AOJu0YxKUJeIyhq0COBSzdeZELSzo9cg2r72l2+muuTn6U9jzrIRTPk+
 h8rbVJ6h3U/WUE5WrJy4ixMFWn5jvI7g84yDRJzKsWM8DRFLc8vXP+kD3fsoiP6DrRVhUgSOhkU
 d4sH8JzL9dd4voFJqKqvkoyOLycc=
X-Google-Smtp-Source: AGHT+IEjBKv24wNHFLHNJEzyCx8YAMkyNuZ0jO0Q2lDUZ/PAPR8NKuAMZSCk4sid+hCoOO7cmEBAFSgmiGj2nHvnUuM=
X-Received: by 2002:a50:fa88:0:b0:55b:fece:de8e with SMTP id
 w8-20020a50fa88000000b0055bfecede8emr746252edr.13.1705836027398; Sun, 21 Jan
 2024 03:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
 <20240117031212.1104034-5-nunes.erico@gmail.com>
 <20240121095604.2368-1-hdanton@sina.com>
In-Reply-To: <20240121095604.2368-1-hdanton@sina.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 21 Jan 2024 19:20:14 +0800
Message-ID: <CAKGbVbtww65w+sr7OiccawRkGt-p3MRWaWNU=nkQTaqdyMxqVA@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] drm/lima: handle spurious timeouts due to high irq
 latency
To: Hillf Danton <hdanton@sina.com>
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
Cc: lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 21, 2024 at 5:56=E2=80=AFPM Hillf Danton <hdanton@sina.com> wro=
te:
>
> On Wed, 17 Jan 2024 04:12:10 +0100 Erico Nunes <nunes.erico@gmail.com>
> >
> > @@ -401,9 +399,33 @@ static enum drm_gpu_sched_stat lima_sched_timedout=
_job(struct drm_sched_job *job
> >       struct lima_sched_pipe *pipe =3D to_lima_pipe(job->sched);
> >       struct lima_sched_task *task =3D to_lima_task(job);
> >       struct lima_device *ldev =3D pipe->ldev;
> > +     struct lima_ip *ip =3D pipe->processor[0];
> > +
> > +     /*
> > +      * If the GPU managed to complete this jobs fence, the timeout is
> > +      * spurious. Bail out.
> > +      */
> > +     if (dma_fence_is_signaled(task->done_fence)) {
> > +             DRM_WARN("%s spurious timeout\n", lima_ip_name(ip));
> > +             return DRM_GPU_SCHED_STAT_NOMINAL;
> > +     }
>
> Given 500ms in lima_sched_pipe_init(), no timeout is spurious by define,
> and stop selling bandaid like this because you have options like locating
> the reasons behind timeout.

This chang do look like to aim for 2FPS apps. Maybe 500ms is too short
for week mali4x0 gpus (2FPS apps appear more likely). AMD/NV GPU uses
10s timeout. So increasing the timeout seems to be an equivalent and better
way?

> > +
> > +     /*
> > +      * Lima IRQ handler may take a long time to process an interrupt
> > +      * if there is another IRQ handler hogging the processing.
> > +      * In order to catch such cases and not report spurious Lima job
> > +      * timeouts, synchronize the IRQ handler and re-check the fence
> > +      * status.
> > +      */
> > +     synchronize_irq(ip->irq);
> > +
> > +     if (dma_fence_is_signaled(task->done_fence)) {
> > +             DRM_WARN("%s unexpectedly high interrupt latency\n", lima=
_ip_name(ip));
> > +             return DRM_GPU_SCHED_STAT_NOMINAL;
> > +     }
> >
> >       if (!pipe->error)
> > -             DRM_ERROR("lima job timeout\n");
> > +             DRM_ERROR("%s lima job timeout\n", lima_ip_name(ip));
> >
> >       drm_sched_stop(&pipe->base, &task->base);
> >
