Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EED98A9889
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 13:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E59113BC4;
	Thu, 18 Apr 2024 11:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y8NijsS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD910113BC3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 11:29:33 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5196fe87775so668979e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713439772; x=1714044572; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VnnE/IfmzmlA5CHyUgqh20yYFBPuvnnShtetUjnyr8w=;
 b=Y8NijsS6/b1+/N1aX5D1mlzVtRazYn112hF7wOB8S554UnhNoAI/GZpy5z2i33kePd
 r8ovuhpLg4KFbHYcZtA2ytQ/fZ9H7TFHEO7zCqWWZynXQXvWdunX9SD0ewi0z8HYDEPZ
 Xg3BGZCNC5KAlJi3Ohkj3Tw/+hJFb8c793zKKqFLGAkRG4QYs1EmSWtnUO+K1aLryxaA
 23X5s7tdvVAsjsmDWEhRJQJ3wBb2LRG7SU8TOfMw8NjzXPmRq8XkbpqsN8ZvUHDyAyLK
 tEZVn+h+jfoVVFB4ifP0CyXrJV5pxZyhKARtW42JNaTK3IwAPyRGsT7hvl7+3vN4anXD
 p/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713439772; x=1714044572;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VnnE/IfmzmlA5CHyUgqh20yYFBPuvnnShtetUjnyr8w=;
 b=xM2fC/S0VggN0CMDRkX9dZuOhq4+niw14hArnuM6fJJSazPKiydfd2xokEGopLUWmB
 FOSszwzcZslWE77oLn5mgpAVQVytnguD0aCAZ1+BaiPFuq5hg10yPpn0SzFHhKGTWSEq
 +9/l+nn2oAiWu4Dtz2q6KvoBEa/L/vGlG6U5J3oRcdmoRqVR8+ndev4esKN2U/VptYAW
 8y72oVzb4hoHVsHMpd7VJDfKninJpqLnzpN5ZWUEujSLirZSVxa2dzTUSVdetCYjUobd
 cEgmYY0H79YOIyY6Bg5ozGOt/kYiIffSGL1K35fJzPj/Aq4xXpasJtJO0JBmRIpIqUYN
 d/Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC9GOxDj1CEAyp//c2Cf/+BAekW2RqNBE2hIQFzuJ8qtmohpvTMAkBFSb4wp7AuJLb3ryoUgzkqabcbkOb2SXVrreXo5xqSplLUE3ZUZJN
X-Gm-Message-State: AOJu0YwCJcM0DTAAD3/GteHQPHyGbU78HIrwyaGCf9TR/1olE22/NuMw
 l1EoAqmSghYOek5ChdxU2BEFLfBsPagfVcAGRKubmDP1Sbgs4EFv0vpFv+/Od04=
X-Google-Smtp-Source: AGHT+IHDv6oDHXnx691EqLgUPOwR5cVUUBZLA5KH4jyaTEU8AhEQ4q2Ks28SwOSGF59XRR6bH5r3jg==
X-Received: by 2002:a05:6512:158d:b0:519:591b:6d7a with SMTP id
 bp13-20020a056512158d00b00519591b6d7amr2116064lfb.7.1713439771793; 
 Thu, 18 Apr 2024 04:29:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a056512389100b005175dbca53bsm202809lft.185.2024.04.18.04.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 04:29:31 -0700 (PDT)
Date: Thu, 18 Apr 2024 14:29:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 6/7] drm/msm/adreno: Redo the speedbin assignment
Message-ID: <2ha26ft5hliicfgaiu6uk7cywyjhhl4x6gygg7rhqqftyfmwqo@qpqf6xr4zudy>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-6-c84f820b7e5b@linaro.org>
 <rilfqdvei26bjyz76hdsh5wlh4s2lcn235up2vxbs65pnolyty@rs77jbxxqzye>
 <132c1e03-f55c-46ba-8a22-9cea1ebdfae1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <132c1e03-f55c-46ba-8a22-9cea1ebdfae1@linaro.org>
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

On Thu, Apr 18, 2024 at 11:57:35AM +0200, Konrad Dybcio wrote:
> On 18.04.2024 1:49 AM, Dmitry Baryshkov wrote:
> > On Wed, Apr 17, 2024 at 10:02:58PM +0200, Konrad Dybcio wrote:
> >> There is no need to reinvent the wheel for simple read-match-set logic.
> >>
> >> Make speedbin discovery and assignment generation independent.
> >>
> >> This implicitly removes the bogus 0x80 / BIT(7) speed bin on A5xx,
> >> which has no representation in hardware whatshowever.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> 
> [...]
> 
> >> +	/* No speedbins defined for this GPU SKU => allow all defined OPPs */
> >> +	if (!info->speedbins) {
> >> +		adreno_gpu->speedbin = ADRENO_SPEEDBIN_FUSE_NODATA;
> >> +		return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> > 
> > BIT(0)
> 
> You mean for &supp_hw, or "1"?
> 
> 1 is the "count" parameter, supp_hw is a "u32 supported_hw[count]"

I see. It confused me. This way it's getting set to UINT_MAX, which
will match against any non-zero opp-supported-hw. Ack.

> 
> > 
> >> +	}
> >> +
> >> +	/*
> >> +	 * If a real error (not counting older devicetrees having no nvmem references)
> >> +	 * occurs when trying to get the fuse value, bail out.
> >> +	 */
> >> +	ret = adreno_read_speedbin(adreno_gpu, dev, &fuse);
> >> +	if (ret) {
> >> +		return ret;
> >> +	} else if (fuse == ADRENO_SPEEDBIN_FUSE_NODATA) {
> >> +		/* The info struct has speedbin data, but the DT is too old => allow all OPPs */
> > 
> > Missing assignment to adeno_gpu->speedbin ? Or is it fine?
> 
> Good catch. Only mesa (and I suppose you :D) read this value.
> 
> > 
> >> +		DRM_DEV_INFO(dev, "No GPU speed bin fuse, please update your device tree\n");
> >> +		return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> > 
> > BIT(0)
> > maybe #define it?
> 
> (ditto)
> 
> Konrad

-- 
With best wishes
Dmitry
