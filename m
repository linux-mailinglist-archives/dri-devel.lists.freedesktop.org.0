Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E929798030
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 03:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B2710E0ED;
	Fri,  8 Sep 2023 01:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A0410E84C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 01:30:46 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so187289166b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 18:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694136644; x=1694741444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+s6ddDNWj5Ed/aqdjx7Pfh0SYjgnxSyCgwh9TBhOQWw=;
 b=Ne9CewkRM54tRmskCDRyNcW4n7STP/ve7va7LhxtlhyVRp7cjr2E1FW/U9+B6mW3Y4
 iF5xCQhsZseUz4e75qVycMy6S/j2jOJZ7JNIhHC7WPC2M1+UWX1okFgVCD0O3vi7tAme
 8bt5/RJ09VBTWPobxY1P2grApu2GmtR9LKMJ0Xp6x2Gtnk/cA1nA4rF0BaebJzq4nPAA
 SgcNuwXCC/GQGmqYWvZ1vuuUJfH5RB+LrTbvNHSc7gTOrKJgU7X6JufTGcInA7mc9uUn
 9Pbsdh1D810/NMuqyTyoUerbmuPtMGP6TpIS0UHHPRRKTlIjDFhX/xEJJQgxyXiE5jNw
 RgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694136644; x=1694741444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+s6ddDNWj5Ed/aqdjx7Pfh0SYjgnxSyCgwh9TBhOQWw=;
 b=cWmM9MXPd79I8KDv/5xHdqtsLVC4lDcEnxrOEtXALYAWqqK6tdxPmh7G01di4T0swC
 9U5cLMPD+nozNt3IPhnWKqzqDkf9EPKPs3516smMyeNGpbOEanb4ByJVz9NbYP8Sibop
 9Gyr7dh0P28jb6ivf6lgmu01BCADbWvSGj/C49q2O/EInLS3korJviNa0/kYEeY9StOk
 T/U41J3l5AsOFnLrUjKdjbbj/dXXhc64c5kn3Y48qIFG1KaI/Plqd/iyQT2tgrMxJfAv
 QjINQof+1n13yH8z4IoINKwM5W/6CEaoaS2fAkfF547LnS9Df6VD5Ju934BJFp8KtvHh
 53Mw==
X-Gm-Message-State: AOJu0Yz0Ch792sHwTf4HT0mj2O4QxMZPzG4PKLiHbJ+gXadiZ+lDq2j3
 AHp86INMRM+g/C7D58Uw9ux69A==
X-Google-Smtp-Source: AGHT+IGoHfi/f0ipDYYNQtYwElSZi0+PTS0KL74gN0o35Q3QTzuxbhrmUK7vaOEkHJM2Pm7wiL3FwQ==
X-Received: by 2002:a17:906:76d8:b0:9a9:ee3e:e6b6 with SMTP id
 q24-20020a17090676d800b009a9ee3ee6b6mr608770ejn.3.1694136644631; 
 Thu, 07 Sep 2023 18:30:44 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a17090648d800b00992e14af9c3sm325285ejt.143.2023.09.07.18.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 18:30:44 -0700 (PDT)
Message-ID: <d5135c84-65d1-4e39-8c97-a7c6838a32a5@linaro.org>
Date: Fri, 8 Sep 2023 04:30:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: change _dpu_plane_calc_bw() to use u64 to
 avoid overflow
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalyan Thota <quic_kalyant@quicinc.com>
References: <20230908012616.20654-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230908012616.20654-1-quic_abhinavk@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, nespera@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2023 04:26, Abhinav Kumar wrote:
> _dpu_plane_calc_bw() uses integer variables to calculate the bandwidth
> used during plane bandwidth calculations. However for high resolution
> displays this overflows easily and leads to below errors
> 
> [dpu error]crtc83 failed performance check -7
> 
> Promote the intermediate variables to u64 to avoid overflow.
> 
> changes in v2:
> 	- change to u64 where actually needed in the math
> 
> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/32
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

