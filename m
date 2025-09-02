Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E55B40707
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA40389830;
	Tue,  2 Sep 2025 14:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xo7NjO2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A62389830;
 Tue,  2 Sep 2025 14:36:37 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-24adcc94338so5046905ad.2; 
 Tue, 02 Sep 2025 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756823797; x=1757428597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+5DHZ7f7XX3p5WOn0gScG+XhwvVRktJH4l0d+5E2fo=;
 b=Xo7NjO2hcrOsilwBYtWoplDR3E3HKMgTp7ZaIrmPUr1S5qBRqY2QEnDCdbybN/HE0f
 dR3Lfn/lZLldkyhutqoh+VfLD2H9EWCJWSanFh5gr59u1IheW5A+BDZ+UUZ5dVEEUVB+
 /Q7VeXvvNvodf4aD2l6EEDHkEL3cu86ewV+sayIlRu8LhP5gI1Q4pE1xwB6Z0kkSGmBl
 u6Ugysm0M5dcipHYZquhAhpH0CkOOS2RRURvhoPMvNiLjzsqzBmSuxwtBA3U4duBmFRv
 IOoAcYVvs6Gr9MKDvfGcasazzlMR/XXXl5Tt3VZne/q3knK/z1qcCNMJXpt5rDgyJBPa
 gEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756823797; x=1757428597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+5DHZ7f7XX3p5WOn0gScG+XhwvVRktJH4l0d+5E2fo=;
 b=pYqwL05INPl1wzqDIBqcDtH/Auoh18Guco5e7co8TUJT7eUU8Vnraym0yGYhjOZ6gN
 oIi+jV4JUJgibtrBsS1NVeXv8V57T9LVV37ZP+Q1Dg7QmtyL8TSX7EGq24tAageamid2
 rlK9vNNUab9j2k8w35RWJQwq2g2lPkiWFMJZ5UiRSMAN5StvO4Eqb+RoUF5pA0GxupQ7
 mBF5koS4MxfNrkNE0my5PGOaJ7Ekvkbb8xaJwckhy7rNC4AKs4NVIlWU7EYm69baUoPM
 Cu6IflUojTc8KbAiUpcQ9uOWNSk8YzJrlPLbwQO9FKFrD8EUlou2b6V8CsaNMRhab/Ti
 8gBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTfhhI5pAH/WrUeehXNIy9Sd9Zj9jEfS4fxNr9M6pSw3nXpxNuFAzuvj6szpOKWYvXYNH6f8de@lists.freedesktop.org,
 AJvYcCVOOYr28H3C57aOoI3JH4pHoxag5BZHuN/pOblXcCbQotiBZUqb8Mh24udk/c1aNy0mPjBhfT0/AAod@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy41OQ4fqHiJF9D979jMx0QWheGGGjhzYqeifPF2fV3xd/Ix6Sj
 j7FxRxCwcJPF5B4tSk/Zcfb0w6AuhfB9D9jojF8nOAloAw+ZcX+q7m4Mf3SXUBVf23iymXRvILi
 NbfG8UXrmIgvtMpeEPwrRYdiJ/LI25oh97Q==
X-Gm-Gg: ASbGnctR0CKSY4l/C9j2UUXKYQiU4CUWucPnBBDKIspHx1AmXfLtZMgpXbi9lvjsywo
 jM7fH+bpV3Y7Yg/FgFXgKWndh8KX/6LkE5LFUXkuM4mBVkKJnXDWETugaa1vzh88uxbvghaG05N
 RozgU2TQc6bIrLtqqE/LisuCFmA4oyk/1/TOoVp+t8k4xt2DPJKPxtQIKMuiy7bKEARuE8ze9VG
 Vjbfaf1Tw44O28ZVw==
X-Google-Smtp-Source: AGHT+IFPgkzTBd9tes9+PQfhWEfLEzvwITrvoWHVUGH24ktFOBmrAuVaI+bG/AXvzWzRgDvtiJy30HX8bF8lYdTXaJ0=
X-Received: by 2002:a17:902:d2cb:b0:240:280a:5443 with SMTP id
 d9443c01a7336-2491e5df37cmr109441175ad.3.1756823797052; Tue, 02 Sep 2025
 07:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250902124050.2628822-1-colin.i.king@gmail.com>
In-Reply-To: <20250902124050.2628822-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 2 Sep 2025 10:36:24 -0400
X-Gm-Features: Ac12FXwZ7nacaEnLaE5ZJsACt3QtxMTwkwjMKrrERijGQCZdxbCuaPPlAFt-TOk
Message-ID: <CADnq5_Pbv+QHmFEeqV7HT1NY2zFnHAiZ4feb+=HSxoV5Rd=bSA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/amdgpu: Fix missing error return on kzalloc
 failure
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Sunil Khatri <sunil.khatri@amd.com>, John Clements <john.clements@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Applied.  Thanks!

Alex

On Tue, Sep 2, 2025 at 8:49=E2=80=AFAM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> Currently the kzalloc failure check just sets reports the failure
> and sets the variable ret to -ENOMEM, which is not checked later
> for this specific error. Fix this by just returning -ENOMEM rather
> than setting ret.
>
> Fixes: 4fb930715468 ("drm/amd/amdgpu: remove redundant host to psp cmd bu=
f allocations")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.c
> index 1d6e1d5de8fa..3696f48c233b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -448,7 +448,7 @@ static int psp_sw_init(struct amdgpu_ip_block *ip_blo=
ck)
>         psp->cmd =3D kzalloc(sizeof(struct psp_gfx_cmd_resp), GFP_KERNEL)=
;
>         if (!psp->cmd) {
>                 dev_err(adev->dev, "Failed to allocate memory to command =
buffer!\n");
> -               ret =3D -ENOMEM;
> +               return -ENOMEM;
>         }
>
>         adev->psp.xgmi_context.supports_extended_data =3D
> --
> 2.51.0
>
