Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073917F37DD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 22:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8565910E503;
	Tue, 21 Nov 2023 21:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30FD10E503;
 Tue, 21 Nov 2023 21:11:44 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-548696eac92so5318803a12.3; 
 Tue, 21 Nov 2023 13:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700601103; x=1701205903; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zmb6qFm+dY2gZyH7ctBiEUL7ECWe/tVnyiTW4a35Jy0=;
 b=DeMYO++Hzczmcz3dqIQg8PT1xLiUep0T71YruwZo1Apqa6YhyWSCK6NxHw3uYXa6+F
 7o7HUbMyBetK4dZwrZBl0/vMWMly1gNbvHFEqMCYTPSAOfcV2PeK7sP685Z1fJnCsYi6
 91ZNJMoBTWxypR60WMKA7kcN488yxONWL8rzJQ+X60LvCFpi6zTLjbz9LgTTRGCuLhEj
 ErB2teWlL2rZVyoVotoO734JN0aHOY/KEXRvQQV8/eUhPYE3DSX2YjlxrhBa7gIbJ3Y3
 8SJoT0agKe/g6c6A1ZRhMjjkFKfV+LliGl09uwio7hF+MOr4Pts/GRjhCnZjK34XIPjm
 SxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700601103; x=1701205903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zmb6qFm+dY2gZyH7ctBiEUL7ECWe/tVnyiTW4a35Jy0=;
 b=bXwvz8V5HwwAmYZcNABzLea+G5EimjJ1kVjWDWwL8Z3CbIgf9dJt4RYN58ifJIpDbV
 8LIZV/m+VZf4x24huQUqadBmiJ62HKOFTibNTQ+k6cC04m7a2ze0WVK1iAlwgkXO2f2O
 BM+dEOQ42Ec1K0k24p9ZfdQa4thCkX0JhEeXog6lZ7lXTcib7TzVSQssPLMOvs370iuU
 0ru0meEVlidT8My80va8/bwNSszpMpVd40vpTMcEMU0MEOxNOt+IHFqIJym41W3uD0U5
 Y+MgGTd+n+FVxfiB0f38mYxwAPwkx5NokBQ4qAXNU6KWWg/D9IeneV12BB7Iv8hmt+C8
 ahJw==
X-Gm-Message-State: AOJu0YzGf9w4INa5kMqh3yRRfc4PsxCqORz/f3tAUbTK/vYioXo0oLw4
 v9K0lc/dsnugF+nVK4b0INX7vrhOSvVcae6FVuYlZvDY
X-Google-Smtp-Source: AGHT+IFe47R2ugPqp9TQK6PbveE1yZcGSRt7LhAWrr0Q8E0tlk4s+Mvmwzhb1uTWIx2PQKD3QUV+keOHnvTBedUiUFE=
X-Received: by 2002:a17:907:1310:b0:a03:9b32:d8a2 with SMTP id
 vj16-20020a170907131000b00a039b32d8a2mr81312ejb.60.1700601102889; Tue, 21 Nov
 2023 13:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20231120020734.2505094-1-airlied@gmail.com>
In-Reply-To: <20231120020734.2505094-1-airlied@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 22 Nov 2023 07:11:31 +1000
Message-ID: <CAPM=9tytOq+A2_HwT5VwjWrADa4W7FPh=ivQ8cXWnx=caFiWDw@mail.gmail.com>
Subject: Re: [PATCH] nouveau/gsp: fix getting max channel id for GSP
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Self NAK, this isn't sufficient to fix events.

On Mon, 20 Nov 2023 at 12:07, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> The fence code uses the total number of channel ids to allocate a
> bunch of memory for fencing. This is probably not the best way to
> do this, but it's hard to fix right now.
>
> The GSP code realises it can fit 8 channels into a USERD
> page, so it claims it can support 256 channels max, but it then
> allocates channel ids sparsely (0, 8, 16 etc).
>
> This just exposes the multiplier to userspace so the fence code
> gets things right, however I think this might all need more thought.
>
> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/274
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c | 7 ++++++-
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h | 2 ++
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c | 7 +++++++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
> index 22443fe4a39f..8e36cdd0e5fb 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
> @@ -178,7 +178,12 @@ nvkm_fifo_info(struct nvkm_engine *engine, u64 mthd, u64 *data)
>                 return ret;
>
>         switch (mthd) {
> -       case NV_DEVICE_HOST_CHANNELS: *data = fifo->chid ? fifo->chid->nr : 0; return 0;
> +       case NV_DEVICE_HOST_CHANNELS:
> +               if (fifo->func->chid_total)
> +                       *data = fifo->func->chid_total(fifo);
> +               else
> +                       *data = fifo->chid ? fifo->chid->nr : 0;
> +               return 0;
>         case NV_DEVICE_HOST_RUNLISTS:
>                 *data = 0;
>                 nvkm_runl_foreach(runl, fifo)
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
> index a0f3277605a5..c21e982b03a5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
> @@ -17,6 +17,8 @@ struct nvkm_fifo_func {
>
>         int (*chid_nr)(struct nvkm_fifo *);
>         int (*chid_ctor)(struct nvkm_fifo *, int nr);
> +
> +       int (*chid_total)(struct nvkm_fifo *);
>         int (*runq_nr)(struct nvkm_fifo *);
>         int (*runl_ctor)(struct nvkm_fifo *);
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> index b374d72fd1c1..1e9c0b113cb5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> @@ -641,6 +641,12 @@ r535_fifo_dtor(struct nvkm_fifo *fifo)
>         kfree(fifo->func);
>  }
>
> +static int
> +r535_fifo_chid_total(struct nvkm_fifo *fifo)
> +{
> +       return fifo->chid->nr * CHID_PER_USERD;
> +}
> +
>  int
>  r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
>               enum nvkm_subdev_type type, int inst, struct nvkm_fifo **pfifo)
> @@ -652,6 +658,7 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
>
>         rm->dtor = r535_fifo_dtor;
>         rm->runl_ctor = r535_fifo_runl_ctor;
> +       rm->chid_total = r535_fifo_chid_total;
>         rm->runl = &r535_runl;
>         rm->cgrp = hw->cgrp;
>         rm->cgrp.func = &r535_cgrp;
> --
> 2.42.0
>
