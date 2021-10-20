Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C13E435190
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 19:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409F36E0E1;
	Wed, 20 Oct 2021 17:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7A76E0E1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 17:43:52 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id o4so10510507oia.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U8bz1tscYKeDUnwVx/VXmCTVDMCZzdbJiMPXw7IpHPw=;
 b=iVV5960q+dIiP0MSvnqpEp5zJUCt2yuvX/k97kvrHIIWLhkZq04WpEiMaXRjz+5HHF
 xwSp7Y335dqShi9voROdyzf4+miPnEveTbQGZKBMiyyHrTmcjw3iShGkTEAHKcpFd/IN
 XtqPzfA9l/o/DBuo8+Iq4Q/XBtP36rIJcgc3IAf0I3tFBDjosVw4cMRxHZ+MXM02okOE
 INXyerE9aWhzIBC97UdXV8MS1acto+Tg7k0+Z+1KoVkZ+1tbs4aHOZbv1sP/LsZL11I1
 ZO9OLX1EO3imMQ/T3PdrHbKlOn/VkRU22ZSGULbTq1+pFS2p3jKtPhgq4otPrSqiptw0
 JX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U8bz1tscYKeDUnwVx/VXmCTVDMCZzdbJiMPXw7IpHPw=;
 b=21GqNHYX6UHiCnCzxaBuFub0l1R4CifncnIk00pC11By1sGPjtpTO+P6hpUmvu+XXy
 3HRzTDH8G883hLccdaP9eaqI29cqV39eDFOtfqrYIdkpDz4xf16bKSTJxbuFJS/V3o3R
 ibQKGB0szfcq5e9qIH1kUkbrpC5HzI817YIS7lTTxtMmzROGUtUGosJUdyEyZibUHlZv
 innyISmIxZ3jJAfD1hvJhR8lbcKvZdNlFc2FDFFai0aNgkbKcFex+1xDrPyzx27krhfY
 onkFbnJJMIe5oH05DDszmCF/137cBiCLQL1X6+vD37yyU7oLzPq7Nd5cUuNJ7SU5s+N3
 CwmA==
X-Gm-Message-State: AOAM533IVQImz4E1q6ElezsqxMNW9tggv3kOTNt8eHEuv/bpkWbXEONP
 3VdWl2g473KY++zPLC64LAEiCRSZHX+3chdfUT0ZRFNukqcw+A==
X-Google-Smtp-Source: ABdhPJxARXvfoIN0ZDiaas+Sm+RI4VXm87DwMF921F0sXbgbt+cIsVCJmgXJ4WofytyZuc4Y4MJFucsoF09SiLhwC6k=
X-Received: by 2002:a05:6808:1527:: with SMTP id
 u39mr270822oiw.123.1634751832126; 
 Wed, 20 Oct 2021 10:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211020173211.2247-1-christian.koenig@amd.com>
In-Reply-To: <20211020173211.2247-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Oct 2021 13:43:41 -0400
Message-ID: <CADnq5_M7Yb3Yq-NeOTtwyN=XKQKHLoJ3FSFPi+qyigqxfrzsMA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix memleak in ttm_transfered_destroy
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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

On Wed, Oct 20, 2021 at 1:32 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> We need to cleanup the fences for ghost objects as well.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> CC: <stable@vger.kernel.org>

Does this fix this bug?
https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

Alex

> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 82af095f6b81..f37a8c53b35f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -190,6 +190,7 @@ static void ttm_transfered_destroy(struct ttm_buffer_=
object *bo)
>         struct ttm_transfer_obj *fbo;
>
>         fbo =3D container_of(bo, struct ttm_transfer_obj, base);
> +       dma_resv_fini(&fbo->base.base._resv);
>         ttm_bo_put(fbo->bo);
>         kfree(fbo);
>  }
> --
> 2.25.1
>
