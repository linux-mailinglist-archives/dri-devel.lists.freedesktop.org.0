Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C0F5B6DBE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 14:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226D610E6EF;
	Tue, 13 Sep 2022 12:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991DB10E6EF;
 Tue, 13 Sep 2022 12:54:14 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so22035252fac.13; 
 Tue, 13 Sep 2022 05:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5TnxhzR41y27enyoDQVCBsyG5YGCmMj80Vbs/LaBjPA=;
 b=iunP141jgptqOjugxEabUf2knnXqzZJpBN/a8q6fTpOZZnTE/e7GY8Cbl4Lbq9FbRx
 tEa+EMwvfc6L6RedT381kcEc82fehbYdZuAM2scDrA0qK4lSB+GsEZRxjVRkDC6lymTk
 rtLbg8kaFJUR6/UJb6c7CqU3uBWBT4zhrmylJP4Trmlc1EAcK3daixgapIqpRId6bO1Q
 4xX4cNOW41gXOMjiIXRuZLdmtyaFIVRhezj+dxDPi2m2ZrZfpaVTOJOFeRXgxPK7vIBn
 nIViGYEeLQM1HrSZD9UKkB+CfaKoawJmjsfIJ+Ix+AUloFE/VdJL3VcaxsuuGeWxsG30
 +wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5TnxhzR41y27enyoDQVCBsyG5YGCmMj80Vbs/LaBjPA=;
 b=8ObLYT3hD5fmay4wd5FfsF9dbUrI8SpDKlyo3fI7EsVa/s/R703roKznqO2l//sOfd
 3WqVMLqtn8mQOrGGrBuoLw7EMyHZscdjkIxIqXTCA3wCrvH9FneqPhSuF5YAS7aJOkNf
 AFy0O4xim3PbneyA890LbB0HoG2YMkL1uctd6mZOeRhQQUP2jr4z4f2it2tUli74Cyax
 PrOQV47X0sR4daa677JitIrdyAXB0VR5bR70hccVjNAiZfRYQ1g2Rrfn3ChaOyu9UFgf
 2wvjiO4x6DErbmygeeK/o8csMdEdyuSiQE7Bk4YeP76mKQW+5O2KR2xeKjEqiPQCC0BL
 4cZA==
X-Gm-Message-State: ACgBeo11iHXpVup9Ba8eO/C6wC8FWrsGesTp2t9PcPyNBYSvX+z5qhLM
 eEzZEtD8MVVfZKHaJ/r349XCM2dNZogHLX7GSVQ=
X-Google-Smtp-Source: AA6agR5QvSx5fPiwcvfDfW7ueJTgIPtjqIpSYpqsnt08vDJvKgxOwiQ+IHHzrSB8wLR9QEJBKQjchySvJMJNEgN3ljk=
X-Received: by 2002:a05:6870:738d:b0:125:1b5:420f with SMTP id
 z13-20020a056870738d00b0012501b5420fmr1695825oam.96.1663073653794; Tue, 13
 Sep 2022 05:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220912223433.630364-1-rafaelmendsr@gmail.com>
In-Reply-To: <20220912223433.630364-1-rafaelmendsr@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Sep 2022 08:54:02 -0400
Message-ID: <CADnq5_PoJ2GiigfBt87EoE3GYLOFiOvsmBRF74TK6MtRc+t5jw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix memory leak in
 hpd_rx_irq_create_workqueue()
To: Rafael Mendonca <rafaelmendsr@gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Sep 12, 2022 at 10:12 PM Rafael Mendonca <rafaelmendsr@gmail.com> wrote:
>
> If construction of the array of work queues to handle hpd_rx_irq offload
> work fails, we need to unwind. Destroy all the created workqueues and
> the allocated memory for the hpd_rx_irq_offload_work_queue struct array.
>
> Fixes: 8e794421bc98 ("drm/amd/display: Fork thread to offload work of hpd_rx_irq")
> Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5140d9c2bf3b..6a2e455c5466 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1295,13 +1295,21 @@ static struct hpd_rx_irq_offload_work_queue *hpd_rx_irq_create_workqueue(struct
>
>                 if (hpd_rx_offload_wq[i].wq == NULL) {
>                         DRM_ERROR("create amdgpu_dm_hpd_rx_offload_wq fail!");
> -                       return NULL;
> +                       goto out_err;
>                 }
>
>                 spin_lock_init(&hpd_rx_offload_wq[i].offload_lock);
>         }
>
>         return hpd_rx_offload_wq;
> +
> +out_err:
> +       for (i = 0; i < max_caps; i++) {
> +               if (hpd_rx_offload_wq[i].wq)
> +                       destroy_workqueue(hpd_rx_offload_wq[i].wq);
> +       }
> +       kfree(hpd_rx_offload_wq);
> +       return NULL;
>  }
>
>  struct amdgpu_stutter_quirk {
> --
> 2.34.1
>
