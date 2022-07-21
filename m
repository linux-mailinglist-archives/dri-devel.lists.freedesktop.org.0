Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CDA57C689
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 10:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084682C000;
	Thu, 21 Jul 2022 08:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47102C000
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 08:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658392771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHQddct22+s5hmZWBuML5igjaqME1krrl4DYXrpi1tg=;
 b=X+QycSlUUIL8OGomNpQpPML0YoiB2o/nM53lfOEZRx6u+cO4wvfChieoKn0XGakXRYuhoQ
 67HknJ9wJ9XxvDajVYhj74Wf60rU9lCr68VhLZqa0KI6CGKw8lUIl7tit/jLdbDF/gOLLj
 DZNbtmncq/nNf5D6Ufb2lUheroPipto=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-hyPphYLxO-ufAaTMgfXFeg-1; Thu, 21 Jul 2022 04:39:28 -0400
X-MC-Unique: hyPphYLxO-ufAaTMgfXFeg-1
Received: by mail-wr1-f71.google.com with SMTP id
 c11-20020adfa30b000000b0021e4e471279so149506wrb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 01:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rHQddct22+s5hmZWBuML5igjaqME1krrl4DYXrpi1tg=;
 b=5hvIjnQoQbGkW/nxaStX9lf9/Gj+QL2aAQd65qYfrHNIUH58tJYdML2PuBbq1iEA4J
 LTgy5XaXhO5/4qhtc9VGkQ/6oM4NYHbAPTXyLGrC1K7uDWR8YVWK/IUPVX6LMXzf+WyV
 zFEjSj7v4nJQrrIXaGXQxdP/YyTSSmD55IkDk2dyvJRKS9xBqUAWJIc4jHXzamSW/Qan
 b1l8W8zOPjt2MXyP3CZ5SdoQm+vowu8bEz5QQ0HItc7IKfEnQ2eUNNtVWIIritVpEIUX
 afKLOqC4aRP5l08369/WxOw+MlDzBfet+MxeYRqdD8HPAgeKJ/KZ3yLOxboCetxrap2U
 tOxQ==
X-Gm-Message-State: AJIora/h3w24TGKm2TKL8hnfZqF2pVSWWfOPoz+Dq2r5AtiMWwetnq7V
 eCCXlRg7czy6cpgATySf555zK6PZ4jgtUwvFYhJnSjcclovM8s1Tt2sy3m8wmU3/Lr6UWJA23N0
 nllX0sN+217x7FbUgJT04sm9bSRVN
X-Received: by 2002:a5d:59a9:0:b0:21d:7ee2:8f90 with SMTP id
 p9-20020a5d59a9000000b0021d7ee28f90mr33649034wrr.598.1658392767583; 
 Thu, 21 Jul 2022 01:39:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tgI04aD7Jw1LlQvxlJXF9GNlLvKMC9uf9PkUQtkjjLkNil8vUimbCbuG4SwLNzapNrDsFc9Q==
X-Received: by 2002:a5d:59a9:0:b0:21d:7ee2:8f90 with SMTP id
 p9-20020a5d59a9000000b0021d7ee28f90mr33649009wrr.598.1658392767222; 
 Thu, 21 Jul 2022 01:39:27 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j20-20020a5d6e54000000b0021d65e9d449sm1168696wrz.73.2022.07.21.01.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 01:39:26 -0700 (PDT)
Message-ID: <c31541b0-ef84-6018-1ba1-cff3a33f4954@redhat.com>
Date: Thu, 21 Jul 2022 10:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] fbdev: Fix order of arguments to
 aperture_remove_conflicting_devices()
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
References: <20220721081655.16128-1-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220721081655.16128-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 7/21/22 10:16, Thomas Zimmermann wrote:
> Reverse the order of the final two arguments when calling
> aperture_remove_conflicting_devices(). An error report is available
> at [1].
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 8d69d008f44c ("fbdev: Convert drivers to aperture helpers")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Stephen Hemminger <sthemmin@microsoft.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Dexuan Cui <decui@microsoft.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-hyperv@vger.kernel.org
> Link: https://lore.kernel.org/lkml/202207202040.jS1WcTzN-lkp@intel.com/ # 1
> ---
>  drivers/video/fbdev/aty/radeon_base.c | 2 +-
>  drivers/video/fbdev/hyperv_fb.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
> index e5e362b8c9da..0a8199985d52 100644
> --- a/drivers/video/fbdev/aty/radeon_base.c
> +++ b/drivers/video/fbdev/aty/radeon_base.c
> @@ -2243,7 +2243,7 @@ static int radeon_kick_out_firmware_fb(struct pci_dev *pdev)
>  	resource_size_t base = pci_resource_start(pdev, 0);
>  	resource_size_t size = pci_resource_len(pdev, 0);
>  
> -	return aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME, false);
> +	return aperture_remove_conflicting_devices(base, size, false, KBUILD_MODNAME);
>  }

I also missed that the order wasn't correct when reviewing.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

