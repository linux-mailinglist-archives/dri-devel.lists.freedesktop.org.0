Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9708D3AF14
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 16:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F98510E19B;
	Mon, 19 Jan 2026 15:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QkQHq+Pp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A223110E2AC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 15:32:44 +0000 (UTC)
Received: by mail-dl1-f54.google.com with SMTP id
 a92af1059eb24-12339e20a87so170006c88.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768836764; cv=none;
 d=google.com; s=arc-20240605;
 b=b82sAJVLphL4YPByrHtRrfvhptft07awkxHBVQC3ArVPqG2hlz7Hkqsz+fN4RSJ136
 GbX8XAk0yOoygybvZEAIeygkrYjuu47XQ1zyF8dvJuVAqWoHGyJryX27ixsYSw4tcmoP
 1fdJI7hZeMkkfd2oDHMTjm8KodWEIpuB8zIPriok4rSHQJ41dw3hjn5aIgjUvZkE2EFZ
 cfYpal633BYFvFB1Em3BQd2ChQokWmsuCHfh5iRa+8PXdUZVfFVBJJ3YuT6Z0FyDo1ci
 3nPw3HbaeZrtdLoS5oQ/9Ud0jkmyGW6rbgHhjcNYmNjrdlVTss0bnHRK+KYoAVrU0HIa
 rhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fImTte1fxp7A+UUuGPcjOwlAej0rmxglegz09JzZSyY=;
 fh=NiE93Bkgvvd4pCsaysQTIlSsbQt00XkvA+IZYcKToAY=;
 b=f7sUqNAj4QDqhpl1/qTlaBhv5uJXXxilobVpoRPyf1z9tO9mLuxyx4LnFrRbb+QL4N
 gELY1t/wUBcy46S90KOnd44ZCWw7GaRr8MDYOX9U2JIPpOUmfRPvCl/d5qLya2Kgkk8C
 YmQ1u8DwvrpjS2fLHlq+QT86t6YiIqIaRsmV7VoJEDPvdQOHV6XwyM9tMm/HE4n0JhcN
 ZtPvCr4RwoD56Bmoc5bbCiuMepDLbfncnp+NYdm7ap1lpwNrYL0xh03OrDz/ApIlAmHN
 jBpEYJ9mWDfw1zWqnEnlyhfRg3b4l4Iotk1PfUaQoP2oEm3s8uVyHolLD655NF3gBh4o
 fHmA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768836764; x=1769441564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fImTte1fxp7A+UUuGPcjOwlAej0rmxglegz09JzZSyY=;
 b=QkQHq+PpnnUkcz4spL3GzL5pW+n/szuxcp/s3/NYy4m76G51TRIji4XCHj8x3/HBmR
 2sJH2j7UKvqiuh6QVYgj+hKG3MXQm1/26bThD0w0628+HHeTYW1RBjq/8KcJ5lvW+g0v
 hAOS73HsFeTUPwpIGP+WHwulKNYhjq0FZj6AsWe++0rFPo8S9Js7mllh+ChOb7GWfkbT
 zmqxTZsJXiARtMbFYDKfbR6HSnDejbi5bo+tpAfFbUI6zeLtAD4MBks0CrGh1wB0YvFk
 pE9fpqnb7/Q/UaG3fFcrAmPAWKcr3zunyzzdIS6aVIhbRfxyWkMjYOkJv9zX/7n8+akJ
 pFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768836764; x=1769441564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fImTte1fxp7A+UUuGPcjOwlAej0rmxglegz09JzZSyY=;
 b=VkIJ6Y4xO5dm6jGpbvgtx7BpyYSe7H+vU8gHShF812RlNiGMjTQfVSGdh4EskRoEXt
 9IbzNru3S/Mew1DsRLNd6e8pbXU+gYUdzZnVrK+gzH02Yb3k5Bt0o5Bqneft5pqsxJge
 rr4+Uh8DgkF15Hs0OAx/BAidRkWg8LeZ5GXLf6m1Fft3O1In0hWNAoLGNcagkm+z2M99
 BTZzIMm/dytDPRxsImVq9HgwFAP+V7x/ytjriVL0ZAMLaxhKmFCrUW/rNCyrChR4CQFE
 pmXeGtOrzAohMW2Jo0PRrS+UfHchot6HUMnlPb1p2TCHLwqoz2vblnngvHBwnTG1c3E3
 Vzug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBSUvNLfu1jtSSXD0GGYoc6RdwQsuiJyl6E8CudTXbvPgKLKC1KjjvZT/NbwFcq3Yy7iADVofZ1lc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/9Invb3gP3t3CKst/YGFUXzhI1GGGtjgnaeq/7gmH1B5VIxV3
 GT137AX8gs2rYMSqVli1SDSsCjk/nf0RDkiwrcu7AEwDFQbwlnpZW3OUX1peTu8QM+KCHPnKcdx
 Pbc5zpbKI34Ke3AmCdWFNb2MyHmS6AiY=
