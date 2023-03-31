Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6906D23AC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 17:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5066210E19D;
	Fri, 31 Mar 2023 15:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF10310E19D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 15:11:03 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:32986.221759475
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 24C731001C8;
 Fri, 31 Mar 2023 23:10:58 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 4ca22286f0024de39acc6a100cbf722e for gangecen@hust.edu.cn; 
 Fri, 31 Mar 2023 23:10:59 CST
X-Transaction-ID: 4ca22286f0024de39acc6a100cbf722e
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <45b623af-e72e-f728-5ce6-dce014a772ed@189.cn>
Date: Fri, 31 Mar 2023 23:10:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PING] drm/bochs: replace ioremap with devm_ioremap to avoid immo
 leak
To: Gencen Gan <gangecen@hust.edu.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230329052655.3487616-1-gangecen@hust.edu.cn>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230329052655.3487616-1-gangecen@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I'm noticed you patch, interesting!

On 2023/3/29 13:26, Gencen Gan wrote:
> From: Gan Gecen <gangecen@hust.edu.cn>
>
> Smatch reports:
>
> 	drivers/gpu/drm/tiny/bochs.c:290 bochs_hw_init()
> 	warn: 'bochs->mmio' from ioremap() not released on
> 	lines: 246,250,254.
>
> In the function bochs_load() that calls bochs_hw_init()
> only, if bochs_hw_init(dev) returns -ENODEV(-19), it
> will jumps to err_free_dev instead of err_hw_fini, so
> bochs->immo won't be freed.

    `mmio`, not `immo`,  you should also fix the typos in you patch's 
commit title.

> We would prefer to replace ioremap with devm_ioremap
> to avoid adding lengthy error handling. The function
> `devm_ioremap` will automatically release the allocated
> resources after use.

Yet, I notice that there is iounmap in bochs_hw_fini() function, does 
double free will happen?

static void bochs_hw_fini(struct drm_device *dev)
{
     struct bochs_device *bochs = dev->dev_private;
     // ...
     if (bochs->mmio)
         iounmap(bochs->mmio);
     // ...
}


I still advise you free it by adding error handling code, free it manually.

Because still there other ioremap() function in the driver.

But you can choose to heard other reviewer's voice, I can only help to 
review.

> Signed-off-by: Gan Gecen <gangecen@hust.edu.cn>
> ---
>   drivers/gpu/drm/tiny/bochs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 024346054c70..0d7e119a732f 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -223,7 +223,7 @@ static int bochs_hw_init(struct drm_device *dev)
>   		}
>   		ioaddr = pci_resource_start(pdev, 2);
>   		iosize = pci_resource_len(pdev, 2);
> -		bochs->mmio = ioremap(ioaddr, iosize);
> +		bochs->mmio = devm_ioremap(&pdev->dev, ioaddr, iosize);
>   		if (bochs->mmio == NULL) {
>   			DRM_ERROR("Cannot map mmio region\n");
>   			return -ENOMEM;
