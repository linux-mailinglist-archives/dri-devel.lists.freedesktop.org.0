Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D413A29F5C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 04:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA1C10E416;
	Thu,  6 Feb 2025 03:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="csSyMFtm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC6A10E416
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 03:26:52 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30616d71bb0so4902391fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 19:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738812410; x=1739417210; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5DdG5Jn1MW15Wn8u30uTGjRTJ9vbOt12LrxRPZobjB0=;
 b=csSyMFtmfNw20cVeOl9voyoMHnOUxSHLdLdiFxQrE1G591M5ivvYxkZrcV7hpoQDN2
 pa6iysoCrKU2xFhp9/ERqAFbuJt1ioKKV5bPCe3MBPeKnYFyV9PE9Y5UT7622bb0f6l8
 IAt6vsucqAzkbzJXCLyd1DT5WOsjrjPurhGKsRcLClAKi0z0Gl0OuyLThMxIeapN1cEl
 peFWkvA8/dP73P/l4rJe7aHjrI1Vdudji3/QR82gCCFMwstYx5wcQPoF1m9UVtN5dW/x
 aa+RhYEj5HQ2QczfEQq0k59SFcggTB8dFpE61HjhEDXgLXYNDYDMDBkDX4eFOfnBd4Qs
 IW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738812410; x=1739417210;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5DdG5Jn1MW15Wn8u30uTGjRTJ9vbOt12LrxRPZobjB0=;
 b=aE3rkR+kZKbYe/YAD7VNPdDVEx8s1uMkjmRLJHYYcjEvx8gMMBlMtE7xZjrBvLZZSZ
 4gy0x4+K2UEMGNmslDHzY2W4uylljBVKKmM4NJzy1yI9uaedqkFJjG/LRkOCve+4ftRf
 uiJiAjOWcvXUg7Ue9pFptLi8KLf5UZjMvkYUjNUe7oywxJH0+vbMdqvr2N6khMr3js9K
 OVhX9OK8Uu2/9ySp2eWG9B0c4h5DFRoKaBVKUjdT5JwGz5qSLi1Hf5tjjS71zs7zNnZw
 H82pjRC83BYTLugYN06njQHQYvxE+ROOptwusHeA+g/tbbi0k6jolyelI9qQoyXQGvHO
 bqiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq0FYpw8irqrIh3iqNYi1ymnNS/00rwatu7DtWGAUang0ez0Wcwv/NLbj9S97VKVMLPX0S0trPwCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj92nyNMzLvfSFdK9jM89XZsvoGu1WAFer5hEc1og/49jzO/xl
 JGrj6DtX+dd1GpzwQ0Syuhqba3Nl3nX8FNjep8zLC7/qBwQ/8cgvXcq70AENOIo=
X-Gm-Gg: ASbGnctQ66ZAulqWV7r4WouZMOxGeyexjXdbnOAzwzbchNM3uGysgtiW5bnp+1Z2aox
 1JgbjGmaudAxDUR0uJhwQpiTXMMe/ttOlRDQxXyZi4yJpMW+WpPE2KO48Y9Vb4niO69+Nj/UbnI
 zfOs/3j6Dy9MImQA5c42mJ+Y22gAlDEFsxBaEIfIbPvMbH+XRw9nQIdhBeNOMnZKT18hiSgqkDI
 uUyUYipQ7zp7iVcVxY/y/tn0tqi9APU686gERcjQP9V8KCRVMJ15QAxYPsqpjNOpw0mR2p1EHgR
 xHjsalH2MUuFVBURh9zE5uBlZesZ+smGAiEHtvEw9XA1IgZjvWGeraZhNOagA9OnUIPW8Xs=
X-Google-Smtp-Source: AGHT+IHW1jb3KW8x6tt/qBgkvjmxR3wnyBKxeKsQxRREB62A0u+WNaONlVtge6tXCMFRwKna1G8X8A==
X-Received: by 2002:a2e:a54f:0:b0:300:33b1:f0e1 with SMTP id
 38308e7fff4ca-307cf23dbd9mr17475791fa.0.1738812410424; 
 Wed, 05 Feb 2025 19:26:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de1c797csm236761fa.63.2025.02.05.19.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 19:26:49 -0800 (PST)
Date: Thu, 6 Feb 2025 05:26:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
 Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v5 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <lnsv5o2uln3bvwryxybx7xb4w3j4e3rr2h5inj7t6cat5zord5@lgohn6yrygrt>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-2-4e4ec979bbf2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-adpdrm-v5-2-4e4ec979bbf2@gmail.com>
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

On Wed, Feb 05, 2025 at 11:10:51PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> This display controller is present on M-series chips and is used
> to drive the touchbar display.
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig        |   2 +
>  drivers/gpu/drm/Makefile       |   1 +
>  drivers/gpu/drm/adp/Kconfig    |  17 ++
>  drivers/gpu/drm/adp/Makefile   |   5 +
>  drivers/gpu/drm/adp/adp-mipi.c | 276 ++++++++++++++++++
>  drivers/gpu/drm/adp/adp_drv.c  | 617 +++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 918 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
