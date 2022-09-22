Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB595E6C39
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 21:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E53810E139;
	Thu, 22 Sep 2022 19:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE2010E183
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 19:54:53 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id a2so16440557lfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=lgBFTMVMXCZBAFp0oMr/KQtqKqlUry12+72uOs2o5A0=;
 b=gSuteSplG8PxA49wHgjUw1l+i4kCCFrGl4lWahQKdlgu+JZaE4fiOWlEQzX7g4xqgy
 wrtBDvfRLRV8AweCZ6WU3wvh+jHN+g/sFqlQWZCi6KqGKKE2rrGWTqIdzeTXBpG8fTj3
 khnOpoLjT0PTdn98YaEk6J1EVqLuA7AwZ0TTzqOSLTRzgJZFaUWo4FRqMY1Rn/zOB2Yl
 jF2IGGbDkpjLMYyp6it3c9Vcct8liYd78+UVr+5cXt9bYkBCobdPOwpWxAL1s5VxhGnJ
 cixDkto0Rm1H3pmavVasqrRLFbpiYOCBL2zhCZHtcKMuM+ntXZq/51jD4I73Jkv9MUw1
 SiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lgBFTMVMXCZBAFp0oMr/KQtqKqlUry12+72uOs2o5A0=;
 b=GLMDwjuXHXa6iawYMv3LdEeUczZQJxrn3wxJlPyY3eK7dzjHQehAHXGGBJL+Dnrocv
 YBdgjRYiie+Kv/e5sQm4M+3rBg7Yw6dpPqvoDukmxQOcpih5ZoD3McH2tFdK7egVfjon
 wM0c23EJnJkcvZQ0nyWbaBSJYKlPLRsczhnW+USRvposFq4lf9VtVhf78qRnvRfgm+An
 npUIfbruwc9SaF0jp8lT/nXBo2aLihGjVizPqSFCC/Uh65dOXNt2MiBAxuJVJ72se2BB
 baaHssUSy0zAU14zQzcBMGqEorHMdMLm/2tsI3IlvEGMoC2WULQVQn8NCvWrKr6iNzbp
 3w4Q==
X-Gm-Message-State: ACrzQf1M90HLnqK0SKt/Kai+WrgMYc0tER7n0fXi074hoVq1ZjKuNDI5
 wSoUBIMn51dY/nvnhdotTfWITQ==
X-Google-Smtp-Source: AMsMyM5x3xQZZsL6AGUzGPXrbBo4Ibfz8nqXqjAm+Dm7MKd8knG6P7UyBb3rGXUpNlKV3qXe4/G2Dw==
X-Received: by 2002:a19:f716:0:b0:498:aa7f:32f7 with SMTP id
 z22-20020a19f716000000b00498aa7f32f7mr1984433lfe.3.1663876492136; 
 Thu, 22 Sep 2022 12:54:52 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a056512370d00b00497a3e2a191sm1083605lfr.112.2022.09.22.12.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 12:54:51 -0700 (PDT)
Message-ID: <8964f7c1-817d-fbd0-69c2-329a442ae5e7@linaro.org>
Date: Thu, 22 Sep 2022 22:54:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 04/10] drm/msm/hdmi: fix memory corruption with too
 many bridges
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-5-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220913085320.8577-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sean Paul <sean@poorly.run>, Steev Klimaszewski <steev@kali.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/09/2022 11:53, Johan Hovold wrote:
> Add the missing sanity check on the bridge counter to avoid corrupting
> data beyond the fixed-sized bridge array in case there are ever more
> than eight bridges.
> 
> Fixes: a3376e3ec81c ("drm/msm: convert to drm_bridge")
> Cc: stable@vger.kernel.org	# 3.12
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

