Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC0FC0D951
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B8710E459;
	Mon, 27 Oct 2025 12:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LYmPsfuA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865BC10E0D4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:38:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-471d83da4d1so1705405e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761568684; x=1762173484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RHGUu/H89+nPNkVnAmHWGAl8x9ue4UGzIIMtUhE6fgY=;
 b=LYmPsfuAgYBaghFPRY2d73kUC6O2wpfmBCARrutA3TcsTHMz4KhckTIj86McCzsxy5
 hwzbdwTdAed9ihXvx3Qftx+QBcll1fgLaRXn1j8gVu/kBH4gU2lAdV4+6jXli4v5CSSU
 VEBfezCUImXlYJTb297KZLpaXmBDlt44JuK+rH8/C/uVCtkapH1JYKm6HoYoP5a5zc1t
 Kvf6c/E0alHc3YGoMVqi9JOlucL33cl+MLJxTRZALH/cAp8nFjfNxLVM4LHD6lo6S01d
 aduc4gGzeArcbrBC/7O0X3w3rGPLzxTwudcdrZEmxmG6ejbXIW/r7QEdORu+pwBbg8D9
 PVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761568684; x=1762173484;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RHGUu/H89+nPNkVnAmHWGAl8x9ue4UGzIIMtUhE6fgY=;
 b=k7Y/5C9fDRBSK5QQOKQj8ES5mQNZwYp9M1bYQ8iP3SdgbZtcoOEb3tSAUIW6AGvsTz
 X+4wCPC9rlzc2TAuMjZQCfHF7Q9dzAZ4831TiUz4IEzQ+jrWYqv/0BWiSsgiGQxfYSdS
 0th1y0MyyiRBA+Wp1B+hc6I/beZzbENPekybgOtnZjNKBtts4ckc4Dy7sLyEaeOuLPAH
 M50slxEmzvU+IhJJm5knmJW6UGg9ea6Ov6Xp1VHZqI9R0Soyvx3Iqg3dU/12oDQB86Zk
 65ZDjJ2eHa1NWjviB+ntL1rOHcQ2EUnNG426LRM1lZsQwMO1euDDue3MGuQoG9m4EtOv
 FvEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj9EsHxrGJdk3xtl2QNgXHLZuwOD8da7ZPQpu1dY0X2iMtUUOaC+n4oLqjwSsXMugPs6oazQdALYQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYKuBUlj4Q4FGVrDUobhJNioVqQlquCPHFFGQJvPMayGDccknZ
 TGiGMjgW4Fmsc1Nxf6ca5RHYsoifw4/Efh1wB6uIJOcev+g9v1QazybYX6VKG2Cgrns=
X-Gm-Gg: ASbGncu+8pc/2c4qal7pT5GH0LQR0xnbipk89cBMFaNZpSGk7cRvrmQwQgxJRqf+SkW
 tfTwZG3gTtbFlsE33mbVXvqt//y03pHSOh7ujYTjUbaFibARnhcOjTZ4jn9OmzqeWj74HPA0zen
 DBEc/pQSLa87eYqoKu/Ss6A/wMUuGRPfVn0ORQF3eRr+1T3SmVNfq7v7tdIQR9nVFzhZWMb+f7o
 LTNDlDhoxlj9S5/x+aZdcpcersmggMfDD8elzj9iLeVg+x20EIv0Csr7U2Yi37l2lhOZPKMgxBx
 0qXuFSmJFvf16eFqbHpNijLSLBnABuWTXRMY1uSL+TUtCgHuBzlbIyWbNsn86gff2wCUI3Bu0RQ
 Ain9Q84pjZD04XFCuy1ZWK/Z3ruvOoJEOPYVk4tbj3r9ZddGnRV5aIMs0ZaYKKnOGHxDujt2DvN
 12FO0LcadVTReFTONGUBUE
X-Google-Smtp-Source: AGHT+IGNtmCu4D763h6+9G3lrm83csyPVRDnPaCSfA4fw/nANSongHAbjp7WQaqw83gqqPcc+kuLHA==
X-Received: by 2002:a05:600c:4f81:b0:475:de51:ccce with SMTP id
 5b1f17b1804b1-475de51cd8dmr32268755e9.1.1761568683944; 
 Mon, 27 Oct 2025 05:38:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de5f9sm14127748f8f.38.2025.10.27.05.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 05:38:03 -0700 (PDT)
Message-ID: <a3808dca-2356-4871-83e8-c535cd0cce86@linaro.org>
Date: Mon, 27 Oct 2025 13:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback
 over DisplayPort
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
 <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
 <51da0617-db4f-4c6f-9f46-0492e49c9a2f@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <51da0617-db4f-4c6f-9f46-0492e49c9a2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
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

On 27/10/2025 13:20, Konrad Dybcio wrote:
> On 10/21/25 1:10 PM, Krzysztof Kozlowski wrote:
>> Add necessary DAI links and DAI name prefixes to enable audio playback
>> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
>> should carry respective DAI name prefix regardless.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> ALSA UCM and audioreach topology will follow up as well.
>> ---
> 
> [...]
> 
>>  &mdss_dp0 {
>> +	sound-name-prefix = "DisplayPort0";
> 
> We should probably push this into SoC dtsi since #sound-dai-cells
> is there


Hm, that's important for user-space and represents actual naming or
wiring on the board, so it is strictly a board property. IOW, there
could be a board which does not have DP0, thus mdss_dp1 should be called
DP0.

If you are sure that such case does not exist, then indeed we can make
it shared.

Best regards,
Krzysztof
