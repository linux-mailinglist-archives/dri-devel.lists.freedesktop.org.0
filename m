Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E71EB43E42
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 16:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7794010EA58;
	Thu,  4 Sep 2025 14:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GqIBswB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AD610E25B;
 Thu,  4 Sep 2025 14:12:12 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-248f2da72edso1829005ad.2; 
 Thu, 04 Sep 2025 07:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756995132; x=1757599932; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P76dzonJpjxq5JjtLQXtMWe8/rjM2VxntAZ0iJ6aPUc=;
 b=GqIBswB/fqN90SvHI6TkAf5f1EdVFfFpSy6sKCqT1htP6Tz5mnR7n5FZ8tVDCCaz16
 nKxDTovsugboQQDNCiie5t+BX0g9YdqJD00NNF5Gu5rMaVRNCMeNzV89Ejgh6fSU3RZP
 a5X4mQiCocZG9rJ6ti2+HzDd3UQ7s7HctZKUNcTU9UkRsHLdIJ1hxCPFWhwD7csqnMr9
 Ob6T41tKyTXabQD6POO4zhcm5L/ogxetFyqdwuYSGm+U9nJxS9uQY94d1djrAgv/Ie1w
 kXzVZRDWt7hBUsWxgXUNMVg5jGzDSwgRe95307epW0fOoTnZiuluNTxLpz3rjSbAa80f
 IyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756995132; x=1757599932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P76dzonJpjxq5JjtLQXtMWe8/rjM2VxntAZ0iJ6aPUc=;
 b=V/q5trmo26k9ZmaTU7WUwxbizRgWVuHdpNdx1H3+MmavpzjecM9rNTYItZBxVl7gvZ
 ZCWO/v+c7cPV76O+W29mD3MNzgcVfCG2xnRy60nIx/KegCRbeDF86r0y1GpneMXN7mXj
 O3XxEmK9K7NrImMYHuS/i5teBEpFiuSQFyQhT0UzkgmG7Rc1zlKcAxNz0z0kfWI2Ra6E
 UiC87iZIWvUOuiRJejiiKUpGTIgDuPxt2x5GVshzH4ACAyC+ZUJV4W7bHCf0zBlNUddg
 GD4qbr3pi5UGMfOeXvvLoy9JNG2yLH2rnoKruqpXg7CsgiGPaeR4TD7altjyjoPuFQ5E
 ukPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNnDPRH0m/Pgy9DzC+y8kpleCMEQrYb7UGNellCqsKBrYFr99sVHSvalZrm2Rs7wc2yhQuazm9Jd3I@lists.freedesktop.org,
 AJvYcCWPagA6t2wtwbyi2hij32t4egSXzamXX892B/cIyJ/yxxzc7jAJHFlgJPvN+r5tAbKLKeJ4/LsO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZHxrUUEkoJQ8REKVKjnDRa9pIv2uBNuKq1xIZ0vu6uOwoYk1V
 Z2xsQVGJruHI/SXjp0BJuE6vbqFHLswWhNG7n6O2uwt0JU9X8WTKa+eD/cYYdhMprT3mQDl+wyp
 NVK/A2hE8NjBLk6vO4FpREUa4fDulo28=
X-Gm-Gg: ASbGnctfOdwoc5Wb27f2dkNAKfr4rS3jRg0zT4WKNYTxWWDN+Jfl92w1Mc+tUdRcsn4
 EnJHClUwkJ8iHpWuNVEQM4zDnS/nykUGKMFVWMxYmtxyPVltU81NvN1fGP+rIqxM+tWV7x5ouGy
 oock7RCCyCA4UyBY+j/kr+L1NJ2CqZHthZWE2Ohzk+L8Jcl4Vn97/gPU5zlmQO9OYj220OgIVIe
 nkr/XU2sdNRXXrejA==
X-Google-Smtp-Source: AGHT+IEAPIL9oOqiKjaF+AER58IkUXfQBh587o4Kke0xYokY60veibzOrZeGvBUwuW565SUvSnaGad6q2MHI0yFNW/E=
X-Received: by 2002:a17:902:e885:b0:248:d679:1aa0 with SMTP id
 d9443c01a7336-2491e604f03mr176532205ad.3.1756995131604; Thu, 04 Sep 2025
 07:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250904082127.271638-1-liaoyuanhong@vivo.com>
 <20250904082127.271638-4-liaoyuanhong@vivo.com>
