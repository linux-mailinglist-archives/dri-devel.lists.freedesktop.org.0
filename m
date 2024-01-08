Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 447F4827976
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 21:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED13D10E2DF;
	Mon,  8 Jan 2024 20:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B9810E2DF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 20:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704747106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UkyxvZQ5pYouZXCc0oPIjClMUAkVOY8Na3esy8fS2w=;
 b=M9tq+EHWRTtVbOLFvOUPQ+MvE91zmlO+/v7PgA7sjzI5C0VEarELnwfTkIk5jYMj8PnoD9
 nPlQ+BPKlLVqZl+7J0dBhCnmLhKW0QBBaat4E2avi2hDBGImM0OcnUy6Vqly78HLdC2vE1
 HGjbUcSIMULKBfmV8gXhIBdL00jCfwQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-eBK6vSCeO12nrgVAW4T8Vg-1; Mon, 08 Jan 2024 15:51:38 -0500
X-MC-Unique: eBK6vSCeO12nrgVAW4T8Vg-1
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-dbe053d5d91so2473407276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 12:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704747097; x=1705351897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UkyxvZQ5pYouZXCc0oPIjClMUAkVOY8Na3esy8fS2w=;
 b=Jk35p7jSCIbBJ8mioZXSa9QFRPiEdWG6L7mY5RIbyovIDKE4sn/MKepLNLUdvnYgku
 em1c3RYHD8rAbrqnIB+j+BMgjW3QOKIjQL4tC/KpP2CUtoeeohqsGkVCp4iSStP7WaEU
 dC6FJSX4vMjreUbbFM3PxUN00D429XIb+GZEE1Ql/rF143dkYVEc4hHzeFB3oGRec6zQ
 fQdahDXaodPKEfjx/vEXcl/0HwM09gYnpSlEXsBfSIDQ7ITnXE32mf2jDifUYgFzX9yT
 g8p/0Ji6KKXYSdPW73nYc48w7kzHHPqLSy54aKZjU3ht9bLk2NQ6gaclz3ILrR8QZ3ae
 u5AQ==
X-Gm-Message-State: AOJu0Yx/IisQXPAAT+yo47OUHfjwqOtz//LTIvBlX4lRvArCemN9hMwM
 hkB9kY1FL2vBK5cWHc6XOcw7ExYX523yrVyQJ7R0E0czdPs2a+xcyicVUVtwrsBU47jSIMkFmW9
 iI/HzhUX6XqUrb+zouss5ErbGjN24g1LAN0OM77FXiZVysZjakYv8
X-Received: by 2002:a25:7391:0:b0:db7:dacf:ed65 with SMTP id
 o139-20020a257391000000b00db7dacfed65mr1729933ybc.70.1704747097758; 
 Mon, 08 Jan 2024 12:51:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEE32OTXBZZ4AqcenfCZ/npf5vs1T3rzedd0Tz3UXzGyBKTZfzreJp+V6uBk9p0wYuShiMc+Z+KKDA0CtYQxSY=
X-Received: by 2002:a25:7391:0:b0:db7:dacf:ed65 with SMTP id
 o139-20020a257391000000b00db7dacfed65mr1729902ybc.70.1704747097086; Mon, 08
 Jan 2024 12:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20240108122823.2090312-1-sashal@kernel.org>
 <20240108122823.2090312-5-sashal@kernel.org>
In-Reply-To: <20240108122823.2090312-5-sashal@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Tue, 9 Jan 2024 06:51:25 +1000
Message-ID: <CAMwc25rAm1ndSiofWMMmQ1BeB0XxBvsHpcvaDKXUwEZp72iwEA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.1 5/5] nouveau: fix disp disabling with GSP
To: Sasha Levin <sashal@kernel.org>
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dakr@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NAK for backporting this to anything, it is just a fix for 6.7


On Mon, Jan 8, 2024 at 10:28=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> From: Dave Airlie <airlied@gmail.com>
>
> [ Upstream commit 7854ea0e408d7f2e8faaada1773f3ddf9cb538f5 ]
>
> This func ptr here is normally static allocation, but gsp r535
> uses a dynamic pointer, so we need to handle that better.
>
> This fixes a crash with GSP when you use config=3Ddisp=3D0 to avoid
> disp problems.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20231222043308.309008=
9-4-airlied@gmail.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/disp/base.c
> index 65c99d948b686..ae47eabd5d0bd 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
> @@ -359,7 +359,7 @@ nvkm_disp_oneinit(struct nvkm_engine *engine)
>         if (ret)
>                 return ret;
>
> -       if (disp->func->oneinit) {
> +       if (disp->func && disp->func->oneinit) {
>                 ret =3D disp->func->oneinit(disp);
>                 if (ret)
>                         return ret;
> @@ -461,8 +461,10 @@ nvkm_disp_new_(const struct nvkm_disp_func *func, st=
ruct nvkm_device *device,
>         spin_lock_init(&disp->client.lock);
>
>         ret =3D nvkm_engine_ctor(&nvkm_disp, device, type, inst, true, &d=
isp->engine);
> -       if (ret)
> +       if (ret) {
> +               disp->func =3D NULL;
>                 return ret;
> +       }
>
>         if (func->super) {
>                 disp->super.wq =3D create_singlethread_workqueue("nvkm-di=
sp");
> --
> 2.43.0
>

