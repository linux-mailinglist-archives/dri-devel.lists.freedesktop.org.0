Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9E05E6C31
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 21:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D3110E0F9;
	Thu, 22 Sep 2022 19:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8D210E0F9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 19:54:39 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a3so16407580lfk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=OjwZCqtCWqNmy6fBlsSqFzKD3bCEsVFc8uYZ8NecXtA=;
 b=cR1wX2FyrChyeXiQTbsumMufekbEXq//32J9TUANOOvMEPcLZBAnvdJkN5/dOTPFhW
 YDzxuQBUWoM8O+Ji2t/YzyJES7V01wIFwoDljjbUsfMqbKEr+FsO2QpGX7GhL2/Mp4G4
 mON4wkSqvEa57udsnvbN4U4OpI1WBslnFDc6d1PdQDr6yJLEe2WZ8OHPXEFigl1J0xw3
 b6XSaWYhGmBtfvo3PjAqcFcVUcnANXhRnP4+5lIbYIDCqnyNSgMZUJtB8fHlA6AehCax
 fMemAtVkjVnrgnonlx+vH3cCQc+KK2iIA9bjL7VaxYEEbI2M6aePGQ0YpGae/k2DGaZq
 QTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=OjwZCqtCWqNmy6fBlsSqFzKD3bCEsVFc8uYZ8NecXtA=;
 b=JbI8Vrn8YuU0DW52bpeVVmpkYjI8wF8e3+Z1Dpc1wja5vB2Daknc3YMF3bGWHtlAqf
 9Gxl0ZHxe3Yv4PLV4WhCbKaXnVRbm4NswjhPX7+TCDtJ2JxBzZG5i1fiAz5qb+0o8+9U
 RvyHA+JaJWuN7yQ7sEnFthDMuVh5VIu1XSUjGWObDQodYBb2d5EE5wmtvDJxomK//Bhd
 WYhxxaSqbqB/ZVrxJnukse6pr2F71sTaN6aQdmTJbfj0Y3pOvtRreeAT9Tfj36cXIv5c
 Ks/c9sSIxASiGXOA/dRs6M/czeZooaaT0Zfe+SqnprTf6vHte1JC44qRSbn83+FNlu3i
 Y2YQ==
X-Gm-Message-State: ACrzQf0YPwiaFyN8zwqNmcW1pRgF0Js859jaWcelneN43GJVWVzExw7Z
 G/XEaqlJwJhrX+UPK5kkwMjMvQ==
X-Google-Smtp-Source: AMsMyM6i0a3Z4JYmUOIVUA71gmZPtBQq55ndJesQ2D0Yuq+Npbif2fuRodqYcIhyrWi8eBAEzx2g+A==
X-Received: by 2002:a05:6512:ac6:b0:4a0:2b26:3ab3 with SMTP id
 n6-20020a0565120ac600b004a02b263ab3mr1551875lfu.154.1663876478067; 
 Thu, 22 Sep 2022 12:54:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a056512210800b00499b726508csm1072325lfr.250.2022.09.22.12.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 12:54:37 -0700 (PDT)
Message-ID: <39ae31b2-48f1-4c30-851c-17276ce55e25@linaro.org>
Date: Thu, 22 Sep 2022 22:54:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 03/10] drm/msm/dsi: fix memory corruption with too many
 bridges
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-4-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220913085320.8577-4-johan+linaro@kernel.org>
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
> Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> Cc: stable@vger.kernel.org	# 4.1
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

