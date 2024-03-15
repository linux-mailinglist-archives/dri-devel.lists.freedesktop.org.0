Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7478C87D6C9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 23:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118B9112652;
	Fri, 15 Mar 2024 22:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gfs98Wq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634ED112652
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 22:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710542773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRIxaUBnHKjzxk/w28aUKJW59ZRRorJbI8C2dVILdKc=;
 b=Gfs98Wq/VWMOUyvaAvzznL2UsWKpn2pWc7MfU8nyFgMMlLyJdMj1UXvO+QwyuS9Beskw6N
 PnxJjF4p0J6Tg+4UWqXFoaMjaXTEechF0eC3RB1HQogpu8/07FZm9VutHMfYLnbGPhtogM
 bFogl4CCKgLbUcnSVjvq4Zsrbg+iO5M=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-V0N2G0t1PxS-bGzbQA9tiw-1; Fri, 15 Mar 2024 18:46:11 -0400
X-MC-Unique: V0N2G0t1PxS-bGzbQA9tiw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-60a0a5bf550so48528237b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 15:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710542771; x=1711147571;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cRIxaUBnHKjzxk/w28aUKJW59ZRRorJbI8C2dVILdKc=;
 b=K4oP6JdwP0LMIofIowyg9Rd0fxzJPhATe5aS/JK3aTqdAQLYM7zgDrEi+tGfi5TnU7
 Ieuu6Tfl5XE9hkQKdthAtjJxIKuyg8qQ1GkQ/j5DuC543WMwCkn4UNLtVLFiDVXKEhy8
 +EvKMRPq7JGcw9ynUJB6tJtnABlMlCTd0DXHeQtI5U/uHyV+RSf2ZoH4n6WC5AkqLp/u
 EoaNfbcwyJp7MHgvw70G4bNl4Qw+rHQSpZukk8QLH35sun4tOc0lucED1xnADVyRT/ZZ
 47oCf9jlHBzJzaUVONx+3qf8gIXiYt8K1twRFSYckEFy9LK6S1K3DYKtiabna8uEh9cQ
 vZZA==
X-Gm-Message-State: AOJu0YyEvt74CmkRRUCkM38dXveB8oSpvuykrE+yisTwYbG0jWRTmeDo
 rJazIP5YbaSzRdMjQq5isbOlTCbXwHiUU2iMdo9IQvuA17Q500xwp2VwjSrCmuAZYRzW4dLMBJQ
 apfgbewSAYwCC9tA7WdsGO4uJU4lOT1D8Jfykl+itX59Ib94A5vImRoZ2hifQ91Fy+eVvayNtvl
 AxL43N9QWTV8L4K0+b7635Ehrj1wCkIkvz5LnBOrux
X-Received: by 2002:a0d:c806:0:b0:5ff:7cca:a434 with SMTP id
 k6-20020a0dc806000000b005ff7ccaa434mr6671704ywd.51.1710542771358; 
 Fri, 15 Mar 2024 15:46:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE546xo3HvJPY2qu672aEMFegdumCBfdse8Abcj5PGVflapFASYr5pywdAPdVOlwGoIO8LpM2ar7PP1CaBsKGQ=
X-Received: by 2002:a0d:c806:0:b0:5ff:7cca:a434 with SMTP id
 k6-20020a0dc806000000b005ff7ccaa434mr6671688ywd.51.1710542771075; Fri, 15 Mar
 2024 15:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240315212104.776936-1-lyude@redhat.com>
In-Reply-To: <20240315212104.776936-1-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Sat, 16 Mar 2024 08:45:59 +1000
Message-ID: <CAMwc25qaqyJa179rkBUgZKU5Otne1S07Z3ir0qK6a9mc=U3EZA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/dp: Fix incorrect return code in
 r535_dp_aux_xfer()
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, 
 open list <linux-kernel@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

Reviewed-by: Dave Airlie <airlied@redhat.com>

On Sat, Mar 16, 2024 at 7:21=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> I've recently been seeing some unexplained GSP errors on my RTX 6000 from
> failed aux transactions:
>
>   [  132.915867] nouveau 0000:1f:00.0: gsp: cli:0xc1d00002 obj:0x00730000
>   ctrl cmd:0x00731341 failed: 0x0000ffff
>
> While the cause of these is not yet clear, these messages made me notice
> that the aux transactions causing these transactions were succeeding - no=
t
> failing. As it turns out, this is because we're currently not returning t=
he
> correct variable when r535_dp_aux_xfer() hits an error - causing us to
> never propagate GSP errors for failed aux transactions to userspace.
>
> So, let's fix that.
>
> Fixes: 4ae3a20102b2 ("nouveau/gsp: don't free ctrl messages on errors")
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/disp/r535.c
> index 6a0a4d3b8902d..027867c2a8c5b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> @@ -1080,7 +1080,7 @@ r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u=
32 addr, u8 *data, u8 *psize)
>         ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ct=
rl));
>         if (ret) {
>                 nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
> -               return PTR_ERR(ctrl);
> +               return ret;
>         }
>
>         memcpy(data, ctrl->data, size);
> --
> 2.43.0
>

