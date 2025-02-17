Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF9A38BD4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BCB10E5B3;
	Mon, 17 Feb 2025 19:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vv1wEtxE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B195910E5AD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:01:17 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-309311e7b39so21482341fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739818876; x=1740423676; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3KVpMc6HL6H0IbUiBn0TVnYFjN3Gop2XIWiyOAEOilM=;
 b=vv1wEtxEGfglTUYKBg4ZTJBrZU2DhHSh2YGHktviOrIfo4bp4W9hYnahxyNUcLOwh8
 PePCn9EeRKX2fRp1jLdp4JWrhGmv/GEd2+eLBPYePstJRF5x8NCNtHSW+S/rR8t9GVnR
 IrYgivbnRwCwZF0YhiKPPFuHOQDOMtx2akwPCkZC5Q5J/GTUYEvQVbl+L+0QB6GoWHYP
 GIPmDWqZXZ16jcB8eleKEJqOB4hv2uI8CeUY2R1kmsafxR0LiNKQwhk+lga/QTMJaeUt
 NLzJ8Lwk5Um9VwMzZ1Y+Ujk6fHB1RL4/6S+77ZNp7llhKCOnetd1YDb4G59mPvXjVokw
 D27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739818876; x=1740423676;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3KVpMc6HL6H0IbUiBn0TVnYFjN3Gop2XIWiyOAEOilM=;
 b=Wod+nJrOi5NXQdPUU1FVeoUerIABq/dBdEaVH1SdcphHoDlFeKZuFFYVsq6BJFgZg3
 hmNWVz5OiBAOMPO08H9VKkmbs1e6jmpa5uTLnO5dsjQQ1e9PFAOHaTrMkHoWalXGNeY5
 677546ZEQwHZ7T7x8cc6G1z23Tbc5YooGr+9H1+Pz5MhS0hbPsadRORendNm/1i7Aemz
 hg6kAG1wD+lBaiXIxlE4cePdCGt8BUptHteG1kiekdenDQavy4cGfBKYL25ixGYajU7v
 Uet/05s3cz3toaMBROsMjtKIAIFvncy5TaVWvvzHgWWbhDPa1Gt50wEnMJPF4fh/KSc8
 walA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5gEJxA7e8feFqoFLn0pAeVVIv8Y9Epv2FdeYfOiXEQ6MmERCrpIyVCuyFsujt5xTdZUh41NkbrvA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzpi8zrTnQqRyCk5fuC/xeVwD0TqfyLXrkUdnPOwKN4U2/xlF3d
 BBccwqxZInv8wgq98b0O0w9PXEgwHxq6wZKalZZUEbABZUZh0c1dckbGoT/1reo=
X-Gm-Gg: ASbGncu3t2N+O4G9CUu9IIQtWAqhUsD2JcOSiih79d7jtGTf8uXmTGzZwr+TAxVbWI4
 5WXP+1wDEIK1Bd0lC4pQFJ/SIIndK5zeJFfeT9cKI+zk9bTYFgTvn+Ym21Q9qOOak5Dyb1rXpso
 BX+MqZ8im/Ut8jkEVmZa1RYTMOghulNuceuAWxt+G19NLtSHyC9Pj6UJkCHUf6V1750cm2ai38O
 7fFGpAiH2tEm4sgI7SF8z5xA6vBOcNFbB8g3Ao8io4/XX7FP2vkA4zFw2ChtjuO3rvQQ5B/UVPQ
 F72/xG6U0GXYVsJPKbuEJMrB5X6+eLQIMQmqB4bE+e65XVXWZgsjwDII3QiEDrHXh6XMDyQ=
X-Google-Smtp-Source: AGHT+IHOqzXihtG/q/MOUu/ObVGRxR4vcEqAKB3UjZpWusxSGj7tDYpn5jPIEX0hDh+XE6pxaNtc0Q==
X-Received: by 2002:a2e:8895:0:b0:300:33b1:f0cc with SMTP id
 38308e7fff4ca-30927afef0dmr28520491fa.34.1739818875993; 
 Mon, 17 Feb 2025 11:01:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a27206f15sm7247121fa.61.2025.02.17.11.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:01:15 -0800 (PST)
Date: Mon, 17 Feb 2025 21:01:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 10/16] drm/msm/dpu: Add handling of LM_6 and LM_7 bits
 in pending flush mask
Message-ID: <fqmt5h24asj36odjx6bdgc5qjoeqwgpmrrsqq642ss6l3tsnmy@wh52uxkzudvv>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-10-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-10-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:31PM +0100, Krzysztof Kozlowski wrote:
> MDSS/MDP v12 comes with new bits in flush registers (e.g.
> MDP_CTL_0_FLUSH) for Layer Mixer 6 and 7.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
