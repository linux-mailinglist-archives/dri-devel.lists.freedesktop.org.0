Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F59487FF0
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 01:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A93810F7FC;
	Sat,  8 Jan 2022 00:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C3910F7FC
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jan 2022 00:27:09 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 j97-20020a9d17ea000000b0059069215e85so8328600otj.13
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 16:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=8g9Y4RuZWFxiMsPIDvaQ+fBgT+fTQjHR9ZTccgF3/K4=;
 b=OYRhnU3o+R1nSiicP0JnwrEAAytRujnsK5+KCA2Nzs5bmK0AIzWHPKMnresN9gTbkk
 W/ep+yUJjES90oRk63c1ajbxa4IamvlQFIn39zMpruqGre2frlO6kseWNwrpkWlIh4d0
 tFyFnXGczc1jB8ZgqO5q8cWkhpgalR1JM3diY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=8g9Y4RuZWFxiMsPIDvaQ+fBgT+fTQjHR9ZTccgF3/K4=;
 b=0eFr4SpSJaMVBbmgdufahNZhpqw00aQE05oghkCWXO969q9dhF4zee6ONF4QtYAfe/
 VgGNAJ3NcZcn7i2RKDLwj4vF/a0EdPU6Mz+mKEwgS8gWUq+SzV6hugx/8RahAX6/YZ4h
 ylidNlF3Jkq6s0FHYqecZ98T4ZlDwTtWdC6ENEi8D182atD6EJiY3J0N0R0YFUOGWjkT
 AKufgo6Crej4s2rTu6y7xm36nGtiNW1W9sDhYdymeO87/la+J0t6sj0Hv0bwtbU7MwrL
 3TgvcVcTQcoNi1j1kDMzdGcDF4wTcSgi2qyfvAOlO/ZIl+0upio5PNKShYkYuxc/VBS9
 khcg==
X-Gm-Message-State: AOAM530lkj/UQilGlDMI7Fx+qLfnTMpRRW+VlrZgxHRX92EacqRJS5pV
 138OGmkO8zqj4TRXXSBb82+yIgMo735kLiPs4kIQmQ==
X-Google-Smtp-Source: ABdhPJzm5bl+1dlG7IjEcfo4sutjPa4jJpUog3GV9//EpeVjS9XpHdZ2agKLM8sM3JMIGirZ+LdbhWUZaj563d9ilNM=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr46117313ota.126.1641601628423; 
 Fri, 07 Jan 2022 16:27:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Jan 2022 16:27:08 -0800
MIME-Version: 1.0
In-Reply-To: <20220106181449.696988-2-robdclark@gmail.com>
References: <20220106181449.696988-1-robdclark@gmail.com>
 <20220106181449.696988-2-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 7 Jan 2022 16:27:07 -0800
Message-ID: <CAE-0n53N0GQ2UXYNpDOf_WVvvUa3cu95ePGYfYk7jZwPTqJ-XA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/gpu: Wait for idle before suspending
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Rob Clark (2022-01-06 10:14:46)
> From: Rob Clark <robdclark@chromium.org>
>
> System suspend uses pm_runtime_force_suspend(), which cheekily bypasses
> the runpm reference counts.  This doesn't actually work so well when the
> GPU is active.  So add a reasonable delay waiting for the GPU to become
> idle.

Maybe also say:

Failure to wait during system wide suspend leads to GPU hangs seen on
resume.

>
> Alternatively we could just return -EBUSY in this case, but that has the
> disadvantage of causing system suspend to fail.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 9 +++++++++
>  drivers/gpu/drm/msm/msm_gpu.c              | 3 +++
>  drivers/gpu/drm/msm/msm_gpu.h              | 3 +++
>  3 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 93005839b5da..b677ca3fd75e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -611,6 +611,15 @@ static int adreno_resume(struct device *dev)
>  static int adreno_suspend(struct device *dev)
>  {
>         struct msm_gpu *gpu = dev_to_gpu(dev);
> +       int ret = 0;

Please don't assign and then immediately overwrite.

> +
> +       ret = wait_event_timeout(gpu->retire_event,
> +                                !msm_gpu_active(gpu),
> +                                msecs_to_jiffies(1000));
> +       if (ret == 0) {

The usual pattern is

	long timeleft;

	timeleft = wait_event_timeout(...)
	if (!timeleft) {
		/* no time left; timed out */

Can it be the same pattern here? It helps because people sometimes
forget that wait_event_timeout() returns the time that is left and not
an error code when it times out.

> +               dev_err(dev, "Timeout waiting for GPU to suspend\n");
> +               return -EBUSY;
> +       }
>
>         return gpu->funcs->pm_suspend(gpu);
>  }
