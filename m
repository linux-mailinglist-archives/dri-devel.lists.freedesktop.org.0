Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1375D41F7F2
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 01:00:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4C26F446;
	Fri,  1 Oct 2021 22:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D726F446
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 22:59:58 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z24so44378825lfu.13
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 15:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MrcSevZqtNOFUzq3pWbbRjEjIk8+7OFN/vmiST/wtNU=;
 b=RgwL5KCvqBIeZB/gE1d8cY3bovbOy61asvkdirxaHIlo5MBe0JgNim+YGg9lSkZZi7
 s3kW6XPLnV8BHaEbrUCX64Qjrjndp+tGvPGvq7kMN3tadiWf7h6qjcNYKbxC9kXAdf1Z
 zyBlubbSFaP2lUsMcyymA3rJ3NQDPTZuD2qJ7BEZ2LyVBWSHM1jOJFRnqq8xU9ja4Ts0
 ccq/l0AeBTr+K6OygMYiU5NTee0Z2zxlNf1+wzLSDW4S04qaMgXZV3Pb0DPMqagLI44h
 vCEY4K+/i7Na4Hq5AGkgnwT3rL3/C2R8FI622J0qkIQCeBVFYycwUE/R3nMBJvnoty/L
 OA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MrcSevZqtNOFUzq3pWbbRjEjIk8+7OFN/vmiST/wtNU=;
 b=fXONQ/UsSsoXrREM6r2jSU2hlMYEqQKBcwP2/prAIVyvp/Lq1PVy8BkJa+z24+X47b
 ZUg8IzAqILPT48DANWymW221DD+BqAtxAqDQ69DP1X7sNLD1DMHE+RhxaIbSvGg445Mp
 WTiag7iayY/N0BRgZT4iu7h0RFRmdVa4SkrEdc9stOA8B+bQBC748ybEZa8uQ78ElJVo
 NN3cpJtjjyG0l1ylZeIy6S+Eje7BhzBdHpt4m2okwVRPYxHOqM1xqNH1UNdpwvqogY/G
 Esl3W0rwQd74J0LQfk2rN6fIZznNt4RxpvTd/a3hWTaSO0V/sNIu1MzkNds2XuryR+8s
 36Kw==
X-Gm-Message-State: AOAM5326sGbpjkaUeuFdmUvPyh5bzcwbM09M/Be1VTB/JNPRq/0fzlb8
 +YRRrrg1kHCDcTTrCiqJueq3eA==
X-Google-Smtp-Source: ABdhPJyDZ2oSrPzTa/TydJ+YDRi4V0TZmc4niH4msrXenJu8SJD6xo7ep5yvzdkledpWM36qcjmr1Q==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr645027lfr.265.1633129197104;
 Fri, 01 Oct 2021 15:59:57 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id 131sm552169ljj.43.2021.10.01.15.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 15:59:56 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm/msm/dsi: fix signedness bug in
 msm_dsi_host_cmd_rx()
To: Dan Carpenter <dan.carpenter@oracle.com>, Rob Clark
 <robdclark@gmail.com>, Hai Li <hali@codeaurora.org>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
 Yangtao Li <tiny.windzz@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211001123617.GH2283@kili>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <a61cad95-d81d-6f6d-33d4-f5259d9814cb@linaro.org>
Date: Sat, 2 Oct 2021 01:59:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001123617.GH2283@kili>
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

On 01/10/2021 15:36, Dan Carpenter wrote:
> The "msg->tx_len" variable is type size_t so if dsi_cmds2buf_tx()
> returns a negative error code that it type promoted to a high positive
> value and treat as a success.  The second problem with this code is
> that it can return meaningless positive values on error.

It looks to me that this piece of code is not fully correct at all.
dsi_cmds2bus_tx would return the size of DSI packet, not the size of the 
DSI buffer.

Could you please be more specific, which 'meaningless positive values' 
were you receiving?

> 
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index c86b5090fae6..42073a562072 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2133,8 +2133,10 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
>   		}
>   
>   		ret = dsi_cmds2buf_tx(msm_host, msg);
> -		if (ret < msg->tx_len) {
> +		if (ret < 0 || ret < msg->tx_len) {
>   			pr_err("%s: Read cmd Tx failed, %d\n", __func__, ret);
> +			if (ret >= 0)
> +				ret = -EIO;
>   			return ret;
>   		}
>   
> 


-- 
With best wishes
Dmitry
