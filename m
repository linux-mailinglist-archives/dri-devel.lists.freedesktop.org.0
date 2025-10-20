Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4D4BF2ADA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 19:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B4310E491;
	Mon, 20 Oct 2025 17:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rvl/jEr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1793010E492
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:21:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CA4C748C74
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F876C19421
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760980889;
 bh=uI5rsFpiE13xOKlRUr0iIvhiw/jg45u3VMFRQxTK9Hk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Rvl/jEr3JCHqO7eVAcQ2vXHc4Cei02Xx6mPp//9vMReOYECUZuKOyRBR+1PEWGaA4
 OC0QZ6+t4kJMRFIJJbJwgZCdpcAw2s+dHkmCCjHU8VD3ZOQfjrhuCJMGfag72QqfST
 I6Bjc3dq6SeRjZPSjcR4FRNU4IzbZOd1U5dX3vXYoLcineMF8fz0zHbLkjqc5U7cVu
 Cd9hm3ahpdusMDDvIl2HRGLy8LUR6Waqfjv8u+TxMUWHeo0AdDkaU0DglgUQjOry2z
 idCNbCNd0uJEi7ZLN1dkaMUI5FaCTKSVGDAWAOwqRqPi0ybiqtwFwuXMvdj2g3UhKw
 zwRUsrO/I+V6w==
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-3c97c98c791so2660567fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 10:21:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUN7hYpgkI5nRQn8AWuJqrPxcsi94VR9ZW+BvRzefvKQwRCDP2j9Y7Q/vOo9qsVFiO9TopdR649HfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQs+w4bUHe9V8oyIfwlPxCNiQU8E2Qr4JZwhFkeXXduipwM+GC
 m7qWd4oV1eleAkPFfu95/yogryIAn7gNSj0Frw3gOU0k8LVwRM/w7Arc3LtKL98kmdkIagkBDq7
 CsDovl4Wfnr7ZaLJSB2AA8jUp6Itq4mg=
X-Google-Smtp-Source: AGHT+IFU0bU8fKZ0Wua75/5pRYAXjg6ICdC5ZIAIZU0v6VlGJqQRFSAEBuztx/l/Pivh+cm/UonHIHXKPVckX8HLNyQ=
X-Received: by 2002:a05:6871:2e90:b0:387:9b79:a61b with SMTP id
 586e51a60fabf-3c98cff3fd9mr5575729fac.22.1760980888969; Mon, 20 Oct 2025
 10:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251020165317.3992933-1-superm1@kernel.org>
 <20251020165317.3992933-4-superm1@kernel.org>
In-Reply-To: <20251020165317.3992933-4-superm1@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Oct 2025 19:21:17 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gsdmfXUJuLW8Ogt2jKDunx4g51LqCfSVMWQ6WHXBw_zg@mail.gmail.com>
X-Gm-Features: AS18NWChU2EP-kmiSeBpXBkZQsZMUWO1qaU0RIWwAVoz1ykVcHqEMNRFvTKh8NY
Message-ID: <CAJZ5v0gsdmfXUJuLW8Ogt2jKDunx4g51LqCfSVMWQ6WHXBw_zg@mail.gmail.com>
Subject: Re: [RFC 3/3] drm/amd: Return -EBUSY for amdgpu_pmops_thaw() on
 success
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: mario.limonciello@amd.com, airlied@gmail.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, dakr@kernel.org, gregkh@linuxfoundation.org, 
 lenb@kernel.org, pavel@kernel.org, rafael@kernel.org, simona@ffwll.ch, 
 Muhammad Usama Anjum <usama.anjum@collabora.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
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

On Mon, Oct 20, 2025 at 6:53=E2=80=AFPM Mario Limonciello (AMD)
<superm1@kernel.org> wrote:
>
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> The PM core should be notified that thaw was skipped for the device
> so that if it's tried to be resumed (such as an aborted hibernate)
> that it gets another chance to resume.
>
> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 61268aa82df4d..d40af069f24dd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2681,7 +2681,7 @@ static int amdgpu_pmops_thaw(struct device *dev)
>
>         /* do not resume device if it's normal hibernation */
>         if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_susp=
end())
> -               return 0;
> +               return -EBUSY;

So that's why you need the special handling of -EBUSY in the previous patch=
.

I think that you need to save some state in this driver and then use
it in subsequent callbacks instead of hacking the core to do what you
want.

>         return amdgpu_device_resume(drm_dev, true);
>  }
> --
