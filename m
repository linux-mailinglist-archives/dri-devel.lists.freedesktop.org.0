Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59996D86DF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 21:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20A710E407;
	Wed,  5 Apr 2023 19:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC1C10E3C4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 19:28:52 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id g19so34933646lfr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 12:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680722931;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=346s2bKdYoG5vPV5rp3s9nWtY0B9BIwq57Oj+lIn3Vg=;
 b=ng0x/2R0Th8bEcsqzNgfBpd7/DzXCd8Cd4TRPar2DMSSggI5YlkDkHDXKcrpUkUqDW
 Z0Y0MexQ0ZUj2q7lmZXTpPCMnUYT/bl32auSmZsJC/z2w7UbSAeRrvLulKh6F/2baSp5
 fZfdIpk47kfzN2ebK676NXnkOU0y9FsG10QR+2KLvI2stawy6Mv+7EQ8yGq47HvcBw1e
 AkN1w4Tuyl9MEhr4XBL2mlenP3w68sSQk4jQDgi5rxICVDy95DwjcCSfvC4esB4s/ibY
 TfNKSNEprLMCPkBC4/7uPfbVBhAlhthOvffo5QWc075V/efwccfDW4spoRNVoUTgZMoS
 QXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680722931;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=346s2bKdYoG5vPV5rp3s9nWtY0B9BIwq57Oj+lIn3Vg=;
 b=2omEg9cWf1O3OtALqyhxWwDYcurCWGCJmSHtZTXr2ADq+7HeiyEmhbywvROVsc91Pa
 0rJ4ILJegdWX2zevQgh8R+Zpg4ySpYkj72WX83rRlsWXydaCoXzm0a7Ne83VAZivWCUI
 MptgkY1WzgY5n4hvn2Srkq2/AjDy7Efwt67jPI1x+FjU+Jx2MHjDrSQJRCb+7/sjZ0KP
 dQFygkJOM+eneFo+t8sO8BO0GTEA8+J2Umjojx5lMqTZd1rXkj0eaZ/DD5OPeN4JuxTy
 ycWSZFEjX6eHycbTRPDg1SMoYmgS73zNR9o6OKnzryHDhVlbYQ1qPl9uTNFQPFOWp1LH
 ABgA==
X-Gm-Message-State: AAQBX9erp5RfYByKXOmmqNYpLdpq9D4M/VUJ5QLwcujAhq7M8AYed+Xa
 k69tx8qSKx6ANPyKy9WYu7Clww==
X-Google-Smtp-Source: AKy350Z/ouHgHeB8oV+efcHIpdWXA+rQsJ/apK5YiovxQb31exrCS09spev/Ov7kjfTinHYxaC9usg==
X-Received: by 2002:a05:6512:961:b0:4de:ca63:b2d2 with SMTP id
 v1-20020a056512096100b004deca63b2d2mr1776561lft.26.1680722930935; 
 Wed, 05 Apr 2023 12:28:50 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o28-20020a056512051c00b004b55ddeb7e3sm2959997lfb.309.2023.04.05.12.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 12:28:50 -0700 (PDT)
Message-ID: <14d6749a-1268-f311-1e17-115bc6328681@linaro.org>
Date: Wed, 5 Apr 2023 22:28:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 6/6] drm/msm/dsi: Fix calculations pkt_per_line
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v4-6-1b79c78b30d7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v4-6-1b79c78b30d7@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/04/2023 03:41, Jessica Zhang wrote:
> Currently, pkt_per_line is calculated by dividing slice_per_intf by
> slice_count. This is incorrect, as slice_per_intf should be divided by
> slice_per_pkt, which is not always equivalent to slice_count as it is
> possible for there to be multiple soft slices per interface even though
> a panel only specifies one slice per packet.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

