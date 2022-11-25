Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FB5638FF0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 19:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375E210E78E;
	Fri, 25 Nov 2022 18:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5EC10E138;
 Fri, 25 Nov 2022 18:37:16 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q83so5225028oib.10;
 Fri, 25 Nov 2022 10:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JrIWWTArvfw6qlTZXNbMb50dkrBaGnKBPGMIkmPfyYs=;
 b=C4P2Vrl7hEIEB7F7Xtn4OUTi1QbIyZ6edjOOihE8vmHswgNMfx3/VNBIdAJgmHIj8z
 E3KcZ+hHke0dsBtKfjT4rXUpuC0mSZvHvcePwIIXAf8NuA/gPTF3+fByN/FpBD/BioNC
 q4674HA5KKMBc4ctZbPNqUi+bbUEn1L0f3L3ja1qdVD+Su/nR1RGsFayuHBBJuEpDaHe
 30929pdB0fofxGKMYoB5BUuyFnDbv0NGtrQssBDSc/5ISYBj2iOxRhJSc2q6H8OeQqBw
 0TjSpeWLX3DTci40Mi0gkC0TRkcAuC6XvGq704rK4EelFkjLXzEN+1OzgKxpaKMYPDhx
 gwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JrIWWTArvfw6qlTZXNbMb50dkrBaGnKBPGMIkmPfyYs=;
 b=XSBKMe/AMFOsa0K8JSujkvTLJ/FJAWeWm4LWYGulYp1GbK2Yo++q6WWQsQLzM8pvU8
 lIeSZGA9ySi1aGXQYjKD/zIKUIVYsVisOpoUd6TKMGeWM3jvl6/eyfpPbi+L+PyW+hFr
 yqxcZVn1Qpl4r4HhIYhIqzTU/wuYepFsXlIxaPQj5NF+CRsUi5X8U/SZfaTr+ODiiWTv
 sdZ/q+xFJQr0VwU3xSa7ZgDj4wJNjrkDrRl8mAWSeo35b4NMW6JscK1191nY7lamuuKw
 khNiIEGvIzG75/cgKdr/+r1y1JlY6C4epu7kFL/hAxwtks8A5PlH6wj8j0aV39VeF2Dc
 QR3Q==
X-Gm-Message-State: ANoB5pkHeMDMci6d6ta5LbtJHj+LAV49tm1d3qC3B3Fd2vGgB/SKIg9a
 X4koc01QuPHg1+xu9NybPd9+8KRYcj9S560grx4=
X-Google-Smtp-Source: AA0mqf7G6q+3dXnRLytPX3s0qOai1gefxjo8z+tNKT990k/9qYMqWR+fuE1aVHZuVFgWAr0e/o58PBt/0dLnzzJKDgw=
X-Received: by 2002:a05:6808:9b8:b0:34f:97ea:14d with SMTP id
 e24-20020a05680809b800b0034f97ea014dmr9477171oig.96.1669401435418; Fri, 25
 Nov 2022 10:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20221122113043.18715-1-wangxiongfeng2@huawei.com>
 <20221122113043.18715-3-wangxiongfeng2@huawei.com>
In-Reply-To: <20221122113043.18715-3-wangxiongfeng2@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Nov 2022 13:37:04 -0500
Message-ID: <CADnq5_Piq=o_OHh=tdLs8UZQGbYd8SAPBswoZHytE+MnD7Mvag@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Fix PCI device refcount leak in
 amdgpu_atrm_get_bios()
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>
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
Cc: Xinhui.Pan@amd.com, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, yangyingliang@huawei.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Tue, Nov 22, 2022 at 6:13 AM Xiongfeng Wang
<wangxiongfeng2@huawei.com> wrote:
>
> As comment of pci_get_class() says, it returns a pci_device with its
> refcount increased and decreased the refcount for the input parameter
> @from if it is not NULL.
>
> If we break the loop in amdgpu_atrm_get_bios() with 'pdev' not NULL, we
> need to call pci_dev_put() to decrease the refcount. Add the missing
> pci_dev_put() to avoid refcount leak.
>
> Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> index e363f56c72af..30c28a69e847 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> @@ -317,6 +317,7 @@ static bool amdgpu_atrm_get_bios(struct amdgpu_device *adev)
>
>         if (!found)
>                 return false;
> +       pci_dev_put(pdev);
>
>         adev->bios = kmalloc(size, GFP_KERNEL);
>         if (!adev->bios) {
> --
> 2.20.1
>
