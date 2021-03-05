Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 348B932E652
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 11:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806BA6E165;
	Fri,  5 Mar 2021 10:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45886E154
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 10:28:08 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id u125so971853wmg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 02:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=508mHarsDAedjeOjCGR9JTna24netIemqOogSJyJGyc=;
 b=AuS+3HMvYjH51pD/anB6X2/9d1EmQcyRJ40Ww+WTp//AQW7XM1K6F9BZlGyrOu5NgQ
 +H1W34bc5EYxDvaCuu9CoxlUYl0WW0YrHL8TMIrRw5DCYY3iTQW3YLqcZjyZgLhQaamq
 wTezvbziWy691ENdKl41IL1CCFzTMo7O+/P3jRZBRaA1au8RpGiNnKSn6UUGLQqvEnGc
 gvGKjbbDJm+moigBzgL+kqqVbqBFhG2ahLEQjFlJpxQXLdLr0NGYueEJq2vr+BdXf/g5
 65+n9HWmbJUpq5FLHxsdR1/a+ar8ngz/ZI790dYNEJs9xX9ilgIAL04Q17XOMTdPj0dF
 dzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=508mHarsDAedjeOjCGR9JTna24netIemqOogSJyJGyc=;
 b=djQjyRe80BFqTCEsJ1PJin+46duHvvb1aiYna7/gTqCd7BAFnueak5RBuIIwjIh/3b
 +H7wKDyZT4ckquNuxcVA4Pc94YnfZ6tyCKyRgKu7gURyQiYtdnzP+oY+7r2F0uQVYGKK
 J7zBya14P6yp5txoqzvjNQZ6khf+ea0KlWoi4WnYP816MxjdbZToOzIRnnKaEgmdua43
 VEFqudwsFx+p57pAPRvnElI0vHW5U2ZTkPDXHreobwGkBu91cqy26AZScFbDGL5YTii7
 WvGVHcmNoXwjzQ665XDPy0QFza0QIAznCvt+Kiu43fFgjprb040KqoTEP7kQMpA6I4fx
 mTQA==
X-Gm-Message-State: AOAM532MKG2sg/ABCVp8AEVCH2VX3ojkkZ3YqWAEs46fSG8+E0JGbHZH
 M8tikcghvvSDHQtqQawF62jaDA==
X-Google-Smtp-Source: ABdhPJztwmHB+341Q2xY064L9OQmgO+DyCD8SsAIe1i9XQUeq0XqSvWUmufvkgY8nJnBed7A9o6NjA==
X-Received: by 2002:a1c:9854:: with SMTP id a81mr7844507wme.19.1614940087340; 
 Fri, 05 Mar 2021 02:28:07 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id s83sm4051271wmf.26.2021.03.05.02.28.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Mar 2021 02:28:06 -0800 (PST)
Subject: Re: [PATCH 1/3] drm/msm: Fix speed-bin support not to access outside
 valid memory
To: Douglas Anderson <dianders@chromium.org>, Rob Clark
 <robdclark@gmail.com>, Jordan Crouse <jcrouse@codeaurora.org>
References: <20210227002603.3260599-1-dianders@chromium.org>
 <20210226162521.1.Ib5ae69a80704c3a2992100b9b5bac1a6cc470249@changeid>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6ce9f5b8-50b4-e655-f6c5-4e095c1d7e19@linaro.org>
