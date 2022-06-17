Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E9E54FC9A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 19:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD2010E86A;
	Fri, 17 Jun 2022 17:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1F710E87B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 17:58:14 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id d18so5511393ljc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=97y9FHnzeeWIkKgO06WJA0gTF/gs2nCQs4ZuQLCUQGQ=;
 b=Y4RxzPZld0xkAgJZ8JaKKwJ4wykgLQERo91KdLt1BXFZnoabFRquIfIcTSRxFcsExX
 vWZdZ1ZtjKX3dwRGkf+QvUXi46mKGKp08/ZG3iw+oqYwGUv8oofc1rcNygrco9isjuLG
 PYiM2+Z1NnXFdiSFzNg+laZ05bnz2icaUJxvpR9+tsLy2dXOUTlU+Mm0MDESI3U+npVB
 Z5gu0kh8CFxauDVYpE7rjexvQPSCvRjZr2tnwPbcs5AjtUuT2/HQyhmrUtmJUw0E7x/e
 hwX8iSla5gggdYcuovtSL8OBENxrJDxqDBl/WHL6G0nAH3LOMEVCupwMJ1xM1f3MgsSy
 /V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=97y9FHnzeeWIkKgO06WJA0gTF/gs2nCQs4ZuQLCUQGQ=;
 b=zanyUeo05ZYqU7xwZOEkumRYYAhMjV5KC8sIG9OIsmlvcXBNdsqYq9lNyXbgDDETrH
 mYD6ugYcsGr59/oa2jPblDwuqPrGAC4+wDPfgQqrx8ipHbDxh/JWmHEDtU6yy2uGOGNo
 nX6gMl5gY14q9gxFsVMRMDnRWA6iJ6HsxiGRruAmNMAGZjKvyXHnXzdBTMOf29AjL1BA
 JB6dK16zlgFvhhqES0irjzCuQuujlrpvpwzOX22Aylvo5AonP5y1Zs/RfcEpe16Z2U1s
 uQp0fm5w9Ho7U2UeW0Js300U3wmyEd9/ds6AJS7XhgFMK2EFmIhXzt7gVfAm2bjYMKAi
 NhXA==
X-Gm-Message-State: AJIora+SBC3V7/f8JLtzWIDyD12SPjtESTwRAwMVJmGlUPqSyk0V2ZHV
 sfAutQd9MfkfaWd9hCs0vWva2w==
X-Google-Smtp-Source: AGRyM1tr5E28EjxazB6c9jBKbsNWgBfS102Co+7JJIF/zfX/fUG+4N6vDkYevs7R3YVB0zKgw2tMmQ==
X-Received: by 2002:a2e:9810:0:b0:255:6c06:1e74 with SMTP id
 a16-20020a2e9810000000b002556c061e74mr5632276ljj.279.1655488693159; 
 Fri, 17 Jun 2022 10:58:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a19dc58000000b0047255d21181sm711403lfj.176.2022.06.17.10.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 10:58:12 -0700 (PDT)
Message-ID: <f9b111ed-e1cd-685b-9428-d042c43e53bf@linaro.org>
Date: Fri, 17 Jun 2022 20:58:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/dpu: limit wb modes based on max_mixer_width
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1655407606-21760-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655407606-21760-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2022 22:26, Abhinav Kumar wrote:
> As explained in [1], using max_linewidth to limit the modes
> does not seem to remove 4K modes on chipsets such as
> sm8250 where the max_linewidth actually supports 4k.
> 
> This would have been alright if dual SSPP support was
> present but otherwise fails the per SSPP bandwidth check.
> 
> The ideal way to implement this would be to filter out
> the modes which will exceed the bandwidth check by computing
> it.
> 
> But this would be an exhaustive solution till we have
> dual SSPP support.
> 
> Let's instead use max_mixer_width to limit the modes.
> 
> max_mixer_width still remains 2560 on sm8250 so even if
> the max_linewidth is 4096, the only way 4k modes could have
> been supported is to have source split enabled on the SSPP.
> 
> Since source split support is not enabled yet in DPU driver,
> enforce max_mixer_width as the upper limit on the modes.
> 
> [1] https://patchwork.freedesktop.org/patch/489662/
> 
> Fixes: e67dcecda06f ("drm/msm/dpu: limit writeback modes according to max_linewidth")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
