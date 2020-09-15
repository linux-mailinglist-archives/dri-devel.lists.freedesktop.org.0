Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8CD269F32
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFF06E84D;
	Tue, 15 Sep 2020 07:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034076E823
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 00:34:09 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id ef16so931581qvb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 17:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AMXsdcZMtd3r1FAfIZIVxJFPK/4+jeZlRHiiC+6VWdk=;
 b=ROVNsuRWiqNko5m4zp2frC9gpRSRjLNxQ2XVgBVyG7ZkgUHlYq2dfKhGAeTtqctAla
 T568uN4UtbeHz76/tSras7chrithr6p88yF4RpgN3Q5nrJVVsGqiCGWqcm2FHUC4ta7Z
 174HVWM7lKsoqMexzIvdMIYs2bLddMlpwr/TjHY053jSn83tRqpJfrcUh5/bbmFP5aAQ
 fk/wzSCnysKVOGZiEo2cgmDUhClOP8PXnQ4QxL8Aw7Wd8WeQW7BES/E0HDW8PEXSQXqI
 j2BSAzT+lMR+cb1wLOgtTRPNUCLT6+vsI/vQGjWIXmi1B1McVe+p3pbLQwl38nLxu8AC
 M1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AMXsdcZMtd3r1FAfIZIVxJFPK/4+jeZlRHiiC+6VWdk=;
 b=EevuK/zPL3+Yw6BFqNV7uYSrvSX/LDvqi6HOVY01OaHVZnBpkVynbdvpkm5izRvtDd
 IG9MsisrdGfmEukg4QAaQHYLT0vxDKuAjcqWwNxd1a49PYs2yRegWpvF1QZRiB36FF2s
 BrvTAmFRnBfpZLlUoD8+sCWsb7gFeKZh+F2Jw4H+zB/1s9l2HSlRctFgEBC0aOW5DP/9
 AIFUwDsNAMiS5DM/cnYAqGjbaVNp6ryut8yMqJyraQeZDB73VRtpfEE9B0plHr+BiSHF
 uI7J0/+TlX8QVdWEVzERqTm0y8fIUXYcnvvHTXksG34sZPtCXSIDAPxOa6uOvtiZYm2x
 eBbQ==
X-Gm-Message-State: AOAM530tLX1Xpip6ksMgSN/zfxiOSX151z5Izbh5wBOdHY8YOnWmbyvP
 Vbinq8aMRpBHPBcZ0xZtd3/zVA==
X-Google-Smtp-Source: ABdhPJx7isSw104HWsxh6GBnxwl7osGdt42xeZrstCu8XtSctGKh5I5nX9suDSQ1TbA7by279WI5JA==
X-Received: by 2002:a0c:9142:: with SMTP id q60mr16094189qvq.13.1600130049049; 
 Mon, 14 Sep 2020 17:34:09 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
 by smtp.gmail.com with ESMTPSA id c13sm14830849qtq.5.2020.09.14.17.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 17:34:08 -0700 (PDT)
Date: Tue, 15 Sep 2020 00:34:06 +0000
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Zhenzhong Duan <zhenzhong.duan@gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix a potential overflow issue
Message-ID: <20200915003406.GC471@uller>
References: <20200912102558.656-1-zhenzhong.duan@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200912102558.656-1-zhenzhong.duan@gmail.com>
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:07:18 +0000
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
Cc: freedreno@lists.freedesktop.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat 12 Sep 10:25 UTC 2020, Zhenzhong Duan wrote:

> It's allocating an array of a6xx_gpu_state_obj structure rathor than
> its pointers.
> 
> This patch fix it.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index b12f5b4..e9ede19 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -875,7 +875,7 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
>  	int i;
>  
>  	a6xx_state->indexed_regs = state_kcalloc(a6xx_state, count,
> -		sizeof(a6xx_state->indexed_regs));
> +		sizeof(*a6xx_state->indexed_regs));
>  	if (!a6xx_state->indexed_regs)
>  		return;
>  
> -- 
> 1.8.3.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
