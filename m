Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255AE7FF7BC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 18:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B66810E737;
	Thu, 30 Nov 2023 17:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5347610E74B;
 Thu, 30 Nov 2023 17:06:31 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6d7e56f6845so715133a34.0; 
 Thu, 30 Nov 2023 09:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701363990; x=1701968790; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MlJsnM9X8S1R1QU50aDaUxRnifVbK+6ZZXWm1jW3cRo=;
 b=cF1NmBpQDCG0jfNtr8Kp0dninWSZ02eUNlP84URbYOqZRGsCXNgRYT/JwW3QZAk2CU
 3ycA1YPw9oca0g3lHd/yuelb8+jt519PRS87lUeH1cXErv1yEibtHcjyhOlfMu3E8QSJ
 Xl73bimkHfo87QKGYpxFl2OhYzk+xP4Ep4LeTTewqNiy1Y+o3zFtCOVz8N+sP8RkgMSh
 Ge8M0Gv26YmHTKhExY7YgL4XoE0mKbOkwyoNg0IPNWPCzesm1/CVsuSrD8xOAQgd4pnd
 u2h94MYmtpbRbJY6bhu3WM+ZLHQdt8nof4uVXVEoFsdomdazoQhF4vVrEKnvL5By8Urh
 qaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701363990; x=1701968790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MlJsnM9X8S1R1QU50aDaUxRnifVbK+6ZZXWm1jW3cRo=;
 b=PtBGsK/gy+XTPXoYm/B5Um1TAcOYCax+1PalKjxEe4jO0BgwirdsmCs4At3SMQuEsz
 cewViEixTrQRAHFQDwEmAvseVS9Oq37jl+me44mez7wtg3ixDOhlhKzkDyWEPii9NuCP
 S8hjfCTzEDOFd9pKZOwKeZ9RbeoSVcuiSsrXTCVf3/1gkLkzqsDJNpCtzXCOlg3gR3df
 j/6kaTeJzKpmjr4Tk4y+EPdRElP35PErml8RewkdzifeRORJ5kK9n9m7fw5RARny1x5C
 aCaj9R1DCU4yxyMsxNfwGp25JZxEAUr5fZOxqi+W6Le7g2JYHLd5i5IjWKiWiHpGKQdf
 LaXA==
X-Gm-Message-State: AOJu0Yx4kWGmUGDq7D5KZ7ltARB+CL6W/s2Be1C1hWsUixcua400wKvq
 1MjUHgDYZORppxvX2zSdAXr32Pzh5yS90Np8JA8=
X-Google-Smtp-Source: AGHT+IEKdlosNmIQ5WeWVkNt7+fGwMIv0iwX5QXmSbUiiJUhBwH4O/QquYnAvbeL0qpC1g0R62JMDvqxfN7qssEs27Y=
X-Received: by 2002:a05:6870:2888:b0:1fa:1c34:98e9 with SMTP id
 gy8-20020a056870288800b001fa1c3498e9mr25202035oab.30.1701363990540; Thu, 30
 Nov 2023 09:06:30 -0800 (PST)
MIME-Version: 1.0
References: <20231129152230.7931-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20231129152230.7931-1-n.zhandarovich@fintech.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Nov 2023 12:06:19 -0500
Message-ID: <CADnq5_O+O-395Brq+OHR3YEDaeTwQsMseJynv4Mm3L-KotO-5g@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/r600_cs: Fix possible int overflows in
 r600_cs_check_reg()
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
> While improbable, there may be a chance of hitting integer
> overflow when the result of radeon_get_ib_value() gets shifted
> left.
>
> Avoid it by casting one of the operands to larger data type (u64).
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Fixes: 1729dd33d20b ("drm/radeon/kms: r600 CS parser fixes")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  drivers/gpu/drm/radeon/r600_cs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r6=
00_cs.c
> index 638f861af80f..6cf54a747749 100644
> --- a/drivers/gpu/drm/radeon/r600_cs.c
> +++ b/drivers/gpu/drm/radeon/r600_cs.c
> @@ -1275,7 +1275,7 @@ static int r600_cs_check_reg(struct radeon_cs_parse=
r *p, u32 reg, u32 idx)
>                         return -EINVAL;
>                 }
>                 tmp =3D (reg - CB_COLOR0_BASE) / 4;
> -               track->cb_color_bo_offset[tmp] =3D radeon_get_ib_value(p,=
 idx) << 8;
> +               track->cb_color_bo_offset[tmp] =3D (u64)radeon_get_ib_val=
ue(p, idx) << 8;
>                 ib[idx] +=3D (u32)((reloc->gpu_offset >> 8) & 0xffffffff)=
;
>                 track->cb_color_base_last[tmp] =3D ib[idx];
>                 track->cb_color_bo[tmp] =3D reloc->robj;
> @@ -1302,7 +1302,7 @@ static int r600_cs_check_reg(struct radeon_cs_parse=
r *p, u32 reg, u32 idx)
>                                         "0x%04X\n", reg);
>                         return -EINVAL;
>                 }
> -               track->htile_offset =3D radeon_get_ib_value(p, idx) << 8;
> +               track->htile_offset =3D (u64)radeon_get_ib_value(p, idx) =
<< 8;
>                 ib[idx] +=3D (u32)((reloc->gpu_offset >> 8) & 0xffffffff)=
;
>                 track->htile_bo =3D reloc->robj;
>                 track->db_dirty =3D true;
> --
> 2.25.1
>
