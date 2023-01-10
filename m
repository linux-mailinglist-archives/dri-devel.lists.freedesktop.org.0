Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A886644F8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 16:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9895710E5EB;
	Tue, 10 Jan 2023 15:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A2310E5EB;
 Tue, 10 Jan 2023 15:34:47 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-15bb8ec196aso734579fac.3; 
 Tue, 10 Jan 2023 07:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aALJ1+6b5A4lyvQQ5kPDXbutVahUhVTXhBlHzFelYpk=;
 b=i6n470Ce+W8oxpPwNBChX5RaFXJ3U23JN6QGshiLXPAPCLB3Vl7bRDfWfXEGqT8Vhn
 oG4B5kAhBbdnfMjH8a5QJB9H/4UUQ2f9dZuV8msyDrodGKrifhB64Df0ZuFKKrPIiEq1
 OCE+K0XbyQyPzg2bAsjB6v4j567tKH6yOWOogo8W975GwHjBuBSXSam22iLhScIjOqlC
 Dv8iP4kFVnJ6x3wdBPZesdbf7Atc2MGJuSMNBM9y+gUTwAYvxF/q3SfzKO2qSWBmmR+D
 Q9weB6DalU7I8RZ5BbMAvFekdRBevNNzIa0BQDlAW3SOsnv+pA1Ylb4jTWAISmqwg/W2
 /Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aALJ1+6b5A4lyvQQ5kPDXbutVahUhVTXhBlHzFelYpk=;
 b=OlbAxW4IcYuT2CFPzJ/BqajtNo0BJKeA0MpBiResxummwifY9dxdVYFclXUWj0lshf
 iLqhpmyL/7u4Z5G7YzWGEk4G8uEHWviGpRGZQ6FwCOtbvQO6tGCnnan4dAIsX8ONxR23
 uy/kpd8tS7SKs5tF9tki8DQE4hrN8w33sPAe4Ptm03XvAS28P90Z6J2HGPQiBuEqCvEx
 npi0MhU0z0gkcSzrWafhvdBsvCirewNy6uUFsqj6tX6GyTS2ga7sWpZS0e7BKuR/Es9W
 dfaIDdFtEGD6FAXLlV9XT9gPjFMDgvQhhxUp/Evtq6YUFiTGpxz/QqnQFbzRoPKi1fie
 q6Ig==
X-Gm-Message-State: AFqh2ko4GvVn752tPghQOS9T2xR3jN5V/ChPe4xWMqpx/LXA8RftmSYy
 rnhAc21IGZgVBKcfcyxL4uTMicfydKJEU/p0cRY=
X-Google-Smtp-Source: AMrXdXvn1xRON1Kd8a0qV7Mrhm6vYwZcsKzzIkhhNKV5lkac3FN/6IpCOpNBj8E7gJ1EQBg4vrMMdWCHfSH7GIiy1oo=
X-Received: by 2002:a05:6870:cb98:b0:15b:96b8:e2be with SMTP id
 ov24-20020a056870cb9800b0015b96b8e2bemr326656oab.38.1673364886323; Tue, 10
 Jan 2023 07:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20230109222547.1368644-1-joel@joelfernandes.org>
In-Reply-To: <20230109222547.1368644-1-joel@joelfernandes.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 10 Jan 2023 07:34:41 -0800
Message-ID: <CAF6AEGsH21bb6ihE41UR-jODL0C8fVVg9=ODj-Ksd7CnZaYzDw@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] adreno: Shutdown the GPU properly
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Ross Zwisler <zwisler@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 9, 2023 at 2:25 PM Joel Fernandes (Google)
<joel@joelfernandes.org> wrote:
>
> During kexec on ARM device, we notice that device_shutdown() only calls
> pm_runtime_force_suspend() while shutting down the GPU. This means the GPU
> kthread is still running and further, there maybe active submits.
>
> This causes all kinds of issues during a kexec reboot:
>
> Warning from shutdown path:
>
> [  292.509662] WARNING: CPU: 0 PID: 6304 at [...] adreno_runtime_suspend+0x3c/0x44
> [  292.509863] Hardware name: Google Lazor (rev3 - 8) with LTE (DT)
> [  292.509872] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  292.509881] pc : adreno_runtime_suspend+0x3c/0x44
> [  292.509891] lr : pm_generic_runtime_suspend+0x30/0x44
> [  292.509905] sp : ffffffc014473bf0
> [...]
> [  292.510043] Call trace:
> [  292.510051]  adreno_runtime_suspend+0x3c/0x44
> [  292.510061]  pm_generic_runtime_suspend+0x30/0x44
> [  292.510071]  pm_runtime_force_suspend+0x54/0xc8
> [  292.510081]  adreno_shutdown+0x1c/0x28
> [  292.510090]  platform_shutdown+0x2c/0x38
> [  292.510104]  device_shutdown+0x158/0x210
> [  292.510119]  kernel_restart_prepare+0x40/0x4c
>
> And here from GPU kthread, an SError OOPs:
>
> [  192.648789]  el1h_64_error+0x7c/0x80
> [  192.648812]  el1_interrupt+0x20/0x58
> [  192.648833]  el1h_64_irq_handler+0x18/0x24
> [  192.648854]  el1h_64_irq+0x7c/0x80
> [  192.648873]  local_daif_inherit+0x10/0x18
> [  192.648900]  el1h_64_sync_handler+0x48/0xb4
> [  192.648921]  el1h_64_sync+0x7c/0x80
> [  192.648941]  a6xx_gmu_set_oob+0xbc/0x1fc
> [  192.648968]  a6xx_hw_init+0x44/0xe38
> [  192.648991]  msm_gpu_hw_init+0x48/0x80
> [  192.649013]  msm_gpu_submit+0x5c/0x1a8
> [  192.649034]  msm_job_run+0xb0/0x11c
> [  192.649058]  drm_sched_main+0x170/0x434
> [  192.649086]  kthread+0x134/0x300
> [  192.649114]  ret_from_fork+0x10/0x20
>
> Fix by calling adreno_system_suspend() in the device_shutdown() path.
>
> [ Applied Rob Clark feedback on fixing adreno_unbind() similarly, also
>   tested as above. ]
>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Cc: Ross Zwisler <zwisler@kernel.org>
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 628806423f7d..36f062c7582f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -551,13 +551,14 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>         return 0;
>  }
>
> +static int adreno_system_suspend(struct device *dev);
>  static void adreno_unbind(struct device *dev, struct device *master,
>                 void *data)
>  {
>         struct msm_drm_private *priv = dev_get_drvdata(master);
>         struct msm_gpu *gpu = dev_to_gpu(dev);
>
> -       pm_runtime_force_suspend(dev);
> +       WARN_ON_ONCE(adreno_system_suspend(dev));
>         gpu->funcs->destroy(gpu);
>
>         priv->gpu_pdev = NULL;
> @@ -609,7 +610,7 @@ static int adreno_remove(struct platform_device *pdev)
>
>  static void adreno_shutdown(struct platform_device *pdev)
>  {
> -       pm_runtime_force_suspend(&pdev->dev);
> +       WARN_ON_ONCE(adreno_system_suspend(&pdev->dev));
>  }
>
>  static const struct of_device_id dt_match[] = {
> --
> 2.39.0.314.g84b9a713c41-goog
>
