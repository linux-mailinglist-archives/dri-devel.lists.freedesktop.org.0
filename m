Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66138AFE10A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 09:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB0110E03F;
	Wed,  9 Jul 2025 07:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GNq09YVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C72D10E021;
 Wed,  9 Jul 2025 07:14:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 47B3B46A86;
 Wed,  9 Jul 2025 07:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2A3C4CEF1;
 Wed,  9 Jul 2025 07:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752045241;
 bh=J76AGjtuh6R11kYnmJzRbYHT82Z1gW9iVpQmqPtKFU4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GNq09YVpegXImtOptIYqxmiwRteYgu+5qb20dqSGXr/OORBJ7ltSNYZOajixZUwzi
 1+mzekTTXtX2LvupMppHf1iIedVM6sThfy9mB2gI+F0bQ1Zh9V+usT9xc6++SwLP8E
 PmjljLqBts1BoZnuMoXwYC0piHuhHrOGk+WxFHwA0B6P6reHWVyKgbValtBmV2pj4q
 /dRlvKYNduQzR5VucdMuppSXj5RI5StrMX1xg4riPJLkrcQxIl2ZH52JgpJT0H5aUB
 tNd4J7J3QsUnjsW30R1ds8FwLai61p8SrC3OXVTx7S+1Pw1ZSR0fQHeZXSTRDi104u
 wuzw263lP1PbA==
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-611b246727cso2515846eaf.0; 
 Wed, 09 Jul 2025 00:14:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUFTKZ6PNJ+qavrOFthn+O6UQjwAV2mOqOWYdg5b79AGO+g7WdQISwpuklf4owMBQ+AV/dE4ex7@lists.freedesktop.org,
 AJvYcCWYA97/LXzYbU7EwKpW8zV/C6vWwa8bi29BtCLOhRAxsmpSZyguyHueRs1uf/Ia6QmpY+I846SyNOJW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxymg8Rlt+4945kH6HjwJnTY1MQdLTE3Iqp0PjHRfnpJv0xBFYx
 Gpi/Y/5rDxMC+cXQWALtsFJqsRqR3MHHNbzoI2bzhEu7EwbinGx/W41L2zNogoIR1QvCZH2c7Z9
 cy51Wn65+cgSq0JECDft9Ax+DhEBmGXA=
X-Google-Smtp-Source: AGHT+IEskKLtdnCJNubzh7Cv2QywfY12LAjcDNXgB1nerfn1NA3+BNnJyGqJuYGQA0goXWDl19YnXJjYrQ6XWocHf6c=
X-Received: by 2002:a05:6820:3085:b0:611:75a8:f6ca with SMTP id
 006d021491bc7-613ccf31355mr832520eaf.6.1752045240045; Wed, 09 Jul 2025
 00:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250709064404.839975-1-guoqing.zhang@amd.com>
 <20250709064404.839975-6-guoqing.zhang@amd.com>
In-Reply-To: <20250709064404.839975-6-guoqing.zhang@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Jul 2025 09:13:48 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ibK49=fbXH2oy6jVSEo6iFD9EvYR8ivHCUpP3iaU=8=A@mail.gmail.com>
X-Gm-Features: Ac12FXyIZd8T-A7UNwtDMfu3w-N8qETo7FMixPqescOOM5nC0bPObGEfy2_bAJI
Message-ID: <CAJZ5v0ibK49=fbXH2oy6jVSEo6iFD9EvYR8ivHCUpP3iaU=8=A@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: Samuel Zhang <guoqing.zhang@amd.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, rafael@kernel.org, 
 len.brown@intel.com, pavel@kernel.org, gregkh@linuxfoundation.org, 
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com, 
 matthew.auld@intel.com, matthew.brost@intel.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 mario.limonciello@amd.com, lijo.lazar@amd.com, victor.zhao@amd.com, 
 haijun.chang@amd.com, Qing.Ma@amd.com, Owen.Zhang2@amd.com, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Wed, Jul 9, 2025 at 8:44=E2=80=AFAM Samuel Zhang <guoqing.zhang@amd.com>=
 wrote:
>
> For normal hibernation, GPU do not need to be resumed in thaw since it is
> not involved in writing the hibernation image. Skip resume in this case
> can reduce the hibernation time.
>
> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
> this can save 50 minutes.
>
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 4f8632737574..c37285a8b2c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>         if (amdgpu_ras_intr_triggered())
>                 return;
>
> +       /* device maybe not resumed here, return immediately in this case=
 */
> +       if (adev->in_s4 && adev->in_suspend)
> +               return;
> +

You need to do analogous things in amdgpu_pmops_prepare() and
amdgpu_pmops_poweroff() AFAICS in case hibernation is carried out in
the "platform" mode.

>         /* if we are running in a VM, make sure the device
>          * torn down properly on reboot/shutdown.
>          * unfortunately we can't detect certain
> @@ -2654,8 +2658,17 @@ static int amdgpu_pmops_freeze(struct device *dev)
>  static int amdgpu_pmops_thaw(struct device *dev)
>  {
>         struct drm_device *drm_dev =3D dev_get_drvdata(dev);
> +       int event =3D pm_transition_event();
>
> -       return amdgpu_device_resume(drm_dev, true);
> +       switch (event) {
> +       case PM_EVENT_THAW: /* normal case */
> +               return 0;
> +       case PM_EVENT_RECOVER: /* error case */
> +               return amdgpu_device_resume(drm_dev, true);
> +       default:
> +               dev_err(dev, "unknown pm_transition_event %d\n", event);
> +               return -EOPNOTSUPP;
> +       }
>  }
>
>  static int amdgpu_pmops_poweroff(struct device *dev)
> --
