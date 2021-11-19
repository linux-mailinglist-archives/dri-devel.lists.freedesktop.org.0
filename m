Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E7545791B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 23:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810A86E448;
	Fri, 19 Nov 2021 22:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF19D6E448;
 Fri, 19 Nov 2021 22:50:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso8596036wme.3; 
 Fri, 19 Nov 2021 14:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ncGZ8xwc7OhnxGmL+ovKtcewVUckULPPfk9VsqmiXik=;
 b=RGsI07w67PD/LL56RAdYR5Ool99iRceODaj/DSvhFWl0iKYxxLeL97QWWlRI6TwA1Q
 FkdIGCtPc+2ilvmuJl0COjmYBuFXMK8i7X0AqmhiDsjJDfmPbpEufevy/G8XAcpqU/Iw
 mujJRnyNU2l1zi17orQyeh31V4KXIaTZqPhdMTOdhwEcbfWHy9PcJcLNK+8qgoUwBLZR
 b/bnC+5yQkW5khCjsdDX4Lc1vdGdBJ5SLFJwttBTRlw3dE3TyAov+iUFP+pYVUQq1Td8
 CD8uoHtEwlc/OfgetQljTejBuJpHTcOTIihO5JlONhEYhf18uavNWFJUAy/ZMDqeh3/M
 9/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ncGZ8xwc7OhnxGmL+ovKtcewVUckULPPfk9VsqmiXik=;
 b=Erpb+kSaNLX9jRMT9Cnb29B7W0ma5LC448RoHYlytX36VOlDv+3qvh+xUA6J84KH5t
 oWz5tahnGpl3oGkvdyBrjnrsCWOTFnD7FmlUeu4Moxbj4rwsuNMYTNjc924P7Sg9jsS5
 f9Bbd+sUcygoHA2YfOwNfCZsy03znC9z3EEQKqay/eqrdQ8B9o0xKXIMXMTylnHpC01v
 vb5/ukxKxIED169T5LLhpywn9MlzdBrJ0QrfcnFxsawc4I2xxwOGxITPXzDmeDXLWmbR
 C/LQZJzRoYiUKcMIEzBCYYOG7N3howAwRFDVuvLyhytRuB/VkdVmq5WgSeXhca8cc21u
 y0sw==
X-Gm-Message-State: AOAM533G01pO/Uqxxk/nRTTwpmOliZ6YpnyKeYND/2TrUjrKBzfrSzkd
 UPu71ckwmVo9p4myZ2jAzmzRjFtvKq0K45bCjqeEz+gnn20=
X-Google-Smtp-Source: ABdhPJz+xkFmybNRxJUJ0e4J55Cz/pZZLhfAEwMy6aDAom4HChI8NvpLK8bGQoWZzLwzlJABw8r74vHB218/msW/JRg=
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr4099763wmq.168.1637362244862; 
 Fri, 19 Nov 2021 14:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20211119225157.984706-1-robdclark@gmail.com>
In-Reply-To: <20211119225157.984706-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 19 Nov 2021 14:55:49 -0800
Message-ID: <CAF6AEGufo9pJRrT003gcMD3d1VP8SqCjN3uSFmgQKDPojfU4QQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/gpu: Fix idle_work time
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 2:46 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This was supposed to be a relative timer, not absolute.
>

Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 43468919df61..7285041c737e 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -228,5 +228,5 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>         struct msm_gpu_devfreq *df = &gpu->devfreq;
>
>         msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
> -                              HRTIMER_MODE_ABS);
> +                              HRTIMER_MODE_REL);
>  }
> --
> 2.33.1
>
