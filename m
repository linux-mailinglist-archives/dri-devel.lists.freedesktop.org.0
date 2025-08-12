Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143DB22E0F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 18:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEA910E05B;
	Tue, 12 Aug 2025 16:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dH7K753T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A3610E05B;
 Tue, 12 Aug 2025 16:46:24 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2400145aa5aso7192605ad.2; 
 Tue, 12 Aug 2025 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755017184; x=1755621984; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=USPFLLOKabQENCa/2/HmAk7p8VGjHmr7nMXA6HKhXog=;
 b=dH7K753T542a60yvsHHK7MJmRLKUBwLcN0w1UEj+h3x0YzSf3gBWMJjJwWrw56vURV
 3RGP5gN1KLGO2U3qH54pcYoo1kFcVXwmQZ5YduP8OPeJ/h1394QeHDrGYX2i+PX2/Fvw
 fmr9oLxpWYPLO2quw0R7p40kjiybFfEHaWE8v47eZqq7LKscXXhEKBvtDUus0XXsrNco
 fI9K7ysmLg2QmflOs78EQkFL+bXc/t9ZtyO74LUo+TJ/aZFHf84LMAUNI97TUdIhC1ge
 1iuP/7usIP0jLF2TjvAnifa/1kAfaOxpzJdq6O6GPafH2d8dUY2eI8TtL5mtXcPjIoJ/
 eaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755017184; x=1755621984;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=USPFLLOKabQENCa/2/HmAk7p8VGjHmr7nMXA6HKhXog=;
 b=mh5QAC7GuxZU4a77ZQ+tvHqMLUu9RjcJAeFTsd0VCwkO0ijh+qAn0UDp5W2iodncAO
 GLlzgbA/xNQLyTX2OkjfJ9sgZpn1gOnD/wayP2cBOkr/pSsprn2JnOp626I+F56aCn5j
 6rYKCiuDZV7uvGPhQ8Tj961oGUTWzTE8sGKHADy3Aj54ebKjsYY0swkEdhs40fWp8zG7
 hM7UBje5kszwmmGBFGKGtm1BnuHTD6l9eHN9i3WWgVk64D0tfs4VZRBjb/o+rVqVBANT
 ivjqtmZErNjBOfRSBKY7F8iNqwIKCvhTWnWIewGkC1QpADPMOn9DPJ51l/BSwsGmgPae
 dS8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDT2xFwCN6Z0kMlJXCJ0zaCi29RCjncFEIcbMeMKmHoN2p3Xg40OJDYcVgd85aKy5QQ8paE7AA@lists.freedesktop.org,
 AJvYcCXigXSBQ+SaKkzhK0KQ2Fh+4gXPrldL7Jwuc83GPu5IaMiayymmmcszZ+gLcNOMFJPVQfwFvc/AVlAY@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyqhl+q1zqqN1u+MvHYfS6TQwYhZ5CY8b/Oh4YC2LSbcjA28g3F
 ndqteTEN+CWwQbw0TZHbGmRUGnR07+LHXBh8d7bv6TOCQU9DMKa0s3rQ8VG74RB5Fc+nfgMul0+
 AIpQ5tq5z3rDSz0nvb3u9XnJQKxqKUYc=
X-Gm-Gg: ASbGncv8N+XKJtheijXvbSnaolfY8EWmejj/+4sUAZWwULqXjfQkD5siZxL6wc9yi05
 ZA3PHC30+H1mPQ28AGU7VIWh4va5k4TL9wlVmTsessi3roNsm3d6bZgX+ziSxz391xKE0cWAn5i
 RTkNEymtESDoIa/nZ7Qta7s91EsXsOLpV0DLlfoijbKNTU9D/sEyw4xxsclQluNtbSL7u98f+rZ
 uL0I4Qj2kYvj+I8wQ==
X-Google-Smtp-Source: AGHT+IHF1kIGWY054cGjdVbveA50uwXOVq+jDM9Mm6EaLoFzcA0qIVghSloC2lGUEWAwHkw2f+pVgxP0txXalE+Im9c=
X-Received: by 2002:a17:902:c403:b0:240:3e5c:476b with SMTP id
 d9443c01a7336-24306922280mr13308645ad.3.1755017184153; Tue, 12 Aug 2025
 09:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250812083208.53809-1-rongqianfeng@vivo.com>
In-Reply-To: <20250812083208.53809-1-rongqianfeng@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Aug 2025 12:46:11 -0400
X-Gm-Features: Ac12FXxlBngCDP3QV-1TzQwHhARxDaRo_kVC615Woiv2wEL4cZJCtOfmTG9U064
Message-ID: <CADnq5_OuicNuLOhOXhotQ1gKx4MfzRpByMk5bdFut-smCwvpEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Use boolean context for pointer null
 checks
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dillon Varone <dillon.varone@amd.com>, Alvin Lee <alvin.lee2@amd.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org, 
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

Applied.  Thanks!

On Tue, Aug 12, 2025 at 4:38=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.co=
m> wrote:
>
> Replace "out =3D=3D 0" with "!out" for pointer comparison to improve code
> readability and conform to coding style.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  .../amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c | 2 +-
>  .../amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c | 2 +-
>  .../amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c   | 2 +-
>  .../amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/d=
ml2_core_factory.c
> index 28394de02885..640087e862f8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_f=
actory.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_f=
actory.c
> @@ -10,7 +10,7 @@ bool dml2_core_create(enum dml2_project_id project_id, =
struct dml2_core_instance
>  {
>         bool result =3D false;
>
> -       if (out =3D=3D 0)
> +       if (!out)
>                 return false;
>
>         memset(out, 0, sizeof(struct dml2_core_instance));
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2=
_dpmm_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/d=
ml2_dpmm_factory.c
> index 3861bc6c9621..dfd01440737d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_f=
actory.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_f=
actory.c
> @@ -20,7 +20,7 @@ bool dml2_dpmm_create(enum dml2_project_id project_id, =
struct dml2_dpmm_instance
>  {
>         bool result =3D false;
>
> -       if (out =3D=3D 0)
> +       if (!out)
>                 return false;
>
>         memset(out, 0, sizeof(struct dml2_dpmm_instance));
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_=
mcg_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2=
_mcg_factory.c
> index cd3fbc0591d8..c60b8fe90819 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_fac=
tory.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_fac=
tory.c
> @@ -15,7 +15,7 @@ bool dml2_mcg_create(enum dml2_project_id project_id, s=
truct dml2_mcg_instance *
>  {
>         bool result =3D false;
>
> -       if (out =3D=3D 0)
> +       if (!out)
>                 return false;
>
>         memset(out, 0, sizeof(struct dml2_mcg_instance));
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_=
pmo_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2=
_pmo_factory.c
> index 7ed0242a4b33..55d2464365d0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_fac=
tory.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_fac=
tory.c
> @@ -26,7 +26,7 @@ bool dml2_pmo_create(enum dml2_project_id project_id, s=
truct dml2_pmo_instance *
>  {
>         bool result =3D false;
>
> -       if (out =3D=3D 0)
> +       if (!out)
>                 return false;
>
>         memset(out, 0, sizeof(struct dml2_pmo_instance));
> --
> 2.34.1
>