X-Gm-Gg: AY/fxX6fkgvrjIXT/KCoVUZLfXhRm+A/JS8+Xd8cwkKs6LXHnW2Dj3Lx0yyqPjpz5yh
 QgPW996JplyZEXmWcQ7MWwSLzITt8dHRCrLxFcInwON0EOkueUDOd7qFKiZlCPe7f1KLebUw1t4
 J3tpQBRSFH/A5zSj4KQOcAlypJBQdJu6UlzSI7eBN4zgamEauOSHxgQqVIvVfR/XjJVUHZvYJtk
 IcVRFCfvNsh8VGn0hKATF3bUrMP7L1yKPgSrnrJ1b5Hpb17/PFsKhuIbznYTWqohwqPZGcO
X-Received: by 2002:a05:7022:e80d:b0:119:e55a:95a0 with SMTP id
 a92af1059eb24-1244a713d6bmr4923545c88.2.1768836763824; Mon, 19 Jan 2026
 07:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20260117095421.12700-1-decce6@proton.me>
In-Reply-To: <20260117095421.12700-1-decce6@proton.me>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Jan 2026 10:32:32 -0500
X-Gm-Features: AZwV_QiPXB_jMj4_9o148eXT2DvApiGgXceyKtRNlHPzqDodG8vQjdvbrt6w9gY
Message-ID: <CADnq5_Nrp6xsEOgs8PVy5cmO3rV9QhdoyBDB6DdTdOtXpmnZ6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/[radeon|amdgpu]: Add HAINAN clock adjustment
To: decce6 <decce6@proton.me>
Cc: kenneth.feng@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Sat, Jan 17, 2026 at 2:17=E2=80=AFPM decce6 <decce6@proton.me> wrote:
>
> Currently, the AMD Radeon R5 M420 GPU is unstable when operating at the d=
efault maximum 850MHz/1000MHz (core/memory) clock speeds. For example, a ga=
me may stop working within one minute after starting up. When using the amd=
gpu driver, the process stops with exitcode 6 and the following message is =
printed: "amdgpu: The CS has cancelled because the context is lost. This co=
ntext is innocent."
>
> From my testing, limiting the clock speeds to 800/950 MHz makes it work p=
erfectly stably.
>

Thanks for the patch.  What revision is your chip?  Can you add the
revision check as well?  Can you also split this into two patches, one
for amdgpu and one for radeon?

Alex

> Signed-off-by: decce6 <decce6@proton.me>
> ---
>  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 4 ++++
>  drivers/gpu/drm/radeon/si_dpm.c            | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm=
/amd/pm/legacy-dpm/si_dpm.c
> index 1f539cc65f41..fcb9e0e20175 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> @@ -3468,6 +3468,10 @@ static void si_apply_state_adjust_rules(struct amd=
gpu_device *adev,
>                         max_sclk =3D 60000;
>                         max_mclk =3D 80000;
>                 }
> +               if (adev->pdev->device =3D=3D 0x666f) {
> +                       max_sclk =3D 80000;
> +                       max_mclk =3D 95000;
> +               }
>         } else if (adev->asic_type =3D=3D CHIP_OLAND) {
>                 if ((adev->pdev->revision =3D=3D 0xC7) ||
>                     (adev->pdev->revision =3D=3D 0x80) ||
> diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_=
dpm.c
> index 9deb91970d4d..2f386ea8827f 100644
> --- a/drivers/gpu/drm/radeon/si_dpm.c
> +++ b/drivers/gpu/drm/radeon/si_dpm.c
> @@ -2925,6 +2925,10 @@ static void si_apply_state_adjust_rules(struct rad=
eon_device *rdev,
>                         max_sclk =3D 60000;
>                         max_mclk =3D 80000;
>                 }
> +               if (rdev->pdev->device =3D=3D 0x666f) {
> +                       max_sclk =3D 80000;
> +                       max_mclk =3D 95000;
> +               }
>         } else if (rdev->family =3D=3D CHIP_OLAND) {
>                 if ((rdev->pdev->revision =3D=3D 0xC7) ||
>                     (rdev->pdev->revision =3D=3D 0x80) ||
> --
> 2.43.0
>
>