In-Reply-To: <20250904082127.271638-4-liaoyuanhong@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Sep 2025 10:11:59 -0400
X-Gm-Features: Ac12FXxwjjMHeUEY5jR_elix-1Pg7z89-JPeJ8lMyom1ZYENdg-eos4fkcVJR2Q
Message-ID: <CADnq5_Ppuwsz3RU0nK3nqUapfuSrS3QDQNZXiKxYUgBvLObWag@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/pm/powerplay/smumgr: remove redundant ternary
 operators
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "open list:AMD POWERPLAY AND SWSMU" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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

Applied the series.  Thanks!

Alex

On Thu, Sep 4, 2025 at 4:29=E2=80=AFAM Liao Yuanhong <liaoyuanhong@vivo.com=
> wrote:
>
> For ternary operators in the form of "a ? true : false", if 'a' itself
> returns a boolean result, the ternary operator can be omitted. Remove
> redundant ternary operators to clean up the code. Swap variable positions
> on either side of '=3D=3D' to enhance readability.
>
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c      | 5 ++---
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   | 5 ++---
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c | 5 ++---
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c     | 5 ++---
>  4 files changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> index 5e43ad2b2956..d2dbd90bb427 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
> @@ -2540,9 +2540,8 @@ static int fiji_initialize_mc_reg_table(struct pp_h=
wmgr *hwmgr)
>
>  static bool fiji_is_dpm_running(struct pp_hwmgr *hwmgr)
>  {
> -       return (1 =3D=3D PHM_READ_INDIRECT_FIELD(hwmgr->device,
> -                       CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROL=
LER_ON))
> -                       ? true : false;
> +       return PHM_READ_INDIRECT_FIELD(hwmgr->device,
> +                       CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROL=
LER_ON) =3D=3D 1;
>  }
>
>  static int fiji_update_dpm_settings(struct pp_hwmgr *hwmgr,
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c b/d=
rivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
> index 17d2f5bff4a7..1f50f1e74c48 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
> @@ -2655,9 +2655,8 @@ static int iceland_initialize_mc_reg_table(struct p=
p_hwmgr *hwmgr)
>
>  static bool iceland_is_dpm_running(struct pp_hwmgr *hwmgr)
>  {
> -       return (1 =3D=3D PHM_READ_INDIRECT_FIELD(hwmgr->device,
> -                       CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROL=
LER_ON))
> -                       ? true : false;
> +       return PHM_READ_INDIRECT_FIELD(hwmgr->device,
> +                       CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROL=
LER_ON) =3D=3D 1;
>  }
>
>  const struct pp_smumgr_func iceland_smu_funcs =3D {
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b=
/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> index ff6b563ecbf5..bf6d09572cfc 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> @@ -2578,9 +2578,8 @@ static int polaris10_initialize_mc_reg_table(struct=
 pp_hwmgr *hwmgr)
>
>  static bool polaris10_is_dpm_running(struct pp_hwmgr *hwmgr)
>  {
> -       return (1 =3D=3D PHM_READ_INDIRECT_FIELD(hwmgr->device,
> -                       CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROL=
LER_ON))
> -                       ? true : false;
> +       return PHM_READ_INDIRECT_FIELD(hwmgr->device,
> +                       CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROL=
LER_ON) =3D=3D 1;
>  }
>
>  static int polaris10_update_dpm_settings(struct pp_hwmgr *hwmgr,
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c b/dri=
vers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
> index 6fe6e6abb5d8..2e21f9d066cb 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
> @@ -3139,9 +3139,8 @@ static int tonga_initialize_mc_reg_table(struct pp_=
hwmgr *hwmgr)
>
>  static bool tonga_is_dpm_running(struct pp_hwmgr *hwmgr)
>  {
> -       return (1 =3D=3D PHM_READ_INDIRECT_FIELD(hwmgr->device,
> -                       CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROL=
LER_ON))
> -                       ? true : false;
> +       return PHM_READ_INDIRECT_FIELD(hwmgr->device,
> +                       CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROL=
LER_ON) =3D=3D 1;
>  }
>
>  static int tonga_update_dpm_settings(struct pp_hwmgr *hwmgr,
> --
> 2.34.1
>
