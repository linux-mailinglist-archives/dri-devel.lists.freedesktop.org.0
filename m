Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEC27FF7C5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 18:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A04110E036;
	Thu, 30 Nov 2023 17:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74EB10E033;
 Thu, 30 Nov 2023 17:10:51 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1f060e059a3so569728fac.1; 
 Thu, 30 Nov 2023 09:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701364251; x=1701969051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P9iOH6Yd9Atg7CwHEtCTfnbvOXuGr9JGPZU/okAPF2U=;
 b=Irrj3L86QzJyNMPYlbq6D8EXWuf2o/6KvrzOJFtWaoXPsqIEBpUoVpG+3KvhEp4HIO
 iu3E/1NnF4Df/NlyKwj8eR3/BnmFY38gEuzH8Bq0c7WQUvraQkGcSvHSGHeQcZ6j5Axb
 rwwy5Y7TfWyA3US1/6TSWFDnA1Gl1R/82f3nfpoaBUCd/AqO+cUE70dlNSm9KQDomj0B
 woTcZEidcqCDUK1oAcmfrF6Sv3UEGYpWkMyKZ4+PXfaXAwfsjQowYFVUaLAIxCwG3zc3
 AZ3PT6SaAKErigsCueAsyq7XXJYKGc+yb/7AWbgWDCHjhN61TwLG0w4/Shw298OZlBed
 Ft6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701364251; x=1701969051;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P9iOH6Yd9Atg7CwHEtCTfnbvOXuGr9JGPZU/okAPF2U=;
 b=cvunCaNxuCVQINyu5/jQ/wwD1Rtpfkz+gqvStwLBG7AcKqcWCMC653iI+dT4Z/f2Mv
 QwUoU7YZRlUxdZ2+7Z75+30btKGxf5ZdQZhN2jeT6Id9r2SWj1H11rHu4h4aZsY1/nzh
 sAleF5mWLPaVXW2pk89aYQylrOCipFwCYwzG3845cK8s2FsS7AsBTq7KIy/h7G2r1kKu
 VV3Kia2EhoIUyrcQ0v5WRkTukJc94CyqIZatX1qVhXTBxdYYnFYSiqXQ+OL4iQ/OfYJQ
 fRhuJJ8WI1QOfx4aEp1KVph+Q8+SzQ4wDX5whCzEmteTTbeRAq0AdIyLAbJrsLY1Vp48
 hFPA==
X-Gm-Message-State: AOJu0YwUZ3Hy+YaD7rrM5cVDNLw8xrYw0S0CXpKeR/oZwApbD2uchYzO
 3Gy6z5ch0gOGmhrP9YmcVcjRxbd8FpTC0BnUdrPHTUXy
X-Google-Smtp-Source: AGHT+IFga0LIgTJHbHwZ6AI3Nebtjpu1/mE6pEvvOWdhSB39jbFHga03BX1yiAShKg5YAMwBtiEtTsJM7ArB+zNs1Mg=
X-Received: by 2002:a05:6870:219a:b0:1fa:e115:ef6c with SMTP id
 l26-20020a056870219a00b001fae115ef6cmr114192oae.38.1701364250763; Thu, 30 Nov
 2023 09:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20231129152212.7879-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20231129152212.7879-1-n.zhandarovich@fintech.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Nov 2023 12:10:39 -0500
Message-ID: <CADnq5_MZSG=g9UiYxWd0dAoqrkA7Bj-yVK0ExSMpsrcj8ML00A@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/r100: Fix integer overflow issues in
 r100_cs_track_check()
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Nov 29, 2023 at 10:28=E2=80=AFAM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
> It may be possible, albeit unlikely, to encounter integer overflow
> during the multiplication of several unsigned int variables, the
> result being assigned to a variable 'size' of wider type.
>
> Prevent this potential behaviour by converting one of the multiples
> to unsigned long.
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Fixes: 0242f74d29df ("drm/radeon: clean up CS functions in r100.c")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  drivers/gpu/drm/radeon/r100.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.=
c
> index affa9e0309b2..cfeca2694d5f 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -2321,7 +2321,7 @@ int r100_cs_track_check(struct radeon_device *rdev,=
 struct r100_cs_track *track)
>         switch (prim_walk) {
>         case 1:
>                 for (i =3D 0; i < track->num_arrays; i++) {
> -                       size =3D track->arrays[i].esize * track->max_indx=
 * 4;
> +                       size =3D track->arrays[i].esize * track->max_indx=
 * 4UL;
>                         if (track->arrays[i].robj =3D=3D NULL) {
>                                 DRM_ERROR("(PW %u) Vertex array %u no buf=
fer "
>                                           "bound\n", prim_walk, i);
> @@ -2340,7 +2340,7 @@ int r100_cs_track_check(struct radeon_device *rdev,=
 struct r100_cs_track *track)
>                 break;
>         case 2:
>                 for (i =3D 0; i < track->num_arrays; i++) {
> -                       size =3D track->arrays[i].esize * (nverts - 1) * =
4;
> +                       size =3D track->arrays[i].esize * (nverts - 1) * =
4UL;
>                         if (track->arrays[i].robj =3D=3D NULL) {
>                                 DRM_ERROR("(PW %u) Vertex array %u no buf=
fer "
>                                           "bound\n", prim_walk, i);
> --
> 2.25.1
>
