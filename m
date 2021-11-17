Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23FE454F67
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 22:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E764789EB7;
	Wed, 17 Nov 2021 21:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA5F89EB7;
 Wed, 17 Nov 2021 21:35:10 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 z2-20020a9d71c2000000b0055c6a7d08b8so7158380otj.5; 
 Wed, 17 Nov 2021 13:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fAbybk/45RMrbU0Skfo3o+U0FCBPe9DYKYw9nVsCH6w=;
 b=fKweHg3TLHziPsmWsqbhdDOV1FGG6kEzinrCY+1v3d9tspMmDzxj3Re/rzdnH3c/gw
 x9pIpqt1WHJFueNn31tXiqptzSZUGpJDSpQJ9G3pp54rarSptb9pUw9X6MhSGnkSWdnQ
 rDL5Wm5rFqCVWA5U+Sn6RBfoOpz9/vaNQp7zv9MMOp7M5c8yknsqNwm6zZioW9yqGTos
 XszLFSkdrl4t2yAad8UQx9nJGq8umisWu5dXG7nmCq7xVyXYLmK2qUCAjxBLSa96lWFC
 hrUaVh8Nqq2di0f3SxcDismOoq1iShPhnzCdHl1KF9DgKLSSFXe5ovyAfpkiU86FIKBS
 EwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fAbybk/45RMrbU0Skfo3o+U0FCBPe9DYKYw9nVsCH6w=;
 b=m1iClYU842m5PZ1Cd4DSh4wzFHm41lfw5octmdrC7ih5VaZxoIFx3ATiXzEihj/S+p
 38B3qzPvwGLKNkRLdmYnvhmERSjB+/pN9H8oyGHQ/a2tG6SrobkX6uIM1U7nfLEcgC2k
 U1nQcY7M9Ow6V9PVLqRbaPS4ONDQacp8bTasbYWk2BxkgYt62F4e6oG2x/oV12mWl40H
 ALqWE9+/l4KzU3I6pdk+nV+zpnfm5CBol4+FuZryawpG7fhd8AZuD4+0JoQZPFNFqI8e
 uuWaAyw2zJv0rt7iWOeDponCO/n4UeFzeGCFxTjo6RInZBKGmRf1CplJoH/6hS3w6oS+
 DOxQ==
X-Gm-Message-State: AOAM5338d4f9X7VtJ4LGK9S5PRxqiQDGGr/Xv+oGppV1YMHwU2tfMvjd
 xbvPu40dmSLKQbue2321FZIzBz15g8pDOcHjlEI57g5U
X-Google-Smtp-Source: ABdhPJzLmY8A8e/jlVJOZ7Zqz1RE/BWM17Kiian6tAwIVuY3frrTFqQLE7tb8ywG727pwGLElJ+afw1NKr2g5kdMgss=
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr17029494otn.299.1637184909532; 
 Wed, 17 Nov 2021 13:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20211115025901.2598-1-bernard@vivo.com>
 <50ed4525-dbe6-1eac-5b83-4233a18a6176@amd.com>
In-Reply-To: <50ed4525-dbe6-1eac-5b83-4233a18a6176@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Nov 2021 16:34:58 -0500
Message-ID: <CADnq5_NhZD7LLiGPDUOGZ60niANZjw6OEVJie_Otkpf0S-_2PA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: fix potential memleak
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: Jonathan Kim <jonathan.kim@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, shaoyunl <shaoyun.liu@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Evan Quan <evan.quan@amd.com>, John Clements <john.clements@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Nov 15, 2021 at 10:56 AM Felix Kuehling <felix.kuehling@amd.com> wrote:
>
> Am 2021-11-14 um 9:58 p.m. schrieb Bernard Zhao:
> > In function amdgpu_get_xgmi_hive, when kobject_init_and_add failed
> > There is a potential memleak if not call kobject_put.
> >
> > Signed-off-by: Bernard Zhao <bernard@vivo.com>
>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> > index 0fad2bf854ae..567df2db23ac 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> > @@ -386,6 +386,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
> >                       "%s", "xgmi_hive_info");
> >       if (ret) {
> >               dev_err(adev->dev, "XGMI: failed initializing kobject for xgmi hive\n");
> > +             kobject_put(&hive->kobj);
> >               kfree(hive);
> >               hive = NULL;
> >               goto pro_end;
