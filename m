Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96917A36292
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D3410E34F;
	Fri, 14 Feb 2025 16:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kTiq+mWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B3310ECFE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 16:02:41 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30737db1aa9so21793941fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 08:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739548960; x=1740153760; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ni8M+7fnHjZEMfJNA97DV1PZ1vn01NK3p1wwHVgLyMQ=;
 b=kTiq+mWHL9r30+gv4kdT1eAYbflqvN0nc5wEdhXn5HD2UsLSaD12rH543hgHBcbJLL
 QRvwrex4IpcRICEzD5CQcoqItgzAZZtVk97ILdcXjYv7ln6Ru61+IESOf5lottIOlgsb
 kmfA8/s0NyAEYroMZmkNH8QPJjMrZqcFO3iFFJ+hd7K1k+g/HfXWlURz8I6d5wWLT53g
 Ynx8tLlcIClVmwNtkTOFSxjx56nVOcUT0JhvGqMI4TEd/Nue67vIgHgwLGT4xooaOKMR
 OrPekHoEAzbtHRboJFNcFq8AwAbEvc5iSDAY1XXYzPSonNL0IYQzU1Ygq5bj8JeqL22+
 gPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739548960; x=1740153760;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ni8M+7fnHjZEMfJNA97DV1PZ1vn01NK3p1wwHVgLyMQ=;
 b=PbbSX6hIQ4hsCVsSUxgyWPNNcNw2PskKF/lAIXqG42DsO85239SWsjyOuQWQuJKC4j
 o+Do8t42hxxJbxqwUrZPL7sHMHE4963IjBDAFUYQvfXVJIEAkQ/RzR+Y8imhku93y9zF
 vZUuPduX/cdEaifBnX7rnY4jNRWOxSp98cEauFW0mBdcz7BgBX7KNB0Rt2YcK7ouKKVa
 YtkvcY9PTaDSH+qRu3NteAowQup5lFRnqGlyHVJtZanP3hE4xycl3nPnlJmHvtZS6Kll
 ouAEivR16kd80eEtca6iuY43oVrZmMn+O7k/yHehIZc4UYUQtP1tc5vCW606drUYg5vY
 yGRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkmo2YUCbB3nKL2cglmzYahktnQby+93lgJ3tsMn+mzL7gjujP8Z//LhDBcuhDM8DOpZRorkviktk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqEMKC9iAh0JUNWBWTpGmuochAWRHAOmUCrTJg+rM9qVqdY7rB
 hPdwg4cNJDunz1gF21uVMKRcl35kIAcoFvV0IRlRRR9/YCEsLIFnjhvxPWgx2QA=
X-Gm-Gg: ASbGncvWsCOXRaTqlfmJks8+wpeTPM1UsQ4IALj3Hb7eqMcOFrJGgJnXCvZqCaJw586
 aEFgKqakch3k3lKzKJIxp7xtpvdcH82LmapxR+tEh8p4Ub8h6dgAmVp1l5jdD+fElOLo35ZQQTw
 +97uBzXhx03M24HneRGHuvpCTJuksMBBJc0p22yalaHHPH0L5aJ/rmaWni9dcWD4oS3qVyBOSC0
 ZHtCZPbnl4dXa9GRAUCgZaIqcTQHKLVDpWm0QyzuAQjSe3E5NT6XPBxvcwi6KvEm7v8OCPrjQG0
 2wUA50lssWrcMbTHkiOpvFmAd1SoO7JVyDZbk3pbTvV7sHc3vDeG9x4NmlNC0rHwSYHAl9U=
X-Google-Smtp-Source: AGHT+IGn28EmgkCJxbojbPnsNpKARzTvTVEWepxmZw6Bez7lrsTqmABZYK92VlugVR6Dz8Cxy1cCRw==
X-Received: by 2002:a2e:bc18:0:b0:308:f4cc:951b with SMTP id
 38308e7fff4ca-3090373a8f8mr40478541fa.23.1739548958674; 
 Fri, 14 Feb 2025 08:02:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309100eabcbsm6136591fa.24.2025.02.14.08.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 08:02:37 -0800 (PST)
Date: Fri, 14 Feb 2025 18:02:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, Aleksandr Mishin <amishin@t-argos.ru>, 
 Al Viro <viro@zeniv.linux.org.uk>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Jyri Sarha <jsarha@ti.com>, Quentin Schulz <quentin.schulz@free-electrons.com>,
 Swapnil Jakhade <sjakhade@cadence.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Fedor Pchelkin <pchelkin@ispras.ru>, Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Vadim Mutilin <mutilin@ispras.ru>, lvc-project@linuxtesting.org
Subject: Re: [PATCH v3] gpu: cdns-mhdp8546: fix call balance of mhdp->clk
 handling routines
Message-ID: <kwrxxcjgjqvkwapfb7hrytf32ike3wqptjkr7mm3m4rz56xifi@ahbrdjt4cytk>
References: <20250214154632.1907425-1-mordan@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214154632.1907425-1-mordan@ispras.ru>
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

On Fri, Feb 14, 2025 at 06:46:32PM +0300, Vitalii Mordan wrote:
> If the clock mhdp->clk was not enabled in cdns_mhdp_probe(), it should not
> be disabled in any path.
> 
> The return value of clk_prepare_enable() is not checked. If mhdp->clk was
> not enabled, it may be disabled in the error path of cdns_mhdp_probe()
> (e.g., if cdns_mhdp_load_firmware() fails) or in cdns_mhdp_remove() after
> a successful cdns_mhdp_probe() call.
> 
> Use the devm_clk_get_enabled() helper function to ensure proper call
> balance for mhdp->clk.
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
> ---
> v2: Use devm_clk_get_enabled() helper function, as per Dmitry Baryshkov's
> request.
> v3: Describe the paths that lead to unbalanced clock handling routines,
> as requested by Dmitry Baryshkov
> 
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
