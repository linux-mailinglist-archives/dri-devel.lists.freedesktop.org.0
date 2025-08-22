Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977E6B32047
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 18:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ED610EB64;
	Fri, 22 Aug 2025 16:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="H4xGTykg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CDB10EB6A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 16:16:43 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-24458194d83so19898225ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 09:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755879403; x=1756484203;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VORULNLKIsgd6AK0smNyc9txjd/WXm3+lJ8Yhl3Q7uA=;
 b=H4xGTykgTBnrRvxft2rN7clvyxbXVVsykceXsoopIMwbawWxzQ+4vZDMmegZJ0XBnf
 2qneBqAHNeMIISEhhPg0FiqLUiiOUlU+UU+6tbmEJrGK6mIetIyHZVKjYPIjixhgfYQn
 /6lawKd0+Q1ME1YV29ja5Fbdh21RLFvpfT+CoOaosg+iZqJ3mDdK9FUPG4FiPU61R3Es
 X4AOj1hTmD/8y4qUSt5U9QZrGhUXNHZax5Eg8F/m6nVmk1HFVnyUQjfkwPU2Og7eq0C6
 ebjo+K1RrJKUsDAxJ93smkKiYSNjMs5eEKH/FW22FX7XUGFdO+6Nfy8fU6andGIXzVBP
 kN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755879403; x=1756484203;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VORULNLKIsgd6AK0smNyc9txjd/WXm3+lJ8Yhl3Q7uA=;
 b=C2w/tQHO3Mc9a2E/8qp+hU2XwhxnFHDa9MOJP0zXkRS6+cFAnMOeKWh0kBpE7ypmk3
 yPvF01F/74r04FizSFNWWFG1ExzceGHhKHKtJHCqP+vgBfPsXLSkyvNsSjjGNmWJVfP7
 zRXq8k9GAABx1Khx+lhhlToYdrn0HsNjesJGbGJihVIfVA2CQ9jfTymu1Qhy9dSHrpqx
 OPX95FtxM686xo7W8fljG/XaiKPP6flogm2hdmwzwjCzzr4ZIyxeYR/IolY6NiHhyhQR
 hgd9scUZau+ueIwoV+xz+wqF26peUkQOu/SLQmWPJsNgiqpyjgY1NsdoM8PRmmYQ2qS7
 EhRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPDy7nCjavaJ7qUH0Hmq3kMXdBsE/1iIvHZjoPwvw+YgC7gs/CDjG53YPvr3Tp7cqmpdCZvpbF84w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxpv1hYlm1qLmL8t4e8r2hU/wUd2ji8rCdUXckwzXXeVmrpFwVV
 1KwPEyRSB1EjVkVcoY3SUVhdMJRhu2qG199n/bLRmY/Z4V2QzuUuNr2PX11TkKaqJQqogf6qyXN
 ls2C0GlRAnJieopJNw79XyOuaJAJet6WWcJZqOPh2rA==
X-Gm-Gg: ASbGncuqIWe43mV5hw8YZORRg0Uuptk/WlBTBnSqTa4eItCc9wAKm0wJcjCjUmf2PBH
 92BN8tCzzk9ARTs48DXUsfscgx92VLq/+i61nF4dVYYb4iz8E7Zdo2o0HuCEEwFJYvL5dVWDAU0
 CwN0XO6r2TJ8Qzs72UyJ+eYcQsV9KPFz+Of1PeQhrj8HRUnNmWy2RRjNsrt0cnAHIgqRn+/10pU
 u7VQRE=
X-Google-Smtp-Source: AGHT+IFCOPScJgiXAHt9W/tv6ALf4TUM39Sss5K8dM2/wG27Nb+NxH8e8xkTkiJIfR/5m2L8pcRVxCeex+IPFIQsFWE=
X-Received: by 2002:a17:903:2282:b0:225:abd2:5e4b with SMTP id
 d9443c01a7336-2462ee02ab9mr64132595ad.16.1755879403112; Fri, 22 Aug 2025
 09:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250811220017.1337-1-jajones@nvidia.com>
 <20250811220017.1337-2-jajones@nvidia.com>
