Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6EE34855A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 00:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC7F6EACB;
	Wed, 24 Mar 2021 23:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B7A6EAC8;
 Wed, 24 Mar 2021 23:33:50 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id o66so349582ybg.10;
 Wed, 24 Mar 2021 16:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mS6K4y5Gdwm273OjX7Mj3NnKkqV9h0GOYxPLfw0a8kE=;
 b=TbBBCMKGGrU1SLAS0jXw2dUt2IsKi4yR/C/6kDgvmt3Zrd/Iy3pI9RU8qXxdO9gUne
 9KFbKOHNGpE4ITCowW1oyy+m+lpITlKOlZdjbnWqBwieqWuExsFJuvsueD1b7ESR05MJ
 9Y1u1rPJVUfGFvdLZirXVQTxpO9TSbMapoFxyysFh9SOW11pe1X+NTUC6Yazhwqi52j1
 s7K7qZeIF3uiE4De/8ZydW5pOinjvRKlmJCgU6grEWlPW7X82bOjp8oRmUp/ApdRu1Jj
 7dOeYZzNgoM2pnsIsYaDF0hTqeNrGMRXnvA4fvygFZxOV0K3KX+0x2ze1TKeySBky6M/
 3T5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mS6K4y5Gdwm273OjX7Mj3NnKkqV9h0GOYxPLfw0a8kE=;
 b=jSN339P2FTBj2z9FckqwUN9q3rTuRwr9dqMoINqUVRyrjI3T8wACW6+5zSiPhMevms
 XNI3+/vuipZf8OHMxb19/yNvC89bO34SPlLAeqQ45E405WBzfxS3nRp4LbwrDeHcqVdA
 SAO5V+C6mbnu5OOLeccSxK9V3A7bqmDlS7ri1dpzoLPi98rKvyjgLQRifl4/B1SQGy3S
 JNM5i81NAqRmHRpnb+8mPr5+JaHJ448xf3wVMbsnVDS3ld5kg1vqJ1Q5pPjXgmyj35YZ
 BIZ+49p/XGEQOxeO/xd9wzUMqylQayf2pp2cM8NIZEfLEwts0kUNi19qYhIYIxb/Po47
 Kd1A==
X-Gm-Message-State: AOAM531YcQlK9p04AgfpY8RMpQc8kdAZGa15z/5ydGMVvvaK3pA8D842
 cdukKkdWL5vqbrFMYxvys2xuiPQ/Jki+1jESmlM=
X-Google-Smtp-Source: ABdhPJyPreiShhfrSTu/mc2aeIAHsRz/4bu0nXdtJz4x0g8v6RWB8S6GmasK38ftTfLNqR/9w0YsOjOWd4ey1SbNiqo=
X-Received: by 2002:a25:6003:: with SMTP id u3mr8647385ybb.96.1616628829328;
 Wed, 24 Mar 2021 16:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210307174853.28273-1-imirkin@alum.mit.edu>
In-Reply-To: <20210307174853.28273-1-imirkin@alum.mit.edu>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 25 Mar 2021 09:33:38 +1000
Message-ID: <CACAvsv5MEeCwc2Cvx8uwMLRu9o-EvNP9ERc44BGB9cPOB5caLQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv04: use vzalloc for
 nv04_display
To: Ilia Mirkin <imirkin@alum.mit.edu>
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, "Nathan E . Egge" <unlord@xiph.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 Mar 2021 at 03:49, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> The struct is giant, and triggers an order-7 allocation (512K). There is
> no reason for this to be kmalloc-type memory, so switch to vmalloc. This
> should help loading nouveau on low-memory and/or long-running systems.
>
> Reported-by: Nathan E. Egge <unlord@xiph.org>
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: stable@vger.kernel.org
Thanks!

> ---
>  drivers/gpu/drm/nouveau/dispnv04/disp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> index 7739f46470d3..99fee4d8cd31 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> @@ -205,7 +205,7 @@ nv04_display_destroy(struct drm_device *dev)
>         nvif_notify_dtor(&disp->flip);
>
>         nouveau_display(dev)->priv = NULL;
> -       kfree(disp);
> +       vfree(disp);
>
>         nvif_object_unmap(&drm->client.device.object);
>  }
> @@ -223,7 +223,7 @@ nv04_display_create(struct drm_device *dev)
>         struct nv04_display *disp;
>         int i, ret;
>
> -       disp = kzalloc(sizeof(*disp), GFP_KERNEL);
> +       disp = vzalloc(sizeof(*disp));
>         if (!disp)
>                 return -ENOMEM;
>
> --
> 2.26.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
