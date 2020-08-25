Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43A2528E1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29ED895B5;
	Wed, 26 Aug 2020 08:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1116E887
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 07:48:09 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id e187so6652133ybc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 00:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HfaePIFgkKDaQAvHyLocpP4Zlin9g8e2YzOSoHz2+5g=;
 b=KxU9o8t8Jhok7Z9BQVvS1djxlWDHWu9ThwzLKwV5UHfyvcdQaiwwq2YFGGxxd8qOjw
 MdRS9OXfdsmEkBkVf9xHjMPuSWAbKfqoZpRI/PAs9Zopmq3VQT3ouKmvorJes5K+y/EU
 0b2l+8XCuf0zHHye8ZuEQJ9DHmj2R3l1RIkoMNKNheMK7RrjQQFnv3QhmcgDAKlUA/YI
 tdIEVSEPv0TkrudPVSgjtEFHUn8Zs/3ZPsai8EYjH6ADP3kFiQ1UH8QVIbvoLjbfeRv0
 jVhTkCIZUXDaFgE7mgwnN025QIoZF9dYEwUuYVbrD3anYzVrLGyojb/pogtQaI1S8S0N
 VXDw==
X-Gm-Message-State: AOAM530T3zJAKugLmf05WYupA9uDhHri8cx3vA/uQ7NtIMNww133ojPf
 pZHvU9VUwmnfGWzbnAXCHWS0WIvmCbh/8sgtqo4=
X-Google-Smtp-Source: ABdhPJzzoQCHoXnnSY9x7+KhRyF3ktxgw1KVvIH0dVLRr/ri2WIgVCoeB1qGC/E8jcdRDplu5z/cKMya91xE/i8mUtU=
X-Received: by 2002:a25:2b89:: with SMTP id
 r131mr12592617ybr.131.1598341688832; 
 Tue, 25 Aug 2020 00:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200825062900.11210-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200825062900.11210-1-dinghao.liu@zju.edu.cn>
From: Mathieu Malaterre <malat@debian.org>
Date: Tue, 25 Aug 2020 09:47:56 +0200
Message-ID: <CA+7wUswtuOPqQ131F5LdH=7dH+sWZc+jmMHXpaYmTDUehvx5eQ@mail.gmail.com>
Subject: Re: [PATCH] video: fbdev: radeon: Fix memleak in radeonfb_pci_register
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, kjlu@umn.edu,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 25, 2020 at 9:27 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
>
> When radeon_kick_out_firmware_fb() fails, info should be
> freed just like the subsequent error paths.
>
> Fixes: 069ee21a82344 ("fbdev: Fix loading of module radeonfb on PowerMac")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/video/fbdev/aty/radeon_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
> index 3fe509cb9b87..13bd2bd5c043 100644
> --- a/drivers/video/fbdev/aty/radeon_base.c
> +++ b/drivers/video/fbdev/aty/radeon_base.c
> @@ -2307,7 +2307,7 @@ static int radeonfb_pci_register(struct pci_dev *pdev,
>
>         ret = radeon_kick_out_firmware_fb(pdev);
>         if (ret)
> -               return ret;
> +               goto err_release_fb;

Good catch ! Thanks

Reviewed-by: Mathieu Malaterre <malat@debian.org>

>         /* request the mem regions */
>         ret = pci_request_region(pdev, 0, "radeonfb framebuffer");
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
