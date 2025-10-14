Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479EABD91DD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6A010E5C1;
	Tue, 14 Oct 2025 11:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p/KryFUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEC010E5B2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:52:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-46e4f2696bdso52857075e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760442731; x=1761047531; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S5kwp6ZoI0Qw9Lio9IILJuSek2MXZc7hvFxHIxIa6Qg=;
 b=p/KryFUeMcYglQCJw0BYhA9jm5vC+BqZxL4EmRRwKUOJTnmXXCadctkFGix5rNQuIy
 UVP6UlbCBoQbcN19fbTk+9foInLQWZ2z3bTb6kHGlaMzDwT9dtOLehh8CMDwCanw6Pni
 4nPcSZChj8cSWjMDPd3EhWLgLN/YkmL3F+p6iybJfhlsLt+4PGG5QNtQUlkdR+bEYr5N
 DGWx9extvX+co/qXToAyKbhHTDq0K2H8jajBWtQEAcfz+/xN6UJdMtP+yTTX2mLjN+SY
 W8cUC66+EwgpljqL9hl6Kz9eZLIqW68KYrQjpkgZy8qqdsrjN8gXykirfkFgsb4Gy+3p
 qtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760442731; x=1761047531;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5kwp6ZoI0Qw9Lio9IILJuSek2MXZc7hvFxHIxIa6Qg=;
 b=vph6AV7p278fXXS7kauyQseEmWMxKVNFyHz2o0whvptR+t7zGkt1bNKi3pxvVSHksw
 pmVzrazHldUZKcu5OHu6lnwoc6ETnTDcpjoidPkt3gbb2DgQZ4tMcejxHmarRylfu7PF
 WvARKd4MF16gxzthRSIMPz4MVTwAddIMYEXA1IqEbA7Amja92V0ZnxgvrW8iwTVPFHQ6
 OVUgiIpSy+fGlY/Xi6vodB/YbTWO5UuG7C/VMSPts6e7Vv+dpt8kfLMwc1cEv10sa5C2
 uIbJWa3Lbkrll0wB9imB99YGNYm6DpcaKKg+mWZlKgLN+KOah9sGeeBXzoVg7lwL1Y+l
 wH6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbQZ5lrpv7y0BmNODZydlxjw9dx89ZVNMGuN5ZT6nxWTv6R+CaOgTFwYsUYQTPCI5CDNwFOVPQ3dQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiS6TTEfD6vk7xBnFHobMam/y6acA3/9ZjoGFUlcypb/sadu4P
 5nH1sq9TgMLHLmekK3YY8Y2KEA+U1Bw8GIop96J9wn2lxuEdfhnSqFSrnTDzKaQ5+5g=
X-Gm-Gg: ASbGnctkRixiPOk0Ar2qR4iKJT6QF8RnzesgdpOFb3cA+If1rlQe/54Q2Fqj3R9qOi1
 jLkBYVNRd+EBvbFs8WB3YdsGkWqQEs5gC0EK1hgAXwqO8iJOmswKaRovfrFmmUMQUH7+b95E8R5
 zWsExpC2A5PS+UCn68t5o7oqkSIEifGidYAcrvzRhr9/hWN55zxWj2pl3xNVDfJvc8rHjeyBfy3
 SxrFBS/mVpA2ws3UQIBJUCdNRpcTKzUoLl6fikp8AmetGsFhhrSgi/EJg4b+EYIGSi10pYFy+Sa
 b5Zi4m3Jx3c608lmsssMP8B4Q+XIQiJLCwFH9tgj9820cXEMflFNU0p9B6o8TRNdcwLIm9udavp
 1QhpczCskwJ4zzf+h70TpIh8JkrxPAnKLlDWPZt1kG0qBPs3qMIUm
X-Google-Smtp-Source: AGHT+IE0T5cvpE7QhDWujs9OdISYV+M+qLIfcBtU5FuqXOEPjcO1IUVOft+IiRF/W2H0Fcynpk8rfA==
X-Received: by 2002:a05:600c:3b29:b0:46e:7e22:ff6a with SMTP id
 5b1f17b1804b1-46fa9aa1d79mr180603815e9.15.1760442731072; 
 Tue, 14 Oct 2025 04:52:11 -0700 (PDT)
Received: from linaro.org ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489af92sm255991685e9.17.2025.10.14.04.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 04:52:09 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:52:07 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
Message-ID: <mugh42lzc64wfkcacwo3z3pj7o5m3gx2ksjh47q3q6gu5dwqly@vfvs2n3czy6v>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
 <mgbv5zoptfox664jswi3imvibrd7d2teazeuied37dw3ooiex5@lli2bsap7d3x>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mgbv5zoptfox664jswi3imvibrd7d2teazeuied37dw3ooiex5@lli2bsap7d3x>
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

On 25-09-11 16:01:30, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 03:28:50PM +0300, Abel Vesa wrote:
> > Document the DisplayPort controller found in the Qualcomm Glymur SoC.
> > There are 4 controllers and their base addresses and layouts differ,
> > therefore being incompatible with all previous platforms.
> 
> ... and it's a new core revision.
> 
> BTW: any additional clocks or regions for DP?

No new regions and AFAICT no new clocks.

Sorry for the late reply.
