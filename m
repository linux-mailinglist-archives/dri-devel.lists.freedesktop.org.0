Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD65C81C14
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 18:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3102D10E310;
	Mon, 24 Nov 2025 17:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ehm7B/OH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9824E10E30E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 17:00:32 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7c32c6eb79dso389304b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 09:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764003632; x=1764608432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+07sI1jmTiqtdmgsqPFnBoQvREXcQ5XyKFGFT4H4n8=;
 b=Ehm7B/OHqGnKizD0WWv2bB1agiudXPPT/lwRc2uL8GrRBOdm2KEatTznqUEwJNnsOI
 mf77xnImvOdBwh9tm5JW/tAeDqzZ6572HnUcOQZYlPt/xIYi/gNSXutoLtCxhbv9FfQu
 kv+vdXVYOeZF7bBWv8kSFlvFbqaSPtjwDpy6VXf4JT+kr+nH/Ll2adPABL1Ofv/fmMQo
 7W66lMAUHSHR60kXvptwRMDa9zd0H4UsiESasQWcDTcuE1EsGQxrB+vCdroFhNa7XFJA
 sEhdm3lfFNepjqC4SEibHi6N3m06Klr4JKAquD6648ue3mDppGXV9cz3alfUt86JNScW
 rZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764003632; x=1764608432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5+07sI1jmTiqtdmgsqPFnBoQvREXcQ5XyKFGFT4H4n8=;
 b=WwCJwNGS7/lsfpYhHkipFyPLXJWKzeHR8BXBjM78ZPparBPk9eX1OLQaiyhWoevyHy
 jlvoMx2aRhkkNKomObr8ubwE5r24N7wYCR0ANqIIv/+daytLkD7RJM+ntwXVNpHVVteJ
 0MDJBb9JzisaHuRc2JqMkOEUkNPf8fmPp03MymOeppU5DEXEFiezpcmWQ+Wa9l1nzc42
 Ov8fVG3uJ+vzcat+/oktqng7aXH5coO8j1CjvLauxT+sZk02hXDEWuyR8g4t/gaO+EQQ
 iJU9xb/U4G1suqKkfqasRhqEaxjGidLY7NC/IiMLyRzWTDFHo6CwrgQV8+bEna+kVrat
 WCSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTY07fCZCJVKds52HlSga4CHt1pIxZL32DH8YUDWuxXrQb3jCNkFqlctHAo3MuLVBP7lkqzs+Y6Bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXg2P0Wp7N1OMxK37Fit/iLyIQ3cCjIDr3zMqO++TNBka6cOod
 MOZ7WG485FHWt8aXPe+SbfxRdezuazPuI998+8zEXwQPPStEouE5FZjqPAUM463EcMhnd8gVnDb
 Pt2heDvLKWTcC1X26tXYJElDn9Z5hePo=
X-Gm-Gg: ASbGncvjQceLrUOsHROSJqzzkQ2r+1a53hJv4tSJ42wvPnAIToVYBF2JsiXOo5Vvo0Z
 G2Wnrvb4Y8hE4/tZpTTvsWl8Mn1JTQnRHV/DQ40zZ7E/IPIrSAmXKuFYvA2jXBjT9T/K+1T6PNv
 vsfLvI916EKChNJSNbBGaLM23lD9kTVW0FJSUGxbLdWr5WkLnnfQEPSlSIzYOlbxIRVUBCoqvjq
 bnTVJo1AJAcdpppCLRrHk33pVTuFUoFgCghodED0rttNCOzdqUJxYnsdw+DSEx85UjBsSg=
X-Google-Smtp-Source: AGHT+IH0bxO+rLSo8ZV5ToGoamqOSwZt9kWMFznXSJhOGP5uBimsN1SMbLsZ/76UkjiFdtVKGnCIY1sDMI70ddgT+b8=
X-Received: by 2002:a05:7022:441c:b0:119:e56b:c3f5 with SMTP id
 a92af1059eb24-11c9f38e94fmr6066643c88.5.1764003631612; Mon, 24 Nov 2025
 09:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20251124163615.6388-1-pierre-eric.pelloux-prayer@amd.com>
 <20251124163615.6388-2-pierre-eric.pelloux-prayer@amd.com>
In-Reply-To: <20251124163615.6388-2-pierre-eric.pelloux-prayer@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Nov 2025 12:00:18 -0500
X-Gm-Features: AWmQ_bmY2SH9XIQVf7sd2ArHJctl1Zx6871JnFEGWQl00z-o6miHb19uzQgBuyI
Message-ID: <CADnq5_M0u3s-hVaZu63sSMsj_mTBAPGyS3QHkAbgAC6OqHi-hw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/amdgpu: free job fences on failure in
 amdgpu_job_alloc_with_ib
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "David (Ming Qiang) Wu" <David.Wu3@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Nov 24, 2025 at 11:44=E2=80=AFAM Pierre-Eric Pelloux-Prayer
<pierre-eric.pelloux-prayer@amd.com> wrote:
>
> Otherwise we're leaking memory.
>
> Fixes: a35c520c1611 ("drm/amdgpu: clean up and unify hw fence handling")
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_job.c
> index 2fc3d9da0fe7..91f1232b7d41 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -246,6 +246,8 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device *ad=
ev,
>         if (r) {
>                 if (entity)
>                         drm_sched_job_cleanup(&(*job)->base);
> +               kfree((*job)->hw_vm_fence);
> +               kfree((*job)->hw_fence);
>                 kfree(*job);
>                 *job =3D NULL;
>         }
> --
> 2.43.0
>
