Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CD0624AD8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 20:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C8610E7E5;
	Thu, 10 Nov 2022 19:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17F110E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 19:43:54 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id m204so2910624oib.6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 11:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0T3rqyfdf+9AOdVOFbD8NHAeeg65m9pGefL2k8Vkcbg=;
 b=YHgYonkuLRK/4jzeLlrhHsziNXot9xh6c1KZpvke7tFRaQoY+MwD0yJaw296G2pQF+
 Q6YnMMQKCaxjtFWF7f4kXOS80BlmYXQLD1ho2k7Y/Uz/7a/T8tRJNry1KVE+y2COgfe4
 wr7xUSfcS4rkYC6uHupr6UmzbGLJUaXSzC6F6LBGBLzEXlAaMtDG+JfhdqDBSKP7Jij1
 YGUqTylTLAvTuqp70ZI8t/pSk8g4Rx+ZroLDUjqfiRKvb2mKKuFwBU5aTBwvT2B9pOhY
 YOhnYc5tih+9zGjaD4EH1yhd12DjxgsfJP5HSt/r1KfwXZbN3aMTQm93e/lA7soiC21N
 54ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0T3rqyfdf+9AOdVOFbD8NHAeeg65m9pGefL2k8Vkcbg=;
 b=aNB/M7f6Ulb6jyGksgUpr580BO3OBl9BiIHmsPTYfWJd/HzeuhzLFjSYMyNzqHNIEI
 lOOZlGsL1/LL+SlcOlp1VVaTI0+uXEh4aVHbQgd+cUbabrNt7G3XXd3Fs/hHB3hqNK7a
 5y6c7qMuSH4GSkZ67wi2BIqBAIhY/t4mhDYbfCzlO0Bq2AxGam+xsAp87hahHaj7K8dU
 WbK2ihc8BVicIiArQe97Szf8L/IZviqwkhc/GmZdE3WYCvuuKoGZIrWFy5DIZFyFvhX1
 cSIkO/JGo20XYUFVrVnfCmS/iXE+zmPzB9ADjGWI5CMHg6FuwOsvcvoFCXQF6qBNAgiA
 uu9Q==
X-Gm-Message-State: ACrzQf0FnagmDy5ktHeZWWFvnNOZB/HKuxpVny75P+mE4EWxS6aXL+wB
 xhF45T6YAPKJYa+rIjnkr0IZnfRJmwwmLgta8c0=
X-Google-Smtp-Source: AMsMyM6TgLHVf7pm5Wr+0MqFt17RFIqMAv+E6dJAq6OJH/9XoId8Pksi7XApspsIj4lMwO7bGtJvrGJ86EIOonsUmfc=
X-Received: by 2002:a05:6808:7dc:b0:34f:97ea:14d with SMTP id
 f28-20020a05680807dc00b0034f97ea014dmr1993286oij.96.1668109433783; Thu, 10
 Nov 2022 11:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20221109095010.141189-1-christian.koenig@amd.com>
 <20221109095010.141189-3-christian.koenig@amd.com>
In-Reply-To: <20221109095010.141189-3-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Nov 2022 14:43:42 -0500
Message-ID: <CADnq5_OCFosfnTcYzXQm5ntnFdtjuekfF7mUR1EFpW2t-U8-NA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/amdgpu: stop resubmittting jobs in
 amdgpu_pci_resume
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Alexander.Deucher@amd.com, daniel.vetter@ffwll.ch,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Shaoyun.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 9, 2022 at 4:50 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> As far as I can see this is not really recoverable since a PCI reset
> clears VRAM.

Might be more clear to say the state of VRAM is unreliable due to a
PCI event like an AER event or a link reset or DPC event.  The reset
itself may not clear VRAM directly (e.g., mode2 reset or APUs).

Alex

>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 3a51c4c61833..8564d4a8e3e8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5747,8 +5747,6 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
>                 if (!ring || !ring->sched.thread)
>                         continue;
>
> -
> -               drm_sched_resubmit_jobs(&ring->sched);
>                 drm_sched_start(&ring->sched, true);
>         }
>
> --
> 2.34.1
>
