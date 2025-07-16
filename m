Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF6BB07541
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 14:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E8510E08D;
	Wed, 16 Jul 2025 12:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dxoF5y/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D6110E08D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 12:04:13 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6099d89a19cso11826149a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752667452; x=1753272252; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lsXEE1hISIb4cJAFw3dYr+DwstAQXXeJCNfdlxzLq1c=;
 b=dxoF5y/ITWidjwigadqxzm7rhXd+jQd5kdR9AD3Npjpu3hd2UT1xpN3ScaW78cnqPX
 5gnrlHYRKDazwZbTgjhpbXSIuhBT4xIfx9ulR+F2T8+lC40pjUhRFV5+Wg9H642K9t0J
 9y+fPJH6z2O3hQ7uxE1B7rcONw4uIemMLGP7yt3mUrWPT47bCGvzGoozJyc9KxGAklJB
 j+nW6bo+gea1zYzpMliE5ZAAaKyyFUghg9Cra7QRlNDjI+i/iRzJd3qSOlIc1yfw6vyC
 YTlE55AQSigHb1D5Cm7VzxDVfSHoD6nXrCnLdyraP/zJIgPkLCL/61kavy3M0gr+LLiu
 ddAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752667452; x=1753272252;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lsXEE1hISIb4cJAFw3dYr+DwstAQXXeJCNfdlxzLq1c=;
 b=lLrcPRV2IGVwL4n9mde6rUVG/RUZNWTC33rvR39oQUK4FzUIDKK5G39qIS1BGkpzkM
 Rv7OmzySLeC46hfJwsZFwntqEaLcmM9EAS2x0l/pJi4AwS2I2gSeoQVijSjflKjKReef
 RdRpjzBzgcN6zXMPoL88IimeRBUQAFl0BCsoVTS1cWDi7frCfcNLQduE7HUWF9KgWU5B
 wLvWcAJtGoxvWKkqWc+khU5oH0pVwxAqMOaiIURG+h0E48o92PZYy2zZFr79uWbLxc3o
 9bbzuOPyH8FIqsclD54TRMtgal7WSCBtLmm9yIEeIkem2V44KuFK/HYCwK4TV+sRuJat
 y78g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTg81sY953O1SpVr9upzdRQxLbEH9zbuiZLxtVOaGH17TZKK6Mno5qNq6Ev2uaRi2T+D/kcv4oIsI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNBa7AUtt0k7I6naCuArUb+FC/RKdvoNN06w0RNkUckoax9hp2
 TiAcMLNdK4/ZFAD7mWkbacUIbQjTy90L1piE9ZlGJPVKmnCdAyGOePRo70dI9uGxoSs=
X-Gm-Gg: ASbGnctbr6FaHh9nn6VIceSgbVnV8MVWqNhOtQxNjz+X/kbH++Tvysgh06exPi/is+o
 U3GQGR7A33F8PqKTsj1SxbEXQuCaZceRZbG5rV8rp5Owqfgc1p4vm7YYQKptSBEO6+YdepEKMRs
 xSQZVlx1deXU448B2NuVnNUmFBzfku5GRguG5308vmyhFOOhw7PJvRAgyNXiByi02nLSHFFKqCH
 YV6oIpvCtTIaQIip7++Na3oIk6i4YOpdpc/2OxHnsTUo7fGWoQRPaglCoIQyoxoD5BnKyMk7f60
 qjw0nwS0U2QVfVoK1wTh2cAgpyPJVk9Mnl7EsadVsyY1bZeEgt7iHtFd9jE+Lk2mx8OfYleV+TA
 XA+RH2JbSd76DPIv8xxlPGaC3RDhhRQ==
X-Google-Smtp-Source: AGHT+IEhSGvwKZCfWmTvLUG6dGYIJWTd4OdkmaI9VTlT7Ykv1sEpL5pIQSQFmLdV3hms4bc49wFnVQ==
X-Received: by 2002:a05:6402:348a:b0:606:df70:7aa2 with SMTP id
 4fb4d7f45d1cf-61285bf41c5mr2186091a12.31.1752667451997; 
 Wed, 16 Jul 2025 05:04:11 -0700 (PDT)
Received: from linaro.org ([82.79.186.23]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611c976d9f7sm8622193a12.54.2025.07.16.05.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 05:04:11 -0700 (PDT)
Date: Wed, 16 Jul 2025 15:04:09 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] clk: imx95-blk-ctl: Save platform data in
 imx95_blk_ctl structure
Message-ID: <aHeVOYUhLu8uIhFe@linaro.org>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-2-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-2-laurentiu.palcu@oss.nxp.com>
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

On 25-07-16 11:15:05, Laurentiu Palcu wrote:
> Currently, besides probe(), the platform data is read in both suspend()
> and resume(). Let's avoid this by making pdata a member of imx95_blk_ctl
> structure.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
