Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC53345CCD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE996E869;
	Tue, 23 Mar 2021 11:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E396C6E869
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:28:41 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so12794454wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 04:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8LbqrlY0e/I2k2EOkhIXKnRaA0GFx4v9lyKMDDc0jhM=;
 b=k0jmybG3gvdFRjkkD5DJzKUK/4yGp7X0FvK0jhfat4SBGIm2HKsAcAnGOVxosXxZif
 BX2wPrsmUGCcS+lte7znTiRA3u2AbJix8C6vTwP4c96Qux6fDEBMzEUpkDCzfvABVjck
 Qe0JPSuM76nhLsUMZXAluMko4xwL2r28/EpRK0fiWLpFXJuF795o1mDRcWiD25Drz0aE
 qu5sZshFPsu1k9ijNT5z+1L2fpWbVEr12ShxAqjhdMZtERCFGDas8cZuAcy3m8gDlPPe
 /Vqp/S1nbv4aRvXPdkPtbjsQGEKlTpp+6ZAyKKOkhCK47ixLup/1Hc9zSzVHqNsmi2xs
 8a5g==
X-Gm-Message-State: AOAM5311UxGUKxtnlZTR5eBEDyJu//qW83FUHtWxrhiapzEgzc8AARic
 99oXyQLMgy7RPgptCCLm+N0=
X-Google-Smtp-Source: ABdhPJzfQNTkQtfE9Jt/vjGsMVVTfI4aNamprQvdmWk3kTbMn0ewGjrwQkPpKUx+ONN5WOO2vjw7gg==
X-Received: by 2002:a7b:c0d1:: with SMTP id s17mr2848291wmh.153.1616498920672; 
 Tue, 23 Mar 2021 04:28:40 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id t1sm23144490wry.90.2021.03.23.04.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 04:28:40 -0700 (PDT)
Date: Tue, 23 Mar 2021 11:28:38 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Subject: Re: [PATCH] video/fbdev: Fix a double free in hvfb_probe
Message-ID: <20210323112838.xrastmol4fnxqxub@liuwe-devbox-debian-v2>
References: <20210323073350.17697-1-lyl2019@mail.ustc.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323073350.17697-1-lyl2019@mail.ustc.edu.cn>
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
Cc: wei.liu@kernel.org, sthemmin@microsoft.com, haiyangz@microsoft.com,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, kys@microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for your patch.

I would like to change the prefix to "video: hyperv_fb:" to be more
specific.

On Tue, Mar 23, 2021 at 12:33:50AM -0700, Lv Yunlong wrote:
> In function hvfb_probe in hyperv_fb.c, it calls hvfb_getmem(hdev, info)
> and return err when info->apertures is freed.
> 
> In the error1 label of hvfb_probe, info->apertures will be freed twice
> by framebuffer_release(info).
> 

I would say "freed for the second time" here. What you wrote reads to me
fraembuffer_release frees the buffer twice all by itself.

> My patch sets info->apertures to NULL after it was freed to avoid
> double free.
> 

I think this approach works. I would like to give other people a chance
to comment though.

Fixes: 3a6fb6c4255c ("video: hyperv: hyperv_fb: Use physical memory for fb on HyperV Gen 1 VMs.")

> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
> ---
>  drivers/video/fbdev/hyperv_fb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index c8b0ae676809..2fc9b507e73a 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1032,6 +1032,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>  		if (!pdev) {
>  			pr_err("Unable to find PCI Hyper-V video\n");
>  			kfree(info->apertures);
> +			info->apertures = NULL;
>  			return -ENODEV;
>  		}
>  
> @@ -1130,6 +1131,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>  		pci_dev_put(pdev);
>  	}
>  	kfree(info->apertures);
> +	info->apertures = NULL;
>  
>  	return 0;
>  
> @@ -1142,6 +1144,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>  	if (!gen2vm)
>  		pci_dev_put(pdev);
>  	kfree(info->apertures);
> +	info->apertures = NULL;
>  
>  	return -ENOMEM;
>  }
> -- 
> 2.25.1
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
