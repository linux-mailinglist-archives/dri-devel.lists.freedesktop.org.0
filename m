Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F361538CEC1
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE196F8E8;
	Fri, 21 May 2021 20:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098FF6E0C9;
 Fri, 21 May 2021 20:18:30 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id z3so20785055oib.5;
 Fri, 21 May 2021 13:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjKGAxpjBYq0AerrBLJXQGl7oHmLTtndw0QsIzcd7Bc=;
 b=N5nQeWt3lHmSFZOZ3XymWrrgevcuWGIBSpKi806RX9Bij72lgH5wWKoXorvE3IFIuw
 U6wf8lFnam6bXRkGrPuenYUjkZebvV6hfRWKWSl+4uIf5vy1QC48p51au6XRwMEHM+cj
 FyDyFLr6qDtgfho4DnEqnrf7EgyoaxYWnr3dG2ZYtsiIoV7CPeCNR3IfDUF4sLJUUij3
 W9sxTWznvZmIQt2skrHCbGiSsOCBrpIzPPQF8TexTHYo6M0me2CCxVoKmJ7/DVyI9cBD
 4co1KMfKQD7T4R/2EPlEpov3tqgEoJtmhYsHYqyRincKJhxLdmsayhtLiaBizZPaAVVm
 0ylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjKGAxpjBYq0AerrBLJXQGl7oHmLTtndw0QsIzcd7Bc=;
 b=MaaEkEKeQm6HZoKLe7QtaBpaaBLH3bvoO5gBBJs1iKQCiM25GhOxj4e4oB3/wjyOmb
 6250CLTQxopobstkTAXiBJltWwH0fYrnlTOsTZ4tgeIvtK/K7V+uWcnHMzJqDngP4A2C
 3nZI4jR5FYj9b2jX7o698xu0FxY/mXYxtjoe57epicaS8WE83fkbhjPUfnky4Q68//kI
 DyxKpiS7IAkNRu0B4lm4A6sVjbp12YRNDaGkqcomRqeaubkCZMHHTZVcKprI6ieE24kx
 FEyv25EuFEczsJT58MNKrzWRnA2r5eT79iJ83l1CCCEhaMxsjB/0HbcT7t7VLaTfOl+9
 mL6w==
X-Gm-Message-State: AOAM530o9ojSkRMb3qDNLx9MxTI/zZnSi4zIslSBmUOSyc/gPL4ECecz
 Z25W61i88gQ2W+vg795bDBIfu3lhT7GNEL6rSLw=
X-Google-Smtp-Source: ABdhPJwjQU1rq2vUudMes+RDRSnfshTdmv1Zff1MFj/vNHjA2L1hw5yG9Q5vBoj11RnA2C0c14GffZJnYYl0XNgCdeo=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr3435810oiw.123.1621628309437; 
 Fri, 21 May 2021 13:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210521201412.746745-1-andrey.grodzovsky@amd.com>
In-Reply-To: <20210521201412.746745-1-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 May 2021 16:18:18 -0400
Message-ID: <CADnq5_OVAVet7b614cDc0rS5fzwarjFtyP3nc9Ute3k5Hnbz1g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix crash when hot unplug in BACO.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 4:14 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Problem:
> When device goes into sleep state due to prolonged
> innactivity (e.g. BACO sleep) and then hot unplugged,
> PCI core will try to wake up the device as part of
> unplug process. Since the device is gone all HW
> programming during rpm resume fails leading
> to a bad SW state later during pci remove handling.
>
> Fix:
> Use a flag we use for PCIe error recovery to avoid
> accessing registres. This allows to succefully complete
> rpm resume sequence and finish pci remove.

Might make sense to create a preliminary patch to change the name of
this flag to something like no_hw_access since it's not specific to
pci error handling.

Alex

>
> P.S Must use pci_device_is_present and not drm_dev_enter/exit
> here since rpm resume happens before PCI remove and so the
> unplug flag is not set yet.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1081
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index d8db5929cdd9..ab95ebf56636 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1555,6 +1555,11 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
>         if (!adev->runpm)
>                 return -EINVAL;
>
> +       /* Avoids registers access if device is physically gone */
> +       if (!pci_device_is_present(adev->pdev))
> +               adev->in_pci_err_recovery = true;
> +
> +
>         if (amdgpu_device_supports_px(drm_dev)) {
>                 drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
>
> --
> 2.25.1
>
