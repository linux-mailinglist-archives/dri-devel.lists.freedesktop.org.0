Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB3470C1D0
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 17:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F1C10E352;
	Mon, 22 May 2023 15:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7210610E351;
 Mon, 22 May 2023 15:02:37 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-38eb2984c82so2070446b6e.0; 
 Mon, 22 May 2023 08:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684767756; x=1687359756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9+Z/yo/990FPPh1vM0WhcUYxVkl6LMnyPg5rFTfhAY=;
 b=oC+ddbUeJBq0b9XNhZ2dJmn6tG665zNZ21gthPPJvPvZJNfEuCpE4hfp7iJu4EM+5K
 7M+hg2Zbnrae9ugnC4AE3qM3JjDAgwYY3mVWUPvKudlsZZa5ng+QVoOzzJZxfzc4seAk
 Gwuv2jDItPCzIbIoFNii0/Iolc8vspBvcukjrgOh32ZBo6B0aXs+cT3aZbqSNg53xUxK
 7fFqCQazjUTzSFH6I2XSGQfAXxDz+3vWDxWKDTYYTsgCZnAX16yU/FsvZGvD7zRoOEhK
 2ffXfbT0JXROF8unVfKSleowQHrNdA4+VcR7Pymo/YlIPVoKrDwByyiodz0yZ5Ho7HAS
 1WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684767756; x=1687359756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l9+Z/yo/990FPPh1vM0WhcUYxVkl6LMnyPg5rFTfhAY=;
 b=KF8FIciIABcKXJYbN9/HBsK+rwcz81mqfJkh7K3XCUV9AwxI7IelUoTjeQ9ilEol2R
 4+kDUZFUj4+1UQaEG5QbwJlTNpsjNkx8IlBKwUTTKF7cRlJjk5NufAw8nnmpWl9BwVwU
 BWv377nHuqfvrzyCtN6CQFhrjuImMkOzynRu6cAfEhmyOkM2nUocRy62JzTw/2MrZjoo
 HtDolSqjQXoobrNoS6zvzMG3nrqMLi/8soF2UetVqkfoH++wcwRv6ZzXzSgEsO/T6Y3y
 5Vr3540qbV6XD2mEb5DazlphpHJV0jX9SF77xkMYx4OWlwwgb4uP8ZqGCNZzMz4A5ozf
 b1BA==
X-Gm-Message-State: AC+VfDyfrZn/wIMPJN2fGMcjyyCqsdF0hmnWRI2ZkdmLpS+2rZp7Gs0r
 YqhQutVnPfzuO20ABipgR76i7JPBjHuKi9Tpv5o=
X-Google-Smtp-Source: ACHHUZ7FhR1W38qAX9keSG9AdoCA3HHMg6j/6hWjxx9ZqXD+09z6pWBBypZbjGdOdHVeiSngkYqWdO5ffL1zVtNEXc0=
X-Received: by 2002:a05:6808:613:b0:396:2bbe:b0c0 with SMTP id
 y19-20020a056808061300b003962bbeb0c0mr5773273oih.18.1684767756342; Mon, 22
 May 2023 08:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230522073017.1782984-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20230522073017.1782984-1-harshit.m.mogalapalli@oracle.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 May 2023 11:02:25 -0400
Message-ID: <CADnq5_Oqnc1vHNp5QFNA82W4Ja+ua+Xj6Feku06VG6O6bkDztg@mail.gmail.com>
Subject: Re: [PATCH next] drm/amdgpu: Fix unsigned comparison with zero in
 gmc_v9_0_process_interrupt()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 error27@gmail.com, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dan.carpenter@linaro.org, Le Ma <le.ma@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Graham Sider <Graham.Sider@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, May 22, 2023 at 3:30=E2=80=AFAM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> Smatch warns:
>         drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:579:
>         unsigned 'xcc_id' is never less than zero.
>
> gfx_v9_4_3_ih_to_xcc_inst() returns negative numbers as well.
> Fix this by changing type of xcc_id to int.
>
> Fixes: faf96b9b602d ("drm/amdgpu: correct the vmhub index when page fault=
 occurs")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is from static analysis, only compile tested.
> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/=
amdgpu/gmc_v9_0.c
> index f70e666cecf2..1e8b2aaa48c1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -557,8 +557,8 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_d=
evice *adev,
>         const char *hub_name;
>         u64 addr;
>         uint32_t cam_index =3D 0;
> -       int ret;
> -       uint32_t node_id, xcc_id =3D 0;
> +       int ret, xcc_id =3D 0;
> +       uint32_t node_id;
>
>         node_id =3D entry->node_id;
>
> --
> 2.38.1
>
