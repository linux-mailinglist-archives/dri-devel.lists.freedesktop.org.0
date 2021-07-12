Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22F73C6B01
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 09:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275896E044;
	Tue, 13 Jul 2021 07:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2866E8954A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 15:45:19 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id q18so44210018lfc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3GNvIH6j09xn0UtxxsHhKVyd4bEJY1cjA3GME8Lc8HI=;
 b=QCfuS/XYtlCppa+2qMm54M+hT6v31+LtSjps+wO6F+Wco1guXqwJhgIH0o49Eqr3wl
 eIoIBfG5Mkq6Owac8YIbFIZlTf4pJ9jUmfnS2TEEAccmYrLFt+5FvJiYZcAqwpQ+iENL
 c0TDqdeTNWzCrc9TZKnSDisBU0lZ3FAa5unjwuKFEAPwVsi1ydIffTL3u/fvdapMVz/R
 D4bAr+GtTZ/d2D6IWoFWrRckimXYPRXltfvaWqRBE4x8RAWxdcgmOFjidJEpd8Ke1rx6
 QW8iJclLAOGmtmPNszsuCBG1qgirzFWBxVomAqnVXoQ5M5FEG4HV+iM5nZqL8G0y4T/I
 l7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3GNvIH6j09xn0UtxxsHhKVyd4bEJY1cjA3GME8Lc8HI=;
 b=ft3umU88CWM8ui0GqxvOp2GDzHKLhymOyWd+YJIpgw9uHm7OVuvOuy1zDDxioL85J8
 OuKkJIRk2k6KacF0ICHM2JY0IAyDEjISxBcoyV4tAY/CmaJkv/zht2yQHUrba4nwZspc
 5mybZn5N6XTOuhukNy/jW8YxDAi+Ylyhcr5PZKJorS532DjLzlQMbk4pZcM6RY0ZuzZ5
 4l6XVit6aqHKjBM79xQxUrUHIT9++LgTfxmBQxm0ExvvgZ912SI62VtdfeU0/PlCpnYg
 C+b8VaA+aDLKqMLd/wJ9+dypMh/jsgcBY3SAfBFVHbIhKw2OsKRK23vfuifZ7mnJuajN
 2gOA==
X-Gm-Message-State: AOAM5300/7h50oC+OzGa3L2aSGX4CPLluBO0BNnvY8nPZW40/JdXqMw9
 lgoRZxIsDyzTQrb3yQvwlTU=
X-Google-Smtp-Source: ABdhPJyJVskDrBRGSJZYKAo0ZdxTWrid0o2++dvWaMkvyHpvDLQmrMRqPq9ED/dwh5FVhcEKt4KPaQ==
X-Received: by 2002:a05:6512:16a6:: with SMTP id
 bu38mr40200056lfb.92.1626104717618; 
 Mon, 12 Jul 2021 08:45:17 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.79.81])
 by smtp.gmail.com with ESMTPSA id v18sm630572lfp.194.2021.07.12.08.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 08:45:17 -0700 (PDT)
Subject: Re: [PATCH] drm/shmobile: Convert to Linux IRQ interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210706074900.8928-1-tzimmermann@suse.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <b4db77fd-4526-8a09-04ee-272d90977cb4@gmail.com>
Date: Mon, 12 Jul 2021 18:45:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210706074900.8928-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 13 Jul 2021 07:09:45 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/6/21 10:49 AM, Thomas Zimmermann wrote:

> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 0a02b7092c04..032a2fff5efd 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
[...]
> @@ -258,7 +256,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>  		goto err_modeset_cleanup;
>  	}
>  
> -	ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
> +	ret = request_irq(platform_get_irq(pdev, 0), shmob_drm_irq, 0, ddev->driver->name, ddev);

   You can't call request_irq() on the result of platfrom_get_irq(), you need to check ifq >= 0 first!
You really need a local (or even global) variable for the IRQ #...

[...]

MBR, Sergei
