Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC4241F7BC
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 00:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160146F40F;
	Fri,  1 Oct 2021 22:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF3B6F40F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 22:47:45 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y23so9259347lfj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WGjN04878+AMOMEOZmF7yNpwbG05OAzAKgYFczYhOeY=;
 b=bZe2t/n/O2ewi8yHei5TI/UaERKkhxeLGNHYwiOCTMCHlrYgV4mk5y7fnmCRxnrXw6
 6YhY1nYq0j+TvH0ETbnJPu6HltvKqd8X57GLIAQxPYJkEsbNLx2ahTHaE2Aww9x2sGjY
 boV82MRCpslGNCqEXnkWsE0dWpGiUPnuScI8hsWOzDG5hi5dq6JFSgjN7Bkx7aG93BHj
 ji/ixYG7ZAR/UNjg7YfMWO5HgbFSKtSqaCKJk5Qst+vn1MKt/bjXl1N8YpriyFfZGaNo
 IEkSfm7ZcyHbe2vhAtWcn82yrd6BdnFtZichw/1tYFmLVmy14z/+qxk6poyvT5D8YoMX
 uI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WGjN04878+AMOMEOZmF7yNpwbG05OAzAKgYFczYhOeY=;
 b=WMdDThzW3IX5DGBBS+y0h2U3uS6TBp/aiANaxwEg1nAC7avOtfU+BktqmoIEDnzSWQ
 ljDXTufldNoqIUzAfgCpn6VtcK4KNfHdBrtY0N0yRqYxq9LliC/GdPH0ns/J+JEJfg2y
 aXrFL/axXrcXwkfyA7YTPQW74KhHLjVIRvtCG1aQ7PS06XL6N8+rYPpudirSsb2SS+9B
 oThnVlIkWKplPWPWtQWYG++vE9DxYSSMkdlsKba77nNO7PB5G4QqjfixbTg72bfvgqnB
 vqIZSUsIhsqo8uidLb1WntIiZtycJhf1Ir2bd2hMFV8MjjUz5Ys2AF89BAItMCrqXKDo
 sLZg==
X-Gm-Message-State: AOAM533gW1Tf8lxkCSXwyibuOvwzomBJOPAb3uOo0BHOO3KWCZHn7SMm
 TOCuzKvLUgeg0txy+cPzX60gpg==
X-Google-Smtp-Source: ABdhPJyFcXijt2H4S9oPNqMyrwyHFwAbIQq4n5w+wmArWVtZP0jRKm0/fY4MurzPfhycLe2LUEskvw==
X-Received: by 2002:a19:7519:: with SMTP id y25mr579354lfe.473.1633128463332; 
 Fri, 01 Oct 2021 15:47:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d13sm870643lfi.48.2021.10.01.15.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 15:47:42 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/msm/dsi: fix off by one in dsi_bus_clk_enable
 error handling
To: Dan Carpenter <dan.carpenter@oracle.com>, Rob Clark
 <robdclark@gmail.com>, Archit Taneja <architt@codeaurora.org>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
 Yangtao Li <tiny.windzz@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211001123409.GG2283@kili>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e9aea681-c27a-d3fd-2c2b-1a0486173dbc@linaro.org>
Date: Sat, 2 Oct 2021 01:47:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001123409.GG2283@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/10/2021 15:34, Dan Carpenter wrote:
> This disables a lock which wasn't enabled and it does not disable
> the first lock in the array.
> 
> Fixes: 6e0eb52eba9e ("drm/msm/dsi: Parse bus clocks from a list")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We should probably switch this to bulk clk api.

> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e269df285136..c86b5090fae6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -451,7 +451,7 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
>   
>   	return 0;
>   err:
> -	for (; i > 0; i--)
> +	while (--i >= 0)
>   		clk_disable_unprepare(msm_host->bus_clks[i]);
>   
>   	return ret;
> 


-- 
With best wishes
Dmitry
