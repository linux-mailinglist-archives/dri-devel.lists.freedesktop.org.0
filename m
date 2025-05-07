Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E4BAAEC12
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED07210E87A;
	Wed,  7 May 2025 19:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pZbq2NFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942F510E02B;
 Wed,  7 May 2025 19:14:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7F8F3A4DCB0;
 Wed,  7 May 2025 19:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D79C4AF0B;
 Wed,  7 May 2025 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746645253;
 bh=kvxfAt9mZdWf/uEiEG3518AtWtSuCcxF7ycxWMiGbRo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pZbq2NFBTmWMndrDDRcWVEDka/k3TfXkmYw+5EfXtW3F+HwKP3oqDkhxOcbnw9vl+
 j2R9maX7JimD8JXQhqzkGGUEN9d7M838KENSwWMVOzvi6wjV3ByhE3iMGgX5u+65YS
 N1ouUNbCoTJHNxZQ5h9DjRZMuQmE27F+ipOD2LEJcnnESH34jOY+EYm+oaAqXfFmHd
 gFf7L745N9qFKi1oshyf/eAGrEQ5tfgWfL4BeQ+ypcTN4bdmem8x/aCxSiL5+2OPPP
 czTU5qXK6o7C4c3RAiD4JL9zizfhaAIa047C1qlUS7S3HuPgwnCuI6Oos7qtSUWt+g
 5IsaeZ/oVwCag==
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-72c47631b4cso95705a34.1; 
 Wed, 07 May 2025 12:14:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWo9aGPstnDAzyn6mPE34oLR0pQEOVPKkXiMn9crwUYGOsRqDkMT3XkhB23ldePRO+zWmadkqE0+TdQ@lists.freedesktop.org,
 AJvYcCXQO1685SpuxWJkHupfianAT4/zGy6ChDukw7jGaREVWuWIWWjlpmdB+gLbc8UyQgJnrXf2d8TS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTr5E1biBfOOrSoJdEYwQhUU90MgZlJ+rx7+ATEx7/F357DU/4
 vu5YmVxYq1o4ORCKxrO33pPguzTKeOhVts+5a0I5jJfOTr4rGfJsgtwKOMoBhuaCvuNAVh7IyUo
 +FbRvWszc/z3uE5TE5ObN3P1nUM0=
X-Google-Smtp-Source: AGHT+IE3jXSjGIIfI91jHEVc3h4Cxa573NLi6+6W00fLbnV16KozMGvO2lXXGZJOwey2fzVqDNLIJrnzqPug+7yMk78=
X-Received: by 2002:a05:6870:702a:b0:2c2:304b:b94f with SMTP id
 586e51a60fabf-2db8140cfc6mr513447fac.13.1746645252404; Wed, 07 May 2025
 12:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250501211734.2434369-1-superm1@kernel.org>
 <20250501211734.2434369-3-superm1@kernel.org>
In-Reply-To: <20250501211734.2434369-3-superm1@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 7 May 2025 21:14:00 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jwO9nv+mnuHy7fbdf4rNW1VW-zLp611ywppzFt3vzy1w@mail.gmail.com>
X-Gm-Features: ATxdqUFOGk9YGDM06KNvT2yGAglzogvXYMO4gKjLzkN35bu358LIPVBevHRiGE4
Message-ID: <CAJZ5v0jwO9nv+mnuHy7fbdf4rNW1VW-zLp611ywppzFt3vzy1w@mail.gmail.com>
Subject: Re: [RFC 2/2] drm/amd: Use suspend and hibernate post freeze
 notifications
To: Mario Limonciello <superm1@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:HIBERNATION (aka Software Suspend,
 aka swsusp)" <linux-pm@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
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

On Thu, May 1, 2025 at 11:17=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> commit 2965e6355dcd ("drm/amd: Add Suspend/Hibernate notification
> callback support") introduced a VRAM eviction earlier in the PM
> sequences when swap was still available for evicting to. This helped
> to fix a number of memory pressure related bugs but also exposed a
> new one.
>
> If a userspace process is actively using the GPU when suspend starts
> then a deadlock could occur.
>
> Instead of going off the prepare notifier, use the PM notifiers that
> occur after processes have been frozen to do evictions.
>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4178
> Fixes: 2965e6355dcd ("drm/amd: Add Suspend/Hibernate notification callbac=
k support")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 7f354cd532dc1..cad311b9fd834 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4917,10 +4917,10 @@ static int amdgpu_device_pm_notifier(struct notif=
ier_block *nb, unsigned long mo
>         int r;
>
>         switch (mode) {
> -       case PM_HIBERNATION_PREPARE:
> +       case PM_HIBERNATION_POST_FREEZE:
>                 adev->in_s4 =3D true;
>                 fallthrough;
> -       case PM_SUSPEND_PREPARE:
> +       case PM_SUSPEND_POST_FREEZE:
>                 r =3D amdgpu_device_evict_resources(adev);
>                 /*
>                  * This is considered non-fatal at this time because
> --

Why do you need a notifier for this?

It looks like this could be done from amdgpu_device_prepare(), but if
there is a reason why it cannot be done from there, it should be
mentioned in the changelog.
