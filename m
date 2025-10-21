Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B10BF62CB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 13:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1227510E22E;
	Tue, 21 Oct 2025 11:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TPst316W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A043610E0B1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 11:51:42 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42702037a01so802740f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761047501; x=1761652301; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6oW5/XOBvE7uDDwrEHiFEsRScYTj311N2yjZu7+rowU=;
 b=TPst316WOY08Kcmj75ZrKNyraQBSXXrlv3o80H+ilA3PbTqCoXUOAxXfw5Hv2t53BA
 ZYtEVTDCfI9fYY0wNxeMX+XWHqWatpotKOJ1nhps5+2eC9cGK6CnoB7Vv3gIpQd6LTQ5
 +HxZOa+fSBLvrTeAa6JIPLuXmbaz/EB/q2JeFtbOK3yPgm/0FdNEbzgumVyc9pJcDsRQ
 pCdHh1FNzUvi1wF9/5odGOCbPK8mw+XZ5NKcntgshSywXgh7OWe5z5ZNk4LNZEGXqR6d
 XJ8M08tJucRh/Pw9B3oQuaqcyTmHTeLR7RzN5vDquCeKqWWubIprkbH5VI6c7ctUE3id
 Wuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761047501; x=1761652301;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6oW5/XOBvE7uDDwrEHiFEsRScYTj311N2yjZu7+rowU=;
 b=FoW4HeogWYI9XZpfZ9ULAwP+kfFIvkC7B9Oq/bilY1b+B9A/dk6F/QtGd3Y7Yop5zT
 5e5/tatl8C8V/pDruefkSH75uOZOFBqJXguTNaEleUfKf+9UCI3IIkwxyC6/JiicA1Of
 8i3ELQ1FpHiLHhE/F5SatM5H5j86n3QgTIeuVL0ANte8hKihFwwNSePWapCH7ZHhXvBN
 KyX0y1M8/M8XLCReIAUGwiGX5Dz1D6j6dDOAli65deSRrlrwmbyTToC8bhV3Gbw3oduQ
 vdKf9Uo71zKU8J9PhjvkPzvvEXQM9EmLNUYI5CTA6ZgqfZBGVKHItmwUPXNJMSm67xu7
 Foow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK909UtO3reRD76q6OuwhACziz4NHwnjF4m6u2pclahvaCSLh5ynt39cGsx84ubeV27onimeuIqS8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFxfFP1ywWtboP0A7AoX5wDQmZYI59vKydHx2643dfSt1ZslA2
 UDovWc++fU2E2l1k7jfDfR9jCJ2026FgOdgmbwW+SnLtw/NpA8YB/n4zfLXH0q8Nwts=
X-Gm-Gg: ASbGncsoApjhD/gtuA/FCOoc+WXW1zqH2GPzQdkCKXS2FIokdU1HaJDPZLkC7DtX4Nv
 SZtfsUgm3qMpomJgpQQGb/uyWuJGkcBwgAr7kr2bQriCFdieAJhPAMrz3196SVJejtvs7VC2G9D
 RXBP/f/jTJMnXat5Waj3d1f80xng1tHssLqw3V88WJvBIpc57r3ymbtq+rwPCOQUi/GnA1pA/n/
 ppWOo84W79VkhoaRt/HWH5dlRXvyNNzsy3iecH3E5a3K+S67a76LbeBA+uTePetRbRZXDrm3DLG
 JukyJ0L//orSs9SQE8HufWBkEaJz3/ZeVOQ5wj1A+RQzWcYG7JqMBbPTwp4beR712R2fwfqO5jW
 +EhyzOyJ7myTGgiKXxDfP/O1mCoab8JPTHBrev3QvrwrMJPAYw2pt1/ynQdW9zP3gY3E+SJEGo0
 zeq2MLwlBD48zrgwCC3rdkC/Cy4orzqww=
X-Google-Smtp-Source: AGHT+IGapGQl9lwmTZCkT8BrnxKktV2NGxlaa53OeTneIyZI/RrGfOsAomtObddDU522LsfDuHf/RA==
X-Received: by 2002:a05:6000:2c0a:b0:408:4c25:60f1 with SMTP id
 ffacd0b85a97d-4284e56ffbemr1187253f8f.10.1761047500936; 
 Tue, 21 Oct 2025 04:51:40 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ba01bsm19717753f8f.41.2025.10.21.04.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 04:51:40 -0700 (PDT)
Message-ID: <15a1cd8d-bbbb-4a42-8061-64dbcd7d3200@linaro.org>
Date: Tue, 21 Oct 2025 13:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback
 over DisplayPort
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
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

On 21/10/2025 13:10, Krzysztof Kozlowski wrote:
> Add necessary DAI links and DAI name prefixes to enable audio playback
> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
> should carry respective DAI name prefix regardless.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> ALSA UCM and audioreach topology will follow up as well.


Also, in case keeping both patches in one patchset was not obvious:
The first patch is needed to avoid dtbs_check warning, thus there is no
strict dependency and patches should go via different trees, however DTS
patch should reach next once binding hits it.


Best regards,
Krzysztof
