Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F039A797FE7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 02:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3255610E84B;
	Fri,  8 Sep 2023 00:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B08510E84B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 00:54:59 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-52a5c0d949eso2044240a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 17:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694134498; x=1694739298; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bXbb+IcSK9Tq00MQg5WGZXUVvdvtrV5bAF3gOE0KZbg=;
 b=sAx1uP17TfU3uRmXjkJp7Ln91OxqKVuZZAfeygyPux+U2WfaDLvWp0RRLHkA3Wipdx
 j2jkw5NDZTN/EYdwkUOY4VUrdYC7/fjlTohrESSV4pdj70jO1DXV9mf2mQzWq9eRJJXz
 d5LiLdQ0jceytTKhPRqflPgqsyvneZegpV8Y9xJOFZy1cvs0rUIuWV7fNVwGRJHAodga
 +/cqzmq8I5Vw3APZrYAHklAmdX3B/97qrszG17cJt/OfMMW0vJLvNslkRYQ+VGQTWe3L
 OdIW8NVuxrxRkS+jxmQ7RALrMVusUtSmZkvvCjPw6foEfIEyAxZxOykOsc68gLwSM2m+
 AY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694134498; x=1694739298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bXbb+IcSK9Tq00MQg5WGZXUVvdvtrV5bAF3gOE0KZbg=;
 b=ZYXMqKJ9JEGHYsSfC8RObVDgXT0drs3FbqQbMUARnv2Yyxe/YDvlKevgfQkPDKvn2U
 FCuLSS9GNpAznJDlQMpd7/8TKTLKE7kWiE1EFS2UEVh/bx7Rg+8OAxRMl3ulr9Bcj03Y
 QxRBkSst9jhtMlb7MuiHAQ89RdaeANlmD0af278aYBKcL8vdYW7cV4ukXaIkaE6SKHil
 /afeZbGWfo2L0hg14kI5iBtShOMXc+9L4SgbVSsyu3GcatUoF1dHbjg5klLkfq/yBWBN
 DXaZblJhv/9imFqsvPHgNKHr5SXXwwvleb6zXmFI/HNG8Cd2I/05raJ/37xXEvf3Eh57
 b0xQ==
X-Gm-Message-State: AOJu0Yzog88EAJFY4W72Fy35c4B35UctOKqoBibpzv7Uzpu5VGCe4Yti
 YC9/nMMX999W//CT1AEvneeQuQ==
X-Google-Smtp-Source: AGHT+IH4w/SdIUgkvoE9cLZ1q6yaPrRyI37jqw4LrrKMrrr1MrTCfZ/ppiYiIkr9K3p5y4n7I7exiQ==
X-Received: by 2002:a50:fe8e:0:b0:52c:84c4:a0bf with SMTP id
 d14-20020a50fe8e000000b0052c84c4a0bfmr574970edt.30.1694134497962; 
 Thu, 07 Sep 2023 17:54:57 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 ca15-20020aa7cd6f000000b005256aaa6e7asm392737edb.78.2023.09.07.17.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 17:54:57 -0700 (PDT)
Message-ID: <f1ad3bb3-22e0-4b9d-bd94-ee2e89713cc7@linaro.org>
Date: Fri, 8 Sep 2023 03:54:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: change _dpu_plane_calc_bw() to use u64 to
 avoid overflow
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalyan Thota <quic_kalyant@quicinc.com>
References: <20230908003240.14104-1-quic_abhinavk@quicinc.com>
 <f110b0fa-f41f-47e8-a83b-30de2f2b128c@linaro.org>
 <19aa1b04-e136-2e19-785d-a7856f4e8e41@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <19aa1b04-e136-2e19-785d-a7856f4e8e41@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, nespera@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2023 03:52, Abhinav Kumar wrote:
> 
> 
> On 9/7/2023 5:35 PM, Dmitry Baryshkov wrote:
>> On 08/09/2023 03:32, Abhinav Kumar wrote:
>>> _dpu_plane_calc_bw() uses integer variables to calculate the bandwidth
>>> used during plane bandwidth calculations. However for high resolution
>>> displays this overflows easily and leads to below errors
>>
>> Can we move the u64 conversion closer to the place where we actually 
>> need it? Having u64 source width looks very strange.
>>
> 
> Its this math 
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c#L139 which overflows.
> 
> So its not just one variable but I can even change this to u32 as that 
> also fixes the issue. Let me know if u32 works better.
> 
> Perhaps I went too far to go from int to u64.

I'd prefer to have the u64 conversion around the actual calculations - 
so that we emphasise the issue, not the size of the width / etc.

> 
>>>
>>> [dpu error]crtc83 failed performance check -7
>>>
>>> Promote the intermediate variables to u64 to avoid overflow.
>>>
>>> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling 
>>> for display")
>>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/32
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index ae970af1154f..c6193131beec 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -118,7 +118,7 @@ static u64 _dpu_plane_calc_bw(const struct 
>>> dpu_mdss_cfg *catalog,
>>>       const struct drm_display_mode *mode,
>>>       struct dpu_sw_pipe_cfg *pipe_cfg)
>>>   {
>>> -    int src_width, src_height, dst_height, fps;
>>> +    u64 src_width, src_height, dst_height, fps;
>>>       u64 plane_prefill_bw;
>>>       u64 plane_bw;
>>>       u32 hw_latency_lines;
>>

-- 
With best wishes
Dmitry

