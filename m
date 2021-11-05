Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED004445F2E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 05:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6AB6E02F;
	Fri,  5 Nov 2021 04:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105646E02B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 04:32:53 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 c2-20020a056830348200b0055a46c889a8so11407210otu.5
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 21:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=e7wV/zXlbFEZLefjaI+cZ2mUrOMI6pJgxRuHVeGTiB0=;
 b=YnYsM26Rs+Xf8pXIQ5nENuN+3ANyFaM6dkQjCLCP7Ir99A28SjSRGrkLaVtovNqGAb
 kXGyJRInVW3Mtkd6uetRuQXo7TIlSwBojh1OY+AEL6vmyOrgBb9vuke1dNfO34Ogmk81
 0id+xA535P1bR386wD0sBznxFSt1DRTXkNXILdHMk4eFKQtLxNuXrYU/Gx5URa3N3ORj
 ZPKDNdxwYqziFSBrkQIT7z8pXgkYc8KVAb4I/kBduklg9VRYe9wud4sT0867QFkUpFp5
 bgwRsM43YiwqfVOtFG1TWyxjHCYEGMVXLruAZgdafFefPZFR7KlQLCYVgqJjIuVkvQ0C
 Oa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e7wV/zXlbFEZLefjaI+cZ2mUrOMI6pJgxRuHVeGTiB0=;
 b=sLY/a8CK289Vr8ZW+PaU6DfAi5vIEdO4v3qHjIv8H+R7l0EjS7IjYai/HQoT8PsPME
 3iB7A5F2SekZ+mKmv2nQIAYp+33xzKmWs9KDMWGBVyyNwZYsqWfX9t7syT7xvgTvGje5
 nMzlDsctrh/JAaaATleO1zGLBfFmHIFAgEgcgkAWHvcykd1cFlcjcBSsMrwOCZ0n5pwc
 d5kxyR/mBMnt7sDAMpNmhN0ctHHBatIM8y6kVuAL5cM2AmsGjq27DyWtBvBvvCfkHDQe
 jCYSLMMYAd9T482zy7dsLKrm2z1TyvlQ1fdMBRjehCjY1yxjrcGN6Rl3N/g11QeZizUJ
 l6Zw==
X-Gm-Message-State: AOAM53087sTQOqKZruhNLj0zer2gl6ZtTxW8pF5Mv8NC5Wz3PR9O14sZ
 28jxqSZOqG+S2UI8DihsDXFOxA==
X-Google-Smtp-Source: ABdhPJz149yEAnlzEutepXMNcT57vxTomZmWHg5AgNejKGnvWASOFZ022mCwDSj4uZFjon3aCelt8g==
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr34638887otn.373.1636086773005; 
 Thu, 04 Nov 2021 21:32:53 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id w10sm1506327otk.51.2021.11.04.21.32.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 21:32:52 -0700 (PDT)
Message-ID: <be2222e2-8fec-84f9-bbcf-bf639a1a63bd@kali.org>
Date: Thu, 4 Nov 2021 23:32:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/msm/devfreq: Fix OPP refcnt leak
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20211104222840.781314-1-robdclark@gmail.com>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211104222840.781314-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/4/21 5:28 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index d32b729b4616..9bf8600b6eea 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -20,8 +20,6 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   	struct msm_gpu *gpu = dev_to_gpu(dev);
>   	struct dev_pm_opp *opp;
>   
> -	opp = devfreq_recommended_opp(dev, freq, flags);
> -
>   	/*
>   	 * If the GPU is idle, devfreq is not aware, so just ignore
>   	 * it's requests
> @@ -31,6 +29,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   		return 0;
>   	}
>   
> +	opp = devfreq_recommended_opp(dev, freq, flags);
> +
>   	if (IS_ERR(opp))
>   		return PTR_ERR(opp);
>   

Testing this here on the Lenovo Yoga C630, and I'm starting to see in my 
dmesg output

[   36.337061] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[   36.388122] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[   36.810941] wcd934x-codec wcd934x-codec.3.auto: Port Closed RX port 
1, value 4
[   36.811914] wcd934x-codec wcd934x-codec.3.auto: Port Closed RX port 
2, value 4
[  198.794946] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  198.845698] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  502.285421] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  502.339427] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  503.361469] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  503.412757] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  503.871480] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  503.922712] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  503.974474] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  504.025501] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  505.923563] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  505.974513] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  510.313052] usb 3-1.3: USB disconnect, device number 4
[  519.677148] usb 3-1.3: new high-speed USB device number 5 using xhci-hcd
[  519.793394] usb 3-1.3: New USB device found, idVendor=5986, 
idProduct=2115, bcdDevice=54.20
[  519.793441] usb 3-1.3: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[  519.793472] usb 3-1.3: Product: Integrated Camera
[  519.793495] usb 3-1.3: Manufacturer: SunplusIT Inc
[  519.861020] usb 3-1.3: Found UVC 1.00 device Integrated Camera 
(5986:2115)
[  519.892879] input: Integrated Camera: Integrated C as 
/devices/platform/soc@0/a8f8800.usb/a800000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.3/3-1.3:1.0/input/input27
[  520.283839] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  520.335854] devfreq 5000000.gpu: Couldn't update frequency transition 
information.


Is this intended?