In-Reply-To: <20250811220017.1337-2-jajones@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 22 Aug 2025 12:16:31 -0400
X-Gm-Features: Ac12FXwY5O8zJstYmF625_unjewCDuAA6BkINcquV_AfyWgB8UjYK28Ggger4zc
Message-ID: <CAOFGe94vHrKX6jSGCuesRNUJPXzYBASK4WvqYYFg=EHTFcs8MQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: define NVIDIA DRM format modifiers for GB20x
To: James Jones <jajones@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Fernandes <joelagnelf@nvidia.com>
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

On Mon, Aug 11, 2025 at 5:57=E2=80=AFPM James Jones <jajones@nvidia.com> wr=
ote:
>
> The layout of bits within the individual tiles
> (referred to as sectors in the
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
> changed for 8 and 16-bit surfaces starting in
> Blackwell 2 GPUs (With the exception of GB10).
> To denote the difference, extend the sector field
> in the parametric format modifier definition used
> to generate modifier values for NVIDIA hardware.
>
> Without this change, it would be impossible to
> differentiate the two layouts based on modifiers,
> and as a result software could attempt to share
> surfaces directly between pre-GB20x and GB20x
> cards, resulting in corruption when the surface
> was accessed on one of the GPUs after being
> populated with content by the other.
>
> Of note: This change causes the
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to
> evaluate its "s" parameter twice, with the side
> effects that entails. I surveyed all usage of the
> modifier in the kernel and Mesa code, and that
> does not appear to be problematic in any current
> usage, but I thought it was worth calling out.
>
> Signed-off-by: James Jones <jajones@nvidia.com>

Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>

>
> ---
>  include/uapi/drm/drm_fourcc.h | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index ea91aa8afde9..e527b24bd824 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -979,14 +979,20 @@ extern "C" {
>   *               2 =3D Gob Height 8, Turing+ Page Kind mapping
>   *               3 =3D Reserved for future use.
>   *
> - * 22:22 s     Sector layout.  On Tegra GPUs prior to Xavier, there is a=
 further
> - *             bit remapping step that occurs at an even lower level tha=
n the
> - *             page kind and block linear swizzles.  This causes the lay=
out of
> - *             surfaces mapped in those SOC's GPUs to be incompatible wi=
th the
> - *             equivalent mapping on other GPUs in the same system.
> - *
> - *               0 =3D Tegra K1 - Tegra Parker/TX2 Layout.
> - *               1 =3D Desktop GPU and Tegra Xavier+ Layout
> + * 22:22 s     Sector layout.  There is a further bit remapping step tha=
t occurs
> + * 26:27       at an even lower level than the page kind and block linea=
r
> + *             swizzles.  This causes the bit arrangement of surfaces in=
 memory
> + *             to differ subtly, and prevents direct sharing of surfaces=
 between
> + *             GPUs with different layouts.
> + *
> + *               0 =3D Tegra K1 - Tegra Parker/TX2 Layout
> + *               1 =3D Pre-GB20x, GB20x 32+ bpp, GB10, Tegra Xavier-Orin=
 Layout
> + *               2 =3D GB20x(Blackwell 2)+ 8 bpp surface layout
> + *               3 =3D GB20x(Blackwell 2)+ 16 bpp surface layout
> + *               4 =3D Reserved for future use.
> + *               5 =3D Reserved for future use.
> + *               6 =3D Reserved for future use.
> + *               7 =3D Reserved for future use.
>   *
>   * 25:23 c     Lossless Framebuffer Compression type.
>   *
> @@ -1001,7 +1007,7 @@ extern "C" {
>   *               6 =3D Reserved for future use
>   *               7 =3D Reserved for future use
>   *
> - * 55:25 -     Reserved for future use.  Must be zero.
> + * 55:28 -     Reserved for future use.  Must be zero.
>   */
>  #define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \
>         fourcc_mod_code(NVIDIA, (0x10 | \
> @@ -1009,6 +1015,7 @@ extern "C" {
>                                  (((k) & 0xff) << 12) | \
>                                  (((g) & 0x3) << 20) | \
>                                  (((s) & 0x1) << 22) | \
> +                                (((s) & 0x6) << 25) | \
>                                  (((c) & 0x7) << 23)))
>
>  /* To grandfather in prior block linear format modifiers to the above la=
yout,
> --
> 2.50.1
>