Date: Fri, 5 Mar 2021 10:28:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210226162521.1.Ib5ae69a80704c3a2992100b9b5bac1a6cc470249@changeid>
Content-Language: en-US
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
Cc: freedreno@lists.freedesktop.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Niklas Cassel <niklas.cassel@linaro.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27/02/2021 00:26, Douglas Anderson wrote:
> When running the latest kernel on an sc7180 with KASAN I got this
> splat:
>    BUG: KASAN: slab-out-of-bounds in a6xx_gpu_init+0x618/0x644
>    Read of size 4 at addr ffffff8088f36100 by task kworker/7:1/58
>    CPU: 7 PID: 58 Comm: kworker/7:1 Not tainted 5.11.0+ #3
>    Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
>    Workqueue: events deferred_probe_work_func
>    Call trace:
>     dump_backtrace+0x0/0x3a8
>     show_stack+0x24/0x30
>     dump_stack+0x174/0x1e0
>     print_address_description+0x70/0x2e4
>     kasan_report+0x178/0x1bc
>     __asan_report_load4_noabort+0x44/0x50
>     a6xx_gpu_init+0x618/0x644
>     adreno_bind+0x26c/0x438
> 
> This is because the speed bin is defined like this:
>    gpu_speed_bin: gpu_speed_bin@1d2 {
>      reg = <0x1d2 0x2>;
>      bits = <5 8>;
>    };
> 
> As you can see the "length" is 2 bytes. That means that the nvmem
> subsystem allocates only 2 bytes. The GPU code, however, was casting
> the pointer allocated by nvmem to a (u32 *) and dereferencing. That's
> not so good.
> 
> Let's fix this to just use the nvmem_cell_read_u16() accessor function
> which simplifies things and also gets rid of the splat.
> 
> Let's also put an explicit conversion from little endian in place just
> to make things clear. The nvmem subsystem today is assuming little
> endian and this makes it clear. Specifically, the way the above sc7180
> cell is interpreted:
> 
> NVMEM:
>   +--------+--------+--------+--------+--------+
>   | ...... | 0x1d3  | 0x1d2  | ...... | 0x000  |
>   +--------+--------+--------+--------+--------+
>                ^       ^
>               msb     lsb
> 
> You can see that the least significant data is at the lower address
> which is little endian.
> 
> NOTE: someone who is truly paying attention might wonder about me
> picking the "u16" version of this accessor instead of the "u8" (since
> the value is 8 bits big) or the u32 version (just for fun). At the
> moment you need to pick the accessor that exactly matches the length
> the cell was specified as in the device tree. Hopefully future
> patches to the nvmem subsystem will fix this.
> 
> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++--------------------
>   1 file changed, 8 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ba8e9d3cf0fe..0e2024defd79 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1350,35 +1350,20 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>   		u32 revn)
>   {
>   	struct opp_table *opp_table;
> -	struct nvmem_cell *cell;
>   	u32 supp_hw = UINT_MAX;
> -	void *buf;
> -
> -	cell = nvmem_cell_get(dev, "speed_bin");
> -	/*
> -	 * -ENOENT means that the platform doesn't support speedbin which is
> -	 * fine
> -	 */
> -	if (PTR_ERR(cell) == -ENOENT)
> -		return 0;
> -	else if (IS_ERR(cell)) {
> -		DRM_DEV_ERROR(dev,
> -				"failed to read speed-bin. Some OPPs may not be supported by hardware");
> -		goto done;
> -	}
> +	u16 speedbin;
> +	int ret;
>   
> -	buf = nvmem_cell_read(cell, NULL);

I think the issue here is not passing len pointer which should return 
how many bytes the cell is!

Then from there we can decide to do le16_to_cpu or le32_to_cpu or not!
This will also future proof the code to handle speed_bins of different 
sizes!

--srini

> -	if (IS_ERR(buf)) {
> -		nvmem_cell_put(cell);

> +	ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
> +	if (ret) {
>   		DRM_DEV_ERROR(dev,
> -				"failed to read speed-bin. Some OPPs may not be supported by hardware");
> +			      "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
> +			      ret);
>   		goto done;
>   	}
> +	speedbin = le16_to_cpu(speedbin);
>   
> -	supp_hw = fuse_to_supp_hw(dev, revn, *((u32 *) buf));
> -
> -	kfree(buf);
> -	nvmem_cell_put(cell);
> +	supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
>   
>   done:
>   	opp_table = dev_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
