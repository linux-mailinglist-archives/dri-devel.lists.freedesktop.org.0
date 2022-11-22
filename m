Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C60B1633F3D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 15:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB7510E401;
	Tue, 22 Nov 2022 14:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFBF10E3FB;
 Tue, 22 Nov 2022 14:49:50 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id h132so16071277oif.2;
 Tue, 22 Nov 2022 06:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hwgro+Mm4grcLsTI4z1CQ0gU6+UP66+rkYIgqXTF/rQ=;
 b=hpFYUH249Ic1nL0AqhXFotGqEgkRx8sf1g9pza49gOxeUJLCAzb7JsbpO3oHEz+XD6
 bJ+nyZAFg/XR2OtRO39KOI2/1fyZO2t9F5ils9Cvn5xnt7X2MItbBMvK8bwg+jPsny9c
 xrJ4NdhFWaDAi8XLrj600h/Jqjn2uoJqlhnPBAim2UFijNX9DyAX+beFBHuocfyRB5Gv
 nhfh5AaREN84WTay/HtyFpBVv8RUl5iad7XIrEOZcIVtYS2utU/lPMSmCFnSa9/zbXwm
 cclPBnUkkSp/TjxpaxXfkqv3z1HRQdrHOi75bn4h0ISfioHrk/XMnY0s1LXtbmoiQYAR
 N40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hwgro+Mm4grcLsTI4z1CQ0gU6+UP66+rkYIgqXTF/rQ=;
 b=5AqDavWvFMecW3ARH28M1v44+DA9Ti8hSsQ1KbG/4vB3+Lybh1G18Mu2pFnoZKJQ20
 uZxpzqdbh81nzKIj2ftvn19PLjQI6YvL9QGMQN8acsu6l3uKpW15ifz2SD0ppySEsH54
 Q1YCG7VuBCwdFZnGuAWM5XzjQiC32LKIVQFRoBGrwpyuF4Z7hHXPJtAggpf917Es4VMa
 RqPrt/vrO1Z3O3Pa7MEKiAhR5VAQfwY607f7D4PIDQyJrR6ChmoeX1sUKw3lBrM36N42
 pRp30XpB+RLFky5KQr0p4pw+RDifwUZFClHYHj0bmhULXNZyjtMReqbLShzFQFROBhCd
 +QlQ==
X-Gm-Message-State: ANoB5pngXMOL58Yt3AUx+sN5I39OIEB3U8CnNZkf456FoheT2p9NY3Eh
 +1pXniftrZ+xDBHZSup+YoFLCX8OPwz2U7F7t3k=
X-Google-Smtp-Source: AA0mqf6pR02AvMqIQNHUy/xIW6cpnuZtBTZtDyYB2bN4HiiF4twoE9RF3lIvW3txzEnSq0pOHz2WFAjBVHIA3Tbj5tk=
X-Received: by 2002:a05:6808:9b8:b0:34f:97ea:14d with SMTP id
 e24-20020a05680809b800b0034f97ea014dmr1764935oig.96.1669128589816; Tue, 22
 Nov 2022 06:49:49 -0800 (PST)
MIME-Version: 1.0
References: <20221122113043.18715-1-wangxiongfeng2@huawei.com>
 <20221122113043.18715-2-wangxiongfeng2@huawei.com>
In-Reply-To: <20221122113043.18715-2-wangxiongfeng2@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Nov 2022 09:49:38 -0500
Message-ID: <CADnq5_NxLhU+zeNv4Esm=3Wn-=qHkRCzOmqT9a208BVZUn29pw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/radeon: Fix PCI device refcount leak in
 radeon_atrm_get_bios()
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

On Tue, Nov 22, 2022 at 6:12 AM Xiongfeng Wang
<wangxiongfeng2@huawei.com> wrote:
>
> As comment of pci_get_class() says, it returns a pci_device with its
> refcount increased and decreased the refcount for the input parameter
> @from if it is not NULL.
>
> If we break the loop in radeon_atrm_get_bios() with 'pdev' not NULL, we
> need to call pci_dev_put() to decrease the refcount. Add the missing
> pci_dev_put() to avoid refcount leak.

For both patches, I think pci_dev_put() needs to go into the loops.
There are 2 or more GPUs on the systems where this is relevant.

Alex

>
> Fixes: d8ade3526b2a ("drm/radeon: handle non-VGA class pci devices with ATRM")
> Fixes: c61e2775873f ("drm/radeon: split ATRM support out from the ATPX handler (v3)")
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
> ---
>  drivers/gpu/drm/radeon/radeon_bios.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
> index 33121655d50b..2df6ce3e32cb 100644
> --- a/drivers/gpu/drm/radeon/radeon_bios.c
> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
> @@ -227,6 +227,7 @@ static bool radeon_atrm_get_bios(struct radeon_device *rdev)
>
>         if (!found)
>                 return false;
> +       pci_dev_put(pdev);
>
>         rdev->bios = kmalloc(size, GFP_KERNEL);
>         if (!rdev->bios) {
> --
> 2.20.1
>
