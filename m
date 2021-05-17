Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F83839E2
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 18:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247D86E9EB;
	Mon, 17 May 2021 16:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1838A6E949
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 12:27:43 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id h7so2295774qvs.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 05:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RrMgSrZtTqdB/wlv0id/9NlOUPd01Z7kAGWKqnT2c2M=;
 b=CctOlq+UkKn18QqKAOdc7VqJDwwJKN9HU/A5tTPZ0EUkYGQMbFanD0RNwVHW2f6R4E
 7fGATCP3I/aegDtzmOBa5y7HYnBAOTRIl+10jhJuS7FOhQbBKJ3dZOOA6X3ITygKqzls
 GYKmF56nNhO+08TdkpRANu9VXaTwgiFhOUXy8+b44TjtqJNCthTAiLbF/r709SBk+TTr
 JFfUCWgDEX967xOAuQfbJGZ4in3xZj/3kE8Mf/9i0HFQ65dEhwLg/3wrcJKdfUh8FmVT
 hxlDPhEvB3cXIZu0UWRwRNkFRYiWjfn70i3oucULeBS2i2/4Qn1sRdt3WfdmU+uTZ/f+
 PWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RrMgSrZtTqdB/wlv0id/9NlOUPd01Z7kAGWKqnT2c2M=;
 b=M8OGoM5B+e/jXk6Ibktx4XuHC2JhlZskKB8lzXx+5lYsQR5tosNEAxM/r7UAFJ08bH
 9rlMRZ+qRwHUBMnDMAOQVl45f3ttrmEBhqRzodOz8RTw0YTttvvHWEQoNO1lvgKZ/eCu
 xvJKqQll9yJk++tzUA7hBPJILfTtGwFy1jVI2oD0Z2kPrup2ECMbJBMGXm2aRK1KM6Dt
 cJtVUiVproGNW83P0qmAbfUk4b3+mt6Ozcc/qAskqWENOhlgHJO7t6bDq3vAmQjrDWee
 TBPowxBTkATVyvA1EiT7qsExXzMAHptgvRWrmoylHIZ7Faz6JCE9tqw0+rgHTiQ1lq3l
 de0A==
X-Gm-Message-State: AOAM533pm7KbRbZZT8EiRoedpTNrXCEkLes9bGlbGLE0+LLZcEC41I4n
 RwcpPTxNRFkB2yCTTwayka8=
X-Google-Smtp-Source: ABdhPJzM+6xSTMZ2jK4banMxGU90aLBTrZTJZYJp2Lr/pLBs4nDcAdGVJO5Aq8VNiSxT+2/N1fJnug==
X-Received: by 2002:a05:6214:87:: with SMTP id n7mr16082560qvr.1.1621254462149; 
 Mon, 17 May 2021 05:27:42 -0700 (PDT)
Received: from ?IPv6:2804:14c:125:811b::1003? ([2804:14c:125:811b::1003])
 by smtp.gmail.com with ESMTPSA id 10sm10377983qka.23.2021.05.17.05.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 05:27:41 -0700 (PDT)
Subject: Re: [PATCH] video: hgafb: correctly handle card detect failure during
 probe
To: Anirudh Rayabharam <mail@anirudhrb.com>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210516192714.25823-1-mail@anirudhrb.com>
From: Igor Torrente <igormtorrente@gmail.com>
Message-ID: <2b945eaa-4288-1601-3f1a-60f2ceaa1ea7@gmail.com>
Date: Mon, 17 May 2021 09:27:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210516192714.25823-1-mail@anirudhrb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 17 May 2021 16:30:08 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <oliver.sang@intel.com>,
 stable <stable@vger.kernel.org>, linux-nvidia@lists.surfsouth.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/16/21 4:27 PM, Anirudh Rayabharam wrote:
> The return value of hga_card_detect() is not properly handled causing
> the probe to succeed even though hga_card_detect() failed. Since probe
> succeeds, hgafb_open() can be called which will end up operating on an
> unmapped hga_vram. This results in an out-of-bounds access as reported
> by kernel test robot [1].
> 
> To fix this, correctly detect failure of hga_card_detect() by checking
> for a non-zero error code.
> 
> [1]: https://lore.kernel.org/lkml/20210516150019.GB25903@xsang-OptiPlex-9020/
> 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Fixes: dc13cac4862c ("video: hgafb: fix potential NULL pointer dereference")
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>   drivers/video/fbdev/hgafb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
> index cc8e62ae93f6..bd3d07aa4f0e 100644
> --- a/drivers/video/fbdev/hgafb.c
> +++ b/drivers/video/fbdev/hgafb.c
> @@ -558,7 +558,7 @@ static int hgafb_probe(struct platform_device *pdev)
>   	int ret;
>   
>   	ret = hga_card_detect();
> -	if (!ret)
> +	if (ret)
>   		return ret;
>   
>   	printk(KERN_INFO "hgafb: %s with %ldK of memory detected.\n",
> 

In fact, this return isn't being properly handled. Thanks for fix it!

Reviewed-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
