Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFE221245F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 15:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1116E073;
	Thu,  2 Jul 2020 13:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4486E073
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 13:16:22 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s10so28267597wrw.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=nC8Lz2S3EJ6vZ8/1nqOq5YPWNqhdwapmW7150qhoX70=;
 b=aZmuATkxN/T6ldpfVP9oIFv/9MPvKQJaWmFWtXeCizxERJyB0kmerR8d9J/2QG92gR
 wFf/e3ARMhNbdik7W71HDtbl9Tokf8XkywH1oQWJVsk0yHWffMp0jWt4PLuE9YJXoiGV
 NMb+oJ3sXAXjczCrTHPemuNtyUbfJCqlQSN4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=nC8Lz2S3EJ6vZ8/1nqOq5YPWNqhdwapmW7150qhoX70=;
 b=XPgFvR/VCtdU1GLMbZUyxs83K9Gu/GrbbDRGdxyMdDYu1483CDZwwJHeW2mm8aNnIx
 ZhnFevFhxWWUZVPYKRfuqogihewC96sRlQD7f1tfqRGW3703/Bsh1oNH+g+pME2YTOum
 2Zgd/Nz2t2d4a/lmwRpvv4cQM3lwFdJxDhjd1PR99LhctQb0X7nSchjT2ousKzjjZ9l7
 AP7B+Ks/hbVp7zkXercMEazfa5EHWsYR4hsjg+NERszdRpKNk4Lp4UnXSbSJAbTeLrW0
 dnTr5IxXtgC+xjm0v0fVbeAxgYSP+SpCDtyCSCFhuPkN6vmZYZ7zvWrWdw81kKnTixnW
 GhPw==
X-Gm-Message-State: AOAM533YN6V70tlxBFE6uXEGxfofvl+M+hwswr+USAIAPRDZm5VMft5P
 ZujVfbwrn/+/BtOqelna3A4mrQ==
X-Google-Smtp-Source: ABdhPJzOcOeKpBUEH4Z3UMS97wgUix2XhD4klj7oKwRt/2qndlfGdZO7UwA9Ri3x6xavOubdbiZTbw==
X-Received: by 2002:adf:fd46:: with SMTP id h6mr9845741wrs.105.1593695780741; 
 Thu, 02 Jul 2020 06:16:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e23sm10144322wme.35.2020.07.02.06.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 06:16:19 -0700 (PDT)
Date: Thu, 2 Jul 2020 15:16:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/hisilicon: Use drmm_kzalloc() instead of
 devm_kzalloc()
Message-ID: <20200702131617.GY3278063@phenom.ffwll.local>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>,
 puck.chen@hisilicon.com, airlied@linux.ie, tzimmermann@suse.de,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org, inuxarm@huawei.com
References: <1593652914-19639-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593652914-19639-1-git-send-email-tiantao6@hisilicon.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org, kraxel@redhat.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, tglx@linutronix.de,
 inuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 02, 2020 at 09:21:54AM +0800, Tian Tao wrote:
> using the new API drmm_kzalloc() instead of devm_kzalloc()
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index a6fd0c2..2f20704 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -23,6 +23,7 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_managed.h>
>  
>  #include "hibmc_drm_drv.h"
>  #include "hibmc_drm_regs.h"
> @@ -267,7 +268,7 @@ static int hibmc_load(struct drm_device *dev)
>  	struct hibmc_drm_private *priv;
>  	int ret;
>  
> -	priv = devm_kzalloc(dev->dev, sizeof(*priv), GFP_KERNEL);
> +	priv = drmm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);

Hm would be nice if hisilicon could entirely switch over to embedding, and
stop using the driver private pointer. Quite a bit more work though. As-is
this change here isn't really brining you closer to that, pretty much all
the lifetime bugs around hotunload are still there.
-Daniel

>  	if (!priv) {
>  		DRM_ERROR("no memory to allocate for hibmc_drm_private\n");
>  		return -ENOMEM;
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
